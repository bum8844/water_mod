local ACTIONS = _G.ACTIONS
local Action = _G.Action
local ActionHandler = _G.ActionHandler
local State = _G.State
local TimeEvent = _G.TimeEvent
local EventHandler = _G.EventHandler
local FRAMES = _G.FRAMES
local SpawnPrefab = _G.SpawnPrefab
local EQUIPSLOTS = _G.EQUIPSLOTS
local FOODGROUP = _G.FOODGROUP
local FOODTYPE = _G.FOODTYPE
local WATERTYPE = _G.WATERTYPE
local WATERGROUP = _G.WATERGROUP
local GetGameModeProperty = _G.GetGameModeProperty
local TheNet = _G.TheNet

-- 액션실행시 연결된 컴포넌트 작동 시키는 코드 구간

local function ForceStopHeavyLifting(inst)
    if inst.components.inventory:IsHeavyLifting() then
        inst.components.inventory:DropItem(
            inst.components.inventory:Unequip(EQUIPSLOTS.BODY),
            true,
            true
        )
    end
end

local cook_stroverride = ACTIONS.COOK.stroverridefn or function(act) return end
ACTIONS.COOK.stroverridefn = function(act)
    return act.target:HasTag("kettle") and STRINGS.ACTIONS.BOIL or cook_stroverride(act)
end

local harvest_stroverride = ACTIONS.HARVEST.stroverridefn or function(act) return end
ACTIONS.HARVEST.stroverridefn = function(act)
    return act.target:HasTag("kettle") and STRINGS.ACTIONS.DRAIN or nil
end

local store_stroverride = ACTIONS.STORE.stroverridefn or function(act) return end
ACTIONS.STORE.stroverridefn = function(act)
    return act.target:HasTag("kettle") and STRINGS.ACTIONS.BOIL or nil
end

--ACTIONS.EAT.priority = 1 기본적으로 priority가 명시되어 있지 않은 Action은 모두 priority = 0입니다. -AFS
ACTIONS.FILL.priority = 1

local FILL_BARREL = Action({priority=2})
FILL_BARREL.id = "FILL_BARREL"
FILL_BARREL.str = STRINGS.ACTIONS.FILL
FILL_BARREL.fn = function(act)
    if act.target.components.waterlevel:TakeWaterItem(act.invobject, act.doer) then
        return true
    end
end

local FILL_BUCKET = Action({priority=2})
FILL_BUCKET.id = "FILL_BUCKET"
FILL_BUCKET.str = STRINGS.ACTIONS.FILL
FILL_BUCKET.fn = function(act)
    local source, filled = nil, nil

    if act.target == nil then
        filled = act.invobject
    else
        if act.invobject:HasTag("watertaker") then
            filled = act.invobject
            source = act.target
        elseif act.target:HasTag("watertaker") then
            filled = act.target
            source = act.invobject
        end
    end

    if filled == nil then
        return false
    elseif source ~= nil
        and source.components.water ~= nil
        and filled.prefab == source.components.water.returnprefab then

        return false
    end

    local groundpt = act:GetActionPoint()
    if groundpt ~= nil then
        local success = TheWorld.Map:IsOceanAtPoint(groundpt.x, 0, groundpt.z)
        if success then
            return filled.components.watertaker:Fill()
        end
    end

    return source ~= nil
        and filled:HasTag("watertaker")
        and filled.components.watertaker:Fill(source)
end

local MILKINGTOOL = Action({priority=2})
MILKINGTOOL.id = "MILKINGTOOL"
MILKINGTOOL.str = STRINGS.ACTIONS.MILK
MILKINGTOOL.fn = function(act)
    if act.invobject.components.milkingtool:IsCharged(act.target) then
        return act.invobject.components.milkingtool:DoMilking(act.target, act.doer)
    else
        return act.invobject.components.milkingtool:NotReady(act.doer)
    end
end

local PURIFY = Action({priority=2, rmb=true})
PURIFY.id = "PURIFY"
PURIFY.str = STRINGS.ACTIONS.PURIFY
PURIFY.fn = function(act)
if act.invobject.components.purify:CanPurify(act.target) then
        return act.invobject.components.purify:DoPurify(act.target, act.doer)
    end
end

local DRINK = Action({ mount_valid=true, priority=2})
DRINK.id = "DRINK"
DRINK.str = STRINGS.ACTIONS.DRINK
DRINK.fn = function(act)
    local obj = act.target or act.invobject
    if obj ~= nil then
        if obj.components.edible ~= nil and act.doer.components.eater ~= nil then
            return act.doer.components.eater:Eat(obj, act.doer)
        end
    end
end

local DRINKPLAYER = Action({ priority=4, rmb=true, canforce=true, rangecheckfn=DefaultRangeCheck })
DRINKPLAYER.id = "DRINKPLAYER"
DRINKPLAYER.str = STRINGS.ACTIONS.FEEDPLAYER
DRINKPLAYER.fn = function(act)
    if act.target ~= nil and
        act.target:IsValid() and
        act.target.sg:HasStateTag("idle") and
        not (act.target.sg:HasStateTag("busy") or
            act.target.sg:HasStateTag("attacking") or
            act.target.sg:HasStateTag("sleeping") or
            act.target:HasTag("playerghost") or
            act.target:HasTag("wereplayer")) and
        act.target.components.eater ~= nil and
        act.invobject.components.edible ~= nil and
        act.target.components.eater:CanEat(act.invobject) and
        (TheNet:GetPVPEnabled() or
        (act.target:HasTag("strongstomach") and 
            act.invobject:HasTag("monstermeat")) or
        (act.invobject:HasTag("spoiled") and act.target:HasTag("ignoresspoilage") and not 
            (act.invobject:HasTag("badfood") or act.invobject:HasTag("unsafefood"))) or
        not (act.invobject:HasTag("badfood") or
            act.invobject:HasTag("unsafefood") or
            act.invobject:HasTag("spoiled"))) then

        if act.target.components.eater:PrefersToEat(act.invobject) then
            local food = act.invobject.components.inventoryitem:RemoveFromOwner()
            if food ~= nil then
                act.target:AddChild(food)
                food:RemoveFromScene()
                food.components.inventoryitem:HibernateLivingItem()
                food.persists = false
                act.target.sg:GoToState("drinking", { feed = food, feeder = act.doer })
                return true
            end
        else
            act.target:PushEvent("wonteatfood", { food = act.invobject })
            return true -- the action still "succeeded", there's just no result on this end
        end
    end
end

AddAction(FILL_BARREL)
AddAction(FILL_BUCKET)
AddAction(PURIFY)
AddAction(DRINK)
AddAction(DRINKPLAYER)
AddAction(MILKINGTOOL)

-- 만들어진 액션을 상호작용할 prefab에 넣어주는 구간

local function milkingtool(inst, doer, target, actions)
    if target:HasTag("lightninggoat") then
        table.insert(actions, ACTIONS.MILKINGTOOL)
    end
end

local function purify(inst, doer, target, actions)
    if inst:HasTag("purify_pill") or inst:HasTag("purify") then
        if target:HasTag("purify_pill") or target:HasTag("purify") then
            table.insert(actions, ACTIONS.PURIFY)
        end
    end
end

local function waterlevel(inst, doer, target, actions)
    if target:HasTag("accepting_water") then
        for k, v in pairs(WATERGROUP) do
            if target:HasTag(v.name.."_waterlevel") then
                for i, v2 in ipairs(v.types) do
                    if inst:HasTag("water_"..v2) then
                        table.insert(actions, ACTIONS.FILL_BARREL)
                        return
                    end
                end
            end
        end
        for k, v in pairs(WATERTYPE) do
            --print("For " .. tostring(v) .. ": " .. tostring(inst:HasTag(v.."_water")) .. ", " .. tostring(target:HasTag(v.."_waterlevel")))
            if inst:HasTag("water_"..v) then
                if target:HasTag(v.."_waterlevel") then
                    table.insert(actions, ACTIONS.FILL_BARREL)
                end
                return
            end
        end
    end
    if target:HasTag("watertaker") then
        table.insert(actions, ACTIONS.FILL_BUCKET)
    end
end

local function watertaker(inst, doer, target, actions)
    for k, v in pairs(WATERGROUP) do
        if target:HasTag(v.name.."_waterlevel") then
            table.insert(actions, ACTIONS.FILL_BUCKET)
            return
        end
    end
    for k, v in pairs(WATERTYPE) do
        if target:HasTag("water_"..v) or target:HasTag(v.."_waterlevel") then
            table.insert(actions, ACTIONS.FILL_BUCKET)
            return
        end
    end
end

local function drinking_use(inst, doer, target, actions, right)

    local iscritter = target:HasTag("critter")
    local ishandfed = target:HasTag("handfed")

    if not (target.replica.rider ~= nil and target.replica.rider:IsRiding()) and
        not (doer.replica.rider ~= nil and doer.replica.rider:IsRiding() and
            not (target.replica.inventoryitem ~= nil and target.replica.inventoryitem:IsGrandOwner(doer))) and
        not target:HasTag("wereplayer") then

        if right or iscritter then
            for k, v in pairs(FOODGROUP) do
                if target:HasTag(v.name.."_eater") then
                    for i, v2 in ipairs(v.types) do
                        if inst:HasTag("edible_"..v2) then
                            if iscritter or ishandfed then
                                if (target.replica.follower ~= nil and target.replica.follower:GetLeader() == doer) or target:HasTag("fedbyall") then
                                    table.insert(actions, ACTIONS.FEED)
                                end
                            elseif target:HasTag("player") and inst:HasTag("drink") then
                                if TheNet:GetPVPEnabled() or 
                                    (target:HasTag("strongstomach") and inst:HasTag("monstermeat")) or
                                    (inst:HasTag("spoiled") and target:HasTag("ignoresspoilage") and not 
                                        (inst:HasTag("badfood") or inst:HasTag("unsafefood"))) or not -- ignoresspoilage still checks for unsage foods
                                    (inst:HasTag("badfood") or inst:HasTag("unsafefood") or inst:HasTag("spoiled")) then
                                    table.insert(actions, ACTIONS.DRINKPLAYER)
                                end
                            elseif (target:HasTag("small_livestock") or ishandfed)
                                and target.replica.inventoryitem ~= nil
                                and target.replica.inventoryitem:IsHeld() then
                                table.insert(actions, ACTIONS.FEED)
                            end
                            return
                        end
                    end
                end
            end
            for k, v in pairs(FOODTYPE) do
                if inst:HasTag("edible_"..v) and inst:HasTag("drink") and target:HasTag(v.."_eater") then
                    if iscritter or ishandfed then
                        if (target.replica.follower ~= nil and target.replica.follower:GetLeader() == doer) or target:HasTag("fedbyall") then
                            table.insert(actions, ACTIONS.FEED)
                        end
                    elseif target:HasTag("player") and inst:HasTag("drink") then
                        if TheNet:GetPVPEnabled() or 
                            (target:HasTag("strongstomach") and inst:HasTag("monstermeat")) or
                            (inst:HasTag("spoiled") and target:HasTag("ignoresspoilage") and not 
                                (inst:HasTag("badfood") or inst:HasTag("unsafefood"))) or not -- ignoresspoilage still checks for unsage foods
                            (inst:HasTag("badfood") or inst:HasTag("unsafefood") or inst:HasTag("spoiled")) then
                            table.insert(actions, ACTIONS.DRINKPLAYER) 
                        end
                    elseif (target:HasTag("small_livestock") or ishandfed)
                        and target.replica.inventoryitem ~= nil
                        and target.replica.inventoryitem:IsHeld() then
                        table.insert(actions, ACTIONS.FEED)
                    end
                    return
                end
            end
        end

        if target:HasTag("compostingbin_accepts_items")
            and not inst:HasTag("edible_ELEMENTAL")
            and not inst:HasTag("edible_GEARS")
            and not inst:HasTag("edible_INSECT")
            and not inst:HasTag("edible_BURNT") then

            table.insert(actions, ACTIONS.ADDCOMPOSTABLE)
        end
    end
end

local function drinking_inv(inst, doer, actions, right)
    if (right or inst.replica.equippable == nil) and
        not (doer.replica.inventory:GetActiveItem() == inst and
            doer.replica.rider ~= nil and
            doer.replica.rider:IsRiding()) then
        for k, v in pairs(FOODGROUP) do
            if doer:HasTag(v.name.."_eater") then
                for i, v2 in ipairs(v.types) do
                    if inst:HasTag("edible_"..v2) and inst:HasTag("drink") then
                        table.insert(actions, ACTIONS.DRINK)
                        return
                    end
                end
            end
        end
    end
    for k, v in pairs(FOODTYPE) do
        if inst:HasTag("edible_"..v) and inst:HasTag("drink") and doer:HasTag(v.."_eater") then
            table.insert(actions, ACTIONS.DRINK)
            return
        end
    end
end

-- 프롭들의 애니메이션 실행 코드 구간

local drunk = State{
    name = "drunk",
    tags = { "busy", "pausepredict", "nomorph" },

    onenter = function(inst)
        ForceStopHeavyLifting(inst)
        inst.Physics:Stop()
        inst.AnimState:PlayAnimation("powerdown")

        if inst.components.playercontroller ~= nil then
            inst.components.playercontroller:RemotePausePrediction()
        end
    end,

    timeline =
    {
        TimeEvent(29 * FRAMES, function(inst)
            inst.sg:RemoveStateTag("nointerrupt")
        end),
    },

    events =
    {
        EventHandler("animover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },
}

local refresh_drunk = State{
    name = "refreshdrunk",
    tags = { "busy", "pausepredict", "nomorph" },

    onenter = function(inst)
        ForceStopHeavyLifting(inst)
        inst.Physics:Stop()
        inst.AnimState:PlayAnimation("powerup")

        if inst.components.playercontroller ~= nil then
            inst.components.playercontroller:RemotePausePrediction()
        end
    end,

    timeline =
    {
        TimeEvent(29 * FRAMES, function(inst)
            inst.sg:RemoveStateTag("nointerrupt")
        end),
    },

    events =
    {
        EventHandler("animover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },
}

local drinking_act = State{
    name = "drinking",
    tags = {"busy"},

    onenter = function(inst, foodinfo)
        inst.SoundEmitter:KillSound("eating")
        inst.components.locomotor:Stop()
        local feed = foodinfo and foodinfo.feed
        if feed ~= nil then
            inst.components.locomotor:Clear()
            inst:ClearBufferedAction()
            inst.sg.statemem.feed = foodinfo.feed
            inst.sg.statemem.feeder = foodinfo.feeder
            inst.sg:AddStateTag("pausepredict")
            if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:RemotePausePrediction()
            end
        elseif inst:GetBufferedAction() then
            feed = inst:GetBufferedAction().invobject
        end

        if feed == nil or
            feed.components.edible == nil or
            feed.components.edible.foodtype ~= FOODTYPE.GEARS then
            inst.SoundEmitter:PlaySound("drink_fx/player/drinking","drinking",.25)
        end

        if inst.components.inventory:IsHeavyLifting() and
            not inst.components.rider:IsRiding() then
            inst.AnimState:PlayAnimation("heavy_quick_eat")
        else
            inst.AnimState:PlayAnimation("quick_eat_pre")
            inst.AnimState:PushAnimation("quick_eat", false)
        end

        inst.components.hunger:Pause()
    end,

    timeline = {
        TimeEvent(12 * FRAMES, function(inst)
            if inst.sg.statemem.feed ~= nil then
                inst.components.eater:Eat(inst.sg.statemem.feed, inst.sg.statemem.feeder)
            else
                inst:PerformBufferedAction()
            end
            inst.sg:RemoveStateTag("busy")
            inst.sg:RemoveStateTag("pausepredict")
        end),
    },

    events = {
        EventHandler("animqueueover", function(inst)
            if inst.AnimState:AnimDone() then
                inst.sg:GoToState("idle")
            end
        end),
    },

    onexit = function(inst)
        inst.SoundEmitter:KillSound("drinking")
        if not GetGameModeProperty("no_hunger") then
            inst.components.hunger:Resume()
        end
        if inst.sg.statemem.feed ~= nil and inst.sg.statemem.feed:IsValid() then
            inst.sg.statemem.feed:Remove()
        end
    end,
}

local drinking_client_act = State{
    name = "drinking",
    tags = {"busy"},
                
    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("quick_eat_pre")
        inst.AnimState:PushAnimation("quick_eat_lag", false)

        inst:PerformPreviewBufferedAction()
        inst.sg:SetTimeout(TIMEOUT)
    end,

    onupdate = function(inst)
        if inst:HasTag("busy") then
            if inst.entity:FlattenMovementPrediction() then
                inst.sg:GoToState("idle", "noanim")
            end
        elseif inst.bufferedaction == nil then
            inst.sg:GoToState("idle")
        end
    end,

    ontimeout = function(inst)
        inst:ClearBufferedAction()
        inst.sg:GoToState("idle")
    end,
}

AddStategraphState("wilson", refresh_drunk)
AddStategraphState("wilson", drunk)
AddStategraphState("wilson", drinking_act)
AddStategraphState("wilson_client", drinking_client_act)

-- 만들어진 애니메이션을 연결해 주는 코드 구간

local refresh_drunk_event = EventHandler("refreshdrunk",function(inst)
        if not inst.sg:HasStateTag("dead") then
            inst.sg:GoToState("refreshdrunk")
        end
    end)

local drunk_event = EventHandler("drunk",function(inst)
        if not inst.sg:HasStateTag("dead") then
            inst.sg:GoToState("drunk")
        end
    end)

local drinking_client_event = EventHandler("drinking_client",function(inst, action)
        if inst.sg:HasStateTag("busy") or inst:HasTag("busy") then
            return
        end
        local obj = action.target or action.invobject
        if obj == nil then
            return
        end
        for k, v in pairs(FOODTYPE) do
            if obj:HasTag("edible_"..v) and obj:HasTag("drink") then
                return v == "drinking"
            end
        end
    end)

local drinking_event = EventHandler("drinking",function(inst, action)
            if inst.sg:HasStateTag("busy") then
            return
        end
        local obj = action.target or action.invobject
        if obj == nil then
            return
        elseif obj.components.edible ~= nil then
            if not inst.components.eater:PrefersToEat(obj) then
                inst:PushEvent("wonteatfood", { food = obj })
                return
            end
        else
            return
        end
        return "drinking"
    end)

AddStategraphEvent("wilson",refresh_drunk_event)
AddStategraphEvent("wilson",drunk_event)
AddStategraphEvent("wilson",drink_event)
AddStategraphEvent("wilson_client",refresh_drunk_event)
AddStategraphEvent("wilson_client",drunk_event)
AddStategraphEvent("wilson_client",drinking_client_event)

-- 액션테이블, 컴포넌트, 작업한 함수 합치는 코드 구간

AddComponentAction("USEITEM", "water", waterlevel)
AddComponentAction("USEITEM", "purify", purify)
AddComponentAction("USEITEM", "edible", drinking_use)
AddComponentAction("USEITEM", "milkingtool", milkingtool)
AddComponentAction("INVENTORY", "edible", drinking_inv)
AddComponentAction("USEITEM", "watertaker", watertaker)

-- 만들어진 컴포넌트 액션을 케릭터에 연결시키는 코드 구간

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.FILL_BARREL, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.FILL_BARREL, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.FILL_BUCKET, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.FILL_BARREL, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.PURIFY, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.PURIFY, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DRINK, "drinking"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINK, "drinking"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DRINKPLAYER, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINKPLAYER, "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.MILKINGTOOL, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.MILKINGTOOL, "dolongaction"))
