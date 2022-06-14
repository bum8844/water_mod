local KnownModIndex = _G.KnownModIndex

local function OnIgniteFn(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/blackpowder_fuse_LP", "hiss")
    DefaultBurnFn(inst)
end

local function OnExtinguishFn(inst)
    inst.SoundEmitter:KillSound("hiss")
    DefaultExtinguishFn(inst)
end

local function OnExplodeFn(inst)
    inst.SoundEmitter:KillSound("hiss")
    SpawnPrefab("explode_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local prefabs =
{
    "spoiled_food",
}

local function MakePreparedFood(data)

    local foodassets =
    {
        Asset("ANIM", "anim/cook_pot_food.zip"),
        Asset("ANIM", "anim/water_spice.zip"),
        Asset("ANIM", "anim/plate_food.zip"),
        Asset("INV_IMAGE", "spice_caffeinpepper_over"),
        Asset("INV_IMAGE", data.name),
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

    local function changeimage(inst)
        local bgname = GetInventoryItemAtlas(inst.inv_image_bg.image)
        if string.find(bgname,"cookbookimages") ~= nil then
            inst.inv_image_bg = nil
            inst.inv_image_bg = { atlas = "images/inventoryimages/"..(data.basename or data.name)..".xml", image = (data.basename or data.name)..".tex" }
        else
            inst.inv_image_bg.atlas = GetInventoryItemAtlas(inst.inv_image_bg.image)
        end
    end

    local function fn()

        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        if data.basename  == "dish_frenchsnailsbaked" or data.name == "dish_frenchsnailsbaked" then
            inst.entity:AddSoundEmitter()
        end

        MakeInventoryPhysics(inst)

        local food_symbol_build = nil

        inst.AnimState:SetBuild("plate_food")
        inst.AnimState:SetBank("plate_food")
        inst.AnimState:OverrideSymbol("swap_garnish", "water_spice", "spice_caffeinpepper")

        inst:AddTag("spicedfood")

        inst.inv_image_bg = { image = (data.basename or data.name)..".tex" }
        changeimage(inst)

        food_symbol_build = data.overridebuild or "cook_pot_food"

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap_food", data.overridebuild or "cook_pot_food", data.basename or data.name)

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

        if data.floater ~= nil then
            MakeInventoryFloatable(inst, data.floater[1], data.floater[2], data.floater[3])
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

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        if data.perishtime ~= nil and data.perishtime > 0 then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "spoiled_food"
        end

        if data.basename  == "dish_frenchsnailsbaked" or data.name == "dish_frenchsnailsbaked" then
            MakeSmallBurnable(inst, 3 + math.random() * 3)
            inst.components.burnable:SetOnBurntFn(nil)
            inst.components.burnable:SetOnIgniteFn(OnIgniteFn)
            inst.components.burnable:SetOnExtinguishFn(OnExtinguishFn)

            inst:AddComponent("explosive")
            inst.components.explosive:SetOnExplodeFn(OnExplodeFn)
            inst.components.explosive.explosivedamage = TUNING.SLURTLESLIME_EXPLODE_DAMAGE
            inst.components.explosive.buildingdamage = 1
            inst.components.explosive.lightonexplode = false
        else
            MakeSmallBurnable(inst)
        end

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

for k, v in pairs(require("water_spicedfoods")) do
    table.insert(prefs, MakePreparedFood(v))
    AddCookerRecipe("portablespicer", v)
end

return unpack(prefs)
