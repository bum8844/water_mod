
local function ForceStopHeavyLifting(inst)
    if inst.components.inventory:IsHeavyLifting() then
        inst.components.inventory:DropItem(
            inst.components.inventory:Unequip(EQUIPSLOTS.BODY),
            true,
            true
        )
    end
end

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

local drink = State{
    name = "drink",
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

        inst.SoundEmitter:PlaySound("drink_fx/player/drinking","drinking")

        if inst.components.inventory:IsHeavyLifting() and
            not inst.components.rider:IsRiding() then
            inst.AnimState:PlayAnimation("heavy_quick_eat")
        else
            inst.AnimState:PlayAnimation("quick_eat_pre")
            inst.AnimState:PushAnimation("quick_eat", false)
        end

        inst.components.hunger:Pause()
        if inst.components.thirst ~= nil then
            inst.components.thirst:Pause()
        end
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
            if inst.components.thirst ~= nil then
                inst.components.thirst:Resume()
            end
        end
        if inst.sg.statemem.feed ~= nil and inst.sg.statemem.feed:IsValid() then
            inst.sg.statemem.feed:Remove()
        end
    end,
}

local drinkstew = State{
        name = "drinkstew",
        tags = { "busy", "nodangle" },

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
                inst.SoundEmitter:PlaySound("drink_fx/player/drinking_stew", "drinkstew")
            end

            --[[if feed ~= nil and feed.components.soul ~= nil then
                inst.sg.statemem.soulfx = SpawnPrefab("wortox_eat_soul_fx")
                inst.sg.statemem.soulfx.entity:SetParent(inst.entity)
                if inst.components.rider:IsRiding() then
                    inst.sg.statemem.soulfx:MakeMounted()
                end
            end]]

            if inst.components.inventory:IsHeavyLifting() and
                not inst.components.rider:IsRiding() then
                inst.AnimState:PlayAnimation("heavy_eat")
            else
                inst.AnimState:PlayAnimation("eat_pre")
                inst.AnimState:PushAnimation("eat", false)
            end

            inst.components.hunger:Pause()
        end,

        timeline =
        {
            TimeEvent(28 * FRAMES, function(inst)
                if inst.sg.statemem.feed == nil then
                    inst:PerformBufferedAction()
                --[[elseif inst.sg.statemem.feed.components.soul == nil then
                    inst.components.eater:Eat(inst.sg.statemem.feed, inst.sg.statemem.feeder)
                elseif inst.components.souleater ~= nil then
                    inst.components.souleater:EatSoul(inst.sg.statemem.feed)]]
                end
            end),

            TimeEvent(30 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
                inst.sg:RemoveStateTag("pausepredict")
            end),

            TimeEvent(70 * FRAMES, function(inst)
                inst.SoundEmitter:KillSound("drinkstew")
            end),
        },

        events =
        {
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },

        onexit = function(inst)
            inst.SoundEmitter:KillSound("drinkstew")
            if not GetGameModeProperty("no_hunger") then
                inst.components.hunger:Resume()
            end
            if inst.sg.statemem.feed ~= nil and inst.sg.statemem.feed:IsValid() then
                inst.sg.statemem.feed:Remove()
            end
            --[[if inst.sg.statemem.soulfx ~= nil then
                inst.sg.statemem.soulfx:Remove()
            end]]
        end,
    }
    
AddStategraphState("wilson", refresh_drunk)
AddStategraphState("wilson", drunk)
AddStategraphState("wilson", drink)
AddStategraphState("wilson", drinkstew)

------------------------------------------------------------------------

local refresh_drunk_event = EventHandler("refreshdrunk", function(inst)
        if not inst.sg:HasStateTag("dead") then
            inst.sg:GoToState("refreshdrunk")
        end
    end)

local drunk_event = EventHandler("drunk", function(inst)
        if not inst.sg:HasStateTag("dead") then
            inst.sg:GoToState("drunk")
        end
    end)

local drink_event = EventHandler("drink",function(inst, action)
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
    --[[elseif obj.components.soul ~= nil then
        if inst.components.souleater == nil then
            inst:PushEvent("wonteatfood", { food = obj })
            return
        end]]
    else
        return
    end
    return --[[(obj.components.soul ~= nil and "drinkstew")
        or]] (obj.components.edible.foodtype == FOODTYPE.MEAT and "drinkstew")
        or "drink"
    end)

AddStategraphEvent("wilson", refresh_drunk_event)
AddStategraphEvent("wilson", drunk_event)
AddStategraphEvent("wilson", drink_event)

------------------------------------------------------------------------

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.GIVEWATER, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TAKEWATER, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TAKEWATER_OCEAN, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.MILKINGTOOL, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.UPGRADE_TILEARRIVE, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DRINK,
        function(inst, action)
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
            return (obj.components.edible.foodtype == FOODTYPE.MEAT and "drinkstew") or "drink"
        end
    )
)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TURNON_TILEARRIVE, "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.BREWING,
        function(inst, action)
            return inst:HasTag("expertchef") and "domediumaction" or "dolongaction"
        end
    )
)

------------------------------------------------------------------------

AddStategraphPostInit("wilson", function(sg)
    do
        local function DoEquipmentFoleySounds(inst)
            local inventory = inst.replica.inventory
            if inventory ~= nil then
                for k, v in pairs(inventory:GetEquips()) do
                    if v.foleysound ~= nil then
                        inst.SoundEmitter:PlaySound(v.foleysound, nil, nil, true)
                    end
                end
            end
        end

        local function DoFoleySounds(inst)
            DoEquipmentFoleySounds(inst)
            if inst.foleysound ~= nil then
                inst.SoundEmitter:PlaySound(inst.foleysound, nil, nil, true)
            end
        end

        local function PlayMooseFootstep(inst, volume, ispredicted)
            --moose footstep always full volume
            inst.SoundEmitter:PlaySound("dontstarve/characters/woodie/moose/footstep", nil, nil, ispredicted)
            PlayFootstep(inst, volume, ispredicted)
        end

        local function ConfigureRunState(inst)
            if inst.components.rider:IsRiding() then
                inst.sg.statemem.riding = true
                inst.sg.statemem.groggy = inst:HasTag("groggy") or inst:HasTag("drunk")
                inst.sg:AddStateTag("nodangle")

                local mount = inst.components.rider:GetMount()
                inst.sg.statemem.ridingwoby = mount and mount:HasTag("woby")

            elseif inst.components.inventory:IsHeavyLifting() then
                inst.sg.statemem.heavy = true
                inst.sg.statemem.heavy_fast = inst.components.mightiness ~= nil and inst.components.mightiness:IsMighty()
            elseif inst:HasTag("wereplayer") then
                inst.sg.statemem.iswere = true
                if inst:HasTag("weremoose") then
                    if inst:HasTag("groggy") then
                        inst.sg.statemem.moosegroggy = true
                    else
                        inst.sg.statemem.moose = true
                    end
                elseif inst:HasTag("weregoose") then
                    if inst:HasTag("groggy") then
                        inst.sg.statemem.goosegroggy = true
                    else
                        inst.sg.statemem.goose = true
                    end
                elseif inst:HasTag("groggy") or inst:HasTag("drunk") then
                    inst.sg.statemem.groggy = true
                else
                    inst.sg.statemem.normal = true
                end
            elseif inst:GetStormLevel() >= TUNING.SANDSTORM_FULL_LEVEL and not inst.components.playervision:HasGoggleVision() then
                inst.sg.statemem.sandstorm = true
            elseif inst:HasTag("groggy") or inst:HasTag("drunk") then
                inst.sg.statemem.groggy = true
            elseif inst:IsCarefulWalking() then
                inst.sg.statemem.careful = true
            else
                inst.sg.statemem.normal = true
                inst.sg.statemem.normalwonkey = inst:HasTag("wonkey") or nil
            end
        end

        local function GetRunStateAnim(inst)
            return ((inst.sg.statemem.heavy and inst.sg.statemem.heavy_fast) and "heavy_walk_fast")
                or (inst.sg.statemem.heavy and "heavy_walk")
                or (inst.sg.statemem.sandstorm and "sand_walk")
                or ((inst.sg.statemem.groggy or inst.sg.statemem.moosegroggy or inst.sg.statemem.goosegroggy) and "idle_walk")
                or (inst.sg.statemem.careful and "careful_walk")
                or (inst.sg.statemem.ridingwoby and "run_woby")
                or "run"
        end

        local _idle_onenter = sg.states["idle"].onenter
        sg.states["idle"].onenter = function(inst, pushanim,...)    
            if inst:HasTag("drunk") then
                inst.components.locomotor:Stop()
                inst.components.locomotor:Clear()

                if inst.components.drownable ~= nil and inst.components.drownable:ShouldDrown() then
                    inst.sg:GoToState("sink_fast")
                    return
                end

                inst.sg.statemem.ignoresandstorm = true

                if inst.components.rider:IsRiding() then
                    inst.sg:GoToState("mounted_idle", pushanim)
                    return
                end

                local equippedArmor = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.BODY)
                if equippedArmor ~= nil and equippedArmor:HasTag("band") then
                    inst.sg:GoToState("enter_onemanband", pushanim)
                    return
                end

                if inst.sg.mem.queuetalk_timeout ~= nil then
                    local remaining_talk_time = inst.sg.mem.queuetalk_timeout - GLOBAL.GetTime()
                    inst.sg.mem.queuetalk_timeout = nil
                    if not inst:HasTag("ignoretalking") and not pushanim then
                        if remaining_talk_time > 1 then
                            if not inst:HasTag("mime") then
                                inst.sg:GoToState("talk")
                                return
                            elseif not inst.components.inventory:IsHeavyLifting() then
                                inst.sg:GoToState("mime")
                                return
                            end
                        end
                    end
                end

                local anims = {}
                local dofunny = true

                if inst:HasTag("wereplayer") then
                    if inst:HasTag("groggy") or inst:HasTag("drunk") then
                        --V2C: groggy moose and goose go straight back to idle_groggy (don't play idle_groggy_pre everytime like others do)
                        local skippre = false
                        if inst:HasTag("weremoose") then
                            skippre =
                                inst.AnimState:IsCurrentAnimation("idle_walk_pst") or
                                inst.AnimState:IsCurrentAnimation("idle_walk") or
                                inst.AnimState:IsCurrentAnimation("idle_walk_pre")
                        elseif inst:HasTag("weregoose") then
                            skippre =
                                inst.AnimState:IsCurrentAnimation("idle_walk_pst") or
                                inst.AnimState:IsCurrentAnimation("idle_walk") or
                                inst.AnimState:IsCurrentAnimation("idle_walk_pre")
                        end
                        if not skippre then
                            table.insert(anims, "idle_groggy_pre")
                        end
                        table.insert(anims, "idle_groggy")
                    else
                        table.insert(anims, "idle_loop")
                        if inst:HasTag("weregoose") then
                            inst.sg.statemem.gooseframe = -1
                        end
                    end
                    dofunny = false
                elseif inst.components.inventory:IsHeavyLifting() then
                    table.insert(anims, "heavy_idle")
                    dofunny = false
                else
                    inst.sg.statemem.ignoresandstorm = false
                    if inst:GetStormLevel() >= TUNING.SANDSTORM_FULL_LEVEL
                        and not inst.components.playervision:HasGoggleVision() then
                        if not (inst.AnimState:IsCurrentAnimation("sand_walk_pst") or
                                inst.AnimState:IsCurrentAnimation("sand_walk") or
                                inst.AnimState:IsCurrentAnimation("sand_walk_pre")) then
                            table.insert(anims, "sand_idle_pre")
                        end
                        table.insert(anims, "sand_idle_loop")
                        inst.sg.statemem.sandstorm = true
                        dofunny = false
                    elseif inst.components.sanity:IsInsane() then
                        table.insert(anims, "idle_sanity_pre")
                        table.insert(anims, "idle_sanity_loop")
                    elseif inst.components.sanity:IsEnlightened() then
                        table.insert(anims, "idle_lunacy_pre")
                        table.insert(anims, "idle_lunacy_loop")
                    elseif inst.components.temperature:IsFreezing() then
                        table.insert(anims, "idle_shiver_pre")
                        table.insert(anims, "idle_shiver_loop")
                    elseif inst.components.temperature:IsOverheating() then
                        table.insert(anims, "idle_hot_pre")
                        table.insert(anims, "idle_hot_loop")
                        dofunny = false
                    elseif inst:HasTag("groggy") or inst:HasTag("drunk") then
                        if not inst.AnimState:IsCurrentAnimation("yawn") then
                            table.insert(anims, "idle_groggy_pre")
                        end
                        table.insert(anims, "idle_groggy")
                    else
                        table.insert(anims, "idle_loop")
                    end
                end

                if pushanim then
                    for k, v in pairs(anims) do
                        inst.AnimState:PushAnimation(v, k == #anims)
                    end
                else
                    inst.AnimState:PlayAnimation(anims[1], #anims == 1)
                    for k, v in pairs(anims) do
                        if k > 1 then
                            inst.AnimState:PushAnimation(v, k == #anims)
                        end
                    end
                end

                if dofunny then
                    inst.sg:SetTimeout(math.random() * 4 + 2)
                end
            else
                _idle_onenter(inst, pushanim,...)
            end
        end
        local _run_timeline = sg.states["run"].timeline
        local _run_start_onenter = sg.states["run_start"].onenter
        sg.states["run_start"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                ConfigureRunState(inst)
                if inst.sg.statemem.normalwonkey and inst.components.locomotor:GetTimeMoving() >= TUNING.WONKEY_TIME_TO_RUN then
                    inst.sg:GoToState("run_monkey")
                    return
                end
                inst.components.locomotor:RunForward()
                inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pre")
                
                inst.sg.mem.footsteps = (inst.sg.statemem.goose or inst.sg.statemem.goosegroggy) and 4 or 0
            else
                _run_start_onenter(inst,...)
            end
        end
        local _run_onenter = sg.states["run"].onenter
        sg.states["run"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                ConfigureRunState(inst)
                inst.components.locomotor:RunForward()

                local anim = GetRunStateAnim(inst)
                if anim == "run" then
                    anim = "run_loop"
                elseif anim == "run_woby" then
                    anim = "run_woby_loop"
                end
                if not inst.AnimState:IsCurrentAnimation(anim) then
                    inst.AnimState:PlayAnimation(anim, true)
                end

                inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
            else
                _run_onenter(inst,...)
            end
        end
        local _run_stop_onenter = sg.states["run_stop"].onenter
        sg.states["run_stop"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                ConfigureRunState(inst)
                inst.components.locomotor:Stop()
                inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pst")

                if inst.sg.statemem.moose or inst.sg.statemem.moosegroggy then
                    PlayMooseFootstep(inst, .6, true)
                    DoFoleySounds(inst)
                end
            else
                _run_stop_onenter(inst,...)
            end
        end
        local _acting_run_stop_onenter = sg.states["acting_run_stop"].onenter
        sg.states["acting_run_stop"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                ConfigureRunState(inst)
                inst.components.locomotor:Stop()
                inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pst")

                if inst.sg.statemem.moose or inst.sg.statemem.moosegroggy then
                    PlayMooseFootstep(inst, .6, true)
                    DoFoleySounds(inst)
                end
            else
                _acting_run_stop_onenter(inst,...)
            end
        end
        local _funnyidle_onenter = sg.states["funnyidle"].onenter
        sg.states["funnyidle"].onenter = function(inst, ...)
            if GetModConfigData("enable_thirst") or inst:HasTag("drunk") then
                if inst.components.temperature:GetCurrent() < 5 then
                    inst.AnimState:PlayAnimation("idle_shiver_pre")
                    inst.AnimState:PushAnimation("idle_shiver_loop")
                    inst.AnimState:PushAnimation("idle_shiver_pst", false)
                elseif inst.components.temperature:GetCurrent() > TUNING.OVERHEAT_TEMP - 10 then
                    inst.AnimState:PlayAnimation("idle_hot_pre")
                    inst.AnimState:PushAnimation("idle_hot_loop")
                    inst.AnimState:PushAnimation("idle_hot_pst", false)
                elseif GetModConfigData("enable_thirst") and inst.components.thirst:GetPercent() < TUNING.THIRST_THRESH then
                    inst.AnimState:PlayAnimation("idle_groggy01_pre")
                    inst.AnimState:PushAnimation("idle_groggy01_loop")
                    inst.AnimState:PushAnimation("idle_groggy01_pst", false)
                elseif inst.components.hunger:GetPercent() < TUNING.HUNGRY_THRESH then
                    inst.AnimState:PlayAnimation("hungry")
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/hungry")
                elseif inst.components.sanity:IsInsanityMode() and inst.components.sanity:GetPercent() < .5 then
                    inst.AnimState:PlayAnimation("idle_inaction_sanity")
                elseif inst.components.sanity:IsLunacyMode() and inst.components.sanity:GetPercent() > .5 then
                    inst.AnimState:PlayAnimation("idle_inaction_lunacy")
                elseif inst:HasTag("groggy") or inst:HasTag("drunk") then
                    inst.AnimState:PlayAnimation("idle_groggy01_pre")
                    inst.AnimState:PushAnimation("idle_groggy01_loop")
                    inst.AnimState:PushAnimation("idle_groggy01_pst", false)
                elseif inst.customidleanim == nil and inst.customidlestate == nil then
                    inst.AnimState:PlayAnimation("idle_inaction")
                else
                    local anim = inst.customidleanim ~= nil and (type(inst.customidleanim) == "string" and inst.customidleanim or inst:customidleanim()) or nil
                    local state = anim == nil and (inst.customidlestate ~= nil and (type(inst.customidlestate) == "string" and inst.customidlestate or inst:customidlestate())) or nil
                    if anim ~= nil or state ~= nil then
                        if inst.sg.mem.idlerepeats == nil then
                            inst.sg.mem.usecustomidle = math.random() < .5
                            inst.sg.mem.idlerepeats = 0
                        end
                        if inst.sg.mem.idlerepeats > 1 then
                            inst.sg.mem.idlerepeats = inst.sg.mem.idlerepeats - 1
                        else
                            inst.sg.mem.usecustomidle = not inst.sg.mem.usecustomidle
                            inst.sg.mem.idlerepeats = inst.sg.mem.usecustomidle and 1 or math.ceil(math.random(2, 5) * .5)
                        end
                        if inst.sg.mem.usecustomidle then
                            if anim ~= nil then
                                inst.AnimState:PlayAnimation(anim)
                            else
                                inst.sg:GoToState(state)
                            end
                        else
                            inst.AnimState:PlayAnimation("idle_inaction")
                        end
                    else
                        inst.AnimState:PlayAnimation("idle_inaction")
                    end
                end
            else
                _funnyidle_onenter(inst, ...)
            end
        end
    end
    local eater = sg.actionhandlers[ACTIONS.EAT].deststate
    sg.actionhandlers[ACTIONS.EAT].deststate = function(inst, action)
        if inst.sg:HasStateTag("busy") then
            return
        end
        local obj = action.target or action.invobject
        if obj == nil then
            return
        end
        if obj:HasTag("drink") then
            if obj.components.edible ~= nil then
                if not inst.components.eater:PrefersToEat(obj) then
                    inst:PushEvent("wonteatfood", { food = obj })
                    return
                end
            --[[elseif obj.components.soul ~= nil then
                if inst.components.souleater == nil then
                    inst:PushEvent("wonteatfood", { food = obj })
                    return
                end]]
            else
                return
            end
            return --[[(obj.components.soul ~= nil and "drinkstew")
                or]] (obj.components.edible.foodtype == FOODTYPE.MEAT and "drinkstew")
                or "drink"
        else
            return eater(inst, action)
        end
    end
end)


if GetModConfigData("enable_thirst") then
    AddStategraphPostInit("wilson", function(sg)
        do
            local _bedroll_onenter = sg.states["bedroll"].onenter
            sg.states["bedroll"].onenter = function (inst, ...)
                if inst.components.thirst.current < TUNING.HYDRATION_MED then
                    inst:PushEvent("performaction", { action = inst.bufferedaction })
                    inst:ClearBufferedAction()
                    inst.sg:GoToState("idle")
                    if inst.components.talker ~= nil then
                        inst.components.talker:Say(GLOBAL.GetString(inst, "ANNOUNCE_NOTHIRSTSLEEP"))
                    end
                    return
                else
                    _bedroll_onenter(inst, ...)
                end
            end
            local _tent_onenter = sg.states["tent"].onenter
            sg.states["tent"].onenter = function (inst, ...)
                if inst.components.thirst.current < TUNING.HYDRATION_MED then
                    inst:PushEvent("performaction", { action = inst.bufferedaction })
                    inst:ClearBufferedAction()
                    inst.sg:GoToState("idle")
                    if inst.components.talker ~= nil then
                        inst.components.talker:Say(GLOBAL.GetString(inst, "ANNOUNCE_NOTHIRSTSLEEP"))
                    end
                    return
                else
                    _tent_onenter(inst, ...)
                end
            end
        end
    end)
end


