
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

local boilbook_open = State{
        name = "boilbook_open",
        tags = { "doing", "busy" },

        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:OverrideSymbol("book_cook", "boilbook", "book_boil")
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("reading_in", false)
            inst.AnimState:PushAnimation("reading_loop", true)
        end,

        timeline =
        {
            TimeEvent(8 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
                inst:PerformBufferedAction()
            end),
        },

        onupdate = function(inst)
            if not GLOBAL.CanEntitySeeTarget(inst, inst) then
                inst.sg:GoToState("cookbook_close")
            end
        end,

        events =
        {
            EventHandler("ms_closepopup", function(inst, data)
                if data.popup == GLOBAL.POPUPS.BOILBOOK then
                    inst.sg:GoToState("cookbook_close")
                end
            end),
        },

        onexit = function(inst)
            inst:ShowPopUp(GLOBAL.POPUPS.BOILBOOK, false)
        end,
    }

local boilbook_close = State{
        name = "boilbook_close",
        tags = { "idle", "nodangle" },

        onenter = function(inst)
            inst.components.locomotor:StopMoving()
            inst.AnimState:PlayAnimation("reading_pst")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState(inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) ~= nil and "item_out" or "idle")
                end
            end),
        },
    }
    
AddStategraphState("wilson", refresh_drunk)
AddStategraphState("wilson", drunk)
AddStategraphState("wilson", drink)
AddStategraphState("wilson", drinkstew)
AddStategraphState("wilson", boilbook_open)
AddStategraphState("wilson", boilbook_close)

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
        or]] (obj.components.edible.foodtype == FOODTYPE.MEAT and not obj:HasTag("alcohol") and "drinkstew")
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
--[[AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DRINK,
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
            return (obj.components.edible.foodtype == FOODTYPE.MEAT and not obj:HasTag("alcohol") and "drinkstew") or "drink"
        end
    )
)]]
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TURNON_TILEARRIVE, "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.BREWING,
        function(inst, action)
            return inst:HasTag("expertchef") and "domediumaction" or "dolongaction"
        end
    )
)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.READBOILBOOK,"boilbook_open"))

------------------------------------------------------------------------

AddStategraphPostInit("wilson", function(sg)
    do
        local function isgroggy(inst)
            return inst.components.grogginess and not inst.components.grogginess.isgroggy
        end

        local _idle_onenter = sg.states["idle"].onenter
        sg.states["idle"].onenter = function(inst, pushanim,...)    
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end
            _idle_onenter(inst, pushanim,...)
        end

        local _run_start_onenter = sg.states["run_start"].onenter
        sg.states["run_start"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end
            _run_start_onenter(inst,...)
        end

        local _run_onenter = sg.states["run"].onenter
        sg.states["run"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end            
            _run_onenter(inst,...)
        end

        local _run_stop_onenter = sg.states["run_stop"].onenter
        sg.states["run_stop"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end   
            _run_stop_onenter(inst,...)
        end

        local _acting_run_stop_onenter = sg.states["acting_run_stop"].onenter
        sg.states["acting_run_stop"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end
            _acting_run_stop_onenter(inst,...)
        end

        local _funnyidle_onenter = sg.states["funnyidle"].onenter
        sg.states["funnyidle"].onenter = function(inst, ...)
            local case_a = inst.components.temperature:GetCurrent() < 5 or inst.components.temperature:GetCurrent() > TUNING.OVERHEAT_TEMP - 10
            local case_b = inst.components.hunger:GetPercent() < TUNING.HUNGRY_THRESH or (inst.components.sanity:IsInsanityMode() and inst.components.sanity:GetPercent() < .5) or (inst.components.sanity:IsLunacyMode() and inst.components.sanity:GetPercent() > .5)

            if case_a then
                _funnyidle_onenter(inst, ...)
            elseif GetModConfigData("enable_thirst") and inst.components.thirst and inst.components.thirst:GetPercent() < TUNING.THIRST_THRESH then
                inst.AnimState:PlayAnimation("idle_groggy01_pre")
                inst.AnimState:PushAnimation("idle_groggy01_loop")
                inst.AnimState:PushAnimation("idle_groggy01_pst", false)
            elseif case_b then
                _funnyidle_onenter(inst, ...)
            else
                if inst:HasTag("drunk") then
                    inst:AddTag("groggy")
                elseif isgroggy(inst) then 
                    inst:RemoveTag("groggy")
                end
                _funnyidle_onenter(inst, ...)
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
                    or]] (obj.components.edible.foodtype == FOODTYPE.MEAT and not obj:HasTag("alcohol") and "drinkstew")
                    or "drink"
            else
                return eater(inst, action)
            end
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


