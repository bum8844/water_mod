AddComponentPostInit("moisture", function(self)
	local easing = require("easing")
	local dehy_OnUpdate = self.OnUpdate

	function self:GetMoistureRate_sping()
		if GLOBAL.FindEntity(self.inst, TUNING.SPRINKLER_RANGE, nil, {"waterspray"}) == nil then
			return 0
		end
		if self.inst.components.rainimmunity ~= nil then
			return 0
		end

	    local waterproofmult =
	        (   self.inst.components.sheltered ~= nil and
	            self.inst.components.sheltered.sheltered and
	            self.inst.components.sheltered.waterproofness or 0
	        ) +
	        (   self.inst.components.inventory ~= nil and
	            self.inst.components.inventory:GetWaterproofness() or 0
	        ) +
	        (   self.inherentWaterproofness or 0
	        ) +
	        (
	            self.waterproofnessmodifiers:Get() or 0
	        )
	    if waterproofmult >= 1 then
        	return 0
    	end

    	local rate = 1
    	return rate * (1 - waterproofmult)
	end

	function self:OnUpdate(dt,...)
		if self:GetMoistureRate_sping() then
			if self:IsForceDry() then
		        return
		    end
		    --[[if self.forceddrymodifiers:Get() then
		        return
		    end]]

		    local sleepingbagdryingrate = self:GetSleepingBagDryingRate()
		    if sleepingbagdryingrate ~= nil then
		        self.rate = -sleepingbagdryingrate
		    else
		        local moisturerate = self:GetMoistureRate()
		        local moisturerate_sping = self:GetMoistureRate_sping()
		        local dryingrate = self:GetDryingRate(moisturerate)
		        local equippedmoisturerate = self:GetEquippedMoistureRate(dryingrate)

		        self.rate = moisturerate + moisturerate_sping + equippedmoisturerate - dryingrate
		    end

		    self.ratescale =
		        (self.rate > .3 and GLOBAL.RATE_SCALE.INCREASE_HIGH) or
		        (self.rate > .15 and GLOBAL.RATE_SCALE.INCREASE_MED) or
		        (self.rate > .001 and GLOBAL.RATE_SCALE.INCREASE_LOW) or
		        (self.rate < -3 and GLOBAL.RATE_SCALE.DECREASE_HIGH) or
		        (self.rate < -1.5 and GLOBAL.RATE_SCALE.DECREASE_MED) or
		        (self.rate < -.001 and GLOBAL.RATE_SCALE.DECREASE_LOW) or
		        GLOBAL.RATE_SCALE.NEUTRAL

		    self:DoDelta(self.rate * dt)
		else
			return dehy_OnUpdate(dt,...)
		end
	end
end)
