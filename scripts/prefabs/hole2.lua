local assets=
{
    Asset("ANIM", "anim/hole.zip"),
}

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("waterwell_item") then
	   inst.SoundEmitter:PlaySound("dontstarve/common/makeFriend")
	   SpawnPrefab("maxwell_smoke").Transform:SetPosition(inst.Transform:GetWorldPosition())
	   local ww = SpawnPrefab("waterwell")
	   ww.Transform:SetPosition(inst.Transform:GetWorldPosition())
	   ww.Transform:SetScale(1.25, 1.25, 1.25)
	   ww.AnimState:PlayAnimation("onbuild")
	   ww.AnimState:PushAnimation("idle_empty", true)
	   ww.SoundEmitter:PlaySound("dontstarve/common/winter_meter_craft")
	   ww.Transform:SetScale(1.25, 1.25, 1.25)
	   item:Remove()
	   inst:Remove()
	   else
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
    GetPlayer().components.inventory:GiveItem(SpawnPrefab("bucket"))
	inst.SoundEmitter:PlaySound("dontstarve/common/makeFriend")
end

local function fn(isbackground)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("gemsocket")

    inst.AnimState:SetBank("hole")
    inst.AnimState:SetBuild("hole")
    inst.AnimState:PlayAnimation("closet",true)
	
	if isbackground then
        inst.AnimState:SetLayer(LAYER_BACKGROUND)
        inst.AnimState:SetSortOrder(3)
    end

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer

    return inst
end

return Prefab( "common/hole2", fn, assets, prefabs)