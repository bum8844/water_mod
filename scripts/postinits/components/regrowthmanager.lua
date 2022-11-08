--regrowth for the mod plants
AddComponentPostInit("regrowthmanager", function(self)
	self:SetRegrowthForType("tea_tree", TUNING.EVERGREEN_REGROWTH.DESOLATION_RESPAWN_TIME, "tea_tree", function()
		return TUNING.TEA_TREE_REGROWTH_TIME_MULT
	end)
	self:SetRegrowthForType("caffeinberry", TUNING.EVERGREEN_REGROWTH.DESOLATION_RESPAWN_TIME, "caffeinberry", function()
		return TUNING.CAFFEINBERRY_REGROWTH_TIME_MULT
	end)
end)