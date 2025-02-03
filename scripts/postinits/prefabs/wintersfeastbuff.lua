local function OnAttached(inst, target)
    inst.components.debuff.dehy_onattachedfn(inst, target)
    target.components.thirst.burnratemodifiers:SetModifier(inst, 0)
end

local function OnDetached(inst, target)
    target.components.thirst.burnratemodifiers:RemoveModifier(inst)
    inst.components.debuff.dehy_ondetachedfn(inst, target)
end

AddPrefabPostInit("wintersfeastbuff",function(inst)
	if inst.components.debuff then
		inst.components.debuff.dehy_onattachedfn = inst.components.debuff.onattachedfn
		inst.components.debuff.dehy_ondetachedfn = inst.components.debuff.ondetachedfn
	    inst.components.debuff:SetAttachedFn(OnAttached)
	    inst.components.debuff:SetDetachedFn(OnDetached)
	end
end)
