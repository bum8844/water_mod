require "prefabutil"

local cooking = require("cooking")

local assets =
{
    Asset("ANIM", "anim/portablekettle.zip"),
    Asset("ANIM", "anim/kettle_drink.zip"),
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
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end

    local item = SpawnPrefab("portablekettle_item")
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    item.AnimState:PlayAnimation("collapse")
    item.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
end

local function GetWet(inst)
    if not inst:HasTag("burnt") then
        if inst.components.waterlevel:GetPercent() > 0 then
            SpawnPrefab("waterballoon_splash").Transform:SetPosition(inst.Transform:GetWorldPosition())
            inst.SoundEmitter:KillSound("destroy")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
            inst.components.wateryprotection:SpreadProtection(inst)
        end
    end
end

local function onpercentusedchange(inst, data)
    inst.components.wateryprotection.addwetness = data.percent * TUNING.WATER_BARREL_WETNESS
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
        GetWet(inst)
        ChangeToItem(inst)
    end

    inst:Remove()
end

local function onhit(inst)--, worker)
    if not inst:HasTag("burnt") then
        if inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("hit_cooking")
            inst.AnimState:PushAnimation("cooking_loop", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        elseif inst.components.stewer:IsDone() then
            inst.AnimState:PlayAnimation("hit_full")
            inst.AnimState:PushAnimation("idle_full", false)
        else
            if inst.components.container ~= nil and inst.components.container:IsOpen() then
                inst.components.container:Close()
                -- onclose will trigger sfx already
            else
                inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
            end
            inst.AnimState:PlayAnimation("hit_empty")
            inst.AnimState:PushAnimation("idle_empty", false)
        end
    end
end

local function startcookfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.waterlevel.accepting = false
        inst.components.water.available = false
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
        inst.Light:Enable(true)
    end
end

local function IsModDrink(inst, product, overridebuild)
    local recipe = cooking.GetRecipe(inst.prefab, product)
    return recipe ~= nil and recipe.overridebuild
end

local function SetProductSymbol(inst, product, overridebuild)
    local recipe = cooking.GetRecipe(inst.prefab, product)
    local potlevel = recipe ~= nil and recipe.potlevel or nil
    local potlevel_bottle = recipe ~= nil and recipe.potlevel_bottle or nil
    local build = IsModDrink(inst, product, overridebuild) and overridebuild or IsModDrink(inst, product, overridebuild) and inst.components.waterlevel:GetWater() >= 5 and overridebuild.."_bottle"
    or inst.components.waterlevel:GetWater() >= 5 and "kettle_drink_bottle" or "kettle_drink"
    local overridesymbol = (recipe ~= nil and recipe.overridesymbolname) or (recipe.basename ~= nil and recipe.basename) or product
    local potlevels = potlevel ~= nil and "swap_"..potlevel or "swap_mid"
    local potlevels_bottle = potlevel_bottle ~= nil and "swap_"..potlevel_bottle.."_bottle" or "swap_mid_bottle"
    local result_potlevels = nil
    
    if inst.components.waterlevel:GetWater() >= 5 then
        result_potlevels = potlevels_bottle
        inst.AnimState:Hide("swap_high")
        inst.AnimState:Hide("swap_mid")
        inst.AnimState:Hide("swap_small")
        if potlevel_bottle == "high" then
            inst.AnimState:Show("swap_high_bottle")
            inst.AnimState:Hide("swap_mid_bottle")
            inst.AnimState:Hide("swap_small_bottle")
        elseif potlevel_bottle == "small" then
            inst.AnimState:Hide("swap_high_bottle")
            inst.AnimState:Hide("swap_mid_bottle")
            inst.AnimState:Show("swap_small_bottle")
        else
            inst.AnimState:Hide("swap_high_bottle")
            inst.AnimState:Show("swap_mid_bottle")
            inst.AnimState:Hide("swap_small_bottle")
        end
    else
        result_potlevels = potlevels
        inst.AnimState:Hide("swap_high_bottle")
        inst.AnimState:Hide("swap_mid_bottle")
        inst.AnimState:Hide("swap_small_bottle")
        if potlevel == "high" then
            inst.AnimState:Show("swap_high")
            inst.AnimState:Hide("swap_mid")
            inst.AnimState:Hide("swap_small")
        elseif potlevel == "small" then
            inst.AnimState:Hide("swap_high")
            inst.AnimState:Hide("swap_mid")
            inst.AnimState:Show("swap_small")
        else
            inst.AnimState:Hide("swap_high")
            inst.AnimState:Show("swap_mid")
            inst.AnimState:Hide("swap_small")
        end
    end

    inst.AnimState:OverrideSymbol(result_potlevels, build, overridesymbol)
end

local function spoilfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.stewer.product = inst.components.stewer.spoiledproduct
        inst.AnimState:OverrideSymbol("swap", "portablekettle_meter_dirty", tostring(inst._waterlevel))
        inst:DoTaskInTime(0,function(inst)
            SetProductSymbol(inst, inst.components.stewer.product)
        end)
    end
end

local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        inst.components.waterlevel.accepting = false
        inst.components.water.available = false
        inst:DoTaskInTime(0,function(inst)
            SetProductSymbol(inst, inst.components.stewer.product)
            inst.components.pickable.product = inst.components.stewer.product
            inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
            inst.components.pickable.canbepicked = true
        end)
    end
end

local function donecookfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_pst")
        inst.AnimState:PushAnimation("idle_full", false)
        ShowProduct(inst)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish")
        inst.Light:Enable(false)
    end
end

local function continuedonefn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("idle_full")
        ShowProduct(inst)
    end
end

local function continuecookfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.water.available = false
        inst.components.waterlevel.accepting = false
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.Light:Enable(true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
    end
end

local function harvestfn(inst,picker,loot)
    if not inst:HasTag("burnt") then
        if inst.components.stewer.spoiltime ~= nil and loot.components.perishable ~= nil then
            local spoilpercent = inst.components.stewer:GetTimeToSpoil() / inst.components.stewer.spoiltime
            loot.components.perishable:SetPercent(inst.components.stewer.product_spoilage * spoilpercent)
            loot.components.perishable:StartPerishing()
        end
        picker:PushEvent("learncookbookrecipe", {product = inst.components.stewer.product, ingredients = inst.components.stewer.ingredient_prefabs})
        inst.components.stewer.product = nil
        inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
        inst.AnimState:PlayAnimation("getdrink")
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
        inst.AnimState:PushAnimation("idle_empty",false)
        inst:DoTaskInTime(.75,function (inst)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        end)
        inst.components.stewer:Harvest(picker)
    end
end
local function isgoodwater(inst)
    return inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN and inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN_ICE
end

local function OnSectionChange(new, old, inst)
    local watertype = (isgoodwater(inst) or inst.components.stewer.product == "spoiled_drink") and "dirty" or "water"
    if new ~= nil then
        if inst._waterlevel ~= new then
            inst._waterlevel = new
        end
    end
    inst.AnimState:OverrideSymbol("swap", "portablekettle_meter_"..watertype, tostring(inst._waterlevel))
end

local function OnDismantle(inst, doer)
    if inst.components.waterlevel:GetPercent() <= 0 then
        ChangeToItem(inst)
        inst:Remove()
    else
        doer.components.talker:Say(GetString(doer,"ACTIONFAIL",{"DISMANTLE","NOTEMPTY"}))
    end
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

local function onopen(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_pre_loop")
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_open")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot", "snd")
    end
end

local function onclose(inst)
    if not inst:HasTag("burnt") then
        if not inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("idle_empty")
            inst.SoundEmitter:KillSound("snd")
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    end
end

local function ondoneboilingfn(inst)
    inst.AnimState:OverrideSymbol("swap", "portablekettle_meter_water", tostring(inst._waterlevel))
    inst.AnimState:PlayAnimation("cooking_pst")
    inst.AnimState:PlayAnimation("idle_empty")
    inst.SoundEmitter:KillSound("snd") 
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish")
end

local function onstartboilingfn(inst)
    inst.AnimState:PlayAnimation("cooking_loop", true)
    inst.SoundEmitter:KillSound("snd")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
    inst.Light:Enable(true)
end

local function OnTakeWater(inst)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    end
end

local function OnTaken(inst, source, delta)
    if not inst:HasTag("burnt") then
        inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
        inst.AnimState:PlayAnimation("getdrink_empty")
        inst.AnimState:PushAnimation("idle_empty", false)
        OnTakeWater(inst)
    end
end


local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst.components.distiller:GetTimeToBoil() > 15 and "PURIFY_LONG")
        or (inst.components.distiller:isBoiling() and inst.components.distiller:GetTimeToBoil() < 15 and "PURIFY_SHORT")
        or (inst.components.stewer:IsDone() and "DONE")
        or (inst.components.stewer:GetTimeToCook() > 15 and "BOILING_LONG")
        or (inst.components.stewer:IsCooking() and inst.components.stewer:GetTimeToCook() < 15 and "BOILING_SHORT")
        or (inst.components.waterlevel:GetWater() > 0 and "HASWATER")
        or "EMPTY"
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil then 
        if data.burnt then
            inst.components.burnable.onburnt(inst)
            inst.Light:Enable(false)
        end
    end
    inst.components.waterlevel:DoDiistiller(inst)
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
	inst:AddTag("kettle")
    inst:AddTag("stewer")

    inst.AnimState:SetBank("portablekettle")
    inst.AnimState:SetBuild("portablekettle")
    inst.AnimState:PlayAnimation("idle_empty")
	inst.AnimState:OverrideSymbol("swap", "portablekettle_meter_water", "0")

    inst:SetPrefabNameOverride("portablekettle_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetCanAccepts({WATERGROUP.BOILABLE})
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.maxwater = TUNING.KETTLE_MAX_LEVEL
    inst.components.waterlevel:SetSections(TUNING.KETTLE_MAX_LEVEL)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("stewer")
    inst.components.stewer.spoiledproduct = "spoiled_drink"
    inst.components.stewer.cooktimemult = TUNING.PORTABLE_COOK_POT_TIME_MULTIPLIER
    inst.components.stewer.onstartcooking = startcookfn
    inst.components.stewer.oncontinuecooking = continuecookfn
    inst.components.stewer.oncontinuedone = continuedonefn
    inst.components.stewer.ondonecooking = donecookfn
    --inst.components.stewer.onharvest = harvestfn
    inst.components.stewer.onspoil = spoilfn

    inst:AddComponent("distiller")
    inst.components.distiller.onstartboiling = onstartboilingfn
    inst.components.distiller.ondoneboiling = ondoneboilingfn

    inst:AddComponent("pickable")
    inst.components.pickable.canbepicked = false
    inst.components.pickable.product = (inst.components.stewer.product ~= nil and inst.components.stewer.product) or (inst.components.waterlevel:GetWater() ~= 0 and "water_clean") or nil
    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
    inst.components.pickable:SetOnPickedFn(harvestfn)

    inst:AddComponent("water")
    inst.components.water.available = false
    inst.components.water:SetOnTakenFn(OnTaken)

    inst:AddComponent("wateryprotection")
    inst.components.wateryprotection.extinguishheatpercent = TUNING.WATER_BARREL_EXTINGUISH_HEAT_PERCENT
    inst.components.wateryprotection.temperaturereduction = TUNING.WATER_BARREL_TEMP_REDUCTION
    inst.components.wateryprotection.witherprotectiontime = TUNING.WATER_BARREL_PROTECTION_TIME
    inst.components.wateryprotection.addwetness = 0 -- 물의 양에 따라 변형
    inst.components.wateryprotection.protection_dist = TUNING.WATER_BARREL_DIST

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("portablekettle")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst.components.container.skipclosesnd = true
    inst.components.container.skipopensnd = true

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