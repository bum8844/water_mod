require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/portablekettle.zip"),
	Asset("ANIM", "anim/portablekettle_meter_dirty.zip"),
	Asset("ANIM", "anim/portablekettle_meter_water.zip"),
    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
}

local assets_item =
{
    Asset("ANIM", "anim/portablekettle.zip"),
}

local prefabs_portablekettle =
{
    "collapse_small",
    "ash",
	"portablekettle_item",
}

local prefabs_item =
{
    "portablekettle",
}

local function ChangeToItem(inst)
    --if inst.components.stewer.product ~= nil and inst.components.stewer:IsDone() then
        --inst.components.stewer:Harvest()
    --end
    --if inst.components.container ~= nil then
        --inst.components.container:DropEverything()
    --end

    local item = SpawnPrefab("portablekettle_item")
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    item.AnimState:PlayAnimation("collapse")
    item.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
end

local function onhammered(inst)--, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end

    if inst:HasTag("burnt") then
        inst.components.lootdropper:SpawnLootPrefab("ash")
        local fx = SpawnPrefab("collapse_small")
        fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
        fx:SetMaterial("metal")
    else
        ChangeToItem(inst)
    end

    inst:Remove()
end

local function onhit(inst)--, worker)
    if not inst:HasTag("burnt") then
        --if inst.components.stewer:IsCooking() then
            --inst.AnimState:PlayAnimation("hit_cooking")
            --inst.AnimState:PushAnimation("cooking_loop", true)
            --inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        --elseif inst.components.stewer:IsDone() then
            --inst.AnimState:PlayAnimation("hit_full")
            --inst.AnimState:PushAnimation("idle_full", false)
        --else
            --if inst.components.container ~= nil and inst.components.container:IsOpen() then
                --inst.components.container:Close()
                --onclose will trigger sfx already
            --else
                inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
            --end
            inst.AnimState:PlayAnimation("hit_empty")
            inst.AnimState:PushAnimation("idle_empty", false)
        --end
    end
end

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        --or (inst.components.stewer:IsDone() and "DONE")
        --or (not inst.components.stewer:IsCooking() and "EMPTY")
        --or (inst.components.stewer:GetTimeToCook() > 15 and "COOKING_LONG")
        --or "COOKING_SHORT"
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function OnDismantle(inst)--, doer)
    ChangeToItem(inst)
    inst:Remove()
end

local function OnBurnt(inst)
    DefaultBurntStructureFn(inst)
    RemovePhysicsColliders(inst)
    SpawnPrefab("ash").Transform:SetPosition(inst.Transform:GetWorldPosition())
    if inst.components.workable ~= nil then
        inst:RemoveComponent("workable")
    end
    if inst.components.portablestructure ~= nil then
        inst:RemoveComponent("portablestructure")
    end
    inst.persists = false
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:ListenForEvent("animover", ErodeAway)
    inst.AnimState:PlayAnimation("burnt_collapse")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst:SetPhysicsRadiusOverride(.5)
    MakeObstaclePhysics(inst, inst.physicsradiusoverride)

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("portablekettle.tex")

    inst.Light:Enable(false)
    inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(235/255,62/255,12/255)

    inst.DynamicShadow:SetSize(2, 1)

    inst:AddTag("structure")

    --stewer (from stewer component) added to pristine state for optimization
    --inst:AddTag("stewer")

    inst.AnimState:SetBank("portablekettle")
    inst.AnimState:SetBuild("portablekettle")
    inst.AnimState:PlayAnimation("idle_empty")
	inst.AnimState:OverrideSymbol("swap", "portablekettle_meter_dirty", "0")

    inst:SetPrefabNameOverride("portablekettle_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

    --inst:AddComponent("stewer")
    --inst.components.stewer.cooktimemult = TUNING.PORTABLE_COOK_POT_TIME_MULTIPLIER
    --inst.components.stewer.onstartcooking = startcookfn
    --inst.components.stewer.oncontinuecooking = continuecookfn
    --inst.components.stewer.oncontinuedone = continuedonefn
    --inst.components.stewer.ondonecooking = donecookfn
    --inst.components.stewer.onharvest = harvestfn
    --inst.components.stewer.onspoil = spoilfn

    --inst:AddComponent("container")
    --inst.components.container:WidgetSetup("portablecookpot")
    --inst.components.container.onopenfn = onopen
    --inst.components.container.onclosefn = onclose
    --inst.components.container.skipclosesnd = true
    --inst.components.container.skipopensnd = true

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)
    inst.components.burnable:SetFXLevel(2)
    inst.components.burnable:SetOnBurntFn(OnBurnt)

    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end


---------------------------------------------------------------
---------------- Inventory Portable Kettle -------------------
---------------------------------------------------------------

local function ondeploy(inst, pt, deployer)
    local pot = SpawnPrefab("portablekettle")
    if pot ~= nil then
        pot.Physics:SetCollides(false)
        pot.Physics:Teleport(pt.x, 0, pt.z)
        pot.Physics:SetCollides(true)
        pot.AnimState:PlayAnimation("place")
        pot.AnimState:PushAnimation("idle_empty", false)
        pot.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/place")
        inst:Remove()
        PreventCharacterCollisionsWithPlacedObjects(pot)
    end
end

local function itemfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("portablekettle")
    inst.AnimState:SetBuild("portablekettle")
    inst.AnimState:PlayAnimation("idle_ground")

    inst:AddTag("portableitem")

    MakeInventoryFloatable(inst, "med", 0.1, 0.8)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.replica.inventoryitem:SetImage("portablekettle_item")
	inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "portablekettle_item"

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
    --inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
    --inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.NONE)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    MakeMediumBurnable(inst)
    MakeSmallPropagator(inst)

    return inst
end

return Prefab("portablekettle", fn, assets, prefabs),
    MakePlacer("portablekettle_item_placer", "portablekettle", "portablekettle", "idle_empty"),
    Prefab("portablekettle_item", itemfn, assets_item, prefabs_item)