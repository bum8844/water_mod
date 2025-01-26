local assets =
{
	Asset("ANIM", "anim/kettle_drink.zip"),
	Asset("SCRIPT", "scripts/prefabs/fertilizer_nutrient_defs.lua"),
}

local prefabs =
{
	"gridplacer_farmablesoil",
}

local FERTILIZER_DEFS = require("prefabs/fertilizer_nutrient_defs").FERTILIZER_DEFS

local function Get_Waterborne_Disease(inst, eater)
    if TUNING.ENABLE_WATERBORNE and not eater.waterborne_immune and
    	eater:HasTag("player") and not eater:HasTag("playerghost") then
        eater:AddDebuff("waterbornedebuff", "waterbornedebuff")
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
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)

    inst.minisign_atlas = "minisign_dehy_drinks_swap"
    inst.minisign_prefab_name = true

	inst.AnimState:SetBank("kettle_drink")
	inst.AnimState:SetBuild("kettle_drink")
	inst.AnimState:PlayAnimation("idle")

	inst.AnimState:OverrideSymbol("swap", "kettle_drink", "spoiled_drink")
	inst:AddTag("icebox_valid")
	inst:AddTag("drink_icebox_valid")
	inst:AddTag("show_spoiled")

	MakeInventoryFloatable(inst)
	MakeDeployableFertilizerPristine(inst)

	inst:AddTag("fertilizerresearchable")

	inst:AddTag("drink")

	inst.GetFertilizerKey = GetFertilizerKey

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM

    inst:AddComponent("smotherer")

	inst:AddComponent("selfstacker")

	inst:AddComponent("edible")
	inst.components.edible.isdrink = true
	inst.components.edible.healthvalue = -TUNING.HEALING_TINY
	inst.components.edible.hungervalue = TUNING.SPOILED_HUNGER
	inst.components.edible.sanityvalue = TUNING.SANITY_POISON
	inst.components.edible.thirstvalue = TUNING.HYDRATION_POISON
	inst.components.edible:SetOnEatenFn(Get_Waterborne_Disease)

	inst:AddComponent("fertilizerresearchable")
	inst.components.fertilizerresearchable:SetResearchFn(fertilizerresearchfn)

	inst:AddComponent("fertilizer")
    inst.components.fertilizer.fertilizervalue = TUNING.SPOILEDFOOD_FERTILIZE
    inst.components.fertilizer.soil_cycles = TUNING.SPOILEDFOOD_SOILCYCLES
    inst.components.fertilizer.withered_cycles = TUNING.SPOILEDFOOD_WITHEREDCYCLES
    inst.components.fertilizer:SetNutrients(FERTILIZER_DEFS.spoiled_drink.nutrients)

    inst:AddComponent("tradable")

    MakeDynamicCupImage(inst, "swap", "kettle_drink", nil, 5)
	MakeDeployableFertilizer(inst)
	MakeHauntableLaunch(inst)

	return inst
end

return Prefab("spoiled_drink", fn, assets, prefabs)
