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

    if inst.components.wateringtool:IsFrozen() then
        sound = "dontstarve/common/bush_fertilize"
    end
    
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

    doer.SoundEmitter:PlaySound(sound)

    if old_val > peruse then
        inst.components.finiteuses:Use(peruse)
        inst.components.wateringtool:SetFrozen(false)
        inst.components.wateringtool:SetDirty(false)
        inst.components.wateringtool:SetFull(false)
        inst.components.wateringtool:StopLostRaindrop()
    else
        inst:Remove()
    end
end
local function OnPickup(inst, doer)
    if doer then
        local ice = ""
        if inst.components.wateringtool:IsFrozen() then
            ice = "_ice"
        end
        if inst.components.wateringtool:IsDirty() then
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

local function MeltWater(inst)
    inst.components.wateringtool:SetFrozen(false)
    inst.AnimState:PlayAnimation("turn_to_full")
    inst:DoTaskInTime(1,function(inst)
        ChangBucketState(inst)
    end)
end

local function FreezeWater(inst)
    inst.frozentask = nil
    inst.components.wateringtool:SetFrozen(true)
    inst.AnimState:PlayAnimation("turn_to_ice")
    inst:DoTaskInTime(1,function(inst)
        ChangBucketState(inst)
    end)
end

local function SpoilWater(inst)
    inst.components.wateringtool:SetDirty(true)
    inst:DoTaskInTime(1,function(inst)
        ChangBucketState(inst)
    end)
end

local function DriesWater(inst)
    inst.AnimState:PlayAnimation("empty")
    inst.components.wateringtool:SetDirty(false)
    inst.components.wateringtool:SetFull(false)
    inst.components.wateringtool:StopLostRaindrop()
end

local function onfiremelt(inst)
    inst.components.perishable.frozenfiremult = true
end

local function onstopfiremelt(inst)
    inst.components.perishable.frozenfiremult = false
end

local function ChangBucketState(inst)
    local waterstate = "full"
    inst:AddComponent("perishable")
    if not inst.components.wateringtool:IsFrozen() then
        local maxtemp = TUNING.TUNING.WATER_CLEAN_MINTEMP

        inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
        inst.components.perishable:SetOnPerishFn(SpoilWater)
        
        if inst.components.wateringtool:IsDirty() then
            maxtemp = TUNING.WATER_DIRTY_MINTEMP
            waterstate = "dirty"
            inst.components.perishable:SetOnPerishFn(DriesWater)
        end

        inst:AddComponent("temperature")
        inst.components.temperature.mintemp = TUNING.WATER_MINTEMP
        inst.components.temperature.maxtemp = TUNING.WATER_MAXTEMP
        inst.components.temperature.current = TUNING.WATER_INITTEMP

        if inst.frozentask ~= nil then
            inst.frozentask:Cancel()
            inst.frozentask = nil
        end

        inst.frozentask = inst:DoPeriodicTask(1, function(inst)
            if inst.components.temperature.current <= maxtemp then
                FreezeWater(inst)
            end
        end)
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    else
        waterstate = "ice"
        inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERFAST)

        inst:ListenForEvent("firemelt", onfiremelt)
        inst:ListenForEvent("stopfiremelt", onstopfiremelt)
    end
    inst.AnimState:PlayAnimation(waterstate)
end

local function onremovewater(inst, doer)
    if inst.rainfilling > 0 then
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        inst.rainfilling = 0
    end
    if inst.components.wateringtool:IsFull() then
        OnPickup(inst, doer)
    end
end

local function DoneMilkingfn(doer)
    doer.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
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
    inst.components.wateringtool:SetCanContainRain(true)
    inst.components.wateringtool:StopLostRaindrop()

    inst:AddComponent("inspectable")

    inst:AddComponent("milkingtool")
    inst.components.milkingtool.donemilkingfn = DoneMilkingfn
	
    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnPickupFn(onremovewater)

    MakeHauntableLaunchAndSmash(inst)

    inst:ListenForEvent("fullwater",ChangBucketState)

    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

return Prefab("bucket_empty", fn, assets)