--This replica is generated to refresh cooker container's "cook" button
--every time waterlevel is updated.
local Waterlevel = Class(function(self, inst)
	self.inst = inst
	self._noneboil = net_bool(inst.GUID, "waterlevel._noneboil")
	self._accepting = net_bool(inst.GUID, "waterlevel._accepting")
	self._isdepleted = net_bool(inst.GUID, "waterlevel._isdepleted", "waterleveldirty")
	self._watertype = net_hash(inst.GUID, "waterlevel._watertype")
end)

--getters
function Waterlevel:HasWater()
	return not self._isdepleted:value()
end

function Waterlevel:NoneBoil()
	return self._noneboil:value()
end

function Waterlevel:IsAccepting()
	return self._accepting:value()
end

function Waterlevel:Watertype()
	return self._watertype:value()
end

--setters
function Waterlevel:SetIsDepleted(is)
	if TheWorld.ismastersim then
		self._isdepleted:set(is)
	end
end

function Waterlevel:SetAccepting(is)
	if TheWorld.ismastersim then
		self._accepting:set(is)
	end
end

function Waterlevel:SetWaterType(type)
	if TheWorld.ismastersim then
		self._watertype:set(type)
	end
end

return Waterlevel
