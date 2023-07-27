AddPrefabPostInit("warly",function(inst)
	if inst.components.eater ~= nil then
		inst.components.eater:SetThristAbsorption(1.5)
		inst.components.foodaffinity:AddPrefabAffinity("water_clean", 0.6667) --왈리가 음료를 요리해 먹을 동기를 부여
	end
end)
