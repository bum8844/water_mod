local FX_FREQ_MIN = 0.25
local FX_FREQ_MAX = 1.8

local function OnTick(inst, target)
    if target.components.health ~= nil and
        not target.components.health:IsDead() and
        not target:HasTag("playerghost") then

		target.components.health:DoDelta(TUNING.WINTERSFEASTBUFF.HEALTH_GAIN, true)

		if target.components.hunger ~= nil then
			target.components.hunger:DoDelta(TUNING.WINTERSFEASTBUFF.HUNGER_GAIN, true)
		end

		if target.components.thirst ~= nil then
			target.components.thirst:DoDelta(TUNING.THIRST_GAIN, true)
		end
		--print("remaining:", inst.components.timer:GetTimeLeft("buffover"))
	else
		inst.components.debuff:Stop()
	end
end

local function CalcIntensity(inst)
	return math.min(inst.components.timer:GetTimeLeft("buffover") / TUNING.WINTERSFEASTBUFF.MAXDURATION, 1)
end

local function OnFxTick(inst, target)
	SpawnPrefab("wintersfeastbuff_fx").Transform:SetPosition(target.Transform:GetWorldPosition())

	local intensity = CalcIntensity(inst)
	inst.SoundEmitter:SetParameter("loop", "intensity", intensity)
	inst:DoTaskInTime(GLOBAL.Remap(intensity, 0, 1, FX_FREQ_MAX, FX_FREQ_MIN), OnFxTick, inst, target)
end

local function OnAttached(inst, target)
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0) --in case of loading

    inst.task = inst:DoPeriodicTask(TUNING.WINTERSFEASTBUFF.TICKRATE, OnTick, nil, target)
	inst.fxtask = inst:DoTaskInTime(0.5 + math.random()*0.75, OnFxTick, inst, target)
    inst:ListenForEvent("death", function()
		local durationleft = inst.components.timer:GetTimeLeft("buffover")
		if durationleft ~= nil and durationleft >= TUNING.WINTERSFEASTBUFF.MAXDURATION * TUNING.WINTERSFEASTBUFF.DROP_SPIRIT_PERCENTAGE_THRESHOLD then
			local item = SpawnPrefab("wintersfeastfuel")
			item.Transform:SetPosition(inst.Transform:GetWorldPosition())
			Launch(item, inst, 2)
		end

        inst.components.debuff:Stop()
    end, target)

	inst.SoundEmitter:PlaySound("wintersfeast2019/winters_feast/feast_buff_LP", "loop")
    inst.SoundEmitter:SetParameter("loop", "intensity", 0)
    target.components.hunger.burnratemodifiers:SetModifier(inst, 0)
    target.components.sanity.externalmodifiers:SetModifier(inst, TUNING.WINTERSFEASTBUFF.SANITY_GAIN)
    target.components.thirst.burnratemodifiers:SetModifier(inst, 0)
end

local function OnDetached(inst, target)
    target.components.hunger.burnratemodifiers:RemoveModifier(inst)
    target.components.sanity.externalmodifiers:RemoveModifier(inst)
    target.components.thirst.burnratemodifiers:RemoveModifier(inst)

	if target.components.talker ~= nil then
		target.components.talker:Say(GLOBAL.GetString(target, "ANNOUNCE_WINTERS_FEAST_BUFF_OVER"))
	end
    inst:Remove()
end

AddPrefabPostInit("wintersfeastbuff",function(inst)
	if inst.components.debuff then
	    inst.components.debuff:SetAttachedFn(OnAttached)
	    inst.components.debuff:SetDetachedFn(OnDetached)
	end
end)
