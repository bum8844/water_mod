local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
	Asset("ATLAS_BUILD", "images/tea_inventoryitem.xml", 256),
}
local prefabs =
{

}

local function onhammered(inst, worker)
	SpawnPrefab("bucket").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("ice").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/iceboulder_smash")
	inst:Remove()
end

local function onhit(inst, worker)
--print(test)
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
    inst.AnimState:PlayAnimation("ice")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddTag("show_spoilage")
	
	inst:AddTag("icebox_valid")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 1
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.CHOP)--DIG
	inst.components.workable:SetWorkLeft(1)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("bucketice")
    inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
	inst.components.inventoryitem.imagename = "bucket_ice"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("bucket_ice", fn, assets)
