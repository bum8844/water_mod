require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/caffeinberry.zip"),
	Asset("ANIM", "anim/caffeinberry_diseased.zip"),
    Asset("ANIM", "anim/caffeinberry_bean.zip"),
}

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

local function setberries(inst, pct)
    if inst._setberriesonanimover then
        inst._setberriesonanimover = nil
        inst:RemoveEventCallback("animover", setberries)
    end

    local berries =
        (pct == nil and "") or
        (pct >= .9 and "berriesmost") or
        (pct >= .33 and "berriesmore") or
        "berries"

    for i, v in ipairs({ "berries", "berriesmore", "berriesmost" }) do
        if v == berries then
            inst.AnimState:Show(v)
        else
            inst.AnimState:Hide(v)
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
        inst.AnimState:PlayAnimation("empty", true)
        inst.AnimState:SetTime(math.random() * inst.AnimState:GetCurrentAnimationLength())
    elseif inst:HasTag("withered") or inst.AnimState:IsCurrentAnimation("idle_dead") then
        --inst.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
        inst.AnimState:PlayAnimation("dead_to_empty")
        inst.AnimState:PushAnimation("empty")
    else
        inst.AnimState:PlayAnimation("empty", true)
    end
    setberries(inst, nil)
end

local function makebarrenfn(inst)--, wasempty)
    if not POPULATING and (inst:HasTag("withered") or inst.AnimState:IsCurrentAnimation("berriesmost")) then
        inst.AnimState:PlayAnimation("full_to_dead")
        inst.AnimState:PushAnimation("idle_dead", false)
    else
		inst.AnimState:PlayAnimation("empty_to_dead")
        inst.AnimState:PlayAnimation("idle_dead")
    end
    cancelsetberriesonanimover(inst)
end

local function shake(inst)
    if inst.components.pickable ~= nil and
        not inst.components.pickable:CanBePicked() and
        inst.components.pickable:IsBarren() then
        inst.AnimState:PlayAnimation("shake_empty")
        inst.AnimState:PushAnimation("idle_dead", false)
    else
        inst.AnimState:PlayAnimation("shake_empty")
        inst.AnimState:PushAnimation("empty")
    end
    cancelsetberriesonanimover(inst)
end

local function onpickedfn(inst, picker)
    if inst.components.pickable ~= nil then
        --V2C: nil cycles_left means unlimited picks, so use max value for math
        --local old_percent = inst.components.pickable.cycles_left ~= nil and (inst.components.pickable.cycles_left + 1) / inst.components.pickable.max_cycles or 1
        --setberries(inst, old_percent)
        if inst.components.pickable:IsBarren() then
            inst.AnimState:PlayAnimation("full_to_dead")
            inst.AnimState:PushAnimation("idle_dead", false)
            setberries(inst, nil)
        else
            inst.AnimState:PlayAnimation("berriesmost_picked")
            inst.AnimState:PushAnimation("empty")
            setberriesonanimover(inst)
        end
    end
end

local function getregentimefn_normal(inst)
    if inst.components.pickable == nil then
        return TUNING.BERRY_REGROW_TIME
    end
    local max_cycles = inst.components.pickable.max_cycles
    local cycles_left = inst.components.pickable.cycles_left or max_cycles
    local num_cycles_passed = math.max(0, max_cycles - cycles_left)
    return TUNING.BERRY_REGROW_TIME
        + TUNING.BERRY_REGROW_INCREASE * num_cycles_passed
        + TUNING.BERRY_REGROW_VARIANCE * math.random()
end

local function makefullfn(inst)
    local anim = "berriesmost"
    local berries = nil
    if inst.components.pickable ~= nil then
        if inst.components.pickable:CanBePicked() then
            berries = inst.components.pickable.cycles_left ~= nil and inst.components.pickable.cycles_left / inst.components.pickable.max_cycles or 1
        elseif inst.components.pickable:IsBarren() then
            anim = "idle_dead"
        end
    end
    if anim ~= "berriesmost" then
        inst.AnimState:PlayAnimation(anim)
    elseif POPULATING then
        inst.AnimState:PlayAnimation("berriesmost", true)
        inst.AnimState:SetTime(math.random() * inst.AnimState:GetCurrentAnimationLength())
    else
		inst.AnimState:PlayAnimation("shake_empty", true)
        inst.AnimState:PushAnimation("berriesmost", true)
    end
    setberries(inst, berries)
end

local function dig_up_common(inst, worker, numberries)
    if inst.components.pickable ~= nil and inst.components.lootdropper ~= nil then
        local withered = inst.components.witherable ~= nil and inst.components.witherable:IsWithered()


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
            inst.components.lootdropper:SpawnLootPrefab("dug_caffeinberry")
        end
    end

    if TheNet:GetDefaultGameMode() ~= "survival" and not inst.planted then
        TheWorld:PushEvent("beginregrowth", inst)
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
    end
    return false
end

--regrowth code
local function OnBurnt(inst)
    if TheNet:GetDefaultGameMode() ~= "survival" and not inst.planted then
        TheWorld:PushEvent("beginregrowth", inst)
    end
    DefaultBurntFn(inst)
end

local function caffeinberry()
	local inst = CreateEntity()
	
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("caffeinberry")
    inst.AnimState:SetBuild("caffeinberry")
    inst.AnimState:PlayAnimation("berriesmost")
	
    MakeSmallObstaclePhysics(inst, .1)
	
    inst:AddTag("bush")
    inst:AddTag("plant")
    inst:AddTag("renewable")

    inst:AddTag("witherable")
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("caffeinberrybush.tex")
	
    setberries(inst, 1)

    MakeSnowCoveredPristine(inst)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.AnimState:SetTime(math.random() * inst.AnimState:GetCurrentAnimationLength())

	inst:AddComponent("pickable")
	inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"
	inst.components.pickable.onpickedfn = onpickedfn
	inst.components.pickable.makeemptyfn = makeemptyfn
	inst.components.pickable.makebarrenfn = makebarrenfn
	inst.components.pickable.makefullfn = makefullfn
	inst.components.pickable.ontransplantfn = ontransplantfn

	inst:AddComponent("witherable")

	MakeLargeBurnable(inst)
	MakeMediumPropagator(inst)
    inst.components.burnable:SetOnBurntFn(OnBurnt)

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

	inst:ListenForEvent("onwenthome", shake)
	MakeSnowCovered(inst)
	MakeNoGrowInWinter(inst)
	
    inst.components.pickable:SetUp("caffeinberry_bean", TUNING.BERRY_REGROW_TIME)
    inst.components.pickable.getregentimefn = getregentimefn_normal
    inst.components.pickable.max_cycles = TUNING.BERRYBUSH_CYCLES + math.random(2)
    inst.components.pickable.cycles_left = inst.components.pickable.max_cycles

	return inst
end


local function on_deploy_fn(inst, position, deployer)
	local tree = SpawnPrefab("caffeinberry")
	if tree ~= nil then
		tree.Transform:SetPosition(position:Get())
		inst.components.stackable:Get():Remove()
		tree.components.pickable:OnTransplant()
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

    inst.AnimState:SetBank("caffeinberry")
    inst.AnimState:SetBuild("caffeinberry")
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
    inst.replica.inventoryitem:SetImage("dug_caffeinberry")
	inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "caffeinberry_bush_dug"

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

    inst.AnimState:SetBank("caffeinberry_bean")
    inst.AnimState:SetBuild("caffeinberry_bean")
    inst.AnimState:PlayAnimation("idle")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", nil, 0.4)

    inst:AddTag("deployedplant")

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

local function caffeinberry_bean_cooked()
        local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("caffeinberry_bean")
    inst.AnimState:SetBuild("caffeinberry_bean")
    inst.AnimState:PlayAnimation("cooked")

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

return Prefab("caffeinberry_bean_cooked", caffeinberry_bean_cooked, assets),
Prefab("caffeinberry_bean", caffeinberry_bean, assets, {"caffeinberry_bean_cooked"}),
Prefab("caffeinberry", caffeinberry, assets, prefabs),
Prefab("dug_caffeinberry",dug_caffeinberry, assets, prefabs_item),
MakePlacer("dug_caffeinberry_placer","caffeinberry","caffeinberry","berriesmost")
