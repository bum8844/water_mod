local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
	Asset("IMAGE", "images/inventoryimages/bucket.tex"),
	Asset("ATLAS", "images/inventoryimages/bucket.xml")
}
local prefabs =
{
    "bucketfull",
}

local function OnEquip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_hat", "buckets", "swap_hat")
	
    owner.AnimState:Show("HAT")
    owner.AnimState:Show("HAT_HAIR")
    owner.AnimState:Hide("HAIR_NOHAT")
    owner.AnimState:Hide("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Hide("HEAD")
        owner.AnimState:Show("HEAD_HAT")	
    end
end

local function OnUnequip(inst, owner) 

    owner.AnimState:Hide("HAT")
    owner.AnimState:Hide("HAT_HAIR")
    owner.AnimState:Show("HAIR_NOHAT")
    owner.AnimState:Show("HAIR")

    if owner:HasTag("player") then
        owner.AnimState:Show("HEAD")
        owner.AnimState:Hide("HEAD_HAT")
    end
end

local function OnFill(inst, from_object)
    if from_object ~= nil
		and from_object.components.watersource ~= nil
        and from_object.components.watersource.override_fill_uses ~= nil then
    end
    inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    return true
end


local function FillByRain(inst)
    inst.rainfilling = 0
	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	if inst.components.stackable.stacksize > 1 then
	    local newbucket = SpawnPrefab("bucketfull")
		newbucket.Transform:SetPosition(inst.Transform:GetWorldPosition())
        newbucket:AddTag("FilledByRain")
		inst.components.stackable:Get():Remove()
	else
	    local newbucket = SpawnPrefab("bucketfull")
		newbucket.Transform:SetPosition(inst.Transform:GetWorldPosition())
        newbucket:AddTag("FilledByRain")
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
	
	inst:AddTag("hat")
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
    inst.components.fillable.filledprefab = "bucketfull"
	inst.components.fillable.showoceanaction = true
	inst.components.fillable.acceptsoceanwater = true
	
	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("bucket")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bucket.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("bucket", fn, assets)
