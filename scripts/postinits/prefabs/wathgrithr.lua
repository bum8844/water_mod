AddPrefabPostInit("wathgrithr",function(inst)
	if inst.components.foodaffinity ~= nil then
		inst.components.foodaffinity:AddTagAffinity("veggietype", 0.25)
		inst.components.foodaffinity:AddTagAffinity("fruittype", 0.25)
		inst.components.foodaffinity:AddTagAffinity("leavestype", 0.25)
	end
end)