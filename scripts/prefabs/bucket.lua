local assets =
{
	Asset("ANIM", "anim/dehy_buckets.zip"),
}

local function SetCheckWeather(inst)
    inst.components.wateringtool:SetCanContainRain(true)
    inst.components.wateringtool.owner = nil
    inst.components.wateringtool:CheckWeather()
end

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
    print(current_fin)

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
        inst.components.wateringtool:SetCanContainRain()
        inst.components.wateringtool.owner = doer
        inst.components.wateringtool:StopCheckWeather()
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

local function CanGetWater(inst, doer)
    if inst.components.wateringtool:IsFull() then
        OnPickup(inst, doer)
    else
        if inst.components.wateringtool:HasWater() then
            inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        end
        inst.components.wateringtool.rainfilling = 0
        inst.components.wateringtool:SetCanContainRain()
        inst.components.wateringtool.owner = doer
        inst.components.wateringtool:StopCheckWeather()
    end
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
    inst:RemoveTag("frozen_bucket")
    inst.AnimState:PlayAnimation("turn_to_full")
    inst:DoTaskInTime(1,function(inst)
        inst:AddComponent("perishable")
        inst.components.perishable:StopPerishing()
        inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
        inst.components.perishable:StartPerishing()
        if inst:HasTag("dirty_bucket") then
            inst.components.perishable:SetOnPerishFn(DriesWater)
        else
            inst.components.perishable:SetOnPerishFn(SpoilWater)
        end
        inst:PushEvent("fullwater")
    end)
end

local function FreezeWater(inst)
    inst.frozentask = nil
    inst:AddTag("frozen_bucket")
    inst.AnimState:PlayAnimation("turn_to_ice")
    inst.AnimState:PushAnimation("ice")
    inst:DoTaskInTime(1,function(inst)
        inst:AddComponent("perishable")
        inst.components.perishable:StopPerishing()
        inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERFAST)
        inst.components.perishable:SetOnPerishFn(MeltWater)
        inst.components.perishable:StartPerishing()
        inst:PushEvent("fullwater")
    end)
end

local function SpoilWater(inst)
    inst:AddTag("dirty_bucket")
    inst:DoTaskInTime(1,function(inst)
        inst:AddComponent("perishable")
        inst.components.perishable:StopPerishing()
        inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
        inst.components.perishable:SetOnPerishFn(DriesWater)
        inst.components.perishable:StartPerishing()
        inst:PushEvent("fullwater")
    end)
end

local function DriesWater(inst)
    inst.AnimState:PlayAnimation("empty")
    inst:RemoveTag("dirty_bucket")
    inst.components.wateringtool:SetFull(false)
    inst.components.wateringtool:CheckWeather()
end

local function onfiremelt(inst)
    inst.components.perishable.frozenfiremult = true
end

local function onstopfiremelt(inst)
    inst.components.perishable.frozenfiremult = false
end

local function ChangeBucketState(inst)
    local waterstate = "full"
    inst:AddComponent("perishable")
    if not inst:HasTag("frozen_bucket") then
        print("안 얼었음")
        local maxtemp = TUNING.WATER_CLEAN_MINTEMP
        
        if inst:HasTag("dirty_bucket") then
            print("더러움")
            maxtemp = TUNING.WATER_DIRTY_MINTEMP
            waterstate = "dirty"
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
        print("얼어버림")
        if inst.frozentask ~= nil then
            inst.frozentask:Cancel()
            inst.frozentask = nil
        end
        waterstate = "ice"

        inst:ListenForEvent("firemelt", onfiremelt)
        inst:ListenForEvent("stopfiremelt", onstopfiremelt)
    end
    inst.AnimState:PlayAnimation(waterstate)
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

    inst:AddComponent("inspectable")

    inst:AddComponent("milkingtool")
    inst.components.milkingtool.donemilkingfn = DoneMilkingfn
	
    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnPickupFn(CanGetWater)

    MakeHauntableLaunchAndSmash(inst)

    inst:ListenForEvent("fullwater",ChangeBucketState)
    inst:ListenForEvent("ondropped",SetCheckWeather)

    return inst
end

return Prefab("bucket_empty", fn, assets)