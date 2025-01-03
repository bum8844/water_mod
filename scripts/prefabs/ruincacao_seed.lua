require "prefabutil" -- for the MakePlacer function

local assets =
{
    Asset("ANIM", "anim/ruincacao_tree_seed.zip"),
	Asset("ANIM", "anim/ruincacao_tree_build.zip")
}

local function on_hammered(inst, hammer, workleft, workdone)
    local num_beans_worked = math.clamp(math.ceil(workdone / TUNING.ROCK_FRUIT_MINES), 1, inst.components.stackable:StackSize())

    local loot_data = TUNING.RUINCACAO_LOOT
    if inst.components.stackable:StackSize() > num_beans_worked then
        inst.AnimState:PlayAnimation("hammered")
        inst.AnimState:PushAnimation("idle_ruincacao", false)
    end

    -- Generate a list of prefabs to create first and optimize the loop by having every type here.
    local spawned_prefabs = {
        ["ruincacao_seed"] = 0,
        ["ruincacao_bean"] = 0,
        ["butter"] = 0,
        ["charcoal"] = 0,
    }

    local butterhunter = hammer:HasTag("butterhunter") and 0.18 or 0

    local odds_bean = hammer:HasTag("butterhunter") and loot_data.BEAN_CHANCE/2 or loot_data.BEAN_CHANCE
    local odds_butter = odds_bean + (loot_data.BUTTER_CHACE + butterhunter)
    local odds_seed = odds_butter + loot_data.SEED_CHANCE

    for _ = 1, num_beans_worked do
        -- Choose a ripeness to spawn.
        local loot_roll = math.random()
        if loot_roll < odds_bean then
            spawned_prefabs["ruincacao_bean"] = spawned_prefabs["ruincacao_bean"] + 1
        elseif loot_roll < odds_butter then
            spawned_prefabs["butter"] = spawned_prefabs["butter"] + 1
        elseif loot_roll < odds_seed then
            spawned_prefabs["ruincacao_seed"] = spawned_prefabs["ruincacao_seed"] + 1
        else
            spawned_prefabs["charcoal"] = spawned_prefabs["charcoal"] + 1
        end
    end

    -- Then create these prefabs while stacking them up as much as they are able to.
    for prefab, count in pairs(spawned_prefabs) do
        local i = 1
        while i <= count do
            local loot = SpawnPrefab(prefab)
            local room = loot.components.stackable ~= nil and loot.components.stackable:RoomLeft() or 0
            if room > 0 then
                local stacksize = math.min(count - i, room) + 1
                loot.components.stackable:SetStackSize(stacksize)
                i = i + stacksize
            else
                i = i + 1
            end
            LaunchAt(loot, inst, hammer, loot_data.SPEED, loot_data.HEIGHT, nil, loot_data.ANGLE)
            if prefab == "ruincacao_bean" then
                loot.AnimState:PlayAnimation("split_open")
                loot.AnimState:PushAnimation("idle_ruincacao_bean")
            end
        end
    end

    -- Finally, remove the actual stack items we just consumed
    local top_stack_item = inst.components.stackable:Get(num_beans_worked)
    top_stack_item:Remove()
end

local function stack_size_changed(inst, data)
    if data ~= nil and data.stacksize ~= nil and inst.components.workable ~= nil then
        inst.components.workable:SetWorkLeft(data.stacksize * TUNING.ROCK_FRUIT_MINES)
    end
end

local function OnExplosion_ruincacao(inst, data)
    local miner = data and data.explosive or nil
    if miner then
        local loot_data = TUNING.RUINCACAO_LOOT
        LaunchAt(inst, inst, miner, loot_data.SPEED, loot_data.HEIGHT, nil, loot_data.ANGLE)
    end
end

local function ruincacao()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("ruincacao_tree_seed")
    inst.AnimState:SetBuild("ruincacao_tree_seed")
    inst.AnimState:PlayAnimation("idle_ruincacao")

    inst.pickupsound = "rock"

    inst:AddTag("molebait")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.MED_FUEL

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("ruincacao")
    inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "ruincacao"

    inst:AddComponent("tradable")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(TUNING.ROCK_FRUIT_MINES * inst.components.stackable.stacksize)
    inst.components.workable:SetOnWorkCallback(on_hammered)

    inst:AddComponent("bait")

    inst:ListenForEvent("stacksizechange", stack_size_changed)
    inst:ListenForEvent("explosion", OnExplosion_ruincacao)

    MakeHauntableLaunch(inst)

    return inst
end

local function ruincacao_bean()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("ruincacao_tree_seed")
    inst.AnimState:SetBuild("ruincacao_tree_seed")
    inst.AnimState:PlayAnimation("idle_ruincacao_bean")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("cookable")
    inst:AddTag("show_spoilage")
    inst:AddTag("cocktail_ingredients")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED*.5)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("ruincacao_bean")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "ruincacao_bean"

    inst:AddComponent("tradable")

    inst:AddComponent("cookable")
    inst.components.cookable.product = "ruincacao_bean_cooked"

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function ruincacao_bean_cooked()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("ruincacao_tree_seed")
    inst.AnimState:SetBuild("ruincacao_tree_seed")
    inst.AnimState:PlayAnimation("ruincacao_bean_cooked")

    inst:AddTag("cocktail_ingredients")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_MED/4
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
    inst.components.edible.sanityvalue = -TUNING.SANITY_SMALL
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("ruincacao_bean_cooked")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "ruincacao_bean_cooked"

    inst:AddComponent("tradable")

	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function dig_sprout(inst, digger)
    inst.components.lootdropper:SpawnLootPrefab("ruincacao_seed")
    inst:Remove()
end

local function grow_anim_over(inst)
    -- Spawn a bush where the seed grew, and remove the seed prefab.
    local seedx, seedy, seedz = inst.Transform:GetWorldPosition()
    inst.SoundEmitter:PlaySound("dontstarve/forest/treeGrow")
    inst:Remove()

    local bush = SpawnPrefab("ruincacao_tree")
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

local function ruincacao_seed_sapling()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddSoundEmitter()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("ruincacao_tree_seed")
    inst.AnimState:SetBuild("ruincacao_tree_seed")
    inst.AnimState:PlayAnimation("planted",true)

    --inst:SetPrefabNameOverride("ROCK_AVOCADO_FRUIT_SPROUT")
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("ruincacao_tree.tex")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.components.inspectable.nameoverride = "ruincacao_seed"

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({"ruincacao_seed"})

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

    local sapling = SpawnPrefab("ruincacao_seed_sapling")
    sapling.Transform:SetPosition(position:Get())
    sapling.SoundEmitter:PlaySound("dontstarve/wilson/plant_tree")
end

local function ruincacao_seed()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("ruincacao_tree_seed")
    inst.AnimState:SetBuild("ruincacao_tree_seed")
    inst.AnimState:PlayAnimation("idle_ruincacao_sapling")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", nil, 0.4)

    inst:AddTag("deployedplant")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("ruincacao_seed")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "ruincacao_seed"

    inst:AddComponent("tradable")

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.PLANT)
    inst.components.deployable.ondeploy = on_deploy_fn

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

return Prefab("ruincacao", ruincacao, assets, {"ruincacao_seed","ruincacao_bean","butter","charcoal"}),
    Prefab("ruincacao_seed", ruincacao_seed, assets),
	Prefab("ruincacao_bean", ruincacao_bean, assets, {"ruincacao_bean_cooked"}),
	Prefab("ruincacao_bean_cooked", ruincacao_bean_cooked, assets),
    MakePlacer("ruincacao_seed_placer", "ruincacao_seed", "ruincacao_tree_seed", "planted"),
    Prefab("ruincacao_seed_sapling", ruincacao_seed_sapling, assets, {"ruincacao_seed"})