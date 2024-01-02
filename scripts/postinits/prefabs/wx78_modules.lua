local function OnChipType(inst)
	inst.AnimState:SetBuild("water_wx_chips")
end

AddPrefabPostInit("wx78module_nonedrunk", function(inst)
	inst:DoTaskInTime(0, OnChipType)
end)