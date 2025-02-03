<<<<<<< HEAD
local light_params =
{
    low =
    {
        radius = 1,
        intensity = .5,
        falloff = .7,
    },
    high =
    {
        radius = 3,
        intensity = .8,
        falloff = .4,
    },
}

local MAX_LIGHT_FRAME = math.floor(2 / FRAMES + .5)

local function OnUpdateLight(inst, dframes)
    local done
    if inst._lightlevel:value() then
        local frame = inst._lightframe:value() + dframes
        done = frame >= MAX_LIGHT_FRAME
        inst._lightframe:set_local(done and MAX_LIGHT_FRAME or frame)
    else
        local frame = inst._lightframe:value() - dframes
        done = frame <= 0
        inst._lightframe:set_local(done and 0 or frame)
    end

    local k = inst._lightframe:value() / MAX_LIGHT_FRAME
    local k1 = 1 - k
    inst.Light:SetRadius(light_params.high.radius * k + light_params.low.radius * k1)
    inst.Light:SetIntensity(light_params.high.intensity * k + light_params.low.intensity * k1)
    inst.Light:SetFalloff(light_params.high.falloff * k + light_params.low.falloff * k1)

    if done then
        inst._lighttask:Cancel()
        inst._lighttask = nil
    end
end

local function OnLightDirty(inst)
    if inst._lighttask == nil then
        inst._lighttask = inst:DoPeriodicTask(FRAMES, OnUpdateLight, nil, 1)
    end
    OnUpdateLight(inst, 0)
end

local function CanHatTarget(inst, target)
    if target == nil or
        target.components.inventory == nil or
        not (target.components.inventory.isopen or
            target:HasTag("pig") or
            target:HasTag("manrabbit") or
            target:HasTag("equipmentmodel") or
            (inst._loading and target:HasTag("player"))) then
        --NOTE: open inventory implies player, so we can skip "player" tag check
        --      closed inventory on player means they shouldn't be able to equip
        --      EXCEPT during load, because player inventory opens after 1 frame
        return false
    end
    local hat = target.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
    return hat == nil or hat.prefab ~= inst.prefab
end

local function slurphunger(inst, owner)
    if owner.components.hunger ~= nil and owner.components.thirst ~= nil then
        if owner.components.hunger.current > 0 then
            owner.components.hunger:DoDelta(-3)
        end
=======
local function slurpthirst(inst, owner)
    if owner.components.thirst ~= nil then
>>>>>>> Beta_1.2.8
        if owner.components.thirst.current > 0 then
        	owner.components.thirst:DoDelta(-5)
        end
    elseif owner.components.health ~= nil then
        owner.components.health:DoDelta(-5, false, "slurper")
    end
end

local function OnEquip(inst, owner)
<<<<<<< HEAD
    --Start feeding!

    if not CanHatTarget(inst, owner) then
        owner.components.inventory:Unequip(EQUIPSLOTS.HEAD)
        return
    end

    inst._light.Light:Enable(true)
    inst._light._lightlevel:set(true)
    inst._light._lightframe:set(inst._light._lightframe:value())
    OnLightDirty(inst._light)

    inst._light.SoundEmitter:PlaySound("dontstarve/creatures/slurper/attach")

    owner.AnimState:OverrideSymbol("swap_hat", "hat_slurper", "swap_hat")
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAIR_HAT")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")
		owner.AnimState:Show("HEAD_HAT_NOHELM")
		owner.AnimState:Hide("HEAD_HAT_HELM")

        inst._light.SoundEmitter:PlaySound("dontstarve/creatures/slurper/headslurp", "slurp_loop")
    else
        inst._light.SoundEmitter:PlaySound("dontstarve/creatures/slurper/headslurp_creatures", "slurp_loop")
    end

    inst.shouldburp = true
    inst.cansleep = false

    inst.onattach(owner)

    if inst.task ~= nil then
        inst.task:Cancel()
    end
    inst.task = inst:DoPeriodicTask(2, slurphunger, nil, owner)
=======
    inst.components.equippable.dehy_onequipfn(inst, owner)
    if inst.dehy_task ~= nil then
        inst.dehy_task:Cancel()
    end
    inst.dehy_task = inst:DoPeriodicTask(2, slurpthirst, nil, owner)
>>>>>>> Beta_1.2.8
end

AddPrefabPostInit("slurper", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.equippable ~= nil then
<<<<<<< HEAD
=======
        inst.components.equippable.dehy_onequipfn = inst.components.equippable.onequipfn
>>>>>>> Beta_1.2.8
    	inst.components.equippable:SetOnEquip(OnEquip)
	end
end)