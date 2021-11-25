local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
	Asset("ATLAS_BUILD", "images/tea_inventoryitem.xml", 256),
}

local prefabs =
{
	"bucket_full",
	"bucket_dirty",
	"bucket_salt",
}

-- 컴포넌트를 바닐라의 것으로 교체하면서, 기존에 component에서 자체적으로 처리하던 태그 부분을 overrideonfillfn으로 가져왔습니다.
local function OnFill(inst, from_object)
	local filleditem
	if from_object ~= nil then
		if from_object:HasTag("cleanwater") then
			filleditem = SpawnPrefab("bucket_full")
		else
			filleditem = SpawnPrefab("bucket_dirty")
		end
	else
		filleditem = SpawnPrefab("bucket_salt")
	end
	
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	
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
	local filleditem
    inst.rainfilling = 0
	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	if inst.components.stackable.stacksize > 1 then
	    filleditem = SpawnPrefab("bucket_full")
		filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst.components.stackable:Get():Remove()
	else
	    filleditem = SpawnPrefab("bucket_full")
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
	
	inst:AddTag("fil_bucket")

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
	
    inst:AddComponent("fillable")
	inst.components.fillable.overrideonfillfn = OnFill
	inst.components.fillable.showoceanaction = true
	inst.components.fillable.acceptsoceanwater = true
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("bucket")
	inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "bucket_empty"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("bucket", fn, assets)