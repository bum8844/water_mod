require "prefabutil"

local assets = 
{
	Asset("ANIM", "anim/well_drilling.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
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

	    item.SoundEmitter:PlaySound("farming/common/farm/plow/collapse")
		
		SpawnPrefab("collapse_small").Transform:SetPosition(x, y, z)
		SpawnPrefab("hole").Transform:SetPosition(x, y, z)
	    item.SoundEmitter:PlaySound("farming/common/farm/plow/dirt_puff")
	else
		SpawnPrefab("collapse_small").Transform:SetPosition(x, y, z)
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
    inst.SoundEmitter:PlaySound("farming/common/farm/plow/LP", "loop")
	local fx_time = 0
	if not inst.components.timer:TimerExists("drilling") then
		inst.components.timer:StartTimer("drilling", TUNING.FARM_PLOW_DRILLING_DURATION)
	else
		fx_time = TUNING.FARM_PLOW_DRILLING_DURATION - inst.components.timer:GetTimeLeft("drilling")
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
	inst.SoundEmitter:PlaySound("farming/common/farm/plow/drill_pre")

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

--[[local function item_ondeploy(inst, pt, deployer)
    local cx, cy, cz = TheWorld.Map:GetTileCenterPoint(pt:Get())

    local obj = SpawnPrefab("well_drilling")
	obj.Transform:SetPosition(cx, cy, cz)

	inst.components.finiteuses:Use(1)
	if inst:IsValid() then
		obj.deploy_item_save_record = inst:GetSaveRecord()
		inst:Remove()
	end
end]]

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

--[[local function can_plow_tile(inst, pt, mouseover, deployer)
	local x, z = pt.x, pt.z
	if not TheWorld.Map:CanPlantAtPoint(x, 0, z) or TheWorld.Map:GetTileAtPoint(x, 0, z) == GROUND.FARMING_SOIL then
		return false
	end

	local ents = TheWorld.Map:GetEntitiesOnTileAtPoint(x, 0, z)
	for _, ent in ipairs(ents) do
		if ent ~= inst and ent ~= deployer and not (ent:HasTag("NOBLOCK") or ent:HasTag("locomotor") or ent:HasTag("NOCLICK") or ent:HasTag("FX") or ent:HasTag("DECOR")) then
			return false
		end
	end

	return true
end]]

local function item_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("well_drilling")
    inst.AnimState:SetBuild("well_drilling")
    inst.AnimState:PlayAnimation("idle_packed")

    inst:AddTag("usedeploystring")
    inst:AddTag("tile_deploy")

	MakeInventoryFloatable(inst, "small", 0.1, 0.8)

	--inst._custom_candeploy_fn = can_plow_tile -- for DEPLOYMODE.CUSTOM

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "well_drilling_item"

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
	--[[inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst.components.deployable.ondeploy = item_ondeploy]]

	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetMaxUses(TUNING.FARM_PLOW_USES)
    inst.components.finiteuses:SetUses(TUNING.FARM_PLOW_USES)

    MakeSmallBurnable(inst)
    MakeSmallPropagator(inst)
    MakeHauntableLaunch(inst)

    return inst
end

--[[local function placer_invalid_fn(player, placer)
    if player and player.components.talker then
        player.components.talker:Say(GetString(player, "ANNOUNCE_CANTBUILDHERE_THRONE"))
    end
end

local function placer_fn()
    local inst = CreateEntity()

    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")
    inst:AddTag("placer")
    
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst.AnimState:SetBank("well_drilling")
    inst.AnimState:SetBuild("well_drilling")
    inst.AnimState:PlayAnimation("idle_place")
    inst.AnimState:SetLightOverride(1)

    inst:AddComponent("placer")
    inst.components.placer.snap_to_tile = true

	inst.outline = SpawnPrefab("tile_outline")
	inst.outline.entity:SetParent(inst.entity)

	inst.components.placer:LinkEntity(inst.outline)

    return inst
end]]

return  Prefab("well_drilling", main_fn, assets),
		Prefab("well_drilling_item", item_fn, assets, prefabs),
		MakePlacer("well_drilling_item_placer", "well_drilling", "well_drilling", "idle_place")
		--Prefab("well_drilling_item_placer", placer_fn)