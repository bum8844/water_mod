local WEREMODE_NAMES =
{
    "beaver",
    "moose",
    "goose",
}

local function IsWereMode(mode)
    return WEREMODE_NAMES[mode] ~= nil
end

local function onbecamewereplayer(inst)
	if not GetGameModeProperty("no_hunger") then
		if inst.components.thirst:IsThirst() then
			inst.components.thirst:SetPercent(.001, true)
		end
		inst.components.thirst:Pause()
	end
end

local function onbecamehuman(inst)
	if not GetGameModeProperty("no_hunger") then
		inst.components.thirst:Resume()
        if IsWereMode(inst.weremode:value()) then
            local thirstpercent = inst:HasTag("cursemaster") and TUNING.SKILLS.WOODIE.CURSE_MASTER_MIN_HUNGER or 0
            inst.components.thirst:SetPercent(thirstpercent, true)
        end
	end
end

local function onpreload(inst, data)
	if data then
<<<<<<< HEAD
		inst.OnPreLoad_old(inst, data)
=======
		inst.dehy_OnPreLoad(inst, data)
>>>>>>> Beta_1.2.8
		if data.isbeaver or data.ismoose or data.isgoose then
			inst.components.thirst:Pause()
		end
	end
end

local function woodie(inst)
	inst:ListenForEvent("transform_person", onbecamehuman)
	inst:ListenForEvent("transform_wereplayer", onbecamewereplayer)

<<<<<<< HEAD
	inst.OnPreLoad_old = inst.OnPreLoad
=======
	inst.dehy_OnPreLoad = inst.OnPreLoad
>>>>>>> Beta_1.2.8
	inst.OnPreLoad = onpreload
end

AddPrefabPostInit("woodie", woodie)
