require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/tea_tree_build.zip"),
    Asset("ANIM", "anim/tea_tree_diseased_build.zip"),
}

local prefabs =
{
    "tealeaves",
	"petals",
	"tea_seed",
    "dug_tea_tree",
    "twigs",
}

local prefabs_item =
{
	"dug_tea_tree_placer"
}

local BUSH_ANIMS =
{
    { idle="idle1", grow = "picked4" },
    { idle="idle2", grow = "grow1" },
    { idle="idle3", grow = "grow2" },
    { idle="idle4", grow = "grow3" },
}

local function play_idle(inst, stage)
    inst.AnimState:PlayAnimation(BUSH_ANIMS[stage].idle)
end

local function play_grow(inst, stage)
    inst.AnimState:PlayAnimation(BUSH_ANIMS[stage].grow)
    inst.AnimState:PushAnimation(BUSH_ANIMS[stage].idle)
end

local function set_stage1(inst)
    inst.components.pickable.canbepicked = false

    play_idle(inst, 1)
end

local function grow_to_stage1(inst)
    play_grow(inst, 1)
end

local function set_stage2(inst)
    inst.components.pickable:Regen()

    play_idle(inst, 2)
end

local function grow_to_stage2(inst)
    play_grow(inst, 2)
end

local function set_stage3(inst)
    inst.components.pickable:Regen()

    play_idle(inst, 3)
end

local function grow_to_stage3(inst)
    play_grow(inst, 3)
end

local function set_stage4(inst)
	inst.components.pickable:Regen()

    play_idle(inst, 4)
end

local function grow_to_stage4(inst)
    play_grow(inst, 4)
end

local STAGE1 = "stage_1"
local STAGE2 = "stage_2"
local STAGE3 = "stage_3"
local STAGE4 = "stage_4"

local growth_stages =
{
    {
        name = STAGE1,
        time = function(inst) return GetRandomWithVariance(TUNING.ROCK_FRUIT_REGROW.EMPTY.BASE, TUNING.ROCK_FRUIT_REGROW.EMPTY.VAR) end,
        fn = set_stage1,
        growfn = grow_to_stage1,
    },
    {
        name = STAGE2,
        time = function(inst) return GetRandomWithVariance(TUNING.ROCK_FRUIT_REGROW.PREPICK.BASE, TUNING.ROCK_FRUIT_REGROW.PREPICK.VAR) end,
        fn = set_stage2,
        growfn = grow_to_stage2,
    },
    {
        name = STAGE3,
        time = function(inst) return GetRandomWithVariance(TUNING.ROCK_FRUIT_REGROW.PICK.BASE, TUNING.ROCK_FRUIT_REGROW.PICK.VAR) end,
        fn = set_stage3,
        growfn = grow_to_stage3,
    },
    {
        name = STAGE4,
        time = function(inst) return GetRandomWithVariance(TUNING.ROCK_FRUIT_REGROW.CRUMBLE.BASE, TUNING.ROCK_FRUIT_REGROW.CRUMBLE.VAR) end,
        fn = set_stage4,
        growfn = grow_to_stage4,
    },
}

local function onregenfn(inst)
    -- If we got here via debug and we're not at pickable yet, just skip us ahead to the first pickable stage.
    if inst.components.growable.stage < 2 then
        inst.components.growable:SetStage(2)
    end
end

local function SetupLoot(lootdropper)
    local inst = lootdropper.inst
    local withered = inst.components.witherable ~= nil and inst.components.witherable:IsWithered()

    if not withered and inst.components.growable ~= nil then
        if inst.components.growable.stage == 2 then
            lootdropper:SetLoot({"tealeaves", "tealeaves", "tealeaves"})
        elseif inst.components.growable.stage == 3 then
            lootdropper:SetLoot({"tealeaves", "tealeaves", "petals"})
            lootdropper:AddChanceLoot("petals", 0.25)
            lootdropper:AddChanceLoot("petals", 0.06)
        elseif inst.components.growable.stage == 4 then
            lootdropper:SetLoot({"tealeaves"})
            lootdropper:AddChanceLoot("tea_seed", 0.25)
            lootdropper:AddChanceLoot("tea_seed", 0.12)
            lootdropper:AddChanceLoot("tea_seed", 0.06)
        end
    end
end

local function on_bush_burnt(inst)
    -- Just like birchnut tree drops cooked birchnut when burnt
    if inst.components.growable.stage == 4 then
        inst.components.lootdropper:SpawnLootPrefab("tea_seed_cooked")
    end

    -- The bush, of course, stops growing once it's been burnt.
    inst.components.growable:StopGrowing()
    -- regen code
    if not inst.planted then
        TheWorld:PushEvent("beginregrowth", inst)
    end

    DefaultBurntFn(inst)
end

local function on_ignite(inst)
    -- Function empty; we make a custom function just to bypass the persists = false portion of the default ignite function.
end

local function on_dug_up(inst, digger)
    local withered = inst.components.witherable ~= nil and inst.components.witherable:IsWithered()

    -- including the barren/withered state into SetLoot resulted picking the tree at the state
    if withered or inst.components.pickable:IsBarren() then
        inst.components.lootdropper:SpawnLootPrefab("twigs")
        inst.components.lootdropper:SpawnLootPrefab("twigs")
    elseif inst.components.lootdropper ~= nil then
        inst.components.lootdropper:DropLoot()
        inst.components.lootdropper:SpawnLootPrefab("dug_tea_tree")
    end

        -- regen cord
    if not inst.planted then
        TheWorld:PushEvent("beginregrowth", inst)
    end

    -- This actual bush is now no longer needed.
    inst:Remove()
end

local function onpickedfn(inst, picker)
    local picked_anim = (inst.components.growable.stage == 2 and "picked2") or (inst.components.growable.stage == 3 and "picked3") or (inst.components.growable.stage == 4 and "picked4")

    if picker ~= nil and picked_anim == "picked3" then
        if picker.components.sanity ~= nil and not picker:HasTag("plantkin") then
            picker.components.sanity:DoDelta(TUNING.SANITY_TINY)
        end
    end

    inst.components.growable:SetStage(1)
    inst.components.lootdropper:SetLoot(nil)

    -- Play the proper picked animation.
    inst.AnimState:PlayAnimation(picked_anim)
    if inst.components.pickable:IsBarren() then
        -- NOTE: IsBarren just tests cycles_left; MakeBarren hasn't actually been called!
        -- So we need to do the relevant parts of that function. Copied here just to not overload SetStage/animations.
        inst.AnimState:PushAnimation("idle1_to_dead1", false)
        inst.AnimState:PushAnimation("dead1", false)
        inst.components.growable:StopGrowing()
        inst.components.growable.magicgrowable = false
    else
        inst.AnimState:PushAnimation("idle1", false)
    end
end

local function makeemptyfn(inst)
    if not POPULATING then
        -- SetStage(1) will change the animation, so store whether we came into this function dead first.
        local emptying_dead = inst.AnimState:IsCurrentAnimation("dead1")

        inst.components.growable:SetStage(1)
        inst.components.growable:StartGrowing()
        inst.components.growable.magicgrowable = true
        inst.components.pickable.canbepicked = false

        if not (inst:HasTag("withered") or emptying_dead) then
            inst.AnimState:PlayAnimation("idle1", false)
        else
            inst.AnimState:PlayAnimation("dead1_to_idle1")
            inst.AnimState:PushAnimation("idle1", false)
        end
    end
end

local function makebarrenfn(inst, wasempty)
    inst.components.growable:SetStage(1)
    inst.components.growable:StopGrowing()
    inst.components.growable.magicgrowable = false

    if not POPULATING and inst:HasTag("withered") then
        inst.AnimState:PlayAnimation("idle1_to_dead1") --temporary motion, should be replaced to "idle1_to_dead1"
        inst.AnimState:PushAnimation("dead1", false)
    else
        inst.AnimState:PlayAnimation("dead1")
    end
end

local function ontransplantfn(inst)
    inst.components.pickable:MakeBarren()
end

local function on_save(inst, data)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        data.burning = true
    end
    data.planted = inst.planted
    data.was_herd = inst.components.herdmember and true or nil
end

local function on_load(inst, data)
    if data == nil then
        return
    end
    inst.planted = data ~= nil and data.planted or nil
    if data.burning then
        on_bush_burnt(inst)
    elseif inst.components.witherable:IsWithered() then
        inst.components.witherable:ForceWither()
    elseif not inst.components.pickable:IsBarren() and data.growable ~= nil and data.growable.stage == nil then
        -- growable doesn't call SetStage on load if the stage was saved out as nil (assuming initial state is ok).
        -- Since we randomly choose a stage on prefab creation, we want to explicitly call SetStage(1) for that case.
        inst.components.growable:SetStage(1)
    end
end

local function on_preload(inst, data)
    if data and data.was_herd then
        if TheWorld.components.lunarthrall_plantspawner then
            TheWorld.components.lunarthrall_plantspawner:setHerdsOnPlantable(inst)
        end
    end
end

local function tea_tree()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("tea_tree.tex")

    inst.AnimState:SetBank("tea_tree_build")
    inst.AnimState:SetBuild("tea_tree_build")
    inst.AnimState:PlayAnimation("idle1")

    MakeSmallObstaclePhysics(inst, .1)

    inst:AddTag("plant")
    inst:AddTag("renewable")
    inst:AddTag("witherable")
    inst:AddTag("lunarplant_target")

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    MakeMediumBurnable(inst)
    inst.components.burnable:SetOnBurntFn(on_bush_burnt)
    inst.components.burnable:SetOnIgniteFn(on_ignite)

    MakeMediumPropagator(inst)

    MakeHauntableIgnite(inst)

    inst:AddComponent("lootdropper")
    inst.components.lootdropper.lootsetupfn = SetupLoot

    if not GetGameModeProperty("disable_transplanting") then
        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.DIG)
        inst.components.workable:SetWorkLeft(1)
        inst.components.workable:SetOnFinishCallback(on_dug_up)
    end

    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"

    -- We will have 3 rock fruit, but we only have real product for one stage, and it's not our initial stage.
    -- We use ChangeProduct to set this up elsewhere.
    --inst.components.pickable.numtoharvest = 3
    inst.components.pickable.use_lootdropper_for_product = true
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.makeemptyfn = makeemptyfn
    inst.components.pickable.makebarrenfn = makebarrenfn
    inst.components.pickable.ontransplantfn = ontransplantfn
    inst.components.pickable.onregenfn = onregenfn

    inst.components.pickable.max_cycles = TUNING.ROCK_FRUIT_PICKABLE_CYCLES
    inst.components.pickable.cycles_left = inst.components.pickable.max_cycles

    inst:AddComponent("witherable")

    inst:AddComponent("inspectable")

    inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable.loopstages = true
    inst.components.growable.springgrowth = true
    inst.components.growable.magicgrowable = true
    inst.components.growable:SetStage(math.random(1, 4))
    inst.components.growable:StartGrowing()

    inst.OnSave = on_save
    inst.OnLoad = on_load
    inst.OnPreLoad = on_preload

    MakeSnowCovered(inst)

    return inst
end

local function on_deploy_fn(inst, position, deployer)
	local tree = SpawnPrefab("tea_tree")
	if tree ~= nil then
		tree.Transform:SetPosition(position:Get())
		inst.components.stackable:Get():Remove()
		tree.components.pickable:OnTransplant()
		if deployer ~= nil and deployer.SoundEmitter ~= nil then
			deployer.SoundEmitter:PlaySound("dontstarve/common/plant")
		end
        inst.planted = true
        if TheWorld.components.lunarthrall_plantspawner and tree:HasTag("lunarplant_target") then
            TheWorld.components.lunarthrall_plantspawner:setHerdsOnPlantable(tree)
        end
	end
end

local function dug_tea_tree()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"
    inst.minisign_prefab_name = true

    inst.AnimState:SetBank("tea_tree_build")
    inst.AnimState:SetBuild("tea_tree_build")
    inst.AnimState:PlayAnimation("dropped")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", nil, 0.4)

    inst:AddTag("deployedplant")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("tea_tree_bush_dug")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "tea_tree_bush_dug"

    inst:AddComponent("tradable")

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.PLANT)
    inst.components.deployable.ondeploy = on_deploy_fn

    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)

    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

return Prefab("tea_tree", tea_tree, assets, prefabs),
Prefab("dug_tea_tree",dug_tea_tree, assets, prefabs_item),
MakePlacer("dug_tea_tree_placer","tea_tree_build","tea_tree_build","idle2")
