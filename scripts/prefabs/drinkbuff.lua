local function OnAttached_caffein(inst, target)
    if target.caffeinbuff_duration then
        inst.components.timer:StartTimer("caffeinbuff_done", target.caffeinbuff_duration)
    end
    if not inst.components.timer:TimerExists("caffeinbuff_done") then
        inst.components.debuff:Stop()
        return
    end
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0)
    target.components.locomotor:SetExternalSpeedMultiplier(target, "caffeinbuff", TUNING.CAFFEIN_SPEED)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnDetached_caffein(inst, target)
    target.components.locomotor:RemoveExternalSpeedMultiplier(target, "caffeinbuff")
    inst:Remove()
end

local function OnExtended_caffein(inst, target)
    local current_duration = inst.components.timer:GetTimeLeft("caffeinbuff_done")
    local new_duration = math.max(current_duration, target.caffeinbuff_duration)
    inst.components.timer:StopTimer("caffeinbuff_done")
    inst.components.timer:StartTimer("caffeinbuff_done", new_duration)
end

local function fn_caffein()
    if not TheWorld.ismastersim then 
		return 
	end

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:Hide()
  
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_caffein)
    inst.components.debuff:SetDetachedFn(OnDetached_caffein)
    inst.components.debuff:SetExtendedFn(OnExtended_caffein)
    inst.components.debuff.keepondespawn = true

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", function(inst, data)
        if data.name == "caffeinbuff_done" then
            inst.components.debuff:Stop()
        end
    end)

    return inst
end

local function OnAttached_alcohol(inst, target)
    if target.alcoholdebuff_duration then 
        inst.components.timer:StartTimer("alcoholdebuff_done", target.alcoholdebuff_duration)
    end
    if not inst.components.timer:TimerExists("alcoholdebuff_done") then
        inst.components.debuff:Stop()
        return
    end
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0)
    target:PushEvent("drunk")
    target:AddTag("groggy")
    target.components.locomotor:SetExternalSpeedMultiplier(target, "alcoholdebuff", 0.5)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnDetached_alcohol(inst, target)
    if not target:HasTag("drinksleep") then
        target:PushEvent("refreshdrunk")
        target:RemoveTag("groggy")
        target.components.locomotor:RemoveExternalSpeedMultiplier(target, "alcoholdebuff")
    else
        target:RemoveTag("drinksleep")      
    end
    inst:Remove()
end

local function OnExtended_alcohol(inst, target)
    local current_duration = inst.components.timer:GetTimeLeft("alcoholdebuff_done")
    local new_duration = math.max(current_duration, target.alcoholdebuff_duration)
    inst.components.timer:StopTimer("alcoholdebuff_done")
    inst.components.timer:StartTimer("alcoholdebuff_done", new_duration)
end

local function fn_alcohol()
    if not TheWorld.ismastersim then 
        return 
    end

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:Hide()
  
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_alcohol)
    inst.components.debuff:SetDetachedFn(OnDetached_alcohol)
    inst.components.debuff:SetExtendedFn(OnExtended_alcohol)
    inst.components.debuff.keepondespawn = true

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", function(inst, data)
        if data.name == "alcoholdebuff_done" then
            inst.components.debuff:Stop()
        end
    end)

    return inst
end

local function OnAttached_immune(inst, target)
    if target.immunebuff_duration then 
        inst.components.timer:StartTimer("immunebuff_done", target.immunebuff_duration)
    end
    if not inst.components.timer:TimerExists("immunebuff_done") then
        inst.components.debuff:Stop()
        return
    end
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0)
    target.components.health.externalabsorbmodifiers:SetModifier(target, TUNING.BUFF_PLAYERABSORPTION_MODIFIER)
    target.components.sanity:SetNegativeAuraImmunity(true)
    target.components.sanity:SetPlayerGhostImmunity(true)
    target.components.sanity:SetLightDrainImmune(true)
end

local function OnDetached_immune(inst, target)
    target.components.health.externalabsorbmodifiers:RemoveModifier(target)
    target.components.sanity:SetNegativeAuraImmunity(false)
    target.components.sanity:SetPlayerGhostImmunity(false)
    target.components.sanity:SetLightDrainImmune(false)
    inst:Remove()
end

local function OnExtended_immune(inst, target)
    local current_duration = inst.components.timer:GetTimeLeft("immunebuff_done")
    local new_duration = math.max(current_duration, target.immunebuff_duration)
    inst.components.timer:StopTimer("immunebuff_done")
    inst.components.timer:StartTimer("immunebuff_done", new_duration)
end

local function fn_immune()
    if not TheWorld.ismastersim then 
        return 
    end

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:Hide()
  
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_immune)
    inst.components.debuff:SetDetachedFn(OnDetached_immune)
    inst.components.debuff:SetExtendedFn(OnExtended_immune)
    inst.components.debuff.keepondespawn = true

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", function(inst, data)
        if data.name == "immunebuff_done" then
            inst.components.debuff:Stop()
        end
    end)

    return inst
end

return Prefab("caffeinbuff", fn_caffein),
Prefab("alcoholdebuff", fn_alcohol),
Prefab("immunebuff",fn_immune)