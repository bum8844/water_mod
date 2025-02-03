local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_body", "armor_slurper", "swap_body")
    if owner.components.thirst ~= nil then
		owner.components.thirst.burnratemodifiers:SetModifier(inst, TUNING.ARMORSLURPER_SLOW_HUNGER)
    end
    if owner.components.hunger ~= nil then
		owner.components.hunger.burnratemodifiers:SetModifier(inst, TUNING.ARMORSLURPER_SLOW_HUNGER)
    end

    inst.components.fueled:StartConsuming()
end

local function onunequip(inst, owner)
	owner.AnimState:ClearOverrideSymbol("swap_body")
    if owner.components.thirst ~= nil then
       owner.components.thirst.burnratemodifiers:RemoveModifier(inst)
    end
    if owner.components.hunger ~= nil then
        owner.components.hunger.burnratemodifiers:RemoveModifier(inst)
    end

    inst.components.fueled:StopConsuming()
end

local function onequiptomodel(inst, owner, from_ground)
    if owner.components.thirst ~= nil then
        owner.components.thirst.burnratemodifiers:RemoveModifier(inst)
    end
    if owner.components.hunger ~= nil then
        owner.components.hunger.burnratemodifiers:RemoveModifier(inst)
    end

    inst.components.fueled:StopConsuming()
end

AddPrefabPostInit("armorslurper", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.equippable ~= nil then
		inst.components.equippable:SetOnEquip(onequip)
		inst.components.equippable:SetOnUnequip(onunequip)
		inst.components.equippable:SetOnEquipToModel(onequiptomodel)
	end
end)