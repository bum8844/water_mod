require "prefabutil" -- for the MakePlacer function

local assets =
{
    Asset("ANIM", "anim/tea_tree_seed.zip"),
	Asset("ANIM", "anim/tealeaves.zip"),
}

local prefabs = {
	"twigs",
    "tea_seed_cooked",
	"tealeaves",
	"tealeaves_dried"
}

local function tealeaves()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("tealeaves")
    inst.AnimState:SetBuild("tealeaves")
    inst.AnimState:PlayAnimation("idle_tealeaves")

    inst:AddTag("cocktail_ingredients")

    inst.pickupsound = "vegetation_grassy"

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("dryable")
	
	inst:AddComponent("dryable")
    inst.components.dryable:SetProduct("tealeaves_dried")
    inst.components.dryable:SetDryTime(TUNING.DRY_MED)
	inst.components.dryable:SetBuildFile("tealeaves")
    inst.components.dryable:SetDriedBuildFile("tealeaves")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("tealeaves")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "tealeaves"

    inst:AddComponent("tradable")
	
	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function tealeaves_dried()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("tealeaves")
    inst.AnimState:SetBuild("tealeaves")
    inst.AnimState:PlayAnimation("idle_tealeaves_dried")

    inst:AddTag("cocktail_ingredients")

    inst.pickupsound = "vegetation_grassy"

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("tealeaves_dried")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "tealeaves_dried"

    inst:AddComponent("tradable")

	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function tea_seed_cooked()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("tea_seed")
    inst.AnimState:SetBuild("tea_tree_seed")
    inst.AnimState:PlayAnimation("cooked")

    inst:AddTag("cocktail_ingredients")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    
    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_SMALL
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_TWO_DAY)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("tea_seed_cooked")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "tea_seed_cooked"

    inst:AddComponent("tradable")

	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function dig_sprout(inst, digger)
    inst.components.lootdropper:SpawnLootPrefab("twigs")
	inst.components.lootdropper:SpawnLootPrefab("twigs")
    inst:Remove()
end

local function grow_anim_over(inst)
    -- Spawn a bush where the seed grew, and remove the seed prefab.
    local seedx, seedy, seedz = inst.Transform:GetWorldPosition()
    inst.SoundEmitter:PlaySound("dontstarve/forest/treeGrow")
    inst:Remove()

    local bush = SpawnPrefab("tea_tree")
    bush.Transform:SetPosition(seedx, seedy, seedz)
end

local function on_grow_timer_done(inst, data)
    if data.name ~= "grow" then
        return
    end

    inst:ListenForEvent("animover", grow_anim_over)
    inst.AnimState:PlayAnimation("growth")
end

local function start_sprout_growing(inst)
    if inst.components.timer ~= nil and not inst.components.timer:TimerExists("grow") then
        inst.components.timer:StartTimer("grow", TUNING.ROCK_FRUIT_SPROUT_GROWTIME)
    end
end

local function stop_sprout_growing(inst)
    if inst.components.timer ~= nil then
        inst.components.timer:StopTimer("grow")
    end
end

local function tea_seed_sapling()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddSoundEmitter()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("tea_seed")
    inst.AnimState:SetBuild("tea_tree_seed")
    inst.AnimState:PlayAnimation("planted")

    --inst:SetPrefabNameOverride("ROCK_AVOCADO_FRUIT_SPROUT")
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("tea_tree.tex")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable.nameoverride = "tea_seed"

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({"tea_seed"})

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(dig_sprout)
    inst.components.workable:SetWorkLeft(1)

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", on_grow_timer_done)

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    inst.components.burnable:SetOnIgniteFn(stop_sprout_growing)
    inst.components.burnable:SetOnExtinguishFn(start_sprout_growing)
    MakeSmallPropagator(inst)

    MakeHauntableIgnite(inst)

    start_sprout_growing(inst)

    return inst
end

local function on_deploy_fn(inst, position)
    inst = inst.components.stackable:Get()
    inst:Remove()

    local sapling = SpawnPrefab("tea_seed_sapling")
    sapling.Transform:SetPosition(position:Get())
    sapling.SoundEmitter:PlaySound("dontstarve/wilson/plant_tree")
end

local function tea_seed()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("tea_seed")
    inst.AnimState:SetBuild("tea_tree_seed")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("cocktail_ingredients")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", nil, 0.4)

    inst:AddTag("deployedplant")

    inst.entity:SetPristine()

    inst:AddTag("cookable")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("bait")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("tea_seed")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "tea_seed"

    inst:AddComponent("tradable")
	
	inst:AddComponent("cookable")
    inst.components.cookable.product = "tea_seed_cooked"

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.PLANT)
    inst.components.deployable.ondeploy = on_deploy_fn

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

return Prefab("tea_seed_cooked", tea_seed_cooked, assets),
    Prefab("tea_seed", tea_seed, assets, {"tea_seed_cooked"}),
	Prefab("tealeaves", tealeaves, assets),
	Prefab("tealeaves_dried", tealeaves_dried, assets),
    MakePlacer("tea_seed_placer", "tea_seed", "tea_tree_seed", "planted"),
    Prefab("tea_seed_sapling", tea_seed_sapling, assets)