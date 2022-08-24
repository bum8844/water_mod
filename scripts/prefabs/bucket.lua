local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
}

local prefabs =
{
	"bucket_clean",
	"bucket_dirty",
	"bucket_salty",
}

local function TestWaterType(inst, from_object)
	if from_object ~= nil then
		local watertype = from_object:HasTag("cleanwater") and "clean"
			or from_object.components.waterlevel ~= nil and from_object.components.waterlevel.watertype
			or from_object.components.water ~= nil and from_object.components.water.watertype
			or "dirty"
		return "bucket_"..watertype
	end
end

local function OnTakeWater(inst, source)
	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
end

local function FillByRain(inst)
	local filleditem = SpawnPrefab("bucket_clean")
    inst.rainfilling = 0

	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")

	if inst.components.stackable.stacksize > 1 then
		filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst.components.stackable:Get():Remove()
	else
		filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
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
	
	inst.rainfilling = 0
	inst:DoPeriodicTask(1, function()
	    local owner = inst.components.inventoryitem.owner
		if TheWorld.state.israining and owner == nil then
		    inst.rainfilling = inst.rainfilling + 1
		end
		if inst.rainfilling >= 45 then
		    FillByRain(inst)
		end
	end)
	-- 우물 상호 작용을 위한 태그
	inst:AddTag("bucket_empty")

	inst:AddComponent("watertaker")
	inst.components.watertaker.capacity = TUNING.BUCKET_MAX_LEVEL
	inst.components.watertaker.prefabtest = TestWaterType
	inst.components.watertaker.onfillfn = OnTakeWater
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

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