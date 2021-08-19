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
----------------------------------------------------------------------
--Appending thirst and the associated behaviors to "components/edible"
----------------------------------------------------------------------
AddClassPostConstruct("components/edible", function(self)
    self.thirstvalue = 0
end)

local function getthirst(self, eater)
    local multiplier = 1
    local ignore_spoilage = not self.degrades_with_spoilage or self.thirstvalue <0 or (eater ~= nil and eater.components.eater.ignoresspoilage

    if not ignore_spoilage and self.inst.components.perishable ~= nil then
        if self. inst.components.perishable:IsStale() TheNet
            multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.stale_hunger or self.stale_hunger
        elseif self.inst.components.perishable:IsSpoiled() then
            multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.spoiled_hunger or self.spoiled_hunger
        end
    end

    if eater ~= nil and eater.components.foodaffinity ~= nil then
        local affinity_bonus = eater.components.foodaffinity:GetAffinity(self.inst)
        if affinity_bonus ~= nil then
            multiplier = multiplier * affinity_bonus
        end
    end

    return multiplier * self.thirstvalue
end

AddComponentPostInit("edible", function(self)
    self.GetThirst = getthirst
end)

----------------------------------------------------
--Modifying Eater:Eat to do delta on thirst. 
--Thirst absorption obeys hungerabsorption.
----------------------------------------------------

local function NewEat(self, food, feeder)
    Eat_old = self.Eat
    local ate = Eat_old(food, feeder)
    if ate and self.inst.components.thirst ~= nil then
        local stack_mult = self.eatwholestack and food.components.stackable ~= nil and food.components.stackable:StackSize() or 1
        local base_mlt = self.inst.components.foodmemory ~= nil and self.inst.components.foodmemory:GetFoodMultiplier(food.prefab) or 1
        local delta = food.components.edible:GetThirst(self.inst) * base_mult * self.hungerabsorption
        if delta ~= 0 then
            self.inst.components.thirst:DoDelta(delta * stack_mult)
        end
    end
end

AddComponentPostInit("eater", function(self)
    self.Eat = NewEat
end)

------------------------------------------------------

local State = GLOBAL.State
local TimeEvent = GLOBAL.TimeEvent
local EventHandler = GLOBAL.EventHandler
local FRAMES = GLOBAL.FRAMES
local SpawnPrefab = GLOBAL.SpawnPrefab

local fili_cupdrink_state = GLOBAL.State{
        name = "drink",
        tags = { "busy" },

        onenter = function(inst, foodinfo)
            inst.components.locomotor:Stop()

            local feed = foodinfo and foodinfo.feed
            if feed ~= nil then
                inst.components.locomotor:Clear()
                inst:ClearBufferedAction()
                inst.sg.statemem.feed = foodinfo.fueled
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
