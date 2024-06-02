require "prefabutil"

local cooking = require("cooking")

local assets =
{
    Asset("ANIM", "anim/distillers.zip"),
}

local prefabs = {

}

local function onhammered(inst, worker)
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst, worker)
    if inst.components.brewing:IsCooking() then
        inst.AnimState:PlayAnimation("hit_cooking")
        inst.AnimState:PushAnimation("cooking_loop", true)
    elseif inst.components.brewing:IsDone() then
        inst.AnimState:PlayAnimation("hit_full")
        inst.AnimState:PushAnimation("idle_full")
    else
        if inst.components.container ~= nil and inst.components.container:IsOpen() then
            inst.components.container:Close()
        end
        inst.AnimState:PlayAnimation("hit_empty")
        inst.AnimState:PushAnimation("idle_empty", false)
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_empty", false)
    inst.SoundEmitter:PlaySound("rifts2/shadow_forge/place")
    inst:DoTaskInTime(1.2, function(inst) 
        inst.SoundEmitter:PlaySound("dontstarve/creatures/together/stagehand/hit")
        inst:DoTaskInTime(0.1, function(inst) 
            inst.SoundEmitter:PlaySound("dontstarve/creatures/together/stagehand/hit")
        end)
    end)
end

local function startcookfn(inst)
    if inst.components.container:IsOpen() then
        inst.AnimState:PlayAnimation("cooking_pre_close")
        inst.AnimState:PushAnimation("cooking_loop", true)
    else
        inst.AnimState:PlayAnimation("cooking_loop", true)
    end
    inst.SoundEmitter:KillSound("loopsound")
    inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/coldfire", "snda")
    inst.SoundEmitter:PlaySound("rifts3/oculus_ice_radius/ambient_lp", "sndb")
    inst.Light:Enable(true)
end

local function onopen(inst)
    inst.AnimState:PlayAnimation("cooking_pre_open")
    inst.AnimState:PushAnimation("cooking_pre_loop")
    inst.SoundEmitter:PlaySound("rifts2/shadow_forge/proximity_lp", "loopopen")
end

local function onclose(inst)
    inst.AnimState:PlayAnimation("cooking_pre_close")
    if not inst.components.brewing:IsCooking() then
        inst.AnimState:PushAnimation("idle_empty")
    else
        inst.AnimState:PushAnimation("cooking_loop", true)
    end
    inst.SoundEmitter:KillSound("loopopen")
    inst.SoundEmitter:PlaySound("rifts2/shadow_forge/proximity_pst")
end

local function IsModDrink(inst, product, overridebuild)
    local recipe = cooking.GetRecipe(inst.prefab, product)
    return recipe ~= nil and recipe.overridebuild
end

local function SetProductSymbol(inst, product, overridebuild)
    local distill_stack = inst.components.brewing.distill_stack*.25
    local recipe = cooking.GetRecipe(inst.prefab, product)
    local potlevel = recipe ~= nil and recipe.potlevel or nil
    local potlevel_bottle = recipe ~= nil and recipe.potlevel_bottle or nil
    local build = IsModDrink(inst, product, overridebuild) and overridebuild or IsModDrink(inst, product, overridebuild) and distill_stack >= 5 and overridebuild.."_bottle"
    or distill_stack >= 5 and "kettle_drink_bottle" or "kettle_drink"
    local overridesymbol = (recipe ~= nil and recipe.overridesymbolname) or (recipe.basename ~= nil and recipe.basename) or product
    local potlevels = potlevel ~= nil and "swap_"..potlevel or "swap_mid"
    local potlevels_bottle = potlevel_bottle ~= nil and "swap_"..potlevel_bottle.."_bottle" or "swap_mid_bottle"
    local result_potlevels = nil
    
    if distill_stack >= 5 then
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
    inst.components.brewing.product = inst.components.brewing.spoiledproduct
    SetProductSymbol(inst, inst.components.brewing.product)
end

local function ShowProduct(inst)
    local product = inst.components.brewing.product
    SetProductSymbol(inst, product, IsModCookingProduct(inst.prefab, product) and product or nil)
end

local function donecookfn(inst)
    inst.AnimState:PlayAnimation("cooking_pst")
    inst.AnimState:PushAnimation("idle_full", false)
    ShowProduct(inst)
    inst.SoundEmitter:PlaySound("rifts/forge/use")
    inst:DoTaskInTime(0.2,function(inst)
        inst.SoundEmitter:KillSound("snda")
        inst.SoundEmitter:KillSound("sndb")
    end)
    inst.Light:Enable(false)
end

local function continuedonefn(inst)
    inst.AnimState:PlayAnimation("idle_full")
    ShowProduct(inst)
end

local function continuecookfn(inst)
    inst.AnimState:PlayAnimation("cooking_loop", true)
    inst.Light:Enable(true)
    inst.SoundEmitter:KillSound("snda")
    inst.SoundEmitter:KillSound("sndb")
    inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/coldfire", "snda")
    inst.SoundEmitter:PlaySound("rifts3/oculus_ice_radius/ambient_lp", "sndb")
end

local function harvestfn(inst)
    inst.AnimState:PlayAnimation("getdrink")
    inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    inst.AnimState:PushAnimation("idle_empty",false)
end

local function getstatus(inst)
    return (inst.components.brewing:IsDone() and "DONE")
        or (not inst.components.brewing:IsCooking() and "EMPTY")
        or (inst.components.brewing:GetTimeToCook() > 15 and "DISTILLTING_LONG")
        or "DISTILLING_SHORT"
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst:SetPhysicsRadiusOverride(.5)
    MakeObstaclePhysics(inst, inst.physicsradiusoverride)

    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("distillers.tex")

    inst:AddTag("structure")
    inst:AddTag("distillers")
    inst:AddTag("brewing")

    inst.AnimState:SetBank("distillers")
    inst.AnimState:SetBuild("distillers")
    inst.AnimState:PlayAnimation("idle_empty")
    inst.scrapbook_anim = "idle_empty"

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("distill")

    inst:AddComponent("brewing")
    inst.components.brewing.usedistill = true
    inst.components.brewing.reduce = TUNING.REDUCE_DISTILL
    inst.components.brewing.onstartbrewing = startcookfn
    inst.components.brewing.oncontinuebrewing = continuecookfn
    inst.components.brewing.oncontinuedone = continuedonefn
    inst.components.brewing.ondonebrewing = donecookfn
    inst.components.brewing.onharvest = harvestfn
    inst.components.brewing.onspoil = spoilfn

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetCanAccepts({WATERGROUP.NONE_BOIL})
    inst.components.waterlevel:SetNoneBoil(true)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("distillers")
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

    inst:ListenForEvent("onbuilt", onbuilt)

    return inst
end

return Prefab("distillers", fn, assets, prefabs),
    MakePlacer("distillers_placer", "distillers", "distillers", "idle_empty")