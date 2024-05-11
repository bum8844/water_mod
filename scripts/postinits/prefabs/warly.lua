AddPrefabPostInit("warly",function(inst)
	if inst.components.eater ~= nil then
		if inst.components.thirst ~= nil then
			inst.components.eater:SetThristAbsorption(1.5)
		end
		inst.components.foodaffinity:AddPrefabAffinity("water_clean", 0.6667) --왈리가 음료를 요리해 먹을 동기를 부여
		inst.components.foodaffinity:AddPrefabAffinity("water_mineral", 0.6667)
	end
end)
