require "prefabutil"

local cooking = require("cooking")

local assets =
{
    Asset("ANIM", "anim/kettle_drink_bottle.zip"),
    Asset("ANIM", "anim/brewery.zip"),
	Asset("ANIM", "anim/brewery_meter_dirty.zip"),
	Asset("ANIM", "anim/brewery_meter_water.zip"),
    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
}

local prefabs =
{
	"collapse_small",
}

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

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
	if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    GetWet(inst)
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        if inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("hit_cooking")
            inst.AnimState:PushAnimation("cooking_loop", true)
        elseif inst.components.stewer:IsDone() then
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
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle_empty", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/lean_to_craft")
    inst:DoTaskInTime(1.2, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/stagehand/hit")end)
end

local function startcookfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.watersource.available = false
        inst.components.waterlevel.accepting = false
        inst.components.water.available = false
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot", "snd")
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
        inst.AnimState:OverrideSymbol("swap", "brewery_meter_dirty", tostring(inst._waterlevel))
        inst:DoTaskInTime(0,function(inst)
            SetProductSymbol(inst, inst.components.stewer.product)
        end)
    end
end

local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        if inst.components.stewer.product == "spoiled_drink" then
            inst.components.waterlevel.item_watertype = WATERTYPE.DIRTY
            inst.AnimState:OverrideSymbol("swap", "brewery_meter_dirty", tostring(inst._waterlevel))
        end
        inst.components.watersource.available = false
        inst.components.waterlevel.accepting = false
        inst.components.water.available = false
        inst:DoTaskInTime(0,function(inst)
            SetProductSymbol(inst, inst.components.stewer.product)
        end)
    end
end

local function donecookfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_pst")
        inst.AnimState:PushAnimation("idle_full")
        ShowProduct(inst)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/ocean_hit")
    end
end

local function continuedonefn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("idle_full",true)
        ShowProduct(inst)
    end
end

local function continuecookfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.watersource.available = false
        inst.components.waterlevel.accepting = false
        inst.components.water.available = false
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot", "snd")
    end
end

local function harvestfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("getdrink")
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
        inst.AnimState:PushAnimation("idle_empty",false)
        inst:DoTaskInTime(.35,function (inst)
            inst.SoundEmitter:PlaySound("saltydog/common/saltbox/close")
            inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
        end)
    end
end

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst.components.stewer:IsDone() and "DONE")
        or (not inst.components.stewer:IsCooking() and "EMPTY")
        or (inst.components.stewer:GetTimeToCook() > 15 and "FERMENTING_LONG")
        or "FERMENTING_SHORT"
end

local function onloadpostpass(inst, newents, data)
    if data and data.additems and inst.components.container then
        for i, itemname in ipairs(data.additems)do
            local ent = SpawnPrefab(itemname)
            inst.components.container:GiveItem( ent )
        end
    end
end

local function OnTakeWater(inst)
    if not inst:HasTag("burnt") then
        if inst.components.container ~= nil and inst.components.container:IsOpen() then
            inst.AnimState:PlayAnimation("take_water_open")
            inst.AnimState:PushAnimation("cooking_pre_loop")
        else
            inst.AnimState:PlayAnimation("take_water")
            inst.AnimState:PushAnimation("idle_empty", false)
            inst:DoTaskInTime(1,function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/wardrobe_close")
            end)
        end
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    end
end

local function OnTaken(inst, source, water_amount)
    if not inst:HasTag("burnt") then
        inst.components.waterlevel:DoDelta(-water_amount)
        if inst.components.container ~= nil and inst.components.container:IsOpen() then
            inst.AnimState:PlayAnimation("getdrink_open")
            inst.AnimState:PushAnimation("cooking_pre_loop")
        else
            inst.AnimState:PlayAnimation("getdrink_empty")
            inst.AnimState:PushAnimation("idle_empty", false)
        end
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    end
end

local function OnSectionChange(new, old, inst)
    local stewer = inst.components.stewer
    local product = (stewer and stewer.product == "spoiled_drink") and "dirty" or "water"
    if inst._waterlevel ~= new then
        inst._waterlevel = new
    end
    inst.AnimState:OverrideSymbol("swap", "brewery_meter_"..product, tostring(new))
end

local function onopen(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_pre_open")
        inst.AnimState:PushAnimation("cooking_pre_loop",false)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/wardrobe_open")
    end
end

local function onclose(inst)
    if not inst:HasTag("burnt") then
        if not inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("cooking_pre_close")
            inst.AnimState:PushAnimation("idle_empty",false)
            inst.SoundEmitter:KillSound("snd")
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/wardrobe_close")
    end
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
        end
    end
    inst.components.waterlevel:DoDiistiller(inst)
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("brewery.tex")
	
    MakeObstaclePhysics(inst, .4)
	
    inst.AnimState:SetBuild("brewery")
    inst.AnimState:SetBank("brewery")
    inst.AnimState:PlayAnimation("idle_empty")
	inst.AnimState:OverrideSymbol("swap","brewery_meter_water", "0")
    
	inst:AddTag("structure")
	inst:AddTag("brewery")
    inst:AddTag("drinkproduction")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetCanAccepts({WATERTYPE.CLEAN, WATERTYPE.EMPTY})
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.maxwater = TUNING.BREWERY_MAX_LEVEL
    inst.components.waterlevel:SetSections(TUNING.BREWERY_SECTIONS)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("water")
    inst.components.water.available = false
    inst.components.water:SetOnTakenFn(OnTaken)

    inst:AddComponent("watersource")
    inst.components.watersource.available = false

    inst:AddComponent("wateryprotection")
    inst.components.wateryprotection.extinguishheatpercent = TUNING.WATER_BARREL_EXTINGUISH_HEAT_PERCENT
    inst.components.wateryprotection.temperaturereduction = TUNING.WATER_BARREL_TEMP_REDUCTION
    inst.components.wateryprotection.witherprotectiontime = TUNING.WATER_BARREL_PROTECTION_TIME
    inst.components.wateryprotection.addwetness = 0 -- 물의 양에 따라 변형
    inst.components.wateryprotection.protection_dist = TUNING.WATER_BARREL_DIST

    inst:AddComponent("stewer")
    inst.components.stewer.spoiledproduct = "spoiled_drink"
	inst.components.stewer.onstartcooking = startcookfn
	inst.components.stewer.oncontinuecooking = continuecookfn
	inst.components.stewer.oncontinuedone = continuedonefn
	inst.components.stewer.ondonecooking = donecookfn
	inst.components.stewer.onharvest = harvestfn
	inst.components.stewer.onspoil = spoilfn

	inst:AddComponent("container")
	inst.components.container:WidgetSetup("kettle")
	inst.components.container.onopenfn = onopen
	inst.components.container.onclosefn = onclose
	inst.components.container.skipclosesnd = true
	inst.components.container.skipopensnd = true
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
	MakeLargeBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass
	
    return inst
end

return Prefab("brewery", fn, assets),
MakePlacer("brewery_placer", "brewery", "brewery", "idle_empty")