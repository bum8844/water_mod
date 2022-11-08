AddPrefabPostInit("pond", function(inst)
	inst:AddComponent("water")
	inst.components.water.watertype = WATERTYPE.DIRTY
end)

AddPrefabPostInit("pond_mos", function(inst)
	inst:AddComponent("water")
	inst.components.water.watertype = WATERTYPE.DIRTY
end)

AddPrefabPostInit("pond_cave", function(inst)
	inst:AddComponent("water")
	inst.components.water.watertype = WATERTYPE.DIRTY
end)
