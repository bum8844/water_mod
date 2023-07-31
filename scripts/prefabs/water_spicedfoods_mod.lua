local KnownModIndex = _G.KnownModIndex

local prefabs =
{
    "spoiled_food",
}

local function MakePreparedFood(data)

    local bnamse = {}

    local foodassets =
    {
        Asset("ANIM", "anim/cook_pot_food.zip"),
        Asset("ANIM", "anim/water_spice.zip"),
        Asset("ANIM", "anim/plate_food.zip"),
        Asset("INV_IMAGE", "spice_caffeinpepper_over"),
        Asset("INV_IMAGE", data.basename),
    }

    if data.overridebuild then
        table.insert(foodassets, Asset("ANIM", "anim/"..data.overridebuild..".zip"))
    end

    local foodprefabs = prefabs
    if data.prefabs ~= nil then
        foodprefabs = shallowcopy(prefabs)
        for i, v in ipairs(data.prefabs) do
            if not table.contains(foodprefabs, v) then
                table.insert(foodprefabs, v)
            end
        end
    end

    local function DisplayNameFn(inst)
        return subfmt(STRINGS.NAMES["SPICE_CAFFEINPEPPER_FOOD"], { food = STRINGS.NAMES[string.upper(data.basename)] })
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        local food_symbol_build = nil

        inst.AnimState:SetBuild("plate_food")
        inst.AnimState:SetBank("plate_food")
        inst.AnimState:OverrideSymbol("swap_garnish", "water_spice", "spice_caffeinpepper")

        inst:AddTag("spicedfood")

        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end
        
        inst.inv_image_bg = { image = (data.basename or data.name)..".tex" }
        inst.inv_image_bg.atlas = GetInventoryItemAtlas(inst.inv_image_bg.image)
        if inst.inv_image_bg.atlas == "images/inventoryimages2.xml" then
            inst.inv_image_bg = { image = (data.basename or data.name)..".tex",
            atlas = "images/inventoryimages/"..(data.basename or data.name)..".xml"}
        elseif KnownModIndex:IsModEnabled("workshop-1505270912") or KnownModIndex:IsModForceEnabled("workshop-1505270912") then
            if inst:HasTag("volcanoinventory") then
                inst.inv_image_bg = { image = (data.basename or data.name)..".tex",
                atlas = "images/inventoryimages/volcanoinventory.xml"}
            elseif inst:HasTag("hamletinventory") then
                inst.inv_image_bg = { image = (data.basename or data.name)..".tex",
                atlas = "images/inventoryimages/hamletinventory.xml"}
            else
                inst.inv_image_bg = { image = (data.basename or data.name)..".tex",
                atlas = "images/inventoryimages/quagmirefoods.xml"}
                data.overridebuild = "preparedfood_gorge"
                table.insert(foodassets, Asset("ANIM", "anim/"..data.overridebuild..".zip"))
            end
        end

        food_symbol_build = data.overridebuild or "cook_pot_food"

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap_food", data.overridebuild or data.basename or data.name, data.basename or data.name)
        --[[if data.overridebuild == "preparedfood_gorge" then
            inst.AnimState:SetScale(2,2,2)
        end]]

        inst:AddTag("preparedfood")
        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end

        if data.basename ~= nil then
            inst:SetPrefabNameOverride(data.basename)
        end

        inst.displaynamefn = DisplayNameFn

        if data.float ~= nil then
            MakeInventoryFloatable(inst, data.float[2], data.float[3], data.float[4])
            if data.float[1] ~= nil then
                local OnLandedClient_old = inst.components.floater.OnLandedClient
                inst.components.floater.OnLandedClient = function(self)
                    OnLandedClient_old(self)
                    self.inst.AnimState:SetFloatParams(data.float[1], 1, self.bob_percent)
                end
            end
        else
            MakeInventoryFloatable(inst)
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.food_symbol_build = food_symbol_build or data.overridebuild

        inst:AddComponent("edible")
        inst.components.edible.healthvalue = data.health
        inst.components.edible.hungervalue = data.hunger
        inst.components.edible.foodtype = data.foodtype or FOODTYPE.GENERIC
        inst.components.edible.secondaryfoodtype = data.secondaryfoodtype or nil
        inst.components.edible.sanityvalue = data.sanity or 0
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible.spice = data.spice
        inst.components.edible:SetOnEatenFn(data.oneatenfn)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        inst:AddComponent("inventoryitem")
        inst.replica.inventoryitem:SetImage("spice_caffeinpepper_over")
        inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
        inst.components.inventoryitem.imagename = "spice_caffeinpepper_over"
        if data.float == nil then
            inst.components.inventoryitem:SetSinks(true)
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        if data.perishtime ~= nil and data.perishtime > 0 then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "spoiled_food"
        end

        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)
        MakeHauntableLaunchAndPerish(inst)
        ---------------------

        inst:AddComponent("bait")

        ------------------------------------------------
        inst:AddComponent("tradable")

        ------------------------------------------------

        return inst
    end

    return Prefab(data.name, fn, foodassets, foodprefabs)
end

local prefs = {}

for k, v in pairs(require("water_spicedfoods_mod")) do
    table.insert(prefs, MakePreparedFood(v))
end

return unpack(prefs)
