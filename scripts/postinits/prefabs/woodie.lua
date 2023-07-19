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
	end
end

local function woodie(inst)
	inst:ListenForEvent("transform_person", onbecamehuman)
	inst:ListenForEvent("transform_wereplayer", onbecamewereplayer)
end

AddPrefabPostInit("woodie", woodie)
