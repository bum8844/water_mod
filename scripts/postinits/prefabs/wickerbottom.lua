AddPrefabPostInit("wickerbottom",function(inst)
	if inst.components.eater ~= nil then
		 inst.components.eater.stale_thirst = TUNING.WICKERBOTTOM_STALE_FOOD_THIRST
	end
end)
