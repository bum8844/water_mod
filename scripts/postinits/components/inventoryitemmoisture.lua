AddComponentPostInit("inventoryitemmoisture",function(self)

	local _UpdateMoisture = self.UpdateMoisture

	function self:GetTargetMoisture_spring(...)
    	local owner = self.inst.components.inventoryitem.owner
		return (owner == nil and GLOBAL.FindEntity(self.inst, TUNING.SPRINKLER_RANGE, nil, {"waterspray"}) ~= nil and TUNING.OCEAN_WETNESS)
			or 0
	end

	function self:UpdateMoisture(dt,...)
		if GLOBAL.FindEntity(self.inst, TUNING.SPRINKLER_RANGE, nil, {"waterspray"}) ~= nil then
		    local targetMoisture = self:GetTargetMoisture_spring()
			local target_delta = targetMoisture - self.moisture
		    if target_delta > 0 then
		        self:SetMoisture(math.min(targetMoisture, self.moisture + 0.5 * dt))
		    elseif target_delta < 0 then
		        self:SetMoisture(math.max(targetMoisture, self.moisture - dt))
		    end
		else
			_UpdateMoisture(self,dt,...)
		end
	end
end)