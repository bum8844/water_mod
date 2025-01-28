-- bum: This makes tea leaves dryable.
-- AFS: dryer:StartDrying calls dryable.components.perishable:GetPercent(), so we need to add such hack to
-- make the objects without dryable on the rack (tea leaves, in this case).
AddComponentPostInit("dryer", function(self)
	local dehy_StartDrying = self.StartDrying
	
	function self:StartDrying(dryable, ...)
		if dryable.components.dryable ~= nil and dryable.components.perishable == nil then
			dryable:AddComponent("perishable")
		end
		
		return dehy_StartDrying(self, dryable, ...)
	end
end)
