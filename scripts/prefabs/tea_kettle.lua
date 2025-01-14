require "prefabutil"

local cooking = require("cooking")

local assets =
{
    Asset("ANIM", "anim/tea_kettle.zip"),
	Asset("ANIM", "anim/teakettle_meter_dirty.zip"),
	Asset("ANIM", "anim/teakettle_meter_water.zip"),
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

local function onpercentusedchange(inst, data)
    inst.components.wateryprotection.addwetness = data.percent * TUNING.WATER_BARREL_WETNESS
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
    fx:SetMaterial("metal")
    GetWet(inst)
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        if inst.components.brewing:IsCooking() or inst.components.distiller:isBoiling() then
            inst.AnimState:PlayAnimation("hit_cooking")
            inst.AnimState:PushAnimation("cooking_loop", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        elseif inst.components.brewing:IsDone() then
            inst.AnimState:PlayAnimation("hit_full")
            inst.AnimState:PushAnimation("idle_full", false)
        else
            if inst.components.container ~= nil and inst.components.container:IsOpen() then
                inst.components.container:Close()
                --onclose will trigger sfx already
            else
                inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
            end
            inst.AnimState:PlayAnimation("hit_empty")
            inst.AnimState:PushAnimation("idle_empty", false)
        end
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle_empty", false)
	inst.SoundEmitter:PlaySound("dontstarve/common/cook_pot_craft")
end

local function startcookfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.water.available = false
        inst.components.waterlevel.accepting = false
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
    local build = IsModDrink(inst, product, overridebuild) and overridebuild or "kettle_drink"
    local overridesymbol = (recipe ~= nil and (recipe.basename ~= nil and recipe.basename or recipe.overridesymbolname)) or product
    local potlevels = potlevel ~= nil and "swap_"..potlevel or "swap_mid"
    local result_potlevels = nil
    
    result_potlevels = potlevels

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

    inst.AnimState:OverrideSymbol(result_potlevels, build, overridesymbol)
end

local function spoilfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.brewing.product = inst.components.brewing.spoiledproduct
        --inst.AnimState:OverrideSymbol("swap", "kettle_meter_dirty", tostring(inst._waterlevel))
        inst:DoTaskInTime(0,function(inst)
            SetProductSymbol(inst, inst.components.brewing.product)
        end)
    end
end

local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        inst.components.waterlevel.accepting = false
        inst.components.water.available = false
        inst:DoTaskInTime(0,function(inst)
            SetProductSymbol(inst, inst.components.brewing.product)
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

local function harvestfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PushAnimation("idle_empty",false)
        inst:DoTaskInTime(.75,function (inst)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
            inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
        end)
    end
end

local function onloadpostpass(inst, newents, data)
    if data and data.additems and inst.components.container then
        for i, itemname in ipairs(data.additems)do
            local ent = SpawnPrefab(itemname)
            inst.components.container:GiveItem( ent )
        end
    end
end

local function isgoodwater(inst)
    return inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN and inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN_ICE
end

local function OnSectionChange(new, old, inst)
    local watertype = (isgoodwater(inst) or inst.components.brewing.product == "spoiled_drink") and "dirty" or "water"
    if new ~= nil then
        if inst._waterlevel ~= new then
            inst._waterlevel = new
        end
    end
    --inst.AnimState:OverrideSymbol("swap", "kettle_meter_"..watertype, tostring(inst._waterlevel))
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
        if not inst.components.brewing:IsCooking() then
            inst.AnimState:PlayAnimation("idle_empty")
            inst.SoundEmitter:KillSound("snd")
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    end
end

local function ondoneboilingfn(inst)
    if not inst:HasTag("burnt") then
        --inst.AnimState:OverrideSymbol("swap", "kettle_meter_water", tostring(inst._waterlevel))
        inst.AnimState:PlayAnimation("cooking_pst")
        inst.AnimState:PlayAnimation("idle_empty")
        inst.SoundEmitter:KillSound("snd") 
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish")
        inst.Light:Enable(false)
    end
end

local function onstartboilingfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
        inst.Light:Enable(true)
    end
end

local function OnTakeWater(inst)
    if not inst:HasTag("burnt") then
        if inst.components.container ~= nil and inst.components.container:IsOpen() then
            inst.AnimState:PlayAnimation("take_water_open")
            if not inst.components.distiller:isDone() then
                inst.AnimState:PushAnimation("idle_empty", false)
                inst:DoTaskInTime(1,function(inst)
                inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
                   if not inst.components.distiller:isDone() then
                        onstartboilingfn(inst)
                    end
                end)
            else
                inst.AnimState:PushAnimation("cooking_pre_loop")
            end
        else
            inst.components.container.canbeopened = false
            inst.AnimState:PlayAnimation("take_water")
            inst.AnimState:PushAnimation("idle_empty", false)
            inst:DoTaskInTime(1,function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
                if not inst.components.distiller:isDone() then
                    onstartboilingfn(inst)
                else
                    inst.components.container.canbeopened = true
                end
            end)
        end
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    end
end

local function OnTaken(inst, source, delta)
    if not inst:HasTag("burnt") then
        if inst.components.container ~= nil and inst.components.container:IsOpen() then
            inst.AnimState:PushAnimation("cooking_pre_loop")
        else
            inst.components.container.canbeopened = false
            inst.AnimState:PushAnimation("idle_empty", false)
            inst:DoTaskInTime(.5,function(inst)
                inst.components.container.canbeopened = true
            end)
        end
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    end
end

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst.components.brewing:IsDone() and "DONE")
        or (inst.components.brewing:IsCooking() and ( inst.components.brewing:GetTimeToCook() > 15 and "BOILING_LONG" or "BOILING_SHORT"))
        or (inst.components.distiller:isBoiling() and ( 
                inst.components.distiller:GetTimeToBoil() > 15 and ( inst.components.waterlevel.watertype == WATERTYPE.CLEAN_ICE and "MELT_LONG" or "PURIFY_LONG" )
                or ( inst.components.waterlevel.watertype == WATERTYPE.CLEAN_ICE and "MELT_SHORT" or "PURIFY_SHORT" )
            ))
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
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddLight()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("tea_kettle.tex")
	
    MakeObstaclePhysics(inst, .1)

    inst.Light:Enable(false)
    inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(235/255,62/255,12/255)
	
    inst.AnimState:SetBuild("tea_kettle")
    inst.AnimState:SetBank("tea_kettle")
    inst.AnimState:PlayAnimation("idle_empty")
	--inst.AnimState:OverrideSymbol("swap", "tea_kettle_meter_water", "0")
    
	inst:AddTag("structure")
    inst:AddTag("tea_kettle")
    inst:AddTag("brewing")
    inst:AddTag("drinkproduction")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetCanAccepts({WATERGROUP.BOILABLE})
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.maxwater = TUNING.KETTLE_MAX_LEVEL
    --inst.components.waterlevel:SetSections(TUNING.KETTLE_MAX_LEVEL)
    --inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("brewing")
    inst.components.brewing.onstartbrewing = startcookfn
    inst.components.brewing.oncontinuebrewing = continuecookfn
    inst.components.brewing.oncontinuedone = continuedonefn
    inst.components.brewing.ondonebrewing = donecookfn
    inst.components.brewing.onharvest = harvestfn
    inst.components.brewing.onspoil = spoilfn

    inst:AddComponent("distiller")
    inst.components.distiller.onstartboiling = OnTakeWater
    inst.components.distiller.oncontinueboiling = onstartboilingfn
    inst.components.distiller.ondoneboiling = ondoneboilingfn

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
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass

    return inst
end

return Prefab("tea_kettle", fn, assets),
MakePlacer("tea_kettle_placer", "tea_kettle", "tea_kettle", "idle_empty")