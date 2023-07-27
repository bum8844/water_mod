AddComponentPostInit("foodmemory", function(self)
	local spicedfoods_caffeinberry = require("water_spicedfoods")
	local spicedfoods_caffeinberry_mod = require("water_spicedfoods_mod")
	local _GetBaseFood = self.GetBaseFood

	function self:GetBaseFood(prefab)
		local basefood = _GetBaseFood(self, prefab) --check vanilla spicedfoods
		if basefood == prefab then
			basefood = (spicedfoods_caffeinberry[prefab] ~= nil and spicefoods[prefab].basename) or --check mod spicedfoods
			(spicedfoods_caffeinberry_mod[prefab] ~= nil and spicedfoods_caffeinberry_mod[prefab].basename) or
			prefab
		end
		return basefood
	end
end)
