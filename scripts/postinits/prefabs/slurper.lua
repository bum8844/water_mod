local function slurpthirst(inst, owner)
    if owner.components.thirst ~= nil then
        if owner.components.thirst.current > 0 then
        	owner.components.thirst:DoDelta(-5)
        end
    elseif owner.components.health ~= nil then
        owner.components.health:DoDelta(-5, false, "slurper")
    end
end

local function OnEquip(inst, owner)
    inst.components.equippable.dehy_onequipfn(inst, owner)
    if inst.dehy_task ~= nil then
        inst.dehy_task:Cancel()
    end
    inst.dehy_task = inst:DoPeriodicTask(2, slurpthirst, nil, owner)
end

AddPrefabPostInit("slurper", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.equippable ~= nil then
        inst.components.equippable.dehy_onequipfn = inst.components.equippable.onequipfn
    	inst.components.equippable:SetOnEquip(OnEquip)
	end
end)