require "prefabutil"

local cooking = require("cooking")

local assets =
{
    Asset("ANIM", "anim/kettle.zip"),
    Asset("ANIM", "anim/kettle_drink.zip"),
	Asset("ANIM", "anim/kettle_meter_dirty.zip"),
	Asset("ANIM", "anim/kettle_meter_water.zip"),
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
        inst.components.waterlevel.watertype = nil
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
        inst.Light:Enable(true)
    end
end

local function SetProductSymbol(inst, product, overridebuild)
    local recipe = cooking.GetRecipe(inst.prefab, product)
    local potlevel = recipe ~= nil and recipe.potlevel or nil
    local build = (recipe ~= nil and recipe.overridebuild) or overridebuild or "kettle_drink"
    local overridesymbol = (recipe ~= nil and recipe.overridesymbolname) or (recipe.basename ~= nil and recipe.basename) or product
    local potlevels = potlevel ~= nil and "swap_"..potlevel or "swap_mid"

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

    inst.AnimState:OverrideSymbol(potlevels, build, overridesymbol)
end

local function HaveProduct(inst)
    inst.components.waterlevel.accepting = false
    inst.components.water.available = false
    inst.components.pickable.product = inst.components.stewer.product
    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
    inst.components.pickable.canbepicked = true
end

local function waterlevelchk(inst)
    if inst.components.stewer.product == nil then
        if inst.components.waterlevel:IsFull() then
            inst.components.waterlevel.accepting = false
        else
            inst.components.waterlevel.accepting = true
        end
        if inst.components.waterlevel:IsEmpty() == 0 then
            inst.components.water.available = false
            print("실패")
        else
            inst.components.water.available = true
            print("성공")
        end
    else
        HaveProduct(inst)
    end
end

local function spoilfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.stewer.product = inst.components.stewer.spoiledproduct
        inst.AnimState:OverrideSymbol("swap", "kettle_meter_dirty", tostring(inst._waterlevel))
        SetProductSymbol(inst, inst.components.stewer.product)
        waterlevelchk(inst)
    end
end

local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        SetProductSymbol(inst, inst.components.stewer.product)
        waterlevelchk(inst)
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
        inst.components.water.available = true
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
        inst.components.stewer.product = nil
        inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
        inst.AnimState:PlayAnimation("idle_empty")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        waterlevelchk(inst)
        inst.components.stewer:Harvest()
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

local function OnSectionChange(new, old, inst)
    local watertype = inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN and "dirty" or "water"
    if new ~= nil then
        if inst._waterlevel ~= new then
            inst._waterlevel = new
        end
    end
    inst.AnimState:OverrideSymbol("swap", "kettle_meter_"..watertype, tostring(inst._waterlevel))
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

local function ondoneboil(inst)
    inst:RemoveTag("boiling")
    waterlevelchk(inst)
    inst.components.container.canbeopened = true
    inst.components.waterlevel.watertype = WATERTYPE.CLEAN
    inst.AnimState:OverrideSymbol("swap", "kettle_meter_water", tostring(inst._waterlevel))
    inst.AnimState:PlayAnimation("cooking_pst")
    inst.AnimState:PlayAnimation("idle_empty")
    inst.SoundEmitter:KillSound("snd") 
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish")
    inst._timer = 0
end

local function boil(inst)
    inst:AddTag("boiling")
    inst.components.container.canbeopened = false
    inst.components.waterlevel.accepting = false
    inst.AnimState:PlayAnimation("cooking_loop", true)
    inst.SoundEmitter:KillSound("snd")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
    inst.Light:Enable(true)
    inst:DoTaskInTime(inst._timer, ondoneboil, inst)
end

local function OnTakeWater(inst)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
        if inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN then
            inst._timer = TUNING.BASE_COOK_TIME * TUNING.KETTLE_WATER * inst.components.waterlevel:GetPercent()
            inst.components.container:Close()
            inst.components.container:DropEverything()
            boil(inst)
        else
            waterlevelchk(inst)
        end
    end
end

local function dospoil(inst, self)
    self.task = nil
    self.targettime = nil
    self.spoiltime = nil

    if self.onspoil ~= nil then
        self.onspoil(inst)
    end
end

local function OnTaken(inst, source, delta)
    waterlevelchk(inst)
    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
end

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst.components.stewer:IsDone() and "DONE")
        or (inst:HasTag("boiling") and "PURIFY")
        or (inst.components.water.available and "HASWATER")
        or (not inst.components.stewer:IsCooking() and "EMPTY")
        or (inst.components.stewer:GetTimeToCook() > 15 and "BOILING_LONG")
        or "BOILING_SHORT"
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
    if inst._timer ~= 0 then
        data.timer = inst._timer
    end
end

local function onload(inst, data)
    if data ~= nil then 
        if data.burnt then
            inst.components.burnable.onburnt(inst)
            inst.Light:Enable(false)
        end
        if data.timer ~= nil then
            inst._timer = data.timer
            boil(inst)
        end
    end
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
	minimap:SetIcon("kettle.tex")
	
    MakeObstaclePhysics(inst, .1)
	
    inst.AnimState:SetBuild("kettle")
    inst.AnimState:SetBank("kettle")
    inst.AnimState:PlayAnimation("idle_empty")
	inst.AnimState:OverrideSymbol("swap", "kettle_meter_water", "0")
    
	inst:AddTag("structure")
    inst:AddTag("kettle")
    inst:AddTag("stewer")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst._timer = 0
    inst._waterlevel = 0

    inst:AddComponent("waterlevel")
    inst.components.waterlevel.SetCanAccepts(WATERGROUP.BOILABLE)
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.maxwater = TUNING.KETTLE_MAX_LEVEL
    inst.components.waterlevel.accepting = true
    inst.components.waterlevel:SetSections(TUNING.KETTLE_MAX_LEVEL)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("water")
    inst.components.water.available = false
    inst.components.water:SetOnTakenFn(OnTaken)

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
	--inst.components.stewer.onharvest = harvestfn
	inst.components.stewer.onspoil = spoilfn

    inst:AddComponent("pickable")
    inst.components.pickable.canbepicked = false
    inst.components.pickable.product = (inst.components.stewer.product ~= nil and inst.components.stewer.product) or (inst.components.waterlevel:GetWater() ~= 0 and "water_clean") or nil
    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
    inst.components.pickable:SetOnPickedFn(harvestfn)

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
    inst:ListenForEvent("onwaterlevelsectionchanged", waterlevelchk)
	
	MakeHauntableWork(inst)
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass

    return inst
end

return Prefab("kettle", fn, assets),
MakePlacer("kettle_placer", "kettle", "kettle", "idle_empty")