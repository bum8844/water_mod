AddPrefabPostInit("wathgrithr",function(inst)
	if inst.components.foodaffinity ~= nil then
		inst.components.foodaffinity:AddTagAffinity("veggietype", 0.85)
		inst.components.foodaffinity:AddTagAffinity("fruittype", 0.85)
		inst.components.foodaffinity:AddTagAffinity("leavestype", 0.85)
	end
end)