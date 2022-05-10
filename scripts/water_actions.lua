local ACTIONS = _G.ACTIONS
local Action = _G.Action
local ActionHandler = _G.ActionHandler
local WATERTYPE = _G.WATERTYPE
local State = _G.State
local TimeEvent = _G.TimeEvent
local EventHandler = _G.EventHandler
local FRAMES = _G.FRAMES
local SpawnPrefab = _G.SpawnPrefab
local EQUIPSLOTS = _G.EQUIPSLOTS

local function ForceStopHeavyLifting(inst)
    if inst.components.inventory:IsHeavyLifting() then
        inst.components.inventory:DropItem(
            inst.components.inventory:Unequip(EQUIPSLOTS.BODY),
            true,
            true
        )
    end
end

ACTIONS.COOK.stroverridefn = function(act)
    if act.target:HasTag("kettle") then
        return STRINGS.ACTIONS.BOIL
    else
        return act.target ~= nil and act.target:HasTag("spicer") and STRINGS.ACTIONS.SPICE or nil
    end
end

ACTIONS.HARVEST.stroverridefn = function(act)
    if act.target:HasTag("kettle") then
        return STRINGS.ACTIONS.DRAIN
    end
end

ACTIONS.EAT.stroverridefn = function(act)
    if act.invobject:HasTag("drink") then
        return STRINGS.ACTIONS.DRINKING
    end
end

ACTIONS.STORE.stroverridefn = function(act)
    if act.target:HasTag("kettle") then
        return STRINGS.ACTIONS.BOIL
    end
end

ACTIONS.FILL.priority = 2

local FILL_BARREL = Action({priority=3})
FILL_BARREL.id = "FILL_BARREL"
FILL_BARREL.str = STRINGS.ACTIONS.FILL
FILL_BARREL.fn = function(act)
    if act.target.components.waterlevel:TakeWaterItem(act.invobject, act.doer) then
        return true
    end
end

AddAction(FILL_BARREL)

local function waterlevel(inst, doer, target, actions)
    for k, v in pairs(WATERTYPE) do
        --print("For " .. tostring(v) .. ": " .. tostring(inst:HasTag(v.."_water")) .. ", " .. tostring(target:HasTag(v.."_waterlevel")))
        if inst:HasTag(v.."_water") then
            if target:HasTag(v.."_waterlevel") then
                table.insert(actions, ACTIONS.FILL_BARREL)
            end
            return
        end
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

AddStategraphState("wilson", refresh_drunk)
AddStategraphState("wilson", drunk)

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

AddStategraphEvent("wilson",refresh_drunk_event)
AddStategraphEvent("wilson",drunk_event)

AddComponentAction("USEITEM", "water", waterlevel)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.FILL_BARREL, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.FILL_BARREL, "dolongaction"))



--[[
function SetupBottleDrinkActions(inst, doer, actions)
	table.insert(actions, ACTIONS.FILI_CUPDRINK)
end

AddComponentAction("INVENTORY", "fili_cupdrink", SetupBottleDrinkActions)



local fili_cupdrink_state = State{
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
            if inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
                inst.AnimState:Show("ARM_carry")
                inst.AnimState:Hide("ARM_normal")
            end
        end,
}

local fili_cupdrink_state_client = .State{
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
		    local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if equip then
                inst.AnimState:Show("ARM_carry")
                inst.AnimState:Hide("ARM_normal")
            end
        end,
}

AddStategraphState("wilson", fili_cupdrink_state)
AddStategraphState("wilson_client", fili_cupdrink_state_client)


local fili_cupdrink_ah = ActionHandler( ACTIONS.FILI_CUPDRINK, "fili_cupdrink_action" )
AddStategraphActionHandler("wilson", fili_cupdrink_ah)
AddStategraphActionHandler("wilson_client", fili_cupdrink_ah)]]
