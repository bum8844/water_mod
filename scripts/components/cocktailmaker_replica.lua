--This replica is generated to refresh cooker container's "cook" button
--every time waterlevel is updated.
local CocktailMaker = Class(function(self, inst)
	self.inst = inst
	self._canmakecocktail = net_bool(inst.GUID, "waterlevel._canmakecocktail")
end)

--getters
function CocktailMaker:CanShack()
	return self._canmakecocktail:value()
end

--setters
function CocktailMaker:SetCanShack(is)
	if TheWorld.ismastersim then
		self._canmakecocktail:set(is)
	end
end

return CocktailMaker