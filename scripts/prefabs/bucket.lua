local BUCKETSTATE = {
    EMPTY = "empty",
    CLEAN = "full",
    DIRTY = "dirty",
}

local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
}

local function SetCheckWeather(inst)
    inst.components.wateringtool:SetCanCollectRainWater(true)
end

local function GetWater(inst, watertype, doer)
    local container = doer ~= nil and (doer.components.inventory or doer.components.container) or nil
    local water = SpawnPrefab(watertype)
    local old_val = inst.components.finiteuses:GetUses()
    local current_fin = old_val
    local peruse = TUNING.BUCKET_LEVEL_PER_USE
    local sound = inst.components.wateringtool:IsFrozen() and "dontstarve_DLC001/common/iceboulder_smash" or "dontstarve/creatures/pengull/splash"


    if current_fin > peruse then
        current_fin = peruse
    end
    print(current_fin)

    if water.components.perishable then
        local perish = inst.components.wateringtool:GetPercent()
        water.components.perishable:SetPercent(perish)
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
        inst.components.wateringtool:SetCanCollectRainWater(false)
    else
        inst:Remove()
    end
end

local function OnPickup(inst, doer)
    if doer then
        local watertype = inst.components.wateringtool:GetWater()
        local ice = inst.components.wateringtool:IsFrozen() and "_ice" or ""
        GetWater(inst, watertype..ice, doer)
    end
    inst.AnimState:PlayAnimation("empty")
end

local function CanGetWater(inst, doer)
    if inst.components.wateringtool:GetWater() then
        OnPickup(inst, doer)
    else
        if inst.components.wateringtool:IsCollectRainWater() then
            inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        end
        inst.components.wateringtool:SetCanCollectRainWater(false)
    end
end

local function OnTakeWater(inst, source, doer)
    if source ~= nil and source.components.waterlevel ~= nil then
        local watervalue = math.min(TUNING.BUCKET_LEVEL_PER_USE, inst.components.finiteuses:GetUses())
        source.components.water:Taken(inst, watervalue)
    end
    inst.components.finiteuses:Use(inst.components.watertaker._laststack)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if inst.components.finiteuses.current <= 0 then
        inst:Remove()
    end
end

local function DoneMilkingfn(doer)
    doer.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
end

local function SetState(inst)
    local isfrozen = inst.components.wateringtool:IsFrozen()
    local watertype = inst.components.wateringtool:GetWater() and 
    ( inst.components.wateringtool:GetWater() == WATERTYPE.CLEAN and BUCKETSTATE.CLEAN or BUCKETSTATE.DIRTY ) or BUCKETSTATE.EMPTY

    if isfrozen then
        local frozenanim = watertype == BUCKETSTATE.DIRTY and "ice_dirty" or "ice"
        inst.AnimState:PlayAnimation("turn_to_"..frozenanim)
        inst.AnimState:PushAnimation(frozenanim)
        inst.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
        return true
    elseif inst.AnimState:IsCurrentAnimation("ice") or inst.AnimState:IsCurrentAnimation("ice_dirty") then
        local meltanim = watertype == BUCKETSTATE.DIRTY and "full_dirty" or "full"
        inst.AnimState:PlayAnimation("turn_to_"..meltanim)
        inst.AnimState:PushAnimation(watertype)
        DoneMilkingfn(inst)
        return true
    end

    if inst.AnimState:IsCurrentAnimation("empty") and not watertype == BUCKETSTATE.EMPTY then
        inst.AnimState:PushAnimation(watertype)
        DoneMilkingfn(inst)
        return true
    end

    if inst.AnimState:IsCurrentAnimation("full") and not watertype == BUCKETSTATE.CLEAN then
        inst.AnimState:PushAnimation(watertype)
        return true
    end

    inst.AnimState:PushAnimation(watertype)
    inst.SoundEmitter:PlaySound("dontstarve/common/dust_blowaway")
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
    inst.components.wateringtool.setstatesfn = SetState

    inst:AddComponent("inspectable")

    inst:AddComponent("milkingtool")
    inst.components.milkingtool.donemilkingfn = DoneMilkingfn
	
    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnPickupFn(CanGetWater)

    MakeHauntableLaunchAndSmash(inst)

    inst:ListenForEvent("ondropped",SetCheckWeather)

    return inst
end

return Prefab("bucket_empty", fn, assets)