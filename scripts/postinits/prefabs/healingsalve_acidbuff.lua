local function buff_OnAttached(inst, target)
	if target._activate_acid_drying_module then
		inst.components.debuff:Stop()
	else
		inst.components.debuff.dehy_onattachedfn(inst, target)
	end
end

local function buff_OnDetached(inst, target)
	if target._activate_acid_drying_module then
		inst:Remove()
	else
		inst.components.debuff.dehy_ondetachedfn(inst, target)
	end
end

AddPrefabPostInit("healingsalve_acidbuff",function(inst)
	if inst.components.debuff then
		inst.components.debuff.dehy_onattachedfn = inst.components.debuff.onattachedfn
		inst.components.debuff.dehy_ondetachedfn = inst.components.debuff.ondetachedfn
	    inst.components.debuff:SetAttachedFn(buff_OnAttached)
	    inst.components.debuff:SetDetachedFn(buff_OnDetached)
	end
end)