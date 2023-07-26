local function OnCookerType(inst)
	if inst.cooker_name == "kettle" then
		inst.AnimState:SetBuild("boillingrecipcard")
		inst.AnimState:SetBank("boillingrecipcard")
		inst.components.inventoryitem:ChangeImageName("boillingrecipcard")
	elseif inst.cooker_name == "brewery" then
		inst.AnimState:SetBuild("fermentingrecipcard")
		inst.AnimState:SetBank("fermentingrecipcard")
		inst.components.inventoryitem:ChangeImageName("fermentingrecipcard")
	end
end

AddPrefabPostInit("cookingrecipecard", function(inst)
	inst:DoTaskInTime(0, OnCookerType)
end)
