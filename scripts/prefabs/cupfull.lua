--[[local function OnEaten(inst, eater)
    local item = SpawnPrefab("cup")
    local stacksize = eater.components.eater.eatwholestack and inst.components.stackable:StackSize() or 1
    item.components.stackable:SetStackSize(stacksize)
    RefundItem(inst, "cup", true)
end]]

local function OnTake(inst, taker, delta)
    local stacksize = math.clamp(math.floor(delta/TUNING.CUP_MAX_LEVEL), 1, inst.components.stackable:StackSize())

    if inst.components.stackable:IsStack() then
        inst.components.stackable:Get(stacksize):Remove()
    else
        inst:Remove()
    end
end

local function FreezeWater(inst)
    local water = inst:HasTag("dirty") and "_dirty" or ""
    if inst.components.stackable:StackSize() >= 5 then
        inst.AnimState:SetBuild("kettle_drink_bottle")
    end
    inst.AnimState:PlayAnimation("turn_to_ice"..water)
    local result = SpawnPrefab(inst:HasTag("clean") and "water_clean_ice" or "water_dirty_ice")
    inst:DoTaskInTime(2, function(inst) RefundItem(inst, result, nil, true) end)
end

local function onperish(inst)
    local result = SpawnPrefab(inst:HasTag("clean") and "water_clean" or "water_dirty")
    local owner = inst.components.inventoryitem.owner
    if owner == nil then
        local water = inst:HasTag("dirty") and "_dirty" or ""
        if inst.components.stackable:StackSize() >= 5 then
            inst.AnimState:SetBuild("kettle_drink_bottle")
        end
        inst.AnimState:PlayAnimation("turn_to_full"..water)
    end
    inst:DoTaskInTime(2, function(inst) RefundItem(inst, result, nil, true) end)
end

local function MakeCup(name, masterfn, tags)
    local assets =
    {
        Asset("ANIM", "anim/kettle_drink.zip"),
        Asset("ANIM", "anim/kettle_drink_bottle.zip"),
    }

    local prefabs =
    {
        "cup",
    }

    local function SetInitialTemperature(inst)
        inst.components.temperature.current = TheWorld.state.temperature > TUNING.BUCKET_FULL_INITTEMP and TUNING.BUCKET_FULL_INITTEMP or TheWorld.state.temperature
    end

    local function onfiremelt(inst)
        inst.components.perishable.frozenfiremult = true
    end

    local function onstopfiremelt(inst)
        inst.components.perishable.frozenfiremult = false
    end

    local function displayadjectivefn(inst)
        return nil
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("kettle_drink")
    	inst.AnimState:SetBuild("kettle_drink")
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", "kettle_drink", name)

        if tags ~= nil then
            for k, v in ipairs(tags) do
                inst:AddTag(v)
            end
        end

        if not inst:HasTag("frozen") then
            inst:AddTag("pre-preparedfood")
            inst:AddTag("drink")
        end

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        if not inst:HasTag("frozen") then
            inst:AddComponent("edible")
            inst.components.edible.foodtype = FOODTYPE.GOODIES
        else
            inst.displayadjectivefn = displayadjectivefn
            inst:AddTag("show_spoilage")

            inst:AddComponent("smotherer")

            inst:ListenForEvent("firemelt", onfiremelt)
            inst:ListenForEvent("stopfiremelt", onstopfiremelt)

            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(TUNING.PERISH_SUPERFAST)
            inst.components.perishable:StartPerishing()
            inst.components.perishable:SetOnPerishFn(onperish)
        end
        --inst.components.edible:SetOnEatenFn(OnEaten)
        if not inst:HasTag("frozen") and not inst:HasTag("salty") then
            inst:AddComponent("temperature")
            inst.components.temperature.mintemp = TUNING.BUCKET_FULL_MINTEMP
            inst.components.temperature.maxtemp = TUNING.BUCKET_FULL_MAXTEMP
            inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED
            inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED
            inst:DoTaskInTime(0, SetInitialTemperature)

            inst:ListenForEvent("startfreezing", FreezeWater)
        end

        inst:AddComponent("inspectable")

        inst:AddComponent("water")
        inst.components.water.watervalue = TUNING.CUP_MAX_LEVEL
        inst.components.water:SetOnTakenFn(OnTake)
        --inst.components.returnprefab = "cup"

        inst:AddComponent("watersource")
        inst.components.watersource.available = false

    	inst:AddComponent("inventoryitem")
        if inst:HasTag("frozen") then
            inst.components.inventoryitem:SetOnPickupFn(onstopfiremelt)
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM

        --It's weird for a cup/bottle of water to burn, isn't it?
        --MakeSmallBurnable(inst)
        --MakeSmallPropagator(inst)
        MakeHauntableLaunchAndPerish(inst)
        MakeDynamicCupImage(inst, "swap", "kettle_drink")

        if masterfn ~= nil then
            masterfn(inst)
        end

        ------------------------------------------------

        inst:AddComponent("tradable")
        if inst:HasTag("frozen") then
            inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.ANTLION
            inst.components.tradable.rocktribute = 1
        end

        ------------------------------------------------

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

local function cleanwater(inst)
    inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SMALLTINY

    inst.components.water:SetWaterType(WATERTYPE.CLEAN)

    inst.components.watersource.available = true
end

local function dirtywater(inst)
    inst.components.edible.healthvalue = -TUNING.HEALING_TINY
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SMALLTINY

    inst.components.water:SetWaterType(WATERTYPE.DIRTY)

    inst.components.watersource.available = true
end

local function saltwater(inst)
    inst.components.edible.healthvalue = -TUNING.HEALING_SMALL
    inst.components.edible.hungervalue = -TUNING.DRINK_CALORIES
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SALT

    inst.components.water:SetWaterType(WATERTYPE.SALTY)
end

local function cleanwater_ice(inst)
    --inst:AddComponent("workable")

    inst.components.water:SetWaterType(WATERTYPE.CLEAN_ICE)

    --inst.components.watersource.available = true
end

local function dirtywater_ice(inst)
    --inst:AddComponent("workable")

    inst.components.water:SetWaterType(WATERTYPE.DIRTY_ICE)

    --inst.components.watersource.available = true
end

return MakeCup("water_clean", cleanwater, {"icebox_valid","clean"}),
    MakeCup("water_dirty", dirtywater, {"icebox_valid","dirty"}),
    MakeCup("water_clean_ice", cleanwater_ice,{"icebox_valid","clean","frozen"}),
    MakeCup("water_dirty_ice", dirtywater_ice,{"icebox_valid","dirty","frozen"}),
    MakeCup("water_salty", saltwater,{"salty"})