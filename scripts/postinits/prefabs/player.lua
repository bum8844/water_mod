local function SetDirty(netvar, val)
    --Forces a netvar to be dirty regardless of value
    netvar:set_local(val)
    netvar:set(val)
end

local function OnThirstDelta(parent, data)
    if data.overtime then
    elseif data.newpercent > data.oldpercent then
        SetDirty(parent.player_classified.isthirstpulseup, true)
    elseif data.newpercent < data.oldpercent then
        SetDirty(parent.player_classified.isthirstpulsedown, true)
    end
end

local function OnThirstDirty(inst)
    if inst._parent ~= nil then
        local oldpercent = inst._oldthirstpercent
        local percent = inst.currentthirst:value() / inst.maxthirst:value()
        local data =
        {
            oldpercent = oldpercent,
            newpercent = percent,
            overtime =
                not (inst.isthirstpulseup:value() and percent > oldpercent) and
                not (inst.isthirstpulsedown:value() and percent < oldpercent),
        }
        --[[print("inst.isthirstpulseup:", inst.isthirstpulseup:value())
        print("inst.isthirstpulsedown:", inst.isthirstpulsedown:value())
        print("percent:", percent)
        print("oldpercent:", oldpercent)]]
        inst._oldthirstpercent = percent
        inst.isthirstpulseup:set_local(false)
        inst.isthirstpulsedown:set_local(false)
        inst._parent:PushEvent("thirstdelta", data)
        if oldpercent > 0 then
            if percent <= 0 then
                inst._parent:PushEvent("startstarving")
            end
        elseif percent > 0 then
            inst._parent:PushEvent("stopstarving")
        end
    else
        inst._oldthirstpercent = 1
        inst.isthirstpulseup:set_local(false)
        inst.isthirstpulsedown:set_local(false)
    end
end

local AddNetvars = function(inst)
    --print("inst._parent:", inst._parent)
    inst._oldthirstpercent = 1
    inst.currentthirst = _G.net_ushortint(inst.GUID, "thirst.current", "thirstdirty")
    inst.maxthirst = _G.net_ushortint(inst.GUID, "thirst.max", "thirstdirty")
    inst.isthirstpulseup = _G.net_bool(inst.GUID, "thirst.dodeltaovertime(up)", "thirstdirty")
    inst.isthirstpulsedown = _G.net_bool(inst.GUID, "thirst.dodeltaovertime(down)", "thirstdirty")
    inst.currentthirst:set(100)
    inst.maxthirst:set(100)

    inst:DoStaticTaskInTime(0, function(inst)
        if _G.TheWorld.ismastersim then
            inst._parent = inst.entity:GetParent()
            inst:ListenForEvent("thirstdelta", OnThirstDelta, inst._parent)
        else
            inst.isthirstpulseup:set_local(false)
            inst.isthirstpulsedown:set_local(false)
            inst:ListenForEvent("thirstdirty", OnThirstDirty)
            if inst._parent ~= nil then
                inst._oldthirstpercent = inst.maxthirst:value() > 0 and inst.currentthirst:value() / inst.maxthirst:value() or 0
            end
        end
    end)

    if not _G.TheWorld.ismastersim then
        inst._OnEntityReplicated = inst.OnEntityReplicated
        inst.OnEntityReplicated = function(inst)
            inst:_OnEntityReplicated()
            if inst._parent.replica.thirst ~= nil then
                inst._parent.replica.thirst:AttachClassified(inst)
            end
            return
        end
        return
    end
end

AddPrefabPostInit("player_classified", AddNetvars)

-----------------------------------------------------------

local AddComponentToPlayer = function(inst)
    inst:AddTag("campfire_upgradeuser")

    if not _G.TheWorld.ismastersim then
        return
    end

    inst:AddComponent("obe")
end

AddPlayerPostInit(AddComponentToPlayer)

if GetModConfigData("enable_thirst") then
    local AddThirstToPlayer = function(inst)
    --Adding Component
        if not _G.TheWorld.ismastersim then
            return
        end

        inst:AddComponent("thirst")
        inst.components.thirst:SetMax(TUNING.WILSON_THIRST)
        inst.components.thirst:SetRate(TUNING.WILSON_HUNGER_RATE)
        inst.components.thirst:SetKillRate(TUNING.WILSON_HEALTH / TUNING.STARVE_KILL_TIME)
        if _G.GetGameModeProperty("no_hunger") then
            inst.components.thirst:Pause()
        end
    end

    AddPlayerPostInit(AddThirstToPlayer)
end
