DismantleToolUser = Class(function(self, inst)
	self.inst = inst
	self._candismantle = net_bool(inst.GUID, "waterlevel._candismantle")
end)

--getters
function DismantleToolUser:CanDismantle()
	return self._candismantle:value()
end

--setters
function DismantleToolUser:SetCanDismantle(is)
	if TheWorld.ismastersim then
		self._candismantle:set(is)
	end
end

return DismantleToolUser