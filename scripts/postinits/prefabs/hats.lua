local fns = {}

local function batnose_equip(inst, owner)
   	local old_onequipfn = inst.components.equippable.old_onequipfn
  	old_onequipfn(inst, owner)
  	if owner.components.thirst ~= nil then
    	owner:AddDebuff("thirstregenbuff", "thirstregenbuff")
    end
end

local function batnose_unequip(inst, owner)
   	local old_onunequipfn = inst.components.equippable.old_onunequipfn
  	old_onunequipfn(inst, owner)
  	if owner.components.thirst ~= nil then
    	owner:RemoveDebuff("thirstregenbuff", "thirstregenbuff")
    end
end

fns.batnose_onequiptomodel = function(inst, owner, from_ground)
    local old_onequiptomodelfn = inst.components.equippable.old_onequiptomodelfn
    old_onequiptomodelfn(inst, owner, from_ground)
    if owner.components.thirst ~= nil then
    	owner:RemoveDebuff("thirstregenbuff", "thirstregenbuff")
    end
end

local function AddBuff(inst)
	local equippable_comp = inst.components.equippable
	if equippable_comp then
		if equippable_comp.onequipfn ~= nil and equippable_comp.old_onequipfn == nil then
			equippable_comp.old_onequipfn = equippable_comp.onequipfn
		end
		if equippable_comp.onunequipfn ~= nil and equippable_comp.old_onunequipfn == nil then
			equippable_comp.old_onunequipfn = equippable_comp.onunequipfn
		end
		if equippable_comp.onequiptomodelfn ~= nil and equippable_comp.old_onunequipfn == nil then
			equippable_comp.old_onequiptomodelfn =  equippable_comp.onequiptomodelfn
		end
		inst:DoTaskInTime(0, function()	
			equippable_comp:SetOnEquip(batnose_equip)
			equippable_comp:SetOnUnequip(batnose_unequip)
			equippable_comp:SetOnEquipToModel(fns.batnose_onequiptomodel)
		end)
	end
end

AddPrefabPostInit("batnosehat", AddBuff)