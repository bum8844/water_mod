local prefabs =
{
    "spoiled_drink",
}

local function GetHealthvalue(inst, eater)
    if eater and eater:HasTag("valkyrie") then
        if inst:HasTag("veggietype") or inst:HasTag("fruittype") or inst:HasTag("leavestype") then
            return inst.components.edible.healthvalue *.25
        end
    end
    return inst.components.edible.healthvalue
end

local function GetSanityvalue(inst, eater)
    if eater and eater:HasTag("valkyrie") then
        if inst:HasTag("veggietype") or inst:HasTag("fruittype") or inst:HasTag("leavestype") then
            return inst.components.edible.sanityvalue *.25
        end
    end
    return inst.components.edible.sanityvalue
end

local function MakePreparedDrink(data)
	local oneatenfn = data.oneatenfn or function(inst, eater) end

	local drinkassets =
	{
		Asset("ANIM", "anim/kettle_drink.zip"),
	}

    local drinkprefabs = prefabs

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
        if data ~= nil and not inst:HasTag("disinfectant") then
            if inst.components.perishable ~= nil and data.stacksize >= 20 then
                inst.components.perishable:SetLocalMultiplier(0.5)
            else
                inst.components.perishable:SetLocalMultiplier(1)
            end
        end
    end

    local function GetFertilizerKey(inst)
        return inst.prefab
    end

    local function fertilizerresearchfn(inst)
        return inst:GetFertilizerKey()
    end

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

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.minisign_atlas = "minisign_dehy_drinks_swap"
        inst.minisign_prefab_name = true

		local food_symbol_build = nil
		inst.AnimState:SetBuild("kettle_drink")
		inst.AnimState:SetBank("kettle_drink")

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", data.overridebuild or "kettle_drink", data.basename or data.name)

        if data.tags ~=nil then
        	for i,v in pairs(data.tags) do
        		inst:AddTag(v)
        	end
        end

        if not inst:HasTag("common") then
            inst:AddTag("drink")
            inst:AddTag("drink_icebox_valid")
            inst:AddTag("preparedfood")
            inst:AddTag("prepareddrink")
            inst:AddTag("show_spoiled")
            inst:AddTag("icebox_valid")
            inst:AddTag("cocktail_ingredients")
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
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

		--inst.food_symbol_build = food_symbol_build or overridebuild

        if not inst:HasTag("disinfectant") then
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
            inst.components.edible.gethealthfn = GetHealthvalue 
            inst.components.edible.getsanityfn = GetSanityvalue
            inst.components.edible:SetOnEatenFn(function(inst, eater)
                oneatenfn(inst, eater)
                --OnEaten(inst, eater)
            end)
        else
            inst:AddComponent("healer")
            inst.components.healer:SetHealthAmount(TUNING.HEALING_HUGE)
        end

        inst:AddComponent("inspectable")
        inst.wet_prefix = data.wet_prefix

        --[[inst:AddComponent("water")
        inst.components.water:SetWaterType(data.watertype or WATERTYPE.GENERIC)
        inst.components.water:SetOnTakenFn(OnTake)
        inst.components.water.returnprefab = "cup"]]

		inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = data.atlas or "images/tea_inventoryitem_drinks.xml"
        if data.OnPutInInventory then
            inst:ListenForEvent("onputininventory", data.OnPutInInventory)
        end

        if data.basename ~= nil then
            inst.components.inventoryitem:ChangeImageName(data.basename)
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM

        if data.perishtime ~= nil and data.perishtime > 0 and not inst:HasTag("disinfectant") then
            inst:AddComponent("perishable")
            inst.components.perishable:SetPerishTime(data.perishtime)
            inst.components.perishable:StartPerishing()
            inst.components.perishable.onperishreplacement = "spoiled_drink"
        end

        if inst:HasTag("spirits") then
            local burntime = TUNING.LARGE_BURNTIME
            local isexplosive = inst:HasTag("explosive")

            if isexplosive then
                burntime = 3 + math.random() * 3

                inst:AddComponent("explosive")
                inst.components.explosive:SetOnExplodeFn(OnExplodeFn)
                inst.components.explosive.explosivedamage = TUNING.GUNPOWDER_DAMAGE
            end

            MakeSmallBurnable(inst, burntime)
            MakeSmallPropagator(inst)

            if isexplosive then
                inst.components.burnable:SetOnBurntFn(nil)
                inst.components.burnable:SetOnIgniteFn(OnIgniteFn)
                inst.components.burnable:SetOnExtinguishFn(OnExtinguishFn)
            end

            inst:AddComponent("fuel")
            inst.components.fuel.fuelvalue = TUNING.MED_FUEL
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

for k, v in pairs(require("preparedspiritsdrink")) do
    table.insert(prefs, MakePreparedDrink(v))
end

return unpack(prefs)
