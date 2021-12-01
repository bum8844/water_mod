
local prefabs =
{
    "spoiled_food",
	"cup",
	"messagebottleempty",
}

local function MakePrepareddrink(data)
	local drinkassets =
	{
		Asset("ANIM", "anim/kettle_drink.zip"),
		Asset("INV_IMAGE", data.name),
		Asset("ANIM", "anim/kettle_bottle_drink.zip"),
		Asset("INV_IMAGE", data.name),
	}

	if data.overridebuild then
        table.insert(drinkassets, Asset("ANIM", "anim/"..data.overridebuild..".zip"))
	end

    local drinkprefabs = prefabs
    if data.prefabs ~= nil then
        drinkprefabs = shallowcopy(prefabs)
        for i, v in ipairs(data.prefabs) do
            if not table.contains(drinkprefabs, v) then
                table.insert(drinkprefabs, v)
            end
        end
    end

    local function DisplayNameFn(inst)
        return subfmt(STRINGS.NAMES[string.upper(data.basename)])
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

		local drink_symbol_build = nil
		inst.AnimState:SetBuild(data.overridebuild or "kettle_drink")
		inst.AnimState:SetBank("kettle_drink")
			
        inst.AnimState:PlayAnimation("idle")
        
        inst:AddTag("prepareddrink")
        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end

        if data.basename ~= nil then
            inst:SetPrefabNameOverride(data.basename)
        end

        if data.floater ~= nil then
            MakeInventoryFloatable(inst, data.floater[1], data.floater[2], data.floater[3])
        else
            MakeInventoryFloatable(inst)
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

		inst.drink_symbol_build = drink_symbol_build or data.overridebuild

        inst:AddComponent("edible")
        inst.components.edible.healthvalue = data.health
        inst.components.edible.hungervalue = data.hunger
        inst.components.edible.drinktype = data.drinktype or drinkTYPE.GENERIC
        inst.components.edible.secondarydrinktype = data.secondarydrinktype or nil
        inst.components.edible.sanityvalue = data.sanity or 0
		inst.components.
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible:SetOnEatenFn(data.oneatenfn)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        inst:AddComponent("inventoryitem")

        if spicename ~= nil then
            inst.components.inventoryitem:ChangeImageName(spicename.."_over")
        elseif data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName(data.basename)
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        if data.perishtime ~= nil and data.perishtime > 0 then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "spoiled_drink"
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

    return Prefab(data.name, fn, drinkassets, drinkprefabs)
end

--local prefs = {}

--for k, v in pairs(require("preparedrinks")) do
    --table.insert(prefs, MakePrepareddrink(v))
--end

--return unpack(prefs)
