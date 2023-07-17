local prefabs =
{
    "spoiled_drink",
}
local spoiled_drink_prefabs = 
{
    "gridplacer_farmablesoil",
}

--[[local function OnEaten(inst, eater)
    local item = SpawnPrefab("cup")
    local stacksize = eater.components.eater.eatwholestack and inst.components.stackable:StackSize() or 1
    item.components.stackable:SetStackSize(stacksize)
    RefundItem(inst, "cup", true)
end]]

local FERTILIZER_DEFS = require("prefabs/fertilizer_nutrient_defs").FERTILIZER_DEFS

local function MakePreparedDrink(data)
	local oneatenfn = data.oneatenfn or function(inst, eater) end

	local drinkassets =
	{
		Asset("ANIM", "anim/kettle_drink.zip"),
        Asset("SCRIPT", "scripts/prefabs/fertilizer_nutrient_defs.lua"),
	}

    local drinkprefabs

    if data.name ~= "spoiled_drink" then
        local drinkprefabs = spoiled_drink_prefabs
    else
        local drinkprefabs = prefabs
    end
    if data.prefabs ~= nil then
        drinkprefabs = shallowcopy(prefabs)
        for k, v in ipairs(data.prefabs) do
            if not table.contains(drinkprefabs, v) then
                table.insert(drinkprefabs, v)
            end
        end
    end


	if data.overridebuild then
		table.insert(drinkassets, Asset("ANIM", "anim/"..data.overridebuild))
	end

    local function OnStackSizeChanged(inst, data)
        if data ~= nil then
            if not inst:HasTag("spoiled_drink") then
                if inst.components.perishable ~= nil and data.stacksize >= 20 then
                    inst.components.perishable:SetLocalMultiplier(0.5)
                else
                    inst.components.perishable:SetLocalMultiplier(1)
                end
            end
        end
    end

    local function GetFertilizerKey(inst)
        return inst.prefab
    end

    local function fertilizerresearchfn(inst)
        return inst:GetFertilizerKey()
    end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

		local food_symbol_build = nil
		inst.AnimState:SetBuild("kettle_drink")
		inst.AnimState:SetBank("kettle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", data.overridebuild or "kettle_drink", data.basename or data.name)

        inst:AddTag("drink")
        inst:AddTag("preparedfood")

        if data.name == "spoiled_drink" then
            inst:AddTag("spoiled_drink")
        else
            inst:AddTag("prepareddrink")
        end

        if data.tags ~=nil then
        	for i,v in pairs(data.tags) do
        		inst:AddTag(v)
        	end
        end

        if not inst:HasTag("common") then
        	inst:AddTag("show_spoiled")
        	inst:AddTag("icebox_valid")
        end

        if inst:HasTag("lightdrink") then
            if data.name == "colaquantum" then
                inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")
            end
            inst.entity:AddLight()
            inst.Light:SetFalloff(0.7)
            inst.Light:SetIntensity(.5)
            inst.Light:SetRadius(0.5)
            inst.Light:SetColour(169/255, 231/255, 245/255)
            inst.Light:Enable(true)
        end

        if data.floater ~= nil then
            MakeInventoryFloatable(inst, data.floater[1], data.floater[2], data.floater[3])
        else
            MakeInventoryFloatable(inst)
        end

        if data.name == "spoiled_drink" then
            inst:AddTag("heal_fertilize")

            MakeDeployableFertilizerPristine(inst)

            inst:AddTag("fertilizerresearchable")

            inst.GetFertilizerKey = GetFertilizerKey
        end
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

		--inst.food_symbol_build = food_symbol_build or overridebuild

        inst:AddComponent("edible")
        inst.components.edible.isdrink = true
        inst.components.edible.healthvalue = data.health
        inst.components.edible.hungervalue = data.hunger
        inst.components.edible.thirstvalue = data.thirst
        inst.components.edible.foodtype = data.foodtype or FOODTYPE.GOODIES
        inst.components.edible.secondaryfoodtype = data.secondaryfoodtype or FOODTYPE.GENERIC
        inst.components.edible.sanityvalue = data.sanity or 0
        inst.components.edible.temperaturedelta = data.temperature or 0
        inst.components.edible.temperatureduration = data.temperatureduration or 0
        inst.components.edible.nochill = data.nochill or nil
        inst.components.edible:SetOnEatenFn(function(inst, eater)
            oneatenfn(inst, eater)
            --OnEaten(inst, eater)
        end)

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        --[[inst:AddComponent("water")
        inst.components.water:SetWaterType(data.watertype or WATERTYPE.GENERIC)
        inst.components.water:SetOnTakenFn(OnTake)
        inst.components.water.returnprefab = "cup"]]

		inst:AddComponent("inventoryitem")

        if data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName(data.basename)
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM

        if data.perishtime ~= nil and data.perishtime > 0 then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "spoiled_drink"
        end

        if data.name == "spoiled_drink" then
            inst:AddComponent("fertilizerresearchable")
            inst.components.fertilizerresearchable:SetResearchFn(fertilizerresearchfn)

            inst:AddComponent("fertilizer")
            inst.components.fertilizer.fertilizervalue = TUNING.SPOILEDFOOD_FERTILIZE
            inst.components.fertilizer.soil_cycles = TUNING.SPOILEDFOOD_SOILCYCLES
            inst.components.fertilizer.withered_cycles = TUNING.SPOILEDFOOD_WITHEREDCYCLES
            inst.components.fertilizer:SetNutrients(FERTILIZER_DEFS.spoiled_drink.nutrients)

            inst:AddComponent("smotherer")
            
            MakeDeployableFertilizer(inst)

            inst:AddComponent("selfstacker")
        end

        MakeDynamicCupImage(inst, "swap", "kettle_drink")
        MakeHauntableLaunchAndPerish(inst)

        ------------------------------------------------

        inst:AddComponent("bait")

        inst:AddComponent("tradable")

        ------------------------------------------------

        inst:ListenForEvent("stacksizechange", OnStackSizeChanged)

        return inst
    end

    return Prefab(data.name, fn, drinkassets, drinkprefabs)	
end

local prefs = {}

for k, v in pairs(require("prepareddrinks")) do
    table.insert(prefs, MakePreparedDrink(v))
end

for k, v in pairs(require("preparedageddrinks")) do
    table.insert(prefs, MakePreparedDrink(v))
end

return unpack(prefs)
