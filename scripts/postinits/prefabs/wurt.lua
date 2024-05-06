AddPrefabPostInit("wurt",function(inst)
	if inst.components.thirst ~= nil then
		inst.components.thirst:SetRate(WILSON_THIRST_RATE*TUNING.WURT_THIRST_RATE_MODIFIER)
	end
	if inst.components.foodaffinity ~= nil then
		inst.components.foodaffinity:AddPrefabAffinity("veggie_tea", 1.93)
		inst.components.foodaffinity:AddPrefabAffinity("seaweed_shake", 1.93)
	end
end)
