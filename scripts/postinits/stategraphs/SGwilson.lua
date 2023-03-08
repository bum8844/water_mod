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

if GetModConfigData("enable_thirst") then

-- 스피치 추가해야함

local function SetSleeperSleepState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:AddImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:IgnoreAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Disable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(false)
        inst.components.playercontroller:Enable(false)
    end
    inst:OnSleepIn()
    inst.components.inventory:Hide()
    inst:PushEvent("ms_closepopups")
    inst:ShowActions(false)
end

local function SetSleeperAwakeState(inst)
    if inst.components.grue ~= nil then
        inst.components.grue:RemoveImmunity("sleeping")
    end
    if inst.components.talker ~= nil then
        inst.components.talker:StopIgnoringAll("sleeping")
    end
    if inst.components.firebug ~= nil then
        inst.components.firebug:Enable()
    end
    if inst.components.playercontroller ~= nil then
        inst.components.playercontroller:EnableMapControls(true)
        inst.components.playercontroller:Enable(true)
    end
    inst:OnWakeUp()
    inst.components.inventory:Show()
    inst:ShowActions(true)
end

local bedroll_water = State{
        name = "bedroll_water",
        tags = { "bedroll", "busy", "nomorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()

            local failreason =
                (GLOBAL.TheWorld.state.isday and
                    (GLOBAL.TheWorld:HasTag("cave") and "ANNOUNCE_NODAYSLEEP_CAVE" or "ANNOUNCE_NODAYSLEEP")
                )
                or (inst.IsNearDanger(inst) and "ANNOUNCE_NODANGERSLEEP")
                -- you can still sleep if your hunger will bottom out, but not absolutely
                or (inst.components.hunger.current < TUNING.CALORIES_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or (inst.components.thirst.current < TUNING.HYDRATION_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or nil

            if failreason == nil and inst.components.sleepingbaguser ~= nil then
                local _, sleepingbagfailreason = inst.components.sleepingbaguser:ShouldSleep()
                failreason = sleepingbagfailreason
            end

            if failreason ~= nil then
                inst:PushEvent("performaction", { action = inst.bufferedaction })
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle")
                if inst.components.talker ~= nil then
                    inst.components.talker:Say(GLOBAL.GetString(inst, failreason))
                end
                return
            end

            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("bedroll", false)
            SetSleeperSleepState(inst)

            --Hack since we've already temp unequipped hand items at this point
            --but we want to show the correct arms for action_uniqueitem_pre
            if inst._sleepinghandsitem ~= nil then
                inst.AnimState:Show("ARM_carry")
                inst.AnimState:Hide("ARM_normal")
            end
        end,

        timeline =
        {
            TimeEvent(20 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/wilson/use_bedroll")
            end),
        },

        events =
        {
            EventHandler("firedamage", function(inst)
                if inst.sg:HasStateTag("sleeping") then
                    inst.sg.statemem.iswaking = true
                    inst.sg:GoToState("wakeup")
                end
            end),
            EventHandler("animqueueover", function(inst)
                if inst.AnimState:AnimDone() then
                    if GLOBAL.TheWorld.state.isday or
                        (inst.components.health ~= nil and inst.components.health.takingfiredamage) or
                        (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
                        inst:PushEvent("performaction", { action = inst.bufferedaction })
                        inst:ClearBufferedAction()
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    elseif inst:GetBufferedAction() then
                        inst:PerformBufferedAction()
                        if inst.components.playercontroller ~= nil then
                            inst.components.playercontroller:Enable(true)
                        end
                        inst.sg:AddStateTag("sleeping")
                        inst.sg:AddStateTag("silentmorph")
                        inst.sg:RemoveStateTag("nomorph")
                        inst.sg:RemoveStateTag("busy")
                        inst.AnimState:PlayAnimation("bedroll_sleep_loop", true)
                    else
                        inst.sg.statemem.iswaking = true
                        inst.sg:GoToState("wakeup")
                    end
                end
            end),
        },

        onexit = function(inst)
            if not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Hide("ARM_carry")
                inst.AnimState:Show("ARM_normal")
            end
            if inst.sleepingbag ~= nil then
                --Interrupted while we are "sleeping"
                inst.sleepingbag.components.sleepingbag:DoWakeUp(true)
                inst.sleepingbag = nil
                SetSleeperAwakeState(inst)
            elseif not inst.sg.statemem.iswaking then
                --Interrupted before we are "sleeping"
                SetSleeperAwakeState(inst)
            end
        end,
    }

local tent_water = State{
        name = "tent_water",
        tags = { "tent", "busy", "silentmorph" },

        onenter = function(inst)
            inst.components.locomotor:Stop()

            local target = inst:GetBufferedAction().target
            local siesta = target:HasTag("siestahut")
            local failreason =
                (siesta ~= GLOBAL.TheWorld.state.isday and
                    (siesta
                    and (GLOBAL.TheWorld:HasTag("cave") and "ANNOUNCE_NONIGHTSIESTA_CAVE" or "ANNOUNCE_NONIGHTSIESTA")
                    or (GLOBAL.TheWorld:HasTag("cave") and "ANNOUNCE_NODAYSLEEP_CAVE" or "ANNOUNCE_NODAYSLEEP"))
                )
                or (target.components.burnable ~= nil and
                    target.components.burnable:IsBurning() and
                    "ANNOUNCE_NOSLEEPONFIRE")
                or (inst.IsNearDanger(inst) and "ANNOUNCE_NODANGERSLEEP")
                -- you can still sleep if your hunger will bottom out, but not absolutely
                or (inst.components.hunger.current < TUNING.CALORIES_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or (inst.components.thirst.current < TUNING.HYDRATION_MED and "ANNOUNCE_NOHUNGERSLEEP")
                or nil

            if failreason ~= nil then
                inst:PushEvent("performaction", { action = inst.bufferedaction })
                inst:ClearBufferedAction()
                inst.sg:GoToState("idle")
                if inst.components.talker ~= nil then
                    inst.components.talker:Say(GLOBAL.GetString(inst, failreason))
                end
                return
            end

            inst.AnimState:PlayAnimation("pickup")
            inst.sg:SetTimeout(6 * FRAMES)

            SetSleeperSleepState(inst)
        end,

        ontimeout = function(inst)
            local bufferedaction = inst:GetBufferedAction()
            if bufferedaction == nil then
                inst.AnimState:PlayAnimation("pickup_pst")
                inst.sg:GoToState("idle", true)
                return
            end
            local tent = bufferedaction.target
            if tent == nil or
                not tent.components.sleepingbag or
                not tent:HasTag("tent") or
                tent:HasTag("hassleeper") or
                tent:HasTag("siestahut") ~= GLOBAL.TheWorld.state.isday or
                (tent.components.burnable ~= nil and tent.components.burnable:IsBurning()) then
                --Edge cases, don't bother with fail dialogue
                --Also, think I will let smolderig pass this one
                inst:PushEvent("performaction", { action = inst.bufferedaction })
                inst:ClearBufferedAction()
                inst.AnimState:PlayAnimation("pickup_pst")
                inst.sg:GoToState("idle", true)
            else
                inst:PerformBufferedAction()
                inst.components.health:SetInvincible(true)
                inst:Hide()
                if inst.Physics ~= nil then
                    inst.Physics:Teleport(inst.Transform:GetWorldPosition())
                end
                if inst.DynamicShadow ~= nil then
                    inst.DynamicShadow:Enable(false)
                end
                inst.sg:AddStateTag("sleeping")
                inst.sg:RemoveStateTag("busy")
                if inst.components.playercontroller ~= nil then
                    inst.components.playercontroller:Enable(true)
                end
            end
        end,

        onexit = function(inst)
            inst.components.health:SetInvincible(false)
            inst:Show()
            if inst.DynamicShadow ~= nil then
                inst.DynamicShadow:Enable(true)
            end
            if inst.sleepingbag ~= nil then
                --Interrupted while we are "sleeping"
                inst.sleepingbag.components.sleepingbag:DoWakeUp(true)
                inst.sleepingbag = nil
                SetSleeperAwakeState(inst)
            elseif not inst.sg.statemem.iswaking then
                --Interrupted before we are "sleeping"
                SetSleeperAwakeState(inst)
            end
        end,
    },

AddStategraphState("wilson", bedroll_water)
AddStategraphState("wilson", tent_water)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.SLEEPIN, "bedroll_water"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.SLEEPIN, "tent_water"))

end

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
