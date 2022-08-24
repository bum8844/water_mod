local bucketstates =
{
	{ name = "CLEAN", anim = "full", health = TUNING.HEALING_TINY, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_TINY },
	{ name = "DIRTY", anim = "dirty", health = -TUNING.HEALING_TINY, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_TINY },
	{ name = "SALTY", anim = "salt", health = -TUNING.HEALING_SMALL, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_SALT },
}

local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
}

local prefabs =
{
	"bucket",
	"bucket_ice",
}

local function ondepleted(inst)
	RefundItem(inst, "bucket_empty")
end

local function onwatering(inst)
	inst.components.waterlevel:SetPercent(0)
end

local function FreezeBucket(inst)
	inst.AnimState:PlayAnimation("turn_to_ice")
	inst.AnimState:PushAnimation("ice")
	local icebucket = SpawnPrefab("bucket_ice")
	inst:DoTaskInTime(2, function(inst) RefundItem(inst, icebucket) end)
end

local function ontake(inst)
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
end

local function OnTaken(inst, taker, delta)
	ontake(inst)
	inst.components.waterlevel:DoDelta(-delta)
end

local function commonfn(anim, tags)
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBuild("buckets")
	inst.AnimState:SetBank("buckets")
	inst.AnimState:PlayAnimation(anim)

	inst:AddTag("pre-preparedfood")
	if tags ~= nil then
		for k, v in ipairs(tags) do
			inst:AddTag(v)
		end
	end

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")

	inst:AddComponent("tradable")

	inst:AddComponent("inventoryitem")

	inst:AddComponent("waterlevel")
	inst.components.waterlevel:InitializeWaterLevel(TUNING.BUCKET_MAX_LEVEL)
	inst.components.waterlevel:SetDepletedFn(ondepleted)
	inst.components.waterlevel:SetTakeWaterFn(ontake)

	--[[inst:AddComponent("finiteuses")
	inst.components.finiteuses:SetMaxUses(TUNING.BUCKET_MAX_LEVEL)
	inst.components.finiteuses:SetUses(TUNING.BUCKET_MAX_LEVEL)
	inst.components.finiteuses:SetOnFinished(ondepleted)]]

	inst:AddComponent("water")
	inst.components.water:SetWatervalue(TUNING.BUCKET_MAX_LEVEL)
	inst.components.water:SetOnTakenFn(OnTaken)
	inst.components.water.returnprefab = "bucket_empty"

	inst:AddComponent("wateryprotection")
	inst.components.wateryprotection.extinguishheatpercent = TUNING.BUCKET_EXTINGUISH_HEAT_PERCENT
	inst.components.wateryprotection.temperaturereduction = TUNING.BUCKET_TEMP_REDUCTION
	inst.components.wateryprotection.witherprotectiontime = TUNING.BUCKET_PROTECTION_TIME
	inst.components.wateryprotection.addwetness = TUNING.BUCKET_WATER_AMOUNT
	inst.components.wateryprotection.protection_dist = TUNING.BUCKET_PROTECTION_DIST
	inst.components.wateryprotection.onspreadprotectionfn = onwatering

	MakeHauntableLaunchAndSmash(inst)

	inst:AddComponent("watersource")
	inst.components.watersource.onusefn = ondepleted

	return inst
end

local function SetInitialTemperature(inst)
	inst.components.temperature.current = TheWorld.state.temperature > TUNING.BUCKET_FULL_INITTEMP and TUNING.BUCKET_FULL_INITTEMP or TheWorld.state.temperature
end

local function clean()
	local inst = commonfn("full")

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("temperature")
    inst.components.temperature.mintemp = TUNING.BUCKET_FULL_MINTEMP
    inst.components.temperature.maxtemp = TUNING.BUCKET_FULL_MAXTEMP
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED
    inst:DoTaskInTime(0, SetInitialTemperature)

	inst.components.water:SetWaterType(WATERTYPE.CLEAN)
	inst.components.waterlevel:SetWaterType(WATERTYPE.CLEAN)

	inst:ListenForEvent("startfreezing", FreezeBucket)

	return inst
end

local function dirty()
	local inst = commonfn("dirty")

	if not TheWorld.ismastersim then
		return inst
	end

	inst.components.water:SetWaterType(WATERTYPE.DIRTY)
	inst.components.waterlevel:SetWaterType(WATERTYPE.DIRTY)

	return inst
end

local function salty()
	local inst = commonfn("salty")

	if not TheWorld.ismastersim then
		return inst
	end

	inst.components.water:SetWaterType(WATERTYPE.SALTY)
	inst.components.waterlevel:SetWaterType(WATERTYPE.SALTY)

	return inst
end

return Prefab("bucket_clean", clean, assets, prefabs),
	Prefab("bucket_dirty", dirty, assets, prefabs),
	Prefab("bucket_salty", salty, assets, prefabs)
