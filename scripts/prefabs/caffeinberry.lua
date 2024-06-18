require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/caffeinberry.zip"),
	Asset("ANIM", "anim/caffeinberry_diseased.zip"),
    Asset("ANIM", "anim/caffeinberry_bean.zip")

local prefabs =
{
	"caffeinberry_bean",
	"twigs",
	"dug_caffeinberry",
}

local prefabs_item =
{
	"dug_caffeinberry_placer"
}

local BERRY_TYPES = { "caffeinberrienone","caffeinberries", "caffeinberriesmore", "caffeinberriesmost" }
local function setberries(inst, pct)
    if inst._setberriesonanimover then
        inst._setberriesonanimover = nil
        inst:RemoveEventCallback("animover", setberries)
    end

    local berries =
        (not pct and "caffeinberrienone") or
        (pct >= .9 and "caffeinberriesmost") or
        (pct >= .33 and "caffeinberriesmore") or
        "caffeinberries"

    for i, berry_type in ipairs(BERRY_TYPES) do
        if berry_type == berries then
            inst.AnimState:Show(berry_type)
        else
            inst.AnimState:Hide(berry_type)
        end
    end
end

local function setberriesonanimover(inst)
    if inst._setberriesonanimover then
        setberries(inst, nil)
    else
        inst._setberriesonanimover = true
        inst:ListenForEvent("animover", setberries)
    end
end

local function cancelsetberriesonanimover(inst)
    if inst._setberriesonanimover then
        setberries(inst, nil)
    end
end

local function makeemptyfn(inst)
    if POPULATING then
        inst.AnimState:PlayAnimation("idle", true)
        inst.AnimState:SetFrame(math.random(inst.AnimState:GetCurrentAnimationNumFrames()) - 1)
    elseif inst:HasTag("withered") or inst.AnimState:IsCurrentAnimation("dead") then
        --inst.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
        inst.AnimState:PlayAnimation("dead_to_idle")
        inst.AnimState:PushAnimation("idle")
    else
        inst.AnimState:PlayAnimation("idle", true)
    end
    setberries(inst, nil)
end

local function makebarrenfn(inst)--, wasempty)
    if not POPULATING and (inst:HasTag("withered") or inst.AnimState:IsCurrentAnimation("idle")) then
        inst.AnimState:PlayAnimation("idle_to_dead")
        inst.AnimState:PushAnimation("dead", false)
    else
        inst.AnimState:PlayAnimation("dead")
    end
    cancelsetberriesonanimover(inst)
end

local function shake(inst)
    if inst.components.pickable and
            not inst.components.pickable:CanBePicked() and
            inst.components.pickable:IsBarren() then
        inst.AnimState:PlayAnimation("shake_dead")
        inst.AnimState:PushAnimation("dead", false)
    else
        inst.AnimState:PlayAnimation("shake")
        inst.AnimState:PushAnimation("idle")
    end
    cancelsetberriesonanimover(inst)
end

local function onpickedfn(inst, picker)
    if inst.components.pickable then
        if inst.components.pickable:IsBarren() then
            inst.AnimState:PlayAnimation("idle_to_dead")
            inst.AnimState:PushAnimation("dead", false)
            setberries(inst, nil)
        else
            inst.AnimState:PlayAnimation("picked")
            inst.AnimState:PushAnimation("idle")
            setberriesonanimover(inst)
        end
    end
end

local function getregentimefn_normal(inst)
    if not inst.components.pickable then
        return TUNING.BERRY_REGROW_TIME
    end
    --V2C: nil cycles_left means unlimited picks, so use max value for math
    local max_cycles = inst.components.pickable.max_cycles
    local cycles_left = inst.components.pickable.cycles_left or max_cycles
    local num_cycles_passed = math.max(0, max_cycles - cycles_left)
    return TUNING.BERRY_REGROW_TIME
        + TUNING.BERRY_REGROW_INCREASE * num_cycles_passed
        + TUNING.BERRY_REGROW_VARIANCE * math.random()
end

local function makefullfn(inst)
    local anim = "idle"
    local berries = nil
    if inst.components.pickable then
        if inst.components.pickable:CanBePicked() then
            berries = (inst.components.pickable.cycles_left and inst.components.pickable.cycles_left / inst.components.pickable.max_cycles) or 1
        elseif inst.components.pickable:IsBarren() then
            anim = "dead"
        end
    end
    if anim ~= "idle" then
        inst.AnimState:PlayAnimation(anim)
    elseif POPULATING then
        inst.AnimState:PlayAnimation("idle", true)
        inst.AnimState:SetFrame(math.random(inst.AnimState:GetCurrentAnimationNumFrames()) - 1)
    else
        inst.AnimState:PlayAnimation("grow")
        inst.AnimState:PushAnimation("idle", true)
    end
    setberries(inst, berries)
end

local function dig_up_common(inst, worker, numberries)
    if inst.components.pickable and inst.components.lootdropper then
        local withered = (inst.components.witherable ~= nil and inst.components.witherable:IsWithered())


        if withered or inst.components.pickable:IsBarren() then
            inst.components.lootdropper:SpawnLootPrefab("twigs")
            inst.components.lootdropper:SpawnLootPrefab("twigs")
        else
            if inst.components.pickable:CanBePicked() then
                local pt = inst:GetPosition()
                pt.y = pt.y + (inst.components.pickable.dropheight or 0)
                for i = 1, numberries do
                    inst.components.lootdropper:SpawnLootPrefab(inst.components.pickable.product, pt)
                end
            end
            inst.components.lootdropper:SpawnLootPrefab("dug_"..inst.prefab)
        end
    end
    inst:Remove()
end

local function dig_up_normal(inst, worker)
    dig_up_common(inst, worker, 1)
end

local function ontransplantfn(inst)
    inst.AnimState:PlayAnimation("dead")
    setberries(inst, nil)
    inst.components.pickable:MakeBarren()
end

local function OnHaunt(inst)
    if math.random() <= TUNING.HAUNT_CHANCE_ALWAYS then
        shake(inst)
        inst.components.hauntable.hauntvalue = TUNING.HAUNT_COOLDOWN_TINY
        return true
    else
        return false
    end
end

local function caffeinberry()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeSmallObstaclePhysics(inst, .1)

    inst:AddTag("bush")
    inst:AddTag("plant")
    inst:AddTag("renewable")
    inst:AddTag("witherable")

    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("caffeinberrybush.tex")

    inst.AnimState:SetBank("caffeinberry")
    inst.AnimState:SetBuild("caffeinberry")
    inst.AnimState:PlayAnimation("idle", true)
    setberries(inst, 1)

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetFrame(math.random(inst.AnimState:GetCurrentAnimationNumFrames()) - 1)
    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.makeemptyfn = makeemptyfn
    inst.components.pickable.makebarrenfn = makebarrenfn
    inst.components.pickable.makefullfn = makefullfn
    inst.components.pickable.ontransplantfn = ontransplantfn
    inst.components.pickable:SetUp("caffeinberry_bean", TUNING.BERRY_REGROW_TIME)
    inst.components.pickable.getregentimefn = getregentimefn_normal
    inst.components.pickable.max_cycles = TUNING.BERRYBUSH_CYCLES + math.random(2)
    inst.components.pickable.cycles_left = inst.components.pickable.max_cycles

    inst:AddComponent("witherable")

    MakeLargeBurnable(inst)
    MakeMediumPropagator(inst)

    MakeHauntableIgnite(inst)
    AddHauntableCustomReaction(inst, OnHaunt, false, false, true)

    inst:AddComponent("lootdropper")

    if not GetGameModeProperty("disable_transplanting") then
        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.DIG)
        inst.components.workable:SetWorkLeft(1)
        inst.components.workable:SetOnFinishCallback(dig_up_normal)
    end

    inst:AddComponent("inspectable")

    MakeSnowCovered(inst)

    return inst
end

local function on_deploy_fn(inst, position, deployer)
	local tree = SpawnPrefab("caffeinberry")
	if tree ~= nil then
        tree.Transform:SetPosition(position:Get())
        inst.components.stackable:Get():Remove()
        if tree.components.pickable ~= nil then
            tree.components.pickable:OnTransplant()
        end
		if deployer ~= nil and deployer.SoundEmitter ~= nil then
			deployer.SoundEmitter:PlaySound("dontstarve/common/plant")
		end
        inst.planted = true
	end
end

local function dug_caffeinberry()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"
    inst.minisign_prefab_name = true

    inst.AnimState:SetBank("caffeinberry")
    inst.AnimState:SetBuild("caffeinberry")
    inst.AnimState:PlayAnimation("dropped")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

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
    inst.replica.inventoryitem:SetImage("dug_caffeinberry")
	inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename = "caffeinberry_bush_dug"

    inst:AddComponent("tradable")

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.PLANT)
    inst.components.deployable.ondeploy = on_deploy_fn

    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

local function caffeinberry_bean()
        local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("caffeinberry_bean")
    inst.AnimState:SetBuild("caffeinberry_bean")
    inst.AnimState:PlayAnimation("idle")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.pickupsound = "vegetation_firm"

    inst:AddTag("cocktail_ingredients")

    inst.entity:SetPristine()

    inst:AddTag("cookable")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
    inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("bait")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("caffeinberry_bean")
    inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "caffeinberry_bean"

    inst:AddComponent("tradable")
    
    inst:AddComponent("cookable")
    inst.components.cookable.product = "caffeinberry_bean_cooked"

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

local function OnEatBeans(inst, eater)
    if eater.components.debuffable then
        eater.caffeinbuff_duration = TUNING.SEG_TIME
        eater:AddDebuff("caffeinbuff", "caffeinbuff")
    end
end

local function caffeinberry_bean_cooked()
        local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("caffeinberry_bean")
    inst.AnimState:SetBuild("caffeinberry_bean")
    inst.AnimState:PlayAnimation("cooked")

    inst:AddTag("cocktail_ingredients")

    inst.pickupsound = "vegetation_firm"

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
    inst.components.edible.sanityvalue = -TUNING.SANITY_TINY
    inst.components.edible.foodtype = FOODTYPE.VEGGIE
    inst.components.edible:SetOnEatenFn(OnEatBeans)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("caffeinberry_bean_cooked")
    inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "caffeinberry_bean_cooked"

    inst:AddComponent("tradable")

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function fn_spice()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.minisign_atlas = "minisign_dehy_items_swap"
    
    inst.AnimState:SetBank("water_spice")
    inst.AnimState:SetBuild("water_spice")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("spice")
    inst:AddTag("watermod")
    inst:AddTag("cocktail_ingredients")

    MakeInventoryFloatable(inst, "med", nil, 0.85)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("spice_caffeinpepper")
    inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "spice_caffeinpepper"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("caffeinberry_bean_cooked", caffeinberry_bean_cooked, assets),
Prefab("caffeinberry_bean", caffeinberry_bean, assets, {"caffeinberry_bean_cooked"}),
Prefab("caffeinberry", caffeinberry, assets, prefabs),
Prefab("dug_caffeinberry",dug_caffeinberry, assets, prefabs_item),
MakePlacer("dug_caffeinberry_placer","caffeinberry","caffeinberry","caffeinberriesmost")
