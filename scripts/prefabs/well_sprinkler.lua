require("constants")
local BLOCKERS_TAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "playerghost", "ghost", "flying", "structure" }
local NEED_TAGS = { "sprinkler_water" }
local range = TUNING.FIND_WATER_RANGE
local WATER_RADIUS = 3.8

local assets =
{
	Asset("ANIM", "anim/well_sprinkler.zip"),
	Asset("ANIM", "anim/well_sprinkler_meter.zip"),
	Asset("ANIM", "anim/well_sprinkler_placement.zip"),
}

local prefabs =
{
	"well_water_pipe",
	"well_water_spray",
    "collapse_small",
}

local function spawndrop(inst)

	local pt = inst:GetPosition()
	local angle = math.random()*2*PI
	local dist = math.random()*TUNING.SPRINKLER_RANGE
	local offset = Vector3(dist * math.cos( angle ), 0, -dist * math.sin( angle ))

	local drops = {}
	for i = 1, 4 do
    	local drop = SpawnPrefab("well_sprinkler_water_drop")
    	drop.Transform:SetPosition(pt.x + offset.x, 0, pt.z + offset.z)
    	drops[i] = drop
	end

	for i = 1, 4 do
    	local x, y, z = drops[i].Transform:GetWorldPosition()
    	TheWorld.components.farming_manager:AddSoilMoistureAtPoint(x, y, z, TUNING.ICE_MELT_GROUND_MOISTURE_AMOUNT / 2)
	end
end

local function TurnOn(inst)
	inst.on = true
	inst.components.fueled:StartConsuming()
	if not inst.waterSpray then
		inst.waterSpray = SpawnPrefab("well_water_spray")
		local follower = inst.waterSpray.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, "top", 0, -100, 0)
	end

	inst.droptask = inst:DoPeriodicTask(0.2,function() spawndrop(inst) spawndrop(inst) end)

	inst.spraytask = inst:DoPeriodicTask(0.2,function()
			if inst.components.machine:IsOn() then
				inst.UpdateSpray(inst)
			end
		end)

	inst.sg:GoToState("turn_on")
end

local function TurnOff(inst)
	inst.on = false
	inst.components.fueled:StopConsuming()

	if inst.waterSpray then
		inst.waterSpray:Remove()
		inst.waterSpray = nil
	end

	if inst.droptask then
		inst.droptask:Cancel()
		inst.droptask = nil
	end

	if inst.spraytask then
		inst.spraytask:Cancel()
		inst.spraytask = nil
	end

	inst.sg:GoToState("turn_off")
end

local function OnFuelEmpty(inst)
	inst.components.machine:TurnOff()
end

local function OnAddFuel(inst)
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/machine_fuel")
end

local function OnFuelSectionChange(new, old, inst)
    if inst._fuellevel ~= new then
        inst._fuellevel = new
        inst.AnimState:OverrideSymbol("swap", "well_sprinkler_meter", tostring(new))
    end
end

local function GetStatus(inst, viewer)
	return inst.components.fueled ~= nil
            and inst.components.fueled.currentfuel / inst.components.fueled.maxfuel <= .25
            and "LOWFUEL"
            or inst.on and "ON"
            or "OFF"
end

local function OnEntitySleep(inst)
    inst.SoundEmitter:KillSound("firesuppressor_idle")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle_off")
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/firesupressor_craft")
end

local function UpdateSpray(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, TUNING.SPRINKLER_RANGE)

    for k,v in pairs(ents) do
    	local burnable_comp = v.components.burnable
    	local crop_comp = v.components.crop
    	local growable_comp = v.components.growable
    	local witherable_comp = v.components.witherable
    	local x, y, z = v.Transform:GetWorldPosition()
    	local wateryprotection_comp = inst.components.wateryprotection
	
		if burnable_comp and not (v.components.inventoryitem and v.components.inventoryitem.owner) then
			v.components.burnable:Extinguish()
		end		
		
		if crop_comp and crop_comp.task then
			crop_comp.growthpercent = crop_comp.growthpercent + (0.001)
		end		

    	if growable_comp ~= nil and growable_comp:IsGrowing() then
			growable_comp:ExtendGrowTime(-0.2)
    	end

    	if witherable_comp and witherable_comp:IsWithered() then
			witherable_comp:ForceRejuvenate()
		end	

    	if wateryprotection_comp then
        	wateryprotection_comp:SpreadProtectionAtPoint(x, y, z, 1)
    	end
	end
end

local function IsValidSprinklerTile(tile)
    return not TileGroupManager:IsOceanTile(tile) and (tile ~= WORLD_TILES.INVALID) and (tile ~= WORLD_TILES.IMPASSABLE)
end

local function GetValidWaterPointNearby(inst)
    local pt = inst:GetPosition()
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
        if v:HasTag("oasis_lake") then
            inst:AddTag("stormchecker")
        end
    end

    if not best_point then
        local range = 20
        local cx, cy = TheWorld.Map:GetTileCoordsAtPoint(pt.x, 0, pt.z)
        local center_tile = TheWorld.Map:GetTile(cx, cy)
        for x = pt.x - range, pt.x + range, 1 do
            for z = pt.z - range, pt.z + range, 1 do
                local tile = TheWorld.Map:GetTileAtPoint(x, 0, z)

                if IsValidSprinklerTile(center_tile) and tile == WORLD_TILES.LILYPOND then
                    local cur_point = Vector3(x, 0, z)
                    local cur_sq_dist = cur_point:DistSq(pt)

                    if cur_sq_dist < min_sq_dist then
                        min_sq_dist = cur_sq_dist
                        best_point = cur_point
                        inst:AddTag("bigpond_haspipe")
                    end
                end
            end
        end
    end

    return best_point
end

local function RotateToTarget(inst, dest)
    local px, py, pz = inst.Transform:GetWorldPosition()
    local dz = pz - dest.z
    local dx = dest.x - px
    local angle = math.atan2(dz, dx) / DEGREES

    -- Offset angle to account for pipe orientation in file.sa
    local OFFSET_ANGLE = 90
	inst.Transform:SetRotation(angle - OFFSET_ANGLE)
end

local function CreatePipes(inst)
    local P0 = inst:GetPosition()
    local P1 = GetValidWaterPointNearby(inst)

    inst.pipes = {}

    if P1 then
        local pipeLength = 2
        local totalDistSq = P1:DistSq(P0)
        local totalDist = math.sqrt(totalDistSq)
        local metricPipeLength = pipeLength / totalDist

        for t = 0.0, 1.0, metricPipeLength do
            local Pt = (P1 - P0) * t + P0
            local pipe = SpawnPrefab("well_water_pipe")
            pipe.Transform:SetPosition(Pt.x, 0.0, Pt.z)
            pipe.pipelineOwner = inst

            RotateToTarget(pipe, P1)

            table.insert(inst.pipes, pipe)
        end
    end
end

local function DestroyPipes(inst)
	for i, pipe in pairs(inst.pipes) do
		pipe:Remove()
	end
end

local function ConnectPipes(inst)
    local numPipes = #inst.pipes

    if numPipes > 2 then
        for i = 2, numPipes, 1 do
            local prevPipe = inst.pipes[i - 1]
            local currPipe = inst.pipes[i]
            prevPipe.nextPipe, currPipe.prevPipe = currPipe, prevPipe
        end
    end
end

local function ExtendPipes(inst)
    if inst.loadedPipesFromFile then
        for i, pipe in ipairs(inst.pipes) do
            pipe.sg:GoToState("idle")
        end
        inst:PushEvent("pipedone")
    else
        local firstPipe = inst.pipes[1]
        if firstPipe ~= nil then
            firstPipe.sg:GoToState("extend", inst)
        end
    end
end

local function RetractPipes(inst)
    local numPipes = #inst.pipes
    if numPipes > 0 then
        local lastPipe = inst.pipes[numPipes]
        lastPipe.sg:GoToState("retract", numPipes)
    end
end

local function OnSave(inst, data)
    if inst:HasTag("burnt") or inst:HasTag("fire") then
        data.burnt = true
    end

    data.onhole = inst.onhole
    data.on = inst.on
    if inst.onhole == nil and inst.pipes ~= nil then
        data.pipes = {}
        data.pipeAngles = {}

        for i, pipe in ipairs(inst.pipes) do
            table.insert(data.pipes, pipe.GUID)
            table.insert(data.pipeAngles, pipe.Transform:GetRotation())
        end
    end
    if inst.waterSpray ~= nil then
        data.waterSpray = inst.waterSpray.GUID
    end

    return {}
end

local function OnLoad(inst, data)
    if data ~= nil then
        if data.burnt ~= nil and inst.components.burnable ~= nil and inst.components.burnable.onburnt ~= nil then
            inst.components.burnable.onburnt(inst)
        end

        inst.onhole = data.onhole or nil
        inst.on = data.on or false
    end
end

local function OnLoadPostPass(inst, newents, data)
    if not data.onhole then
        inst.pipes = {}
        inst.loadedPipesFromFile = false

        if data.pipes ~= nil then
            for i, pipeGUID in ipairs(data.pipes) do
                local newpipe = newents[pipeGUID].entity

                if newpipe ~= nil then
                    newpipe.pipelineOwner = inst
                    table.insert(inst.pipes, newpipe)
                    inst.pipes[i].Transform:SetRotation(data.pipeAngles[i])
                    inst.loadedPipesFromFile = true
                end
            end
        end
    end
end

local function HasPhysics(obj)
    return obj.Physics ~= nil
end

local function TryAvailable(inst, OnSandstormChanged)
    if FindEntity(inst, WATER_RADIUS, HasPhysics, nil, BLOCKERS_TAGS) ~= nil then
        inst.availabletask = inst:DoTaskInTime(5, TryAvailable, OnSandstormChanged)
        return
    end
    inst.availabletask = nil
    inst.driedup_water = false
    inst:AddTag("haspipe")
end

local function OnSandstormChanged(inst, active)
    if inst.availabletask then
        inst.availabletask:Cancel()
        inst.availabletask = nil
    end
    if active then
        if inst.driedup_water then
            TryAvailable(inst, OnSandstormChanged)
        end
    elseif not inst.driedup_water then
        inst.driedup_water = true
        if inst.components.machine:IsOn() then
            inst.on = false
            inst.components.machine:TurnOff(inst)
            TurnOff(inst)
        end
        inst:RemoveTag("haspipe")
    end
end

local function OnSnowLevel(inst, snowlevel)
    if snowlevel > .02 then
        if not inst.pondisfrozen then
            inst.pondisfrozen = true
            if inst.components.machine:IsOn() then
                inst.on = false
                inst.components.machine:TurnOff(inst)
                TurnOff(inst)
            end
            inst:RemoveTag("haspipe")
        end
    elseif inst.pondisfrozen or inst.pondisfrozen == nil then
        inst.pondisfrozen = false
        inst:AddTag("haspipe")
    end
end

local function addtags(inst)
    inst:AddTag("connected")
    inst:AddTag("haspipe")
end

local function WeatherCheck(inst)
    if inst:HasTag("connected") then
        if inst:HasTag("stormchecker") then
            inst:ListenForEvent("ms_stormchanged", function(src, data)
                if data.stormtype == STORM_TYPES.SANDSTORM then
                    OnSandstormChanged(inst, data.setting)
                end
            end, TheWorld)
            OnSandstormChanged(inst, TheWorld.components.sandstorms ~= nil and TheWorld.components.sandstorms:IsSandstormActive())
        elseif not inst:HasTag("dummy") and not inst:HasTag("bigpond_haspipe") then
            inst:WatchWorldState("snowlevel", OnSnowLevel)
            OnSnowLevel(inst, TheWorld.state.snowlevel)
        end
    end
end

local function PipeCheck(inst)
    local pt = inst:GetPosition()
    if inst.onhole == nil and GetValidWaterPointNearby(inst) then
        if not inst.pipes or (#inst.pipes < 1) then
            CreatePipes(inst)
        end
        ConnectPipes(inst)
        ExtendPipes(inst)
    elseif inst.onhole then
        inst:AddTag("hashole")
    else
        inst:AddTag("dummy")
    end
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		if not inst.sg:HasStateTag("busy") then
			inst.sg:GoToState("hit")
		end
	end
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.machine.turnofffn(inst)
	inst.SoundEmitter:KillSound("idleloop")
    local fx = SpawnPrefab("collapse_small")
    if inst.onhole ~= nil then
    	local hole = SpawnPrefab("hole")
    	hole.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif inst.pipes ~= nil then
    	RetractPipes(inst)
    end
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
	inst.components.lootdropper:DropLoot()
	inst:Remove()
end

local function OnEnableHelper(inst, enabled)
    if enabled then
        if inst.helper == nil then
            inst.helper = CreateEntity()

            --[[Non-networked entity]]
            inst.helper.entity:SetCanSleep(false)
            inst.helper.persists = false

            inst.helper.entity:AddTransform()
            inst.helper.entity:AddAnimState()

            inst.helper:AddTag("CLASSIFIED")
            inst.helper:AddTag("NOCLICK")
            inst.helper:AddTag("placer")

            inst.helper.Transform:SetScale(TUNING.SPRINKLER_PLACER_SCALE, TUNING.SPRINKLER_PLACER_SCALE, TUNING.SPRINKLER_PLACER_SCALE)

            inst.helper.AnimState:SetBank("well_sprinkler_placement")
            inst.helper.AnimState:SetBuild("well_sprinkler_placement")
            inst.helper.AnimState:PlayAnimation("idle")
            inst.helper.AnimState:SetLightOverride(1)
            inst.helper.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
            inst.helper.AnimState:SetLayer(LAYER_BACKGROUND)
            inst.helper.AnimState:SetSortOrder(1)
            inst.helper.AnimState:SetAddColour(0, .2, .5, 0)

            inst.helper.entity:SetParent(inst.entity)
        end
    elseif inst.helper ~= nil then
        inst.helper:Remove()
        inst.helper = nil
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("well_sprinkler.tex")

	MakeObstaclePhysics(inst, 1)

	inst.AnimState:SetBank("well_sprinkler")
	inst.AnimState:SetBuild("well_sprinkler")
	inst.AnimState:PlayAnimation("idle_off")
	inst.AnimState:OverrideSymbol("swap", "well_sprinkler_meter", "10")

	inst:AddTag("structure")
	inst:AddTag("forfarm")
    inst:AddTag("alwayson")

	if not TheNet:IsDedicated() then
		inst:AddComponent("deployhelper")
		inst.components.deployhelper.onenablehelper = OnEnableHelper
    end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.onhole = nil
    inst.on = false
    inst.waterSpray = nil

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = GetStatus

	inst:AddComponent("machine")
	inst.components.machine.turnonfn = TurnOn
	inst.components.machine.turnofffn = TurnOff
	inst.components.machine.cooldowntime = 0.5

    inst:AddComponent("wateringmachine")

	inst:AddComponent("fueled")
	inst.components.fueled:SetDepletedFn(OnFuelEmpty)
	inst.components.fueled:SetTakeFuelFn(OnAddFuel)
	inst.components.fueled.accepting = true
	inst.components.fueled:SetSections(10)
	inst.components.fueled:SetSectionCallback(OnFuelSectionChange)
	inst.components.fueled:InitializeFuelLevel(TUNING.SPRINKLER_MAX_FUEL_TIME)
	inst.components.fueled.bonusmult = 5
	inst.components.fueled.secondaryfueltype = "CHEMICAL"

	inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:SetStateGraph("SGwell_sprinkler")

	inst.moisturizing = 2
	inst.UpdateSpray = UpdateSpray

	inst.OnSave = OnSave 
    inst.OnLoad = OnLoad
    inst.OnLoadPostPass = OnLoadPostPass
    inst.OnEntitySleep = OnEntitySleep

	inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("pipedone",addtags)

	MakeSnowCovered(inst, .01)

	inst:DoTaskInTime(0,PipeCheck)

    if not inst.onhole then
        inst:DoPeriodicTask(1,WeatherCheck)
    end

	return inst
end

return Prefab("well_sprinkler", fn, assets, prefabs)