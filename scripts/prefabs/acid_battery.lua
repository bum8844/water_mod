local assets = {}

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

	inst.AnimState:SetBuild("acid_battery")
	inst.AnimState:SetBank("acid_battery")
	inst.AnimState:PlayAnimation("idle")

	inst.pickupsound = "metal"
	inst.minisign_atlas = "minisign_dehy_items_swap"

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

	inst:AddComponent("edible")
	inst.components.edible.foodtype = FOODTYPE.ACID_BATTERY
    inst.components.edible.healthvalue = TUNING.HEALING_SUPERHUGE/2
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = 0

	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.HUGE_FUEL
	inst.components.fuel.fueltype = FUELTYPE.CHEMICAL

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetSinks(true)

    MakeHauntableLaunchAndSmash(inst)

	return inst
end

return Prefab("acid_battery",fn,assets)