--This replica is generated to refresh cooker container's "cook" button
--every time waterlevel is updated.
local Waterlevel = Class(function(self, inst)
	self.inst = inst
	self._isdepleted = net_bool(inst.GUID, "waterlevel._isdepleted", "waterleveldirty")
end)

function Waterlevel:IsDepleted()
	return self._isdepleted
end

function Waterlevel:SetIsDepleted(is)
	if TheWorld.ismastersim then
		self._isdepleted:set(is)
	end
end

return Waterlevel
