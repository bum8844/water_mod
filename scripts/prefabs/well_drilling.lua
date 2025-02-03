require "prefabutil"

local assets = 
{
	Asset("ANIM", "anim/well_drilling.zip"),
	Asset("IMAGE", "images/inventoryitems/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/inventoryitems/tea_inventoryitem.xml"),
}

local prefabs =
{
	"well_drilling_item",
	"well_drilling_item_placer",
	"hole",
}

local function onhammered(inst)
	local x, y, z = inst.Transform:GetWorldPosition()

	local fx = SpawnPrefab("collapse_small")
	fx.Transform:SetPosition(x, y, z)

	if inst.deploy_item_save_record ~= nil then
        local item = SpawnSaveRecord(inst.deploy_item_save_record)
		item.Transform:SetPosition(x, y, z)
		item.AnimState:PlayAnimation("collapse", false)
		item.AnimState:PushAnimation("idle_packed")
		item.SoundEmitter:PlaySound("drink_fx/sfx/drilling_pst", "drilling_pst")
	end

    inst:Remove()
end

local function item_foldup_finished(inst)
	inst:RemoveEventCallback("animqueueover", item_foldup_finished)
	inst.AnimState:PlayAnimation("idle_packed")
	inst.components.inventoryitem.canbepickedup = true
end

local function Finished(inst, force_fx)
	local x, y, z = inst.Transform:GetWorldPosition()
	if inst.deploy_item_save_record ~= nil then
        local item = SpawnSaveRecord(inst.deploy_item_save_record)
		item.Transform:SetPosition(x, y, z)
		item.components.inventoryitem.canbepickedup = false

		item.AnimState:PlayAnimation("collapse", false)
		item:ListenForEvent("animover", item_foldup_finished)

	    item.SoundEmitter:PlaySound("drink_fx/sfx/drilling_pst", "drilling_pst")
		
		SpawnPrefab("small_puff").Transform:SetPosition(x, y, z)
		SpawnPrefab("hole").Transform:SetPosition(x, y, z)
	    item.SoundEmitter:PlaySound("farming/common/farm/plow/dirt_puff")
	else
		SpawnPrefab("small_puff").Transform:SetPosition(x, y, z)
		SpawnPrefab("hole").Transform:SetPosition(x, y, z)
	end

    inst:Remove()
end

local function IsPosWithin(x, z, positions, dist)
    dist = dist * dist
    for i, v in ipairs(positions) do
        local distance = VecUtil_DistSq(x, z, v.x, v.z)
        if distance < dist then
            return true
        end
    end
    return false
end

local function DoDrilling(inst)
	inst:RemoveEventCallback("animover", DoDrilling)

	inst.AnimState:PlayAnimation("drill_loop", true)
    inst.SoundEmitter:PlaySound("drink_fx/sfx/drilling_loop", "drilling_loop")
	local fx_time = 0
	if not inst.components.timer:TimerExists("drilling") then
		inst.components.timer:StartTimer("drilling", TUNING.WELL_DRILLING_DURATION)
	else
		fx_time = TUNING.WELL_DRILLING_DURATION - inst.components.timer:GetTimeLeft("drilling")
	end
end

local function timerdone(inst, data)
	if data ~= nil and data.name == "drilling" then
		Finished(inst)
	end
end

local function StartUp(inst)
    inst.AnimState:PlayAnimation("drill_pre")
	inst:ListenForEvent("animover", DoDrilling)
	inst.SoundEmitter:PlaySound("drink_fx/sfx/drilling_pre", "drilling_pre")

	inst.startup_task = nil
end

local function OnSave(inst, data)
	data.deploy_item = inst.deploy_item_save_record
end

local function OnLoadPostPass(inst, newents, data)
	if data ~= nil then
		inst.deploy_item_save_record = data.deploy_item
	end

	if inst.components.timer:TimerExists("drilling") then
		if inst.startup_task ~= nil then
			inst.startup_task:Cancel()
			inst.startup_task = nil
		end
		DoDrilling(inst)
	end
end

local function main_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeObstaclePhysics(inst, 0.5)

    inst.AnimState:SetBank("well_drilling")
    inst.AnimState:SetBuild("well_drilling")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onhammered)

    inst:AddComponent("timer")

    MakeMediumBurnable(inst, nil, nil, true)
    MakeLargePropagator(inst)

	inst.deploy_item_save_record = nil

	inst.startup_task = inst:DoTaskInTime(0, StartUp)

	inst:ListenForEvent("timerdone", timerdone)


	inst.OnSave = OnSave
	inst.OnLoadPostPass = OnLoadPostPass

    return inst
end

local NEED_TAGS = {"water_hole"}
local range = 3.2

local function GetValidWaterPointNearby(inst, pt)
    local best_point = nil
    local min_sq_dist = 999999999999
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, range, NEED_TAGS)
    for i, v in ipairs(ents) do
        local ex, ey, ez = v.Transform:GetWorldPosition()
        if TheWorld.Map:IsAboveGroundAtPoint(pt.x, pt.y, pt.z, false) then
            local cur_point = Vector3(ex, 0, ez)
            local cur_sq_dist = cur_point:DistSq(pt)
            if cur_sq_dist < min_sq_dist then
                min_sq_dist = cur_sq_dist
                best_point = cur_point
            end
        end
    end

    return best_point
end

local function PlaceTestFn(inst, pt, mouseover, deployer)
    return GetValidWaterPointNearby(inst, pt) == nil and TheWorld.Map:IsAboveGroundAtPoint(pt.x, pt.y, pt.z, false) and not TheWorld.Map:IsDockAtPoint(pt.x, 0, pt.z) and TheWorld.Map:CanDeployPlantAtPoint(pt, inst)
end

local function ondeploy(inst, pt, deployer)
    local obj = SpawnPrefab("well_drilling")
	--obj.Physics:SetCollides(false)
    obj.Physics:Teleport(pt.x, 0, pt.z)
    --obj.Physics:SetCollides(true)

	inst.components.finiteuses:Use(1)
	if inst:IsValid() then
		obj.deploy_item_save_record = inst:GetSaveRecord()
		inst:Remove()
	end
end

local function item_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)

    inst.minisign_atlas = "minisign_dehy_items_swap"
    inst.minisign_prefab_name = true

    inst.AnimState:SetBank("well_drilling")
    inst.AnimState:SetBuild("well_drilling")
    inst.AnimState:PlayAnimation("idle_packed")

    inst:AddTag("usedeploystring")

    inst._custom_candeploy_fn = PlaceTestFn

	MakeInventoryFloatable(inst, "small", 0.1, 0.8)

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "well_drilling_item"

    inst:AddComponent("deployable")
    inst.components.deployable.spacing = 4.5
    inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst.components.deployable.ondeploy = ondeploy

	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetMaxUses(TUNING.WELL_DRILL_USES)
    inst.components.finiteuses:SetUses(TUNING.WELL_DRILL_USES)

    MakeSmallBurnable(inst)
    MakeSmallPropagator(inst)
    MakeHauntableLaunch(inst)

    return inst
end

return  Prefab("well_drilling", main_fn, assets),
		Prefab("well_drilling_item", item_fn, assets, prefabs),
		MakePlacer("well_drilling_item_placer", "well_drilling", "well_drilling", "idle_place")