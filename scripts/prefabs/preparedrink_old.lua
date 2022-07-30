
local prefabs =
{
	"cup",
	"messagebottleempty",
    "gridplacer_farmablesoil",
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

local function OnUnwrapped(inst, pos, doer)
    local item = SpawnPrefab((inst:HasTag("spoiled") and "spoiled_food")or"wetgoop")
    local bowl = SpawnPrefab((inst:HasTag("preparedrink_bottle") and "messagebottleempty")or"cup")
    if inst:HasTag("preparedrink_bottle") then
        local value = inst.components.finiteuses:GetUses()
        for i=1, value do
            SpawnPrefab((inst:HasTag("spoiled") and "spoiled_food")or"wetgoop").Transform:SetPosition(pos:Get())
        end
        bowl.Transform:SetPosition(pos:Get())
    else
        item.Transform:SetPosition(pos:Get())
        bowl.Transform:SetPosition(pos:Get())
    end
    inst:Remove()
end

local function OnApplied(inst, final_use, doer, target)
    local x, y, z = inst.Transform:GetWorldPosition()
    local refund = nil

    if inst.components.finiteuses ~= nil then 
        if final_use then
            refund = SpawnPrefab("messagebottleempty")
        end
    else
        refund = SpawnPrefab("cup")
    end

    if refund ~= nil then
        if doer ~= nil and doer.components.inventory ~= nil then
            doer.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
        else
            refund.Transform:SetPosition(x,y,z)
        end
    end
end

local function OnTake(inst, taker)
    if inst.components.water.watervalue >= 15 then
        taker.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    elseif inst.components.water.watervalue >= 5 then
        taker.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    else
        taker.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    end
end

local function MakePreparedCupDrink(data)
    local name = data.name
    local prefabs = data.prefabs
    local overridebuild = data.overridebuild
    local basename = data.basename ~= nil and data.basename or data.name
    local spice = nil
    local oneaten = data.oneaten or function(inst, eater) end

	local drinkassets =
	{
		Asset("ANIM", "anim/kettle_drink.zip"),
	}

	if overridebuild then
        table.insert(drinkassets, Asset("ANIM", "anim/"..overridebuild..".zip"))
	end

    local function DisplayNameFn(inst)
        local displayname = basename == "water" and "cleanwater" or basename
        return subfmt( STRINGS.NAMES["CUP_ITEM"],{drink=STRINGS.NAMES[string.upper(displayname)]})
    end 

    local function DisplaySpiceNameFn(inst)
        return subfmt( STRINGS.NAMES["SPICE_CUP_ITEM"],{drink=STRINGS.NAMES[string.upper(basename)]})
    end

    local drinkprefabs = prefabs
    if prefabs ~= nil then
        drinkprefabs = shallowcopy(prefabs)
        for i, v in ipairs(prefabs) do
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
		inst.AnimState:SetBuild(overridebuild or "kettle_drink")
		inst.AnimState:SetBank("kettle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", overridebuild or "kettle_drink", "cup_"..basename or "cup_"..name)

        inst:AddTag("preparedrink_cup")
        inst:AddTag("preparedrink")
        inst:AddTag("preparedfood")
        inst:AddTag("drink")

        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end

        if not inst:HasTag("common") then
            inst:AddTag(name)
            inst:AddTag("show_spoiled")
            inst:AddTag("icebox_valid")
        end

        if inst:HasTag("lightdrink") then
            if name == "colaquantum" then
                inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
            end
            inst.entity:AddLight()
            inst.Light:SetFalloff(0.7)
            inst.Light:SetIntensity(.5)
            inst.Light:SetRadius(0.5)
            inst.Light:SetColour(169/255, 231/255, 245/255)
            inst.Light:Enable(true)
        end

        if basename ~= nil then
            inst:SetPrefabNameOverride(basename)
            if spice ~= nil then
                inst.displaynamefn = DisplaySpiceNameFn
            else
                inst.displaynamefn = DisplayNameFn
            end
        end

        if data.floater ~= nil then
            MakeInventoryFloatable(inst, data.floater[1], data.floater[2], data.floater[3])
        else
            MakeInventoryFloatable(inst)
        end

        if name == "spoiled" then
            MakeDeployableFertilizerPristine(inst)
        end

        if name == "spoiled" or name == "garbage" then
            inst:AddTag("unwrappable")
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

		inst.food_symbol_build = food_symbol_build or overridebuild

        if inst:HasTag("spoiled") or inst:HasTag("garbage") then
            inst:AddComponent("unwrappable")
            inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)
        end

        inst:AddComponent("edible")
        inst.components.edible.isdrink = true
        inst.components.edible.healthvalue = data.health
        inst.components.edible.hungervalue = data.hunger
        inst.components.edible.thirstvalue = data.thirst
        inst.components.edible.foodtype = data.foodtype or FOODTYPE.GOODIES
        inst.components.edible.secondaryfoodtype = data.secondaryfoodtype or nil
        inst.components.edible.sanityvalue = data.sanity or 0
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible:SetOnEatenFn(function(inst, eater)
            oneaten(inst, eater)
            RefundItem(eater, "cup")
        end)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        if inst:HasTag("common") then
            if inst:HasTag("purify") then
                inst:AddComponent("purify")
            end
            inst:AddTag("watercan")
        end

        inst:AddComponent("water")
        inst.components.water:SetWaterType(data.watertype or WATERTYPE.GENERIC)
        inst.components.water:SetOnTakenFn(OnTake)
        inst.components.water.returnprefab = "cup"

		inst:AddComponent("inventoryitem")
		inst.replica.inventoryitem:SetImage("cup_"..name)
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "cup_"..name

        if data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName("cup_"..data.basename)
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        if data.perishtime ~= nil and data.perishtime > 0 and not inst:HasTag("spoiled") then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime ~= nil and data.perishtime or nil)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "cup_spoiled"
        end

        if inst:HasTag("spoiled") then
            inst:AddComponent("fertilizer")
            inst.components.fertilizer.fertilizervalue = TUNING.SPOILEDFOOD_FERTILIZE
            inst.components.fertilizer.soil_cycles = TUNING.SPOILEDFOOD_SOILCYCLES
            inst.components.fertilizer.withered_cycles = TUNING.SPOILEDFOOD_WITHEREDCYCLES
            inst.components.fertilizer:SetNutrients(TUNING.SPOILED_FOOD_NUTRIENTS)
            inst.components.fertilizer.onappliedfn = OnApplied

            MakeDeployableFertilizer(inst)
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
    local check =  from_object.components.stewer ~= nil and from_object.components.stewer.product ~= nil and from_object.components.stewer.product ~= "saltrock" and from_object.components.stewer.product
                  or not from_object:HasTag("desalinator") and from_object.components.waterlevel ~= nil and (waterlevel == "CLEAN" and string.lower(waterlevel) or waterlevel == "SALTY" and string.lower(waterlevel) or waterlevel == "DIRTY" and string.lower(waterlevel))
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

    local name = data.name
    local prefabs = data.prefabs
    local overridebuild = data.overridebuild
    local basename = data.basename ~= nil and data.basename or data.name
    local spice = nil
    local oneaten = data.oneaten or function(inst, eater) end

	local drinkassets =
	{
		Asset("ANIM", "anim/kettle_bottle_drink.zip"),
	}

	if overridebuild then
        table.insert(drinkassets, Asset("ANIM", "anim/"..overridebuild..".zip"))
	end

    local function DisplayNameFn(inst)
        return subfmt( STRINGS.NAMES["BOTTLE_ITEM"],{drink=STRINGS.NAMES[string.upper(basename)]})
    end 

    local function DisplaySpiceNameFn(inst)
        return subfmt( STRINGS.NAMES["SPICE_BOTTLE_ITEM"],{drink=STRINGS.NAMES[string.upper(basename)]})
    end

    local drinkprefabs = prefabs
    if prefabs ~= nil then
        drinkprefabs = shallowcopy(prefabs)
        for i, v in ipairs(prefabs) do
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
		inst.AnimState:SetBuild(overridebuild or "kettle_bottle_drink")
		inst.AnimState:SetBank("kettle_bottle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", overridebuild or "kettle_bottle_drink", "bottle_"..basename or "bottle_"..name)

        inst:AddTag("preparedrink_bottle")
        inst:AddTag("preparedrink")
        inst:AddTag("preparedfood")
        inst:AddTag("drink")

        if data.tags ~= nil then
            for i,v in pairs(data.tags) do
                inst:AddTag(v)
            end
        end

        if inst:HasTag("lightdrink") then
            if name == "colaquantum" then
                inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
            end
            inst.entity:AddLight()
            inst.Light:SetFalloff(0.7)
            inst.Light:SetIntensity(.5)
            inst.Light:SetRadius(0.5)
            inst.Light:SetColour(169/255, 231/255, 245/255)
            inst.Light:Enable(true)
        end

        if not inst:HasTag("common") then
            inst:AddTag(name)
            inst:AddTag("show_spoiled")
            inst:AddTag("icebox_valid")
        end

        if basename ~= nil then
            inst:SetPrefabNameOverride(basename)
            if spice ~= nil then
                inst.displaynamefn = DisplaySpiceNameFn
            else
                inst.displaynamefn = DisplayNameFn
            end
        end

        if data.floater ~= nil then
            MakeInventoryFloatable(inst, data.floater[1], data.floater[2], data.floater[3])
        else
            MakeInventoryFloatable(inst)
        end

        if name == "spoiled" then
            MakeDeployableFertilizerPristine(inst)
        end

        if name == "spoiled" or name == "garbage" then
            inst:AddTag("unwrappable")
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

		inst.food_symbol_build = food_symbol_build or overridebuild

        inst:AddComponent("fillable")
        inst.components.fillable.overrideonfillfn = OnFill
        inst.components.fillable.showoceanaction = true
        inst.components.fillable.acceptsoceanwater = true

        if inst:HasTag("spoiled") or inst:HasTag("garbage") then
            inst:AddComponent("unwrappable")
            inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)
        end

        inst:AddComponent("edible")
        inst.components.edible.isdrink = true
        inst.components.edible.healthvalue = data.health
        inst.components.edible.hungervalue = data.hunger
        inst.components.edible.thirstvalue = data.thirst
        inst.components.edible.foodtype = data.foodtype or FOODTYPE.GOODIES
        inst.components.edible.secondaryfoodtype = data.secondaryfoodtype or nil
        inst.components.edible.sanityvalue = data.sanity or 0
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible:SetOnEatenFn(function(inst, eater)
            oneaten(inst, eater)
            RefundItem(eater, "messagebottleempty")
        end)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses(TUNING.BOTTLE_MAX_LEVEL)
        inst.components.finiteuses:SetUses(TUNING.BOTTLE_MAX_LEVEL)

        if inst:HasTag("common") then
            if inst:HasTag("purify") then
                inst:AddComponent("purify")
            end
            inst:AddTag("watercan")
        end

        inst:AddComponent("water")
        inst.components.water.watervalue = TUNING.BOTTLE_MAX_LEVEL
        --inst.components.water.watertype = WATERTYPE[string.upper( _name == "water" and "clean" or _name == "salt" and "salty" or _name )]
        inst.components.water:SetOnTakenFn(OnTake)
        inst.components.water.returnprefab = "messagebottleempty"

        inst:AddComponent("inventoryitem")
        inst.replica.inventoryitem:SetImage("bottle_"..name)
        inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
        inst.components.inventoryitem.imagename = "bottle_"..name

        if data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName("bottle_"..data.basename)
        end

        if data.perishtime ~= nil and data.perishtime > 0 and not inst:HasTag("spoiled") then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime ~= nil and data.perishtime+TUNING.PERISH_SUPERSLOW or nil)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "bottle_spoiled"
        end

        if inst:HasTag("spoiled") then
            inst:AddComponent("fertilizer")
            inst.components.fertilizer.fertilizervalue = TUNING.SPOILEDFOOD_FERTILIZE
            inst.components.fertilizer.soil_cycles = TUNING.SPOILEDFOOD_SOILCYCLES
            inst.components.fertilizer.withered_cycles = TUNING.SPOILEDFOOD_WITHEREDCYCLES
            inst.components.fertilizer:SetNutrients(TUNING.SPOILED_FOOD_NUTRIENTS)
            inst.components.fertilizer.onappliedfn = OnApplied

            MakeDeployableFertilizer(inst)
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