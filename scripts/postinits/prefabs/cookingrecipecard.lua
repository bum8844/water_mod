local function OnCookerType(inst)
	if inst.cooker_name == "kettle" then
		inst.minisign_atlas = "minisign_dehy_items_swap"
		inst.AnimState:SetBuild("boillingrecipcard")
		inst.AnimState:SetBank("boillingrecipcard")
		inst.components.inventoryitem:ChangeImageName("boillingrecipcard")
	elseif inst.cooker_name == "brewery" then
		inst.minisign_atlas = "minisign_dehy_items_swap"
		inst._swap_type = "fermentingrecipcard"
		inst.AnimState:SetBuild("fermentingrecipcard")
		inst.AnimState:SetBank("fermentingrecipcard")
		inst.components.inventoryitem:ChangeImageName("fermentingrecipcard")
	end
end

AddPrefabPostInit("cookingrecipecard", function(inst)
	inst:DoTaskInTime(0, OnCookerType)
end)
