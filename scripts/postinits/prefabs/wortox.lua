local function OnEatSoul(inst, soul, ...)
	if GetModConfigData("enable_thirst") then
	    inst.components.hunger:DoDelta(TUNING.CALORIES_MED)
	    inst.components.sanity:DoDelta(-TUNING.SANITY_SMALL)
	    inst.components.thirst:DoDelta(TUNING.HYDRATION_MEDSMALL)
	    if inst._checksoulstask ~= nil then
	        inst._checksoulstask:Cancel()
	    end
	    inst._checksoulstask = inst:DoTaskInTime(.2, CheckSoulsRemovedAfterAnim, "eat")
	else
		return inst.components.souleater.dehy_oneatsoulfn(inst, soul, ...)
	end
end

AddPrefabPostInit("wortox",function(inst)
	if inst.components.eater ~= nil then
		inst.components.eater:SetThristAbsorption(.5)
	end
	if inst.components.souleater ~= nil then
		inst.components.souleater.dehy_oneatsoulfn = inst.components.souleater.oneatsoulfn
		inst:DoTaskInTime(0, function()	
			inst.components.souleater:SetOnEatSoulFn(OnEatSoul)
		end)
	end
end)
