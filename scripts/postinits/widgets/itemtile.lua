AddClassPostConstruct("widgets/itemtile", function(self)
	local _Refresh = self.Refresh
	function self:Refresh()
		_Refresh(self)
		if not self.ismastersim then
			return
		end
		if self.item.components.waterlevel ~= nil then
			self:SetPercent(self.item.components.waterlevel:GetPercent())
		end
	end
end)
