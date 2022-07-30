local assets =
{
	Asset("ANIM", "anim/kettle_drink.zip"),
	Asset("SCRIPT", "scripts/prefabs/fertilizer_nutrient_defs.lua"),
}

local prefabs =
{
	"cup",
	"spoiled_food",
	"gridplacer_farmablesoil",
}

local FERTILIZER_DEFS = require("prefabs/fertilizer_nutrient_defs").FERTILIZER_DEFS

local function OnApplied(inst, final_use, doer, target)
    local x, y, z = inst.Transform:GetWorldPosition()
    if doer ~= nil and doer.components.inventory ~= nil then
        doer.components.inventory:GiveItem(SpawnPrefab("cup"), nil, Vector3(x, y, z))
    else
        refund.Transform:SetPosition(x,y,z)
    end
end

local function OnUnwrapped(inst, pos, doer)
    local item = SpawnPrefab("spoiled_food")
    local bowl = SpawnPrefab("cup")
    local num = inst.components.stackable:StackSize()
    item.components.stackable:SetStackSize(num)
    bowl.components.stackable:SetStackSize(num)
    item.Transform:SetPosition(pos:Get())
    bowl.Transform:SetPosition(pos:Get())
    inst:Remove()
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

	inst.AnimState:SetBank("kettle_drink")
	inst.AnimState:SetBuild("kettle_drink")
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap", "kettle_drink", "spoiled_drink")

	inst:AddTag("icebox_valid")
	inst:AddTag("show_spoiled")
	inst:AddTag("unwrappable")

	MakeInventoryFloatable(inst, "med", nil, 0.73)
	MakeDeployableFertilizerPristine(inst)

	inst:AddTag("fertilizerresearchable")

	inst.GetFertilizerKey = function(inst) return inst.prefab end

	inst.entity:SetPristine()
 
	if not TheWorld.ismastersim then
		return inst
	end

    inst:AddComponent("unwrappable")
    inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)

	inst:AddComponent("fertilizer")
    inst.components.fertilizer.fertilizervalue = TUNING.SPOILEDFOOD_FERTILIZE
    inst.components.fertilizer.soil_cycles = TUNING.SPOILEDFOOD_SOILCYCLES
    inst.components.fertilizer.withered_cycles = TUNING.SPOILEDFOOD_WITHEREDCYCLES
    inst.components.fertilizer:SetNutrients(FERTILIZER_DEFS.spoiled_drink.nutrients)
    inst.components.fertilizer.onappliedfn = OnApplied
    MakeDeployableFertilizer(inst)

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("fertilizerresearchable")
    inst.components.fertilizerresearchable:SetResearchFn(fertilizerresearchfn)

    inst:AddComponent("selfstacker")

    inst:AddComponent("tradable")

    MakeDeployableFertilizer(inst)
    MakeHauntableLaunchAndIgnite(inst)
    MakeDynamicCupImage(inst, "swap", "kettle_drink")

    return inst
end

return Prefab("spoiled_drink", fn, assets, prefabs)
