
local prefabs =
{
    "spoiled_food",
	"cup",
	"messagebottleempty",
}

local function onsave(inst, data)
    if inst.components.pickable.numtoharvest > 0 then
        -- This isn't saved on the pickable component
        data.numtoharvest = inst.components.pickable.numtoharvest
    end
end

local function onload(inst, data)
	if data ~= nil then
		if data.numtoharvest ~= nil and data.numtoharvest > 0 then
			inst.components.pickable.numtoharvest = data.numtoharvest
			updatewellstate(inst)
		end
	end
end

local function onuseafter(inst, taker, refund)
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    if owner ~= nil then
        local container = owner.components.inventory or owner.components.container
        local item = container:RemoveItem(inst, false) or inst
        item:Remove()
        container:GiveItem(refund, nil, owner:GetPosition())
    else
        refund.Transform:SetPosition(inst.Transform:GetWorldPosition())
        local item =
            inst.components.stackable ~= nil and
            inst.components.stackable:IsStack() and
            inst.components.stackable:Get() or
            inst
        item:Remove()
    end
end

local function onusecup(inst, taker)

    local refund = nil
    refund = SpawnPrefab("cup")
    onuseafter(inst, taker, refund)
    
    return true
end

local function onusebottle(inst, taker)
    local max = taker.components.waterlevel.maxwater
    local current = taker.components.waterlevel.oldcurrentwater
    if max ~= current then
        max = max - current
    end
    local uses = inst.components.finiteuses:GetUses()
    uses = uses - max

    local refund = nil
    if uses > 0 then
        refund = SpawnPrefab(inst.prefab)
        refund.components.finiteuses:SetUses(uses)
        onuseafter(inst, taker, refund)
    else
        refund = SpawnPrefab("messagebottleempty")
        onuseafter(inst, taker, refund)
    end
    
    return true
end

local function MakePreparedCupDrink(data)
	local drinkassets =
	{
		Asset("ANIM", "anim/kettle_drink.zip"),
	}
	
	local _name = data.name
	local _prefabs = data.prefabs
	local _overridebuild = data.overridebuild
	local _basename = data.basename

	if _overridebuild then
        table.insert(drinkassets, Asset("ANIM", "anim/".._overridebuild..".zip"))
	end

    local drinkprefabs = prefabs
    if _prefabs ~= nil then
        drinkprefabs = shallowcopy(prefabs)
        for i, v in ipairs(_prefabs) do
            if not table.contains(drinkprefabs, v) then
                table.insert(drinkprefabs, v)
            end
        end
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

		local food_symbol_build = nil
		inst.AnimState:SetBuild(_overridebuild or "kettle_drink")
		inst.AnimState:SetBank("kettle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", _overridebuild or "kettle_drink", _basename or "cup_".._name)
		
        if _name == "water" then
            inst:AddTag("clean")
        else
            inst:AddTag(_name)
        end
		inst:AddTag("icebox_valid")
        inst:AddTag("preparedrink_cup")

        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end

        if _basename ~= nil then
            inst:SetPrefabNameOverride("cup_".._basename)
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

		inst.food_symbol_build = food_symbol_build or _overridebuild

        inst:AddComponent("edible")
        inst.components.edible.healthvalue = data.health
        inst.components.edible.hungervalue = data.hunger
        inst.components.edible.foodtype = data.foodtype or FOODTYPE.GENERIC
        inst.components.edible.secondaryfoodtype = data.secondaryfoodtype or nil
        inst.components.edible.sanityvalue = data.sanity or 0
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible:SetOnEatenFn(data.oneatenfn)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        if inst:HasTag("dirty") or inst:HasTag("salt") or inst:HasTag("clean") then
            inst:AddTag("watercan")

            inst:AddComponent("water")
            inst.components.water.watervalue = 1
            inst.components.water.watertype = WATERTYPE[string.upper( _name == "water" and "clean" or _name == "salt" and "salty" or _name )]
            inst.components.water:SetOnTakenFn(onusecup)
        end

		inst:AddComponent("inventoryitem")
		inst.replica.inventoryitem:SetImage("cup_".._name)
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "cup_".._name
		

		if data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName("cup_".._basename)
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

        ------------------------------------------------
        inst:AddComponent("tradable")

        ------------------------------------------------

        return inst
    end

    return Prefab("cup_"..data.name, fn, drinkassets, drinkprefabs)	
	end
	
local function MakePreparedBottleDrink(data)
	local drinkassets =
	{
		Asset("ANIM", "anim/kettle_bottle_drink.zip"),
	}
	
	local _name = data.name
	local _prefabs = data.prefabs
	local _overridebuild = data.overridebuild
	local _basename = data.basename

	if _overridebuild then
        table.insert(drinkassets, Asset("ANIM", "anim/".._overridebuild..".zip"))
	end

    local drinkprefabs = prefabs
    if _prefabs ~= nil then
        drinkprefabs = shallowcopy(prefabs)
        for i, v in ipairs(_prefabs) do
            if not table.contains(drinkprefabs, v) then
                table.insert(drinkprefabs, v)
            end
        end
    end
	
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

		local food_symbol_build = nil
		inst.AnimState:SetBuild(_overridebuild or "kettle_bottle_drink")
		inst.AnimState:SetBank("kettle_bottle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", _overridebuild or "kettle_bottle_drink", _basename or "bottle_".._name)
		
        if _name == "water" then
            inst:AddTag("clean")
        else
            inst:AddTag(_name)
        end
		inst:AddTag("icebox_valid")
        inst:AddTag("preparedrink_bottle")
        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end

        if _basename ~= nil then
            inst:SetPrefabNameOverride("bottle_".._basename)
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

		inst.food_symbol_build = food_symbol_build or _overridebuild
		inst._max_drink_level = 5
		inst._drink_level = 5

        inst:AddComponent("edible")
        inst.components.edible.healthvalue = data.health
        inst.components.edible.hungervalue = data.hunger
        inst.components.edible.foodtype = data.foodtype or FOODTYPE.GENERIC
        inst.components.edible.secondaryfoodtype = data.secondaryfoodtype or nil
        inst.components.edible.sanityvalue = data.sanity or 0
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible:SetOnEatenFn(data.oneatenfn)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses(5)
        inst.components.finiteuses:SetUses(5)
        inst.components.finiteuses:SetOnFinished(onusebottle)

        if inst:HasTag("dirty") or inst:HasTag("salt") or inst:HasTag("clean") then
            inst:AddTag("watercan")

            inst:AddComponent("water")
            inst.components.water.watervalue = 5
            inst.components.water.watertype = WATERTYPE[string.upper( _name == "water" and "clean" or _name == "salt" and "salty" or _name )]
            inst.components.water:SetOnTakenFn(onusebottle)
        end

		inst:AddComponent("inventoryitem")
		inst.replica.inventoryitem:SetImage("bottle_".._name)
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "bottle_".._name
		
		if data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName(data.basename)
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

        ------------------------------------------------
        inst:AddComponent("tradable")

        ------------------------------------------------

        return inst
    end
    return Prefab("bottle_"..data.name, fn, drinkassets, drinkprefabs)
	end

local prefs = {}

for k, v in pairs(require("preparedrink")) do
	table.insert(prefs, MakePreparedCupDrink(v))
	table.insert(prefs, MakePreparedBottleDrink(v))
end

for k, v in pairs(require("prepareagedrink")) do
	table.insert(prefs, MakePreparedCupDrink(v))
	table.insert(prefs, MakePreparedBottleDrink(v))
end

return unpack(prefs)