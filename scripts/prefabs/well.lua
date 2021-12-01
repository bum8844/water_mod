--[[require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/well.zip"),
}

local assets_drilling_item =
{
    Asset("ANIM", "anim/well_drilling.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
}

local prefabs{
	"collapse_small",
}

local prefabs_well_item =
{
    "well",
}

local prefabs_drilling_item =
{
	"well_drilling",
}

local prefabs_drilling =
{
	"well_drilling_item",
}

local function onrepaired(inst)
    if data.buildsound ~= nil then
        inst.SoundEmitter:PlaySound(data.buildsound)
    end
	makewell(inst)
end

local makewell(inst)
	local x, y, z = inst.Transform:GetWorldPosition()
	SpawnPrefab("well").Transform:SetPosition(x, y, z)
	item.SoundEmitter:PlaySound("farming/common/farm/plow/dirt_puff")
	inst.Remove()
end

local function make_hole
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst:SetPhysicsRadiusOverride(0.4)
	
    inst.AnimState:SetBank("hole")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("antlion_sinkhole_blocker")
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable") -- here for repairable
    inst.components.workable:SetMaxWork(1)
	inst.components.workable.workleft = 0

    inst:AddComponent("repairable")
    inst.components.repairable.repairmaterial = "well_item"
    inst.components.repairable.onrepaired = onrepaired
    inst.components.repairable.testvalidrepairfn = ValidRepairFn
	
	return inst
end

---------------------------------------------------------------
--------------------------- well's ----------------------------
---------------------------------------------------------------

local function make_well_item
	
end

local function make_well

end

---------------------------------------------------------------
-------------------------- drilling ---------------------------
---------------------------------------------------------------

local function onhammered_drill(inst)
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

local function Finished_drill(inst, force_fx)
	local x, y, z = inst.Transform:GetWorldPosition()
	if inst.deploy_item_save_record ~= nil then
        local item = SpawnSaveRecord(inst.deploy_item_save_record)
		item.Transform:SetPosition(x, y, z)
		item.components.inventoryitem.canbepickedup = false

		item.AnimState:PlayAnimation("collapse", false)
		item:ListenForEvent("animover", item_foldup_finished)

	    item.SoundEmitter:PlaySound("farming/common/farm/plow/collapse")

		SpawnPrefab("hole").Transform:SetPosition(x, y, z)
	    item.SoundEmitter:PlaySound("farming/common/farm/plow/dirt_puff")
	else
		SpawnPrefab("collapse_small").Transform:SetPosition(x, y, z)
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
	drill_time = 0
	if not inst.components.timer:TimerExists("drilling") then
		inst.components.timer:StartTimer("drilling", TUNING.FARM_PLOW_DRILLING_DURATION)
	else
		drill_time = TUNING.FARM_PLOW_DRILLING_DURATION - inst.components.timer:GetTimeLeft("drilling")
	end
end

local function timerdone_drill(inst, data)
	if data ~= nil and data.name == "drilling" then
		if drill_time ~= nil then
			if not drill_time < 0 then
				Finished_drill(inst)
			end
		else
			Finished_drill(inst)
		end
	end
end

local function StartUp_drill(inst)
    inst.AnimState:PlayAnimation("drill_pre")
	inst:ListenForEvent("animover", DoDrilling)
	inst.SoundEmitter:PlaySound("farming/common/farm/plow/drill_pre")

	inst.startup_task = nil
end

local function OnSave_drill(inst, data)
	data.deploy_item = inst.deploy_item_save_record
end

local function OnLoadPostPass_drill(inst, newents, data)
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

local function make_drilling
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.entity:AddSoundEmitter()

    MakeObstaclePhysics(inst, 0.5)

    inst.AnimState:SetBank("well_drilling")
    inst.AnimState:SetBuild("well_drilling")

    inst:AddTag("scarytoprey")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onhammered_drill)

    inst:AddComponent("timer")

    MakeMediumBurnable(inst, nil, nil, true)
    MakeLargePropagator(inst)
	
	inst:AddComponent("spawner")

	inst.deploy_item_save_record = nil

	inst.startup_task = inst:DoTaskInTime(0, StartUp_drill)

	inst:ListenForEvent("timerdone", timerdone_drill)

	inst.OnSave = OnSave_drill
	inst.OnLoadPostPass = OnLoadPostPass_drill

    return inst
end

local function item_ondeploy(inst, pt, deployer)
    local cx, cy, cz = TheWorld.Map:GetTileCenterPoint(pt:Get())

    local obj = SpawnPrefab("farm_plow")
	obj.Transform:SetPosition(cx, cy, cz)

	inst.components.finiteuses:Use(1)
	if inst:IsValid() then
		obj.deploy_item_save_record = inst:GetSaveRecord()
		inst:Remove()
	end
end

local function can_plow_tile(inst, pt, mouseover, deployer)
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
end

local function make_drilling_item
	   local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("well_drilling")
    inst.AnimState:SetBuild("well_drilling")
    inst.AnimState:PlayAnimation("idle_packed")

    MakeInventoryFloatable(inst, "med", 0.1, 0.8)
	
	inst:AddTag("usedeploystring")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.replica.inventoryitem:SetImage("well_drilling_item")
	inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "well_drilling_item"

    inst:AddComponent("deployable")
	inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst.components.deployable.ondeploy = item_ondeploy

	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetMaxUses(TUNING.FARM_PLOW_USES)
    inst.components.finiteuses:SetUses(TUNING.FARM_PLOW_USES)

    MakeSmallBurnable(inst)
    MakeSmallPropagator(inst)
    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("hole",make_hole,assets,prefabs),
Prefab("well_item",make_well_item,assets,prefabs),
Prefab("well",make_well,assets,prefabs),
MakePlacer("well_placer","well","well","idle_empty"),
Prefab("well_drilling_item",make_drilling_item,assets_drilling_item,prefabs_drilling_item),
Prefab("well_drilling",make_drilling,assets_drilling_item,prefabs_drilling),
MakePlacer("well_drilling_placer","well_drilling","well_drilling","idle_place")]]--