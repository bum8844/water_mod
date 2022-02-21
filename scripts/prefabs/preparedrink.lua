
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
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

		local food_symbol_build = nil
		inst.AnimState:SetBuild(_overridebuild or "kettle_drink")
		inst.AnimState:SetBank("kettle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", _overridebuild or "kettle_drink", _basename or "cup_".._name)
		
        if _name == "glowberrywine" or _name == "colaquantum" then
            inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

            inst.entity:AddLight()

            inst.Light:SetFalloff(0.7)
            inst.Light:SetIntensity(.5)
            inst.Light:SetRadius(0.5)
            inst.Light:SetColour(169/255, 231/255, 245/255)
            inst.Light:Enable(true)
        end

        if _name == "water" then
            inst:AddTag("clean")
        elseif _name == "salt" then
            inst:AddTag("salty")
        else
            inst:AddTag(_name)
        end
		inst:AddTag("icebox_valid")
        inst:AddTag("preparedrink_cup")
        inst:AddTag("drink")

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

        if inst:HasTag("dirty") or inst:HasTag("salty") or inst:HasTag("clean") then
            inst:AddTag("watercan")

            inst:AddComponent("water")
            inst.components.water.watervalue = TUNING.CUP_MAX_LEVEL
            inst.components.water.watertype = WATERTYPE[string.upper( _name == "water" and "clean" or _name == "salt" and "salty" or _name )]
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
            inst.components.perishable:SetPerishTime(data.perishtime ~= nil and data.perishtime or nil)
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

local function OnFill(inst, from_object)
    local watering = false
    local waterlevel = from_object.components.waterlevel ~= nil and from_object.components.waterlevel.watertype
    local water = from_object.components.water ~= nil and from_object.components.water.watertype
    local check =  from_object.components.stewer ~= nil and from_object.components.stewer.product 
                  or from_object.components.waterlevel ~= nil and (waterlevel == "CLEAN" and string.lower(waterlevel) or waterlevel == "SALTY" and string.lower(waterlevel) or waterlevel == "DIRTY" and string.lower(waterlevel))
                  or from_object.components.water ~= nil and (water == "CLEAN" and string.lower(water) or water == "SALTY" and string.lower(water) or water == "DIRTY" and string.lower(waterlevel))
                  or not from_object:HasTag("cleanwater") and "dirty"
                  or from_object:HasTag("cleanwater") and "clean"
                  or from_object == nil and "salty"
                  or nil
    if check ~= nil and inst:HasTag(check) then
        if from_object.components.waterlevel ~= nil and inst.components.finiteuses:GetUses() ~= inst.components.finiteuses.total then
            local currentwater = inst.components.finiteuses:GetUses()
            local currentwater_old = inst.components.finiteuses:GetUses()
            local maxwater = inst.components.finiteuses.total
            local currentwaterlevel = from_object.components.waterlevel.currentwater
            currentwater = currentwater + currentwaterlevel
            if currentwater > maxwater then
                currentwaterlevel = TUNING.BOTTLE_MAX_LEVEL - currentwater_old
                currentwater = TUNING.BOTTLE_MAX_LEVEL
            end

            from_object.components.waterlevel:DoDelta(-currentwaterlevel)
            inst.components.finiteuses:SetUses(currentwater)
            watering = true
            print(from_object.components.waterlevel.currentwater)
            print(inst.components.finiteuses:GetUses())
        end
        if from_object.components.finiteuses ~= nil and inst.components.finiteuses:GetUses() ~= inst.components.finiteuses.total then
            local currentwater = inst.components.finiteuses:GetUses()
            local maxwater = inst.components.finiteuses.total
            if currentwater ~= maxwater then
                local uses = from_object.components.finiteuses:GetUses()
                currentwater = currentwater + uses
                if currentwater > maxwater then
                    uses = currentwater - maxwater
                    currentwater = inst.components.water.watervalue
                else
                    uses = 0
                end
                from_object.components.finiteuses:SetUses(uses)
                inst.components.finiteuses:SetUses(currentwater)
                watering = true
            end
        end
        if from_object.components.stewer ~= nil then
            if from_object.components.waterlevel.currentwater == 0 then
                from_object.components.stewer.product = nil
                from_object.components.stewer:Harvest()
                watering = true
            end
        end
    end
    if watering then
        if from_object ~= nil then
            from_object.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
        else
            inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
        end
        inst:PushEvent("givewater",{inst = inst, from_object = from_object})
        return true
    else
        return false
    end
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
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

		local food_symbol_build = nil
		inst.AnimState:SetBuild(_overridebuild or "kettle_bottle_drink")
		inst.AnimState:SetBank("kettle_bottle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", _overridebuild or "kettle_bottle_drink", _basename or "bottle_".._name)
		
        if _name == "glowberrywine" then
            inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

            inst.entity:AddLight()

            inst.Light:SetFalloff(0.7)
            inst.Light:SetIntensity(.5)
            inst.Light:SetRadius(0.5)
            inst.Light:SetColour(169/255, 231/255, 245/255)
            inst.Light:Enable(true)

        end

        if _name == "water" then
            inst:AddTag("clean")
        elseif _name == "salt" then
            inst:AddTag("salty")
        else
            inst:AddTag(_name)
        end
		inst:AddTag("icebox_valid")
        inst:AddTag("preparedrink_bottle")
        inst:AddTag("drink")
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

        inst:AddComponent("fillable")
        inst.components.fillable.overrideonfillfn = OnFill
        inst.components.fillable.showoceanaction = true
        inst.components.fillable.acceptsoceanwater = true

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
        inst.components.finiteuses:SetMaxUses(TUNING.BOTTLE_MAX_LEVEL)
        inst.components.finiteuses:SetUses(TUNING.BOTTLE_MAX_LEVEL)

        if inst:HasTag("dirty") or inst:HasTag("salty") or inst:HasTag("clean") then
            inst:AddTag("watercan")

            inst:AddComponent("water")
            inst.components.water.watervalue = TUNING.BOTTLE_MAX_LEVEL
            inst.components.water.watertype = WATERTYPE[string.upper( _name == "water" and "clean" or _name == "salt" and "salty" or _name )]
        end

		inst:AddComponent("inventoryitem")
		inst.replica.inventoryitem:SetImage("bottle_".._name)
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "bottle_".._name
		
		if data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName(data.basename)
        end

        if data.perishtime ~= nil and data.perishtime > 0 then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime ~= nil and data.perishtime+TUNING.PERISH_SUPERSLOW or nil)
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