local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
	Asset("ATLAS_BUILD", "images/tea_inventoryitem.xml", 256),
}

local prefabs =
{
	"bucket_clean",
	"bucket_dirty",
	"bucket_salty",
}

-- 컴포넌트를 바닐라의 것으로 교체하면서, 기존에 component에서 자체적으로 처리하던 태그 부분을 overrideonfillfn으로 가져왔습니다.
local function OnFill(inst, from_object)
	local filleditem, watertype = nil, nil
	if from_object ~= nil then
		if from_object.components.waterlevel ~= nil then
			watertype = from_object.components.waterlevel.watertype
		elseif from_object.components.water ~= nil then
			watertype = from_object.components.water.watertype
		end
		filleditem = SpawnPrefab("bucket_"..string.lower(watertype))
		if from_object.components.waterlevel ~= nil then
			local dodelta = from_object.components.waterlevel.currentwater < 20 and from_object.components.waterlevel.currentwater or 20
			from_object.components.waterlevel:DoDelta(-dodelta)
			filleditem.components.finiteuses:SetUses(dodelta)
			print(from_object.components.waterlevel.currentwater)
		end
	else
		filleditem = SpawnPrefab("bucket_salty")
	end

	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	
	if filleditem == nil then
		return false
	end

	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    if owner ~= nil then
        local container = owner.components.inventory or owner.components.container
        local item = container:RemoveItem(inst, false) or inst
        item:Remove()
        container:GiveItem(filleditem, nil, owner:GetPosition())
    else
        source.Transform:SetPosition(inst.Transform:GetWorldPosition())
        local item =
            inst.components.stackable ~= nil and
            inst.components.stackable:IsStack() and
            inst.components.stackable:Get() or
            inst
        item:Remove()
    end
	
	return true
end

local function FillByRain(inst)
	local filleditem = SpawnPrefab("bucket_full")
    inst.rainfilling = 0

	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")

	if inst.components.stackable.stacksize > 1 then
		filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst.components.stackable:Get():Remove()
	else
		filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
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

    inst.AnimState:SetBuild("buckets")
    inst.AnimState:SetBank("buckets")
    inst.AnimState:PlayAnimation("empty")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.rainfilling = 0
	inst:DoPeriodicTask(1, function()
	    local owner = inst.components.inventoryitem.owner
		if TheWorld.state.israining and owner == nil then
		    inst.rainfilling = inst.rainfilling + 1
		end
		if inst.rainfilling >= 45 then
		    FillByRain(inst)
		end
	end)
	-- 우물 상호 작용을 위한 태그
	inst:AddTag("bucket_empty")
	
    inst:AddComponent("fillable")
	inst.components.fillable.overrideonfillfn = OnFill
	inst.components.fillable.showoceanaction = true
	inst.components.fillable.acceptsoceanwater = true
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("tradable") --to work with water well

    inst:AddComponent("inspectable")
	
    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
	
    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename = "bucket_empty"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("bucket", fn, assets)