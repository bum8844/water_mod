local assets =
{ 
    Asset("ANIM", "anim/hat_wood.zip"),

    Asset("ATLAS", "images/inventoryimages/bucket.xml"),
    Asset("IMAGE", "images/inventoryimages/bucket.tex"),
}

local prefabs = 
{
}

local function OnEquip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_hat", "hat_wood", "swap_hat")
	
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

local function fn()

    local inst = CreateEntity()
    
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	
	inst.entity:AddSoundEmitter()
	
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("hat_wood")
    inst.AnimState:SetBuild("hat_wood")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("hat")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
	
    inst:AddComponent("inspectable")
	
	

    inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "bucket"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bucket.xml"
	
    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(OnEquip)
    inst.components.equippable:SetOnUnequip(OnUnequip)
	inst.components.equippable.dapperness = 1*TUNING.DAPPERNESS_TINY
	
	inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.USAGE
    inst.components.fueled:InitializeFuelLevel(TUNING.WINTERHAT_PERISHTIME)
    inst.components.fueled:SetDepletedFn(inst.Remove)
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)
	
	inst:AddComponent("armor")
	inst.components.armor:InitCondition(TUNING.ARMOR_FOOTBALLHAT/3, TUNING.ARMOR_FOOTBALLHAT_ABSORPTION/2)

    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("common/inventory/bucket_helmet", fn, assets, prefabs)