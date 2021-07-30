local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Ingredient = GLOBAL.Ingredient
local FOODTYPE = GLOBAL.FOODTYPE
local TECH = GLOBAL.TECH
local TUNING = GLOBAL.TUNING
local TheSim = GLOBAL.TheSim
local Vector3 = GLOBAL.Vector3
local ACTIONS = GLOBAL.ACTIONS
local TheNet = GLOBAL.TheNet





AddAction("FILI_CUPDRINK", STRINGS.AW_DRINK, function(act)
	if act.invobject and act.invobject.components.fili_cupdrink then
        return act.invobject.components.fili_cupdrink:Drink(act.doer, act.invobject)
    end
end)
	
function SetupBottleDrinkActions(inst, doer, actions)
	table.insert(actions, GLOBAL.ACTIONS.FILI_CUPDRINK)
end
AddComponentAction("INVENTORY", "fili_cupdrink", SetupBottleDrinkActions)




local State = GLOBAL.State
local TimeEvent = GLOBAL.TimeEvent
local EventHandler = GLOBAL.EventHandler
local FRAMES = GLOBAL.FRAMES
local SpawnPrefab = GLOBAL.SpawnPrefab

local fili_cupdrink_state = GLOBAL.State{
        name = "fili_cupdrink_action",
        tags = { "busy" },

        onenter = function(inst)
            inst.components.locomotor:Stop()

            if inst.components.inventory:IsHeavyLifting() and
                not inst.components.rider:IsRiding() then
                inst.AnimState:PlayAnimation("heavy_quick_eat")
            else
                inst.AnimState:PlayAnimation("action_uniqueitem_pre")
                inst.AnimState:PushAnimation("horn", false)
				inst.AnimState:OverrideSymbol("horn01", "swap_cup", "drink_override")
				inst.AnimState:Show("ARM_normal")
            end
        end,

        timeline =
        {
            TimeEvent(42 * FRAMES, function(inst)
                inst:PerformBufferedAction()
                inst.sg:RemoveStateTag("busy")
                inst.sg:RemoveStateTag("pausepredict")
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
            if inst.components.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry")
                inst.AnimState:Hide("ARM_normal")
            end
        end,
}

local fili_cupdrink_state_client = GLOBAL.State{
        name = "fili_cupdrink_action",
        tags = { "busy" },

        onenter = function(inst)
            inst.components.locomotor:Stop()
		
            inst.AnimState:PlayAnimation("action_uniqueitem_pre")
            inst.AnimState:PushAnimation("horn", false)
			inst.AnimState:OverrideSymbol("horn01", "swap_cup", "drink_override")
			inst.AnimState:Show("ARM_normal")
            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(2)
        end,

        timeline =
        {
            TimeEvent(42 * FRAMES, function(inst)
                inst.sg:RemoveStateTag("busy")
                inst.sg:RemoveStateTag("pausepredict")
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
		    local equip = inst.replica.inventory:GetEquippedItem(GLOBAL.EQUIPSLOTS.HANDS)
            if equip then
                inst.AnimState:Show("ARM_carry")
                inst.AnimState:Hide("ARM_normal")
            end
        end,
}

AddStategraphState("wilson", fili_cupdrink_state)
AddStategraphState("wilson_client", fili_cupdrink_state_client)


local fili_cupdrink_ah = GLOBAL.ActionHandler( GLOBAL.ACTIONS.FILI_CUPDRINK, "fili_cupdrink_action" )
AddStategraphActionHandler("wilson", fili_cupdrink_ah)
AddStategraphActionHandler("wilson_client", fili_cupdrink_ah)
