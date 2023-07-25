local function OnTakeWater(inst, source, doer)
    inst.rainfilling = 0
    if source ~= nil and source.components.waterlevel ~= nil then
        local watervalue = TUNING.BUCKET_LEVEL_PER_USE
        if TUNING.BUCKET_LEVEL_PER_USE > inst.components.finiteuses:GetUses() then
            watervalue = inst.components.finiteuses:GetUses()
        end
        source.components.water:Taken(inst, watervalue)
    end
    inst.components.finiteuses:Use(inst.components.watertaker._laststack)
    if inst.components.finiteuses.current == 0 then
        inst:Remove()
        doer.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    else
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    end
end

--[[local function FillByRain(inst)
    local current_fin = inst.components.finiteuses:GetUses()
    local water = SpawnPrefab("water_clean")
    inst.rainfilling = 0
    if current_fin > TUNING.BUCKET_LEVEL_PER_USE then
        inst.components.finiteuses:Use(TUNING.BUCKET_LEVEL_PER_USE)
        water.components.stackable:SetStackSize(TUNING.BUCKET_LEVEL_PER_USE)
        water.Transform:SetPosition(inst.Transform:GetWorldPosition())
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    else
        water.components.stackable:SetStackSize(current_fin)
        water.Transform:SetPosition(inst.Transform:GetWorldPosition())
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        inst:Remove()
    end
end

local function WeatherCheck(inst)
    local owner = inst.components.inventoryitem.owner
    if GLOBAL.TheWorld.state.israining and owner == nil then
        inst.rainfilling = inst.rainfilling + TUNING.RAIN_GIVE_WATER
    elseif not GLOBAL.TheWorld.state.israining and inst.rainfilling > 0 then
        inst.rainfilling = inst.rainfilling - TUNING.LOST_WATER
    end
    if inst.rainfilling >= TUNING.BUCKET_LEVEL_PER_USE then
        FillByRain(inst)
    end
end]]

local function onremovewater(inst)
    if not GLOBAL.TheWorld.state.israining and inst.rainfilling ~= 0 then
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
        inst.rainfilling = 0
    end
end

local function onsave(inst, data)
    return { rainfilling = inst.rainfilling }
end

local function onload(inst, data)
    if data.rainfilling ~= nil then
        inst.rainfilling = data.rainfilling
    end
end

AddPrefabPostInit("kyno_bucket_empty", function(inst)

    inst.AnimState:SetBuild("buckets")
    inst.AnimState:SetBank("buckets")
    inst.AnimState:PlayAnimation("empty")

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
    inst:AddComponent("milker")

    inst.components.finiteuses:SetMaxUses(TUNING.BUCKET_MAX_LEVEL)
    inst.components.finiteuses:SetUses(TUNING.BUCKET_MAX_LEVEL)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    
    inst:AddComponent("wateringtool")
end)