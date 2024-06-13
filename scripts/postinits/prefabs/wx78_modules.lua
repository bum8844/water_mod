local function OnChipType(inst)
    inst.water_swap_type = true
    --inst.water_use_prefab_name = true
	inst.AnimState:SetBuild("water_wx_chips")
end

AddPrefabPostInit("wx78module_nonedrunk", function(inst)
	inst:DoTaskInTime(0, OnChipType)
end)