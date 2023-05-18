local function CheckItem(inst, data)
	if inst.killcode == nil and not ( data.loot.prefab == ( "cookingrecipecard" or "boillingrecipcard" or "fermentingrecipcard") ) then
        if inst.ghost == nil then
			if math.random() < TUNING.COOKINGRECIPECARD_GRAVESTONE_CHANCE then
                inst.components.lootdropper:SpawnLootPrefab("boillingrecipcard")
			elseif math.random() < TUNING.COOKINGRECIPECARD_GRAVESTONE_CHANCE then
				inst.components.lootdropper:SpawnLootPrefab("fermentingrecipcard")
			end
        end
        inst.killcode = true
    else
    	inst.killcode = nil
    end
end

AddPrefabPostInit("mound", function(inst)
	inst:ListenForEvent("loot_prefab_spawned",CheckItem)
end)