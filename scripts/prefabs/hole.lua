local assets=
{
    Asset("ANIM", "anim/hole.zip"),
}

local function onhammered(inst, worker)
    SpawnPrefab("turf_mud").Transform:SetPosition(inst.Transform:GetWorldPosition())
    SpawnPrefab("maxwell_smoke").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("hole2").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst:Remove()
end

local function onhit(inst, worker)
end

local function OnGetItemFromPlayer(inst, giver, item)
    GetPlayer().components.inventory:GiveItem(SpawnPrefab("bucket"))
	inst.SoundEmitter:PlaySound("dontstarve/common/makeFriend")
end

local function hole(isbackground)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, 1)

    inst.AnimState:SetBank("hole")
    inst.AnimState:SetBuild("hole")
    inst.AnimState:PlayAnimation("open")
	
	if isbackground then
        inst.AnimState:SetLayer(LAYER_BACKGROUND)
        inst.AnimState:SetSortOrder(3)
    end

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

    return inst
end

return Prefab( "common/hole", hole, assets, prefabs)