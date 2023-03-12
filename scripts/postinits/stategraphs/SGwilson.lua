
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

        inst.SoundEmitter:PlaySound("drink_fx/player/drinking","drinking",.25)

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

AddStategraphState("wilson", refresh_drunk)
AddStategraphState("wilson", drunk)
AddStategraphState("wilson", drink)

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

AddStategraphEvent("wilson", refresh_drunk_event)
AddStategraphEvent("wilson", drunk_event)

------------------------------------------------------------------------

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.GIVEWATER, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TAKEWATER, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.TAKEWATER_OCEAN, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.MILKINGTOOL, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.PURIFY, "dolongaction"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DRINK, "drink"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DRINKPLAYER, "give"))

------------------------------------------------------------------------

AddStategraphPostInit("wilson", function(sg)
    local eater = sg.actionhandlers[ACTIONS.EAT].deststate
    sg.actionhandlers[ACTIONS.EAT].deststate = function(inst, action)
        local result = eater(inst, action)
        if result ~= nil then
            local obj = action.target or action.invobject
            if obj:HasTag("drink") then
                return "drink"
            end
        end
        return result
    end
end)


if GetModConfigData("enable_thirst") then
-- 스피치 추가해야함
    AddStategraphPostInit("wilson", function(sg)
        do
            local _funnyidle_onenter = sg.states["funnyidle"].onenter
            local function test(inst, ...)
                return inst.components.temperature:GetCurrent() < 5 or inst.components.temperature:GetCurrent() > TUNING.OVERHEAT_TEMP - 10
            end
            sg.states["funnyidle"].onenter = function(inst, ...)
                if test(inst, ...) then
                    _funnyidle_onenter(inst, ...)
                elseif inst.components.thirst:GetPercent() < TUNING.THIRST_THRESH then
                    inst.AnimState:PlayAnimation("idle_groggy01_pre")
                    inst.AnimState:PushAnimation("idle_groggy01_loop")
                    inst.AnimState:PushAnimation("idle_groggy01_pst", false)
                else
                    _funnyidle_onenter(inst, ...)
                end
            end
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


