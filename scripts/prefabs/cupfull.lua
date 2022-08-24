local function OnEaten(inst, eater)
    local item = SpawnPrefab("cup")
    local stacksize = eater.components.eater.eatwholestack and inst.components.stackable:StackSize() or 1
    item.components.stackable:SetStackSize(stacksize)
    RefundItem(inst, "cup", true)
end

local function OnTake(inst, taker, delta)
    for i=1,math.clamp(math.floor(delta/TUNING.CUP_MAX_LEVEL), 1, inst.components.stackable:StackSize()) do
        RefundItem(inst, "cup")
    end
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

        inst:AddTag("pre-preparedfood")

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("edible")
        --inst.components.edible.foodtype = FOODTYPE.GOODIES
        inst.components.edible:SetOnEatenFn(OnEaten)

        inst:AddComponent("inspectable")

        inst:AddComponent("water")
        inst.components.water:SetWatervalue(TUNING.CUP_MAX_LEVEL)
        inst.components.water:SetOnTakenFn(OnTake)
        inst.components.returnprefab = "cup"

    	inst:AddComponent("inventoryitem")

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

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

        ------------------------------------------------

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

local function cleanwater(inst)
    inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.DRINK_CALORIES
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SMALLTINY

    inst.components.water.watertype = WATERTYPE.CLEAN
end

local function dirtywater(inst)
    inst.components.edible.healthvalue = -TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.DRINK_CALORIES
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SMALLTINY

    inst.components.water.watertype = WATERTYPE.DIRTY
end

local function saltwater(inst)
    inst.components.edible.healthvalue = TUNING.HEALING_SMALL
    inst.components.edible.hungervalue = TUNING.DRINK_CALORIES
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SALT

    inst.components.water.watertype = WATERTYPE.SALTY
end

return MakeCup("water_clean", cleanwater),
    MakeCup("water_dirty", dirtywater),
    MakeCup("water_salty", saltwater)
