local function sleepfunction(inst, target)
    target.components.debuffable:RemoveDebuff("alcoholdebuff")
    target.components.debuffable:RemoveDebuff("drunkarddebuff")
    if KnownModIndex:IsModEnabled("workshop-2334209327") or KnownModIndex:IsModForceEnabled("workshop-2334209327") then
        target.components.debuffable:RemoveDebuff("kyno_strengthbuff")
        target.components.debuffable:RemoveDebuff("kyno_strengthbuff_med")
        target.components.debuffable:RemoveDebuff("kyno_dmgreductionbuff")
    end
end

local function IsResistance(target)
    return target.components.grogginess:GetResistance() > 4
end

local function OnAttached_sleepdrink_ex(inst, target)
    if target.sleepdrinkbuff_ex_duration then
        inst.components.timer:StartTimer("sleepdrinkbuff_ex_done", target.sleepdrinkbuff_ex_duration)
    end
    if not inst.components.timer:TimerExists("sleepdrinkbuff_ex_done") then
        inst.components.debuff:Stop()
        return
    end
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0)
    target.knockout_ex_time = inst.components.timer:GetTimeLeft("sleepdrinkbuff_ex_done")
    target:PushEvent("yawn", { grogginess = 4, knockoutduration = target.knockout_ex_time })
    if target:HasTag("drunk") and not target:HasTag("insomniac") and not IsResistance(target) then
        target:AddTag("drinksleep")
    end
    if target.drinksleeptask_ex ~= nil then
        target.drinksleeptask_ex:Cancel()
        target.drinksleeptask_ex = nil
    end
    target.drinksleeptask_ex = target:DoTaskInTime(target.knockout_ex_time, function()
        inst.components.debuff:Stop()
    end)
end

local function OnDetached_sleepdrink_ex(inst, target)
    if target:HasTag("drunk") then
        if target:HasTag("drinksleep") then
            target:DoTaskInTime(4.1, function()
                target:AddDebuff("healthregenbuff", "healthregenbuff")
                target:DoTaskInTime(9, function()
                    sleepfunction(inst, target)
                end)
            end)  
        else
            sleepfunction(inst, target)
            target:AddDebuff("healthregenbuff", "healthregenbuff")
        end
    end
    inst:Remove()
end

local function OnExtended_sleepdrink_ex(inst, target)
    if target.drinksleeptask_ex ~= nil then
        target.drinksleeptask_ex:Cancel()
        target.drinksleeptask_ex = nil
    end

    local current_duration = inst.components.timer:GetTimeLeft("sleepdrinkbuff_ex_done")
    local new_duration = math.max(current_duration, target.sleepdrinkbuff_ex_duration)
    inst.components.timer:StopTimer("sleepdrinkbuff_ex_done")
    inst.components.timer:StartTimer("sleepdrinkbuff_ex_done", new_duration)


    target.knockout_ex_time = inst.components.timer:GetTimeLeft("sleepdrinkbuff_ex_done")
    target:PushEvent("yawn", { grogginess = 4, knockoutduration = target.knockout_ex_time })
    if target:HasTag("drunk") and not target:HasTag("insomniac") and not IsResistance(target) then
        target:AddTag("drinksleep")
    end

    target.drinksleeptask_ex = target:DoTaskInTime(target.knockout_ex_time, function()
        inst.components.debuff:Stop()
    end)
end

local function fn_sleepdrink_ex()
    if not TheWorld.ismastersim then 
        return 
    end

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:Hide()
  
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_sleepdrink_ex)
    inst.components.debuff:SetDetachedFn(OnDetached_sleepdrink_ex)
    inst.components.debuff:SetExtendedFn(OnExtended_sleepdrink_ex)
    inst.components.debuff.keepondespawn = true

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", function(inst, data)
        if data.name == "sleepdrink_ex_done" then
            inst.components.debuff:Stop()
        end
    end)

    return inst
end

local function OnAttached_sleepdrink(inst, target)
    if target.sleepdrinkbuff_duration then
        inst.components.timer:StartTimer("sleepdrinkbuff_done", target.sleepdrinkbuff_duration)
    end
    if not inst.components.timer:TimerExists("sleepdrinkbuff_done") then
        inst.components.debuff:Stop()
        return
    end
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0)
    target.knockout_time = inst.components.timer:GetTimeLeft("sleepdrinkbuff_done")
    target:PushEvent("yawn", { grogginess = 4, knockoutduration = target.knockout_time })
    if target:HasTag("drunk") and not target:HasTag("insomniac") and not IsResistance(target) then
        target:AddTag("drinksleep")
    end
    if target.drinksleeptask ~= nil then
        target.drinksleeptask:Cancel()
        target.drinksleeptask = nil
    end
    target.drinksleeptask = target:DoTaskInTime(target.knockout_time, function()
        inst.components.debuff:Stop()
    end)
end

local function OnDetached_sleepdrink(inst, target)
    if target:HasTag("drunk") then
        if target:HasTag("drinksleep") then
            target:DoTaskInTime(4.1, function()
                target:DoTaskInTime(9, function()
                    sleepfunction(inst, target)
                end)
            end)  
        else
            sleepfunction(inst, target)
        end
    end
    inst:Remove()
end

local function OnExtended_sleepdrink(inst, target)
    if target.drinksleeptask ~= nil then
        target.drinksleeptask:Cancel()
        target.drinksleeptask = nil
    end

    local current_duration = inst.components.timer:GetTimeLeft("sleepdrinkbuff_done")
    local new_duration = math.max(current_duration, target.sleepdrinkbuff_duration)
    inst.components.timer:StopTimer("sleepdrinkbuff_done")
    inst.components.timer:StartTimer("sleepdrinkbuff_done", new_duration)


    target.knockout_time = inst.components.timer:GetTimeLeft("sleepdrinkbuff_done")
    target:PushEvent("yawn", { grogginess = 4, knockoutduration = target.knockout_time })
    if target:HasTag("drunk") and not target:HasTag("insomniac") and not IsResistance(target) then
        target:AddTag("drinksleep")
    end

    target.drinksleeptask = target:DoTaskInTime(target.knockout_time, function()
        inst.components.debuff:Stop()
    end)
end

local function fn_sleepdrink()
    if not TheWorld.ismastersim then 
        return 
    end

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:Hide()
  
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_sleepdrink)
    inst.components.debuff:SetDetachedFn(OnDetached_sleepdrink)
    inst.components.debuff:SetExtendedFn(OnExtended_sleepdrink)
    inst.components.debuff.keepondespawn = true

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", function(inst, data)
        if data.name == "sleepdrink_done" then
            inst.components.debuff:Stop()
        end
    end)

    return inst
end

local function OnAttached_obe(inst, target)
    inst.entity:SetParent(target.entity)
    if target.components.obe ~= nil then
        target.components.obe:SetHealth(target.components.health.currenthealth)
        target.components.obe:SetHunger(target.components.hunger.current)
        target.components.obe:SetSanity(target.components.sanity.current)
        if target.components.thirst ~= nil then
            target.components.obe:SetThirst(target.components.thirst.current)
        end
        TheNet:Announce(""..target:GetDisplayName().." drank ".. STRINGS.NAMES.GHOSTLY_TEA ..", and became a ghost for "..TUNING.GHOST_TIME.." seconds!")
        target.components.obe:DrinktoDeath()
    else
        target.components.health:DoDelta(-1000000)
    end
end

local function OnDetached_obe(inst, target)
    inst:Remove()
end

local function fn_obe()
    if not TheWorld.ismastersim then 
        return 
    end

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:Hide()
  
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_obe)
    inst.components.debuff:SetDetachedFn(OnDetached_obe)
    inst.components.debuff.keepondespawn = true

    return inst
end

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
    target:AddTag("drunk")

    target.components.locomotor:SetExternalSpeedMultiplier(target, "alcoholdebuff", 0.5)
    target:PushEvent("foodbuffattached", { buff = "ANNOUNCE_DRUNK", priority = 2 })
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnDetached_alcohol(inst, target)
    target:PushEvent("refreshdrunk")
    target:RemoveTag("drunk")
    target.components.locomotor:RemoveExternalSpeedMultiplier(target, "alcoholdebuff")
    if not target:HasTag("drinksleep") then
        target:PushEvent("foodbuffdetached", { buff = "ANNOUNCE_DRUNK_END", priority = 1 })
    else
        target:RemoveTag("drinksleep")
        target:PushEvent("foodbuffdetached", { buff = "ANNOUNCE_SLEEP_END", priority = 1 })
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
    target.components.sanity:SetFullAuraImmunity(true)
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

local function OnTick_thirstregen(inst, target)
    if target.components.health ~= nil and target.components.thirst ~= nil and
            not target.components.health:IsDead() and
            not target:HasTag("playerghost") then
        local thirstabsorption = (target.components.eater ~= nil and target.components.eater.thirstabsorption)
                or 1.0

        local delta = TUNING.HUNGERREGEN_TICK_VALUE * thirstabsorption
        target.components.thirst:DoDelta(delta, nil, inst.prefab)
    else
        inst.components.debuff:Stop()
    end
end

local function OnAttached_thirstregen(inst, target)
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0) --in case of loading

    inst.task = inst:DoPeriodicTask(TUNING.HUNGERREGEN_TICK_RATE, OnTick_thirstregen, nil, target)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function fn_thirstregen()
    local inst = CreateEntity()

    if not TheWorld.ismastersim then
        inst:DoTaskInTime(0, inst.Remove)

        return inst
    end

    inst.entity:AddTransform()

    inst.entity:Hide()
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_thirstregen)
    inst.components.debuff:SetDetachedFn(inst.Remove)

    return inst
end

local function OnTick_drunkard(inst, target)
    if target.components.health ~= nil
        and not target.components.health:IsDead()
        and target.components.sanity ~= nil
        and not target:HasTag("playerghost") then
        target.components.sanity:DoDelta(TUNING.DRUNKARD_SANITY_DELTA)
    else
        inst.components.debuff:Stop()
    end
end

local function OnAttached_drunkard(inst, target)
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0) --in case of loading
    inst.task = inst:DoPeriodicTask(TUNING.DRUNKARD_TICK_RATE, OnTick_drunkard, nil, target)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnTimerDone_drunkard(inst, data)
    if data.name == "drunkard" then
        inst.components.debuff:Stop()
    end
end

local function OnExtended_drunkard(inst, target)
    inst.components.timer:StopTimer("drunkard")
    inst.components.timer:StartTimer("drunkard", TUNING.DRUNKARD_DURATION)
    inst.task:Cancel()
    inst.task = inst:DoPeriodicTask(TUNING.DRUNKARD_TICK_RATE, OnTick_drunkard, nil, target)
end

local function fn_drunkard()
    local inst = CreateEntity()

    if not TheWorld.ismastersim then
        --Not meant for client!
        inst:DoTaskInTime(0, inst.Remove)

        return inst
    end

    inst.entity:AddTransform()

    inst.entity:Hide()
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached_drunkard)
    inst.components.debuff:SetDetachedFn(inst.Remove)
    inst.components.debuff:SetExtendedFn(OnExtended_drunkard)
    inst.components.debuff.keepondespawn = true

    inst:AddComponent("timer")
    inst.components.timer:StartTimer("drunkard", TUNING.SWEETTEA_DURATION)
    inst:ListenForEvent("timerdone", OnTimerDone_drunkard)

    return inst
end

return Prefab("caffeinbuff", fn_caffein),
Prefab("alcoholdebuff", fn_alcohol),
Prefab("immunebuff",fn_immune),
Prefab("obebuff",fn_obe),
Prefab("sleepdrinkbuff",fn_sleepdrink),
Prefab("sleepdrinkbuff_ex",fn_sleepdrink_ex),
Prefab("thirstregenbuff", fn_thirstregen),
Prefab("drunkarddebuff",fn_drunkard)