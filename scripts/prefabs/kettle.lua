require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/kettle.zip"),
    Asset("ANIM", "anim/kettle_meter.zip"),
    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
}

local prefabs =
{
	"collapse_small",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit_empty")
    inst.AnimState:PushAnimation("idle_empty",false)
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kettle.tex")
	
    MakeObstaclePhysics(inst, .1)
	
    inst.AnimState:SetBuild("kettle")
    inst.AnimState:SetBank("kettle")
    inst.AnimState:PlayAnimation("idle_empty")
    
	inst:AddTag("structure")
	inst:AddTag("kettle")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
    return inst
end

return Prefab("kettle", fn, assets),
MakePlacer("kettle_placer", "kettle", "kettle", "idle_empty")