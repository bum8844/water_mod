local function OnEatSoul(inst, soul, ...)
	if GetModConfigData("enable_thirst") then
	    inst.components.hunger:DoDelta(TUNING.CALORIES_MED)
		if inst.wortox_inclination == "nice" then
			inst.components.sanity:DoDelta(-TUNING.SANITY_TINY * 2)
		elseif inst.wortox_inclination == "naughty" then
			-- Feel nothing.
		else
			inst.components.sanity:DoDelta(-TUNING.SANITY_TINY)
		end
	    inst.components.thirst:DoDelta(TUNING.HYDRATION_MEDSMALL)
	    if inst._checksoulstask ~= nil then
	        inst._checksoulstask:Cancel()
	    end
	    inst._checksoulstask = inst:DoTaskInTime(.2, CheckSoulsRemovedAfterAnim, "eat")
	else
		return inst.components.souleater._oneatsoulfn(inst, soul, ...)
	end
end

AddPrefabPostInit("wortox",function(inst)
	if inst.components.eater ~= nil then
		inst.components.eater:SetThristAbsorption(.5)
	end
	if inst.components.souleater ~= nil then
		inst.components.souleater._oneatsoulfn = inst.components.souleater.oneatsoulfn
		inst:DoTaskInTime(0, function()	
			inst.components.souleater:SetOnEatSoulFn(OnEatSoul)
		end)
	end
end)
