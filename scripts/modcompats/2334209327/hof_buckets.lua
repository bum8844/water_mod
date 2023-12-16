local _G = GLOBAL
local TECH = _G.TECH
local Ingredient = _G.Ingredient

local function ModAtlas()
  return "images/tea_inventoryitem.xml"
end

AddRecipePostInit("fertilizer",function(v) v.ingredients = {Ingredient("poop", 3), Ingredient("boneshard", 2), Ingredient("kyno_bucket_empty", 1, ModAtlas(), nil,"bucket_empty.tex")} end)
AddRecipePostInit("kyno_bucket_empty",function(v) v.ingredients = {Ingredient("log",4)} v.level = TECH.NONE end)

local function SetTemperature(inst)
    local isfrozen = inst.components.wateringtool:IsFrozen()

    local temp = isfrozen and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP
    local curtemp = inst.components.wateringtool:GetWater() ~= WATERTYPE.EMPTY and math.min(TheWorld.state.temperature, temp) or TheWorld.state.temperature

    inst.components.temperature.current = curtemp

    if isfrozen then
        inst.components.temperature.maxtemp = TUNING.WATER_INITTEMP
        inst.components.temperature.mintemp = TUNING.MIN_ENTITY_TEMP
    else
        inst.components.temperature.mintemp = TUNING.MAX_ENTITY_TEMP
        inst.components.temperature.mintemp = TUNING.WATER_FROZEN_INITTEMP
    end
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE
end

local function GetWater(inst, watertype, doer)
    local container = doer ~= nil and (doer.components.inventory or doer.components.container) or nil
    local water = SpawnPrefab(watertype)
    local old_val = inst.components.finiteuses:GetUses()
    local current_fin = old_val
    local peruse = TUNING.BUCKET_LEVEL_PER_USE
    local sound = inst.components.wateringtool:IsFrozen() and "dontstarve_DLC001/common/iceboulder_smash" or "dontstarve/creatures/pengull/splash"


    if current_fin > peruse then
        current_fin = peruse
    end
    --print(current_fin)

    if water.components.perishable then
        local perish = inst.components.wateringtool:GetPercent(true)
        water.components.perishable:SetPercent(perish)
    end
    water.Transform:SetPosition(inst.Transform:GetWorldPosition())
    water.components.stackable:SetStackSize(current_fin)
    
    if container ~= nil then
        container:GiveItem(water, nil, doer:GetPosition())
    else
        LaunchAt(water, doer, nil, 1, 1)
    end

    doer.SoundEmitter:PlaySound(sound)

    if old_val > peruse then
        inst.components.finiteuses:Use(peruse)
        inst.components.wateringtool:SetCanCollectRainWater(false)
        SetTemperature(inst)
    else
        inst:Remove()
    end
end

local function OnPickup(inst, doer)
    if doer then
        local watertype = inst.components.wateringtool:GetWater()
        local ice = inst.components.wateringtool:IsFrozen() and "_ice" or ""
        GetWater(inst, watertype..ice, doer)
    end
    inst.AnimState:PlayAnimation("empty")
end

local function CanGetWater(inst, doer)
    if inst.components.wateringtool:IsFull() then
        OnPickup(inst, doer)
    else
        if inst.components.wateringtool:IsTask() then
            inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        end
        inst.components.wateringtool:SetCanCollectRainWater(false)
    end
end

local function OnTakeWater(inst, source, doer)
    if source ~= nil and source.components.waterlevel ~= nil then
        local watervalue = math.min(TUNING.BUCKET_LEVEL_PER_USE, inst.components.finiteuses:GetUses())
        source.components.water:Taken(inst, watervalue)
    end
    inst.components.finiteuses:Use(inst.components.watertaker._laststack)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if inst.components.finiteuses.current <= 0 then
        inst:Remove()
    end
end

local function SetToFrozed(inst, data)
    if inst.components.wateringtool:GetWater() ~= WATERTYPE.EMPTY then
        local cur_temp = inst.components.temperature:GetCurrent()
        local min_temp = inst.components.temperature.mintemp
        local max_temp = inst.components.temperature.maxtemp
        if inst.components.wateringtool:IsFrozen() then
            if cur_temp >= max_temp then
                inst.components.wateringtool:SetFrozed(false)
                --print("녹음")
            end
        elseif cur_temp <= min_temp then
            inst.components.wateringtool:SetFrozed(true)
            --print("얼음")
        end
    end
end

local function SetState(inst)
    local isfrozen = inst.components.wateringtool:IsFrozen()
    local watertype = inst.components.wateringtool:GetWater()
    local wateranim = watertype ~= nil and ( watertype == WATERTYPE.CLEAN and "full" or "dirty" ) or "empty"
    local sound = wateranim ~= "empty" and ( wateranim == "full" and "dontstarve/creatures/pengull/splash" or "") or "dontstarve/common/dust_blowaway"

    if isfrozen then
        if inst.AnimState:IsCurrentAnimation("ice") then
            inst.AnimState:PlayAnimation("ice_dirty")
            return true
        end
        local frozenanim = watertype == WATERTYPE.CLEAN and "ice" or "ice_dirty"
        inst.AnimState:PlayAnimation("turn_to_"..frozenanim)
        inst.AnimState:PushAnimation(frozenanim)
        inst.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
        return true
    elseif inst.AnimState:IsCurrentAnimation("ice") or inst.AnimState:IsCurrentAnimation("ice_dirty") then
        local meltanim = watertype == WATERTYPE.CLEAN and "full" or "full_dirty"
        inst.AnimState:PlayAnimation("turn_to_"..meltanim)
        inst.AnimState:PushAnimation(wateranim)
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        return true
    end

    inst.AnimState:PlayAnimation(wateranim)
    if sound ~= "" then
        inst.SoundEmitter:PlaySound(sound)
    end
end

local function getstatus(inst)
    return inst.components.wateringtool:IsFull() and 
    (
        inst.components.wateringtool:IsFrozen() and
        ( 
            inst.components.wateringtool:IsDirty() and "DIRTY_ICE" or "FULL_ICE" 
        )
        or inst.components.wateringtool:IsDirty() and "DIRTY" or "FULL"
    )
    or "EMPTY"
end

AddPrefabPostInit("kyno_bucket_empty", function(inst)

    inst.AnimState:SetBuild("buckets")
    inst.AnimState:SetBank("buckets")
    inst.AnimState:PlayAnimation("empty")

    inst.pickupsound = "wood"

	inst:AddTag("watertaker")

	inst.entity:SetPristine()

	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("watertaker")
	inst.components.watertaker.capacity = TUNING.BUCKET_LEVEL_PER_USE
	inst.components.watertaker.onfillfn = OnTakeWater
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("milker")

    inst.components.finiteuses:SetMaxUses(TUNING.BUCKET_MAX_LEVEL)
    inst.components.finiteuses:SetUses(TUNING.BUCKET_MAX_LEVEL)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    
    inst:AddComponent("wateringtool")
    inst.components.wateringtool.setstatesfn = SetState
    inst.components.wateringtool.settemperaturefn = SetTemperature

    inst.components.inventoryitem:SetOnPickupFn(CanGetWater)

    inst:ListenForEvent("ondropped",SetCheckWeather)
    inst:ListenForEvent("temperaturedelta", SetToFrozed)
end)
