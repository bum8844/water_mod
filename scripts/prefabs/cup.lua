local assets =
{
	Asset("ANIM", "anim/kettle_drink.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
}

local prefabs =
{
	"water_clean",
	"water_dirty",
	"water_salty",
}

local function OnTakeWater(inst, source)
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
end

local function TestWatertype(inst, from_object)
	local prefab = nil
	if from_object ~= nil then
		local watertype = from_object.components.water and from_object.components.water:GetWatertype()
		prefab = from_object.components.stewer ~= nil and from_object.components.stewer.product
			or watertype and "water_"..watertype
	else
		prefab = "water_salty"
	end

	return prefab
end

local function FillByRain(inst)
    inst.rainfilling = 0
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    local filleditem = SpawnPrefab("water_clean")
	filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
	if inst.components.stackable:IsStack() then
		inst.components.stackable:Get():Remove()
	else
		inst:Remove()
	end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("kettle_drink")
    inst.AnimState:SetBank("kettle_drink")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","kettle_drink","empty")

	inst:AddTag("watertaker")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("watertaker")
	inst.components.watertaker.capacity = TUNING.CUP_MAX_LEVEL
	inst.components.watertaker.prefabtest = TestWatertype
	inst.components.watertaker.onfillfn = OnTakeWater
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("cup", fn, assets)