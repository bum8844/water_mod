--Addding Percentage on items with the 'waterlevel' component
AddClassPostConstruct("components/inventoryitem_replica", function(self)
	local dehy_SerializeUsage = self.SerializeUsage
	function self:SerializeUsage()
		dehy_SerializeUsage(self)
		if self.classified ~= nil and self.inst.components.waterlevel ~= nil then
			self.classified:SerializePercentUsed(self.inst.components.waterlevel:GetPercent())
		end
	end
end)
