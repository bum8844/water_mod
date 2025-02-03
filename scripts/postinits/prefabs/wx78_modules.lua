local function OnChipType(inst)
    inst.minisign_atlas = "minisign_dehy_items_swap"
	inst.AnimState:SetBuild("water_wx_chips")
end

AddPrefabPostInit("wx78module_nonedrunk", function(inst)
	inst:DoTaskInTime(0, OnChipType)
<<<<<<< HEAD
=======
end)

AddPrefabPostInit("wx78module_acid_drying", function(inst)
	inst:DoTaskInTime(0, OnChipType)
>>>>>>> Beta_1.2.8
end)