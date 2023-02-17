local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
}

local function OnTakeWater(inst, source, doer)
	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	inst.components.finiteuses:Use(inst.components.watertaker._laststack)
    if source.components.waterlevel ~= nil then
        source.components.water:Taken(inst, TUNING.BUCKET_LEVEL_PER_USE)
    end
    if inst.components.finiteuses.current == 0 then
        inst:Remove()
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

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	-- 우물 상호 작용을 위한 태그
	inst:AddTag("bucket_empty")

	inst:AddComponent("watertaker")
	inst.components.watertaker.capacity = TUNING.BUCKET_LEVEL_PER_USE
	inst.components.watertaker.onfillfn = OnTakeWater
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.BUCKET_MAX_LEVEL)

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    
    inst:AddComponent("tradable") --to work with water well

    inst:AddComponent("inspectable")

    inst:AddComponent("milkingtool")
	
    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)
	
    inst:AddComponent("inventoryitem")

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("bucket_empty", fn, assets)