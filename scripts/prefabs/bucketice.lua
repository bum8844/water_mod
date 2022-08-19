local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
}

local prefabs =
{
	"ice",
}

local function OnWorked(inst, miner)
	SpawnPrefab("bucket").Transform:SetPosition(inst.Transform:GetWorldPosition())
	LaunchAt(SpawnPrefab("ice"), inst, miner, TUNING.ROCK_FRUIT_LOOT.SPEED, TUNING.ROCK_FRUIT_LOOT.HEIGHT, nil, TUNING.ROCK_FRUIT_LOOT.ANGLE)--.Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/iceboulder_smash")
	inst:Remove()
end

local function Changeitem(inst)
    local water = SpawnPrefab("bucket_clean")
    inst.AnimState:PlayAnimation("turn_to_full")
    inst.AnimState:PushAnimation("full")
    inst:DoTaskInTime(2, function(inst) RefundItem(inst, water) end)
end

local function SetInitialTemperature()
    return TheWorld.state.temperature > TUNING.BUCKET_ICE_INITTEMP and TUNING.BUCKET_ICE_INITTEMP or TheWorld.state.temperature
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
    inst.AnimState:PlayAnimation("ice")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("tradable") -- get gold for pigking
    inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.ANTLION
    inst.components.tradable.rocktribute = 1

    inst:AddComponent("inspectable")

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(1)
	inst.components.workable:SetOnFinishCallback(OnWorked)

    inst:AddComponent("inventoryitem")

    inst:AddComponent("temperature")
    inst.components.temperature.mintemp = TUNING.BUCKET_ICE_MINTEMP
    inst.components.temperature.maxtemp = TUNING.BUCKET_ICE_MAXTEMP
    inst.components.temperature.current = SetInitialTemperature()
    inst:DoPeriodicTask(1, Changeitem)


    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("bucket_ice", fn, assets)