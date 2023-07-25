AddComponentPostInit("edible", function(self)
    self.stale_thirst = TUNING.STALE_FOOD_THIRST
    self.spoiled_thirst = TUNING.SPOILED_FOOD_THIRST
    self.isdrink = false
    --self.waterpersip = 10
    --self.thirstvalue = 0
    --AFS: If thirstvalue is not assigned, it will be automatically calculated.

    function self:GetThirstFromHungerValue()
        local mult = (self.inst:HasTag("preparedfood") and 0.25) or 0.125
		local thirstvalue = (self.inst:HasTag("fruit") and self.hungervalue * 0.75) or
             (self.inst:HasTag("veggie") and self.hungervalue * 0.5) or
             (RoundBiasedUp(self.hungervalue * 2 ^ (math.abs(self.hungervalue / 300) - 1), 4) * mult)
	    return thirstvalue
	end

    function self:GetThirst(eater)
        local thirst = self.thirstvalue or self:GetThirstFromHungerValue()
        local multiplier = 1
        local ignore_spoilage = not self.degrades_with_spoilage or thirst < 0 or (eater ~= nil and eater.components.eater ~= nil and eater.components.eater.ignoresspoilage)

        if not ignore_spoilage and self.inst.components.perishable ~= nil then
            if self.inst.components.perishable:IsStale() then
                multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.stale_thirst or self.stale_thirst
            elseif self.inst.components.perishable:IsSpoiled() then
                multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.spoiled_thirst or self.spoiled_thirst
            end
        end

        --[[if eater ~= nil and eater.components.foodaffinity ~= nil then
            local affinity_bonus = eater.components.foodaffinity:GetAffinity(self.inst)
            if affinity_bonus ~= nil then
                multiplier = multiplier * affinity_bonus
            end
        end]]

        return multiplier * thirst
    end
end)