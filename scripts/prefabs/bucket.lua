local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
}

local function GetWater(inst, watertype, doer)
    local container = doer ~= nil and (doer.components.inventory or doer.components.container) or nil
    local water = SpawnPrefab(watertype)
    local old_val = inst.components.finiteuses:GetUses()
    local current_fin = old_val
    local peruse = TUNING.BUCKET_LEVEL_PER_USE
    local sound = "dontstarve/creatures/pengull/splash"
    
    if current_fin > peruse then
        current_fin = peruse
    end

    water.Transform:SetPosition(inst.Transform:GetWorldPosition())
    water.components.stackable:SetStackSize(current_fin)
    
    if container ~= nil then
        container:GiveItem(water, nil, doer:GetPosition())
    else
        LaunchAt(water, doer, nil, 1, 1)
    end

    if inst._IsFrozen then
        sound = "dontstarve/common/bush_fertilize"
    end
    doer.SoundEmitter:PlaySound(sound)

    inst:RemoveComponent("perishable")

    inst._IsFrozen = false
    inst._IsDirty = false
    inst._IsFull = false

    if old_val > peruse then
        inst.components.finiteuses:Use(peruse)
    else
        inst:Remove()
    end
end
local function OnPickup(inst, doer)
    if doer then
        local ice = ""
        if inst._IsFrozen then
            ice = "_ice"
        end
        if inst._IsDirty then
            GetWater(inst, "water_dirty"..ice, doer)
        else
            GetWater(inst, "water_clean"..ice, doer)
        end
    end
    inst.AnimState:PlayAnimation("empty")
end

local function OnTakeWater(inst, source, doer)
    if source ~= nil and source.components.waterlevel ~= nil then
        local watervalue = TUNING.BUCKET_LEVEL_PER_USE
        if TUNING.BUCKET_LEVEL_PER_USE > inst.components.finiteuses:GetUses() then
            watervalue = inst.components.finiteuses:GetUses()
        end
        source.components.water:Taken(inst, watervalue)
    end
    inst.components.finiteuses:Use(inst.components.watertaker._laststack)
    if inst.components.finiteuses.current == 0 then
        inst:Remove()
        doer.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    else
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    end
end

local function onfiremelt(inst)
    inst.components.perishable.frozenfiremult = true
end

local function onstopfiremelt(inst)
    inst.components.perishable.frozenfiremult = false
end

local function ChangBucketState(inst)
    if inst.frozentask ~= nil then
        inst.frozentask:Cancel()
        inst.frozentask = nil
        inst._IsFrozen = true
    end
    inst.rainfilling = 0
    local state = "full"
    local max_temp = TUNING.WATER_CLEAN_MINTEMP

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:SetOnPerishFn(ChangBucketState)

    if not inst._IsFrozen then
        inst:AddComponent("temperature")
        inst.components.temperature.mintemp = TUNING.WATER_MINTEMP
        inst.components.temperature.maxtemp = TUNING.WATER_MAXTEMP
        inst.components.temperature.current = TUNING.WATER_INITTEMP
    else
        inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERFAST)

        inst:ListenForEvent("firemelt", onfiremelt)
        inst:ListenForEvent("stopfiremelt", onstopfiremelt)
    end

    inst.components.perishable:StartPerishing()

    if not inst._IsFull then
        inst._IsFull = true
    elseif not inst._IsDirty then
        inst._IsDirty = true
        state = "dirty"
        max_temp = TUNING.WATER_DIRTY_MINTEMP
    elseif inst._IsFrozen then
        inst.AnimState:PushAnimation("turn_to_ice")
        state = "ice"
    elseif not TheWorld.state.israining then
        OnPickup(inst, nil)
    end
    inst.AnimState:PlayAnimation(state)

    inst.frozentask = inst:DoPeriodicTask(1, function()
        if not inst._IsFrozen and inst.components.temperature.current <= max_temp then
            ChangBucketState(inst)
        end
    end)

    inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
end

local function WeatherCheck(inst)
    local rainfilling = inst.rainfilling
    local owner = inst.components.inventoryitem.owner
    if TheWorld.state.israining and owner == nil then
        inst.rainfilling = inst.rainfilling + TUNING.RAIN_GIVE_WATER
    elseif not TheWorld.state.israining and inst.rainfilling > 0 then
        inst.rainfilling = inst.rainfilling - TUNING.LOST_WATER
    end
    if rainfilling >= TUNING.BUCKET_LEVEL_PER_USE then
        ChangBucketState(inst)
    end
end

local function onremovewater(inst, doer)
    if inst.rainfilling > 0 then
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        inst.rainfilling = 0
    end
    if inst._IsFull then
        OnPickup(inst, doer)
    end
end

local function DoneMilkingfn(doer)
    doer.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
end

local function onsave(inst, data)
    local rainfilling = inst.rainfilling >= 0 or inst.rainfilling or nil
    data.rainfilling = rainfilling
    data.full_bucket = inst._IsFull
    data.dirty_bucket = inst._IsDirty
    data.ice_bucket = inst._IsFrozen
end

local function onload(inst, data)
    if data.rainfilling ~= nil then
        inst.rainfilling = data.rainfilling
    end
    if data.full_bucket then
        inst._IsFull = true
        if data.dirty_bucket then 
            inst._IsDirty = true
        if data.ice_bucket then 
            inst._IsFrozen = true
        end
        print(inst._IsFull)
        ChangBucketState(inst)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("buckets")
    inst.AnimState:SetBank("buckets")
    inst.AnimState:PlayAnimation("empty")

    inst:AddTag("watertaker")
    inst:AddTag("bucket_empty")

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    --empty full dirty
    inst.rainfilling = 0
    inst.Full_Bucket = false
    inst.Dirty_Bucket = false
    inst.Frozen_Bucket = false
    inst:DoPeriodicTask(1,WeatherCheck)
	
	-- 우물 상호 작용을 위한 태그

	inst:AddComponent("watertaker")
	inst.components.watertaker.capacity = TUNING.BUCKET_LEVEL_PER_USE
	inst.components.watertaker.onfillfn = OnTakeWater
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.BUCKET_MAX_LEVEL)

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    
    inst:AddComponent("wateringtool")

    inst:AddComponent("inspectable")

    inst:AddComponent("milkingtool")
    inst.components.milkingtool.donemilkingfn = DoneMilkingfn
	
    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnPickupFn(onremovewater)

    MakeHauntableLaunchAndSmash(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

return Prefab("bucket_empty", fn, assets)