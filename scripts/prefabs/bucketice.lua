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

local function on_mine(inst, miner, workleft, workdone)
	SpawnPrefab("bucket").Transform:SetPosition(inst.Transform:GetWorldPosition())
	LaunchAt(SpawnPrefab("ice"), inst, miner, TUNING.ROCK_FRUIT_LOOT.SPEED, TUNING.ROCK_FRUIT_LOOT.HEIGHT, nil, TUNING.ROCK_FRUIT_LOOT.ANGLE)
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
    inst.components.workable:SetWorkAction(ACTIONS.MINE)
    inst.components.workable:SetWorkLeft(1)
    --inst.components.workable:SetOnFinishCallback(on_mine)
    inst.components.workable:SetOnWorkCallback(on_mine)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("bucketice")
    inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
	inst.components.inventoryitem.imagename = "bucket_ice"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("bucket_ice", fn, assets)
