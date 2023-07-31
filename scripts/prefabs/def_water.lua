local function Get_Waterborne_Disease(inst, eater)
    if TUNING.ENABLE_WATERBORNE and eater:HasTag("player") and not eater:HasTag("waterborne_immune") then
        eater:AddDebuff("waterbornedebuff", "waterbornedebuff")
    end
end

local function OnTake(inst, taker, delta)
    local stacksize = math.clamp(math.floor(delta/TUNING.CUP_MAX_LEVEL), 1, inst.components.stackable:StackSize())

    if inst.components.stackable:IsStack() then
        inst.components.stackable:Get(stacksize):Remove()
    else
        inst:Remove()
    end
end

local function Change_Dirty_Item(inst) 
    local isice = inst:HasTag("frozed") and "_ice" or ""
    local item = ReplacePrefab(inst, "water_dirty"..isice)
    if inst.components.stackable ~= nil and inst.components.stackable:IsStack() then
        item.components.stackable:SetStackSize(inst.components.stackable:StackSize())
    end
    return item
end

local function Change_Normal_Item(inst) 
    local item = ReplacePrefab(inst, inst:HasTag("clean") and "water_clean" or "water_dirty")
    if inst.components.stackable ~= nil and inst.components.stackable:IsStack() then
        item.components.stackable:SetStackSize(inst.components.stackable:StackSize())
    end
    return item
end

local function Change_Ice_Item(inst) 
    local item = ReplacePrefab(inst, inst:HasTag("clean") and "water_clean_ice" or "water_dirty_ice")
    if inst.components.stackable ~= nil and inst.components.stackable:IsStack() then
        item.components.stackable:SetStackSize(inst.components.stackable:StackSize())
    end
    return item
end

local function SetPerish(result, remainingtime)
    if remainingtime then
        result.components.perishable:SetPercent(remainingtime)
    end
end

local function FreezeWater(inst, value)
    inst.temperaturetask = nil
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local remainingtime = inst.components.perishable and inst.components.perishable:GetPercent() or nil

    if container ~= nil then
        local result = Change_Ice_Item(inst)
        result.components.temperature:SetTemperature(value)
        SetPerish(result, remainingtime)
        container:GiveItem(result)
    else
        local water = inst:HasTag("dirty") and "_dirty" or ""
        if inst.components.stackable:StackSize() >= 5 then
            inst.AnimState:SetBuild("kettle_drink_bottle")
        end
        inst.AnimState:PlayAnimation("turn_to_ice"..water)
        inst:DoTaskInTime(1,function()
            local result = Change_Ice_Item(inst)
            result.components.temperature:SetTemperature(value)
            SetPerish(result)
            result.Transform:SetPosition(inst.Transform:GetWorldPosition())
        end)
    end
end

local function MeltingWater(inst, value)
    inst.temperaturetask = nil
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local remainingtime = inst.components.perishable and inst.components.perishable:GetPercent() or nil

    if container ~= nil then
        local result = Change_Normal_Item(inst)
        result.components.temperature:SetTemperature(value)
        SetPerish(result, remainingtime)
        container:GiveItem(result)
    else
        local water = inst:HasTag("dirty") and "_dirty" or ""
        if inst.components.stackable:StackSize() >= 5 then
            inst.AnimState:SetBuild("kettle_drink_bottle")
        end
        inst.AnimState:PlayAnimation("turn_to_full"..water)
        inst:DoTaskInTime(1,function()
            local result = Change_Normal_Item(inst)
            result.components.temperature:SetTemperature(value)
            SetPerish(result, remainingtime)
            result.Transform:SetPosition(inst.Transform:GetWorldPosition())
        end)
    end
end

local function onperish(inst)
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil

    local result = Change_Dirty_Item(inst)
    if container ~= nil then
        container:GiveItem(result)
    else
        result.Transform:SetPosition(inst.Transform:GetWorldPosition())
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

    local function displayadjectivefn(inst)
        return nil
    end

    local function MakeDone(new_item, container, pos, owner, doer)
        if container ~= nil then
            container:GiveItem(new_item,nil,owner:GetPosition())
        else
            new_item.Physics:Teleport(pos:Get())
            new_item.components.inventoryitem:OnDropped(true, .5)
        end
        doer.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
    end

    local function MakeItem(inst, pos, item, perish, num, doer)
        local num_def = TUNING.STACK_SIZE_SMALLITEM
        local moisture = inst.components.inventoryitem:GetMoisture()
        local iswet = inst.components.inventoryitem:IsWet()
        local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
        local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil

        while num > 0 do
            if num > num_def then
                local new_item = SpawnPrefab(item)
                local 
                num = num - num_def

                new_item.components.perishable:SetPercent(perish)
                new_item.components.stackable:SetStackSize(num_def)
                new_item.components.inventoryitem:InheritMoisture(moisture, iswet)

                MakeDone(new_item, container, pos, owner, doer)
            else
                local new_item = SpawnPrefab(item)

                new_item.components.perishable:SetPercent(perish)
                new_item.components.stackable:SetStackSize(num)
                new_item.components.inventoryitem:InheritMoisture(moisture, iswet)
                num = 0

                MakeDone(new_item, container, pos, owner, doer)
            end
        end
    end 

    local function OnUnwrapped(inst, pos, doer)
        local item = inst:HasTag("dirty") and "wetgoop" or "ice"
        local perish = inst.components.perishable and inst.components.perishable:GetPercent() or 1
        local num = inst.components.stackable:StackSize()
        MakeItem(inst, pos, item, perish, num, doer)
        inst:Remove()
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

        if not inst:HasTag("frozed") then
            inst:AddTag("drink")
            inst:AddTag("def_water")
        end

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        if not inst:HasTag("frozed") then
            inst:AddComponent("edible")
            inst.components.edible.foodtype = FOODTYPE.GOODIES
        else
            inst:AddComponent("unwrappable")
            inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)
        end

        if not inst:HasTag("none_perishable") then
            local set_perish = TUNING.PERISH_FAST

            if inst:HasTag("frozed") then
                set_perish = TUNING.PERISH_SLOW
            end

            inst.displayadjectivefn = displayadjectivefn
            inst:AddTag("show_spoilage")

            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(set_perish)
            inst.components.perishable:StartPerishing()
            inst.components.perishable:SetOnPerishFn(onperish)
        end

        if not inst:HasTag("salty") then
            local SET_MAXTEMP = TUNING.WATER_CLEAN_MINTEMP
            local INITTEMP = TUNING.WATER_INITTEMP

            if inst:HasTag("dirty") then
                SET_MAXTEMP = TUNING.WATER_DIRTY_MINTEMP
            end

            if inst:HasTag("frozed") then
                INITTEMP = SET_MAXTEMP
            end

            inst:AddComponent("temperature")
            inst.components.temperature.mintemp = TUNING.WATER_MINTEMP
            inst.components.temperature.maxtemp = TUNING.WATER_MAXTEMP
            inst.components.temperature.current = INITTEMP
            inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
            inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE

            if inst.temperaturetask ~= nil then
                inst.temperaturetask:Cancel()
                inst.temperaturetask = nil
            end

            inst.temperaturetask = inst:DoPeriodicTask(1, function(inst)
                local cur_temp = inst.components.temperature:GetCurrent()
                if cur_temp < SET_MAXTEMP and not inst:HasTag("frozed") then
                    FreezeWater(inst, cur_temp)
                elseif cur_temp > SET_MAXTEMP and inst:HasTag("frozed") then
                    MeltingWater(inst, cur_temp)
                end
            end)
        end

        inst:AddComponent("smotherer")

        inst:AddComponent("inspectable")

        inst:AddComponent("water")
        inst.components.water.watervalue = TUNING.CUP_MAX_LEVEL
        inst.components.water:SetOnTakenFn(OnTake)

        inst:AddComponent("watersource")
        inst.components.watersource.available = false

    	inst:AddComponent("inventoryitem")

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
        if inst:HasTag("frozed") then
            inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.ANTLION
            inst.components.tradable.rocktribute = 1
        end

        ------------------------------------------------

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

local function cleanwater(inst)
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SMALLTINY
    inst.components.edible.degrades_with_spoilage = false

    inst.components.water:SetWaterType(WATERTYPE.CLEAN)

    inst.components.watersource.available = true
end

local function dirtywater(inst)
    inst.components.edible.healthvalue = -TUNING.HEALING_TINY
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = -TUNING.SANITY_MED
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SUPERTINY
    inst.components.edible.inst.components.edible:SetOnEatenFn(Get_Waterborne_Disease)

    inst.components.water:SetWaterType(WATERTYPE.DIRTY)

    inst.components.watersource.available = true
end

local function saltwater(inst)
    inst.components.edible.healthvalue = -TUNING.HEALING_TINY
    inst.components.edible.hungervalue = -TUNING.DRINK_CALORIES
    inst.components.edible.sanityvalue = -TUNING.SANITY_MEDLARGE
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SALT

    inst.components.water:SetWaterType(WATERTYPE.SALTY)
end

local function cleanwater_ice(inst)
    inst.components.water:SetWaterType(WATERTYPE.CLEAN_ICE)
end

local function dirtywater_ice(inst)
    inst.components.water:SetWaterType(WATERTYPE.DIRTY_ICE)
end

return MakeCup("water_clean", cleanwater, {"icebox_valid","clean","farm_water","pre-preparedfood","potion","def"}),
    MakeCup("water_dirty", dirtywater, {"icebox_valid","dirty","farm_water","none_perishable"}),
    MakeCup("water_clean_ice", cleanwater_ice,{"icebox_valid","clean","frozed","unwrappable"}),
    MakeCup("water_dirty_ice", dirtywater_ice,{"icebox_valid","dirty","frozed","unwrappable","none_perishable"}),
    MakeCup("water_salty", saltwater,{"salty","none_perishable"})