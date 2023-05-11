AddPrefabPostInit("wurt",function(inst)
	if inst.components.foodaffinity ~= nil then
		inst.components.foodaffinity:AddPrefabAffinity ("veggie_tea", 1.93)
	end
end)
