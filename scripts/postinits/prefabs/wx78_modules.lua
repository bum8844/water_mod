local function OnChipType(inst)
    inst.minisign_atlas = "minisign_dehy_items_swap"
	inst.AnimState:SetBuild("water_wx_chips")
end

AddPrefabPostInit("wx78module_nonedrunk", function(inst)
	inst:DoTaskInTime(0, OnChipType)
end)