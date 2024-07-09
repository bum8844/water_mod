local UpvalueHacker = require("utils/upvaluehacker")

require("constants")
local BLOCKERS_TAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "playerghost", "ghost", "flying", "structure" }
local NEED_TAGS = { "sprinkler_water" }
local range = TUNING.FIND_WATER_RANGE
local WATER_RADIUS = 3.8

local assets =
{
	--Asset("ANIM", "anim/well_winona_sprinkler.zip"),
    Asset("ANIM", "anim/well_sprinkler.zip"),
	Asset("ANIM", "anim/well_sprinkler_placement.zip"),
    Asset("ANIM", "anim/winona_battery_placement.zip"),
}

local prefabs =
{
	"well_water_pipe",
	"well_water_spray",
    "collapse_small",
}

local function GetTilesInRange(inst)
    local range = TUNING.SPRINKLER_RANGE
    local x, y, z = inst.Transform:GetWorldPosition()
    local tiles = {}

    for dx = -range, range do
        for dz = -range, range do
            local tile_x, tile_z = x + dx, z + dz
            local mos = TheWorld.components.farming_manager:IsSoilMoistAtPoint(tile_x, y, tile_z)
            if mos then
                local grid = UpvalueHacker.GetUpvalue(mos,"soilmoisture")
                print("grid = ",grid)
                --local test = TheWorld.components.farming_manager:GetMoistureGrid()
            end
        end
    end
end

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
	if not inst.waterSpray then
		inst.waterSpray = SpawnPrefab("well_water_spray")
		local follower = inst.waterSpray.entity:AddFollower()
		follower:FollowSymbol(inst.GUID, "top", 0, -100, 0)
	end

	inst.droptask = inst:DoPeriodicTask(0.2,function() spawndrop(inst) spawndrop(inst) end)

	inst.spraytask = inst:DoPeriodicTask(0.2,function()
			if inst.components.machine:IsOn() then
                --GetTilesInRange(inst)
				inst.UpdateSpray(inst)
			end
		end)

	inst.sg:GoToState("turn_on")
end

local function TurnOff(inst)
	inst.on = false

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
	return --[[inst.components.fueled ~= nil
            and inst.components.fueled.currentfuel / inst.components.fueled.maxfuel <= .25
            and "LOWFUEL"
            or]] inst.on and "ON"
            or "OFF"
end

local function OnEntitySleep(inst)
    inst.SoundEmitter:KillSound("firesuppressor_idle")
    --[[inst.components.updatelooper:RemoveOnUpdateFn(OnUpdateLightServer)
    SetTarget(inst, nil)
    EnableLight(inst, false)]]
end

local function OnEntityWake(inst)
    --inst.components.updatelooper:AddOnUpdateFn(OnUpdateLightServer)
    if not inst.SoundEmitter:PlayingSound("firesuppressor_idle") then
        inst.SoundEmitter:PlaySound("dangerous_sea/common/water_pump/LP", "firesuppressor_idle")
    end
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

    	if growable_comp ~= nil then
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
    data._systemtype = inst._systemtype
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
        inst._systemtype = data._systemtype or "smart"
    end
end

local function OnLoadPostPass(inst, newents, data)
    if data and not data.onhole then
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

local function addtags(inst)
    inst:AddTag("connected")
    inst:AddTag("haspipe") 
end

--[[local function WeatherCheck(inst)
    if inst:HasTag("connected") then
        if inst:HasTag("stormchecker") then
            inst:ListenForEvent("ms_stormchanged", function(src, data)
                if data.stormtype == STORM_TYPES.SANDSTORM then
                    OnSandstormChanged(inst, data.setting)
                end
            end, TheWorld)
            OnSandstormChanged(inst, TheWorld.components.sandstorms ~= nil and TheWorld.components.sandstorms:IsSandstormActive())
        elseif not inst:HasTag("dummy") then
            inst:WatchWorldState("snowlevel", OnSnowLevel)
            OnSnowLevel(inst, TheWorld.state.snowlevel)
        end
    end
end]]

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

local PLACER_SCALE = 1.5
local SPRINKLER_PLACER_SCALE = 2.4

local function OnUpdatePlacerHelper(helperinst)
    if not helperinst.placerinst:IsValid() then
        helperinst.components.updatelooper:RemoveOnUpdateFn(OnUpdatePlacerHelper)
        helperinst.AnimState:SetAddColour(0, 0, 0, 0)
    else
        local range = TUNING.WINONA_BATTERY_RANGE - TUNING.WINONA_ENGINEERING_FOOTPRINT
        local hx, hy, hz = helperinst.Transform:GetWorldPosition()
        local px, py, pz = helperinst.placerinst.Transform:GetWorldPosition()
        --<= match circuitnode FindEntities range tests
        if distsq(hx, hz, px, pz) <= range * range and TheWorld.Map:GetPlatformAtPoint(hx, hz) == TheWorld.Map:GetPlatformAtPoint(px, pz) then
            helperinst.AnimState:SetAddColour(helperinst.placerinst.AnimState:GetAddColour())
        else
            helperinst.AnimState:SetAddColour(0, 0, 0, 0)
        end
    end
end

local function CreatePlacerRing()
    local inst = CreateEntity()

    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")
    inst:AddTag("placer")

    inst.AnimState:SetBank("well_sprinkler_placement")
    inst.AnimState:SetBuild("well_sprinkler_placement")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetLightOverride(1)
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(1)
    inst.AnimState:SetScale(SPRINKLER_PLACER_SCALE, SPRINKLER_PLACER_SCALE)
    inst.AnimState:SetAddColour(0, .2, .5, 0)

    return inst
end

local function CreatePlacerBatteryRing()
    local inst = CreateEntity()

    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")
    inst:AddTag("placer")

    inst.AnimState:SetBank("winona_battery_placement")
    inst.AnimState:SetBuild("winona_battery_placement")
    inst.AnimState:PlayAnimation("idle_small")
    inst.AnimState:SetLightOverride(1)
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(1)
    inst.AnimState:SetScale(PLACER_SCALE, PLACER_SCALE)

    CreatePlacerRing().entity:SetParent(inst.entity)

    return inst
end

local function OnEnableHelper(inst, enabled, recipename, placerinst)
    if enabled then
        if inst.helper == nil and inst:HasTag("HAMMER_workable") and not inst:HasTag("burnt") then
            inst.helper = CreatePlacerBatteryRing()
            inst.helper.entity:SetParent(inst.entity)
            if placerinst and (
                placerinst.prefab == "winona_battery_low_item_placer" or
                placerinst.prefab == "winona_battery_high_item_placer" or
                recipename == "winona_battery_low" or
                recipename == "winona_battery_high"
            ) then
                inst.helper:AddComponent("updatelooper")
                inst.helper.components.updatelooper:AddOnUpdateFn(OnUpdatePlacerHelper)
                inst.helper.placerinst = placerinst
                OnUpdatePlacerHelper(inst.helper)
            end
        end
    elseif inst.helper ~= nil then
        inst.helper:Remove()
        inst.helper = nil
    end
end

local function NotifyCircuitChanged(inst, node)
    node:PushEvent("engineeringcircuitchanged")
end

local function OnCircuitChanged(inst)
    --Notify other connected batteries
    inst.components.circuitnode:ForEachNode(NotifyCircuitChanged)
end

local function EnableMoistureSearch(inst, enable)
    if inst._turnofftask then
        inst._turnofftask:Cancel()
        inst._turnofftask = nil
    end
    if not enable then
        inst._updatedelay = nil
        --[[SetTarget(inst, nil)
        EnableLight(inst, false)]]
    elseif inst._updatedelay == nil then
        if not inst:IsAsleep() then
            inst._updatedelay = 0
            --OnUpdateLightServer(inst, 0)
        end
        inst._updatedelay = math.random() * UPDATE_TARGET_PERIOD
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

local function OnSnowLevel(inst)
    local snowlevel = TheWorld.state.snowlevel
    if snowlevel > .02 then
        if not inst.pondisfrozen then
            inst.pondisfrozen = true
        end
    elseif inst.pondisfrozen or inst.pondisfrozen == nil then
        inst.pondisfrozen = false
    end
    return inst.pondisfrozen
end

local function WeatherCheck(inst)
    if not TheWorld.state.israining and not OnSnowLevel(inst) then
        EnableMoistureSearch(inst, true)
    elseif inst._turnofftask == nil then
        inst._turnofftask = inst:DoTaskInTime(2 + math.random() * 0.5, EnableMoistureSearch, false)
    end
end

local function ChackStorm(inst, src, data)
    if data.stormtype == STORM_TYPES.SANDSTORM then
        OnSandstormChanged(inst, data.setting)
    end
end

local function SetPowered(inst, powered, duration, ispipe)
    if not powered then
        if inst._powertask then
            inst._powertask:Cancel()
            inst._powertask = nil
            inst.sg:GoToState("turn_off")
            inst:StopWatchingWorldState("israining",WeatherCheck)
            if ispipe then
                if inst:HasTag("stormchecker") then
                    inst:RemoveEventCallback("ms_stormchanged",ChackStorm, TheWorld)
                elseif not inst:HasTag("dummy") then
                    inst:StopWatchingWorldState("snowlevel", WeatherCheck)
                end
            end
        end
        --[[EnableTargetSearch(inst, false)
        SetLedStatusOff(inst)]]
    else
        local waspowered = inst._powertask ~= nil
        local remaining = waspowered and GetTaskRemaining(inst._powertask) or 0
        if duration > remaining then
            if inst._powertask then
                inst._powertask:Cancel()
            end
            inst._powertask = inst:DoTaskInTime(duration, SetPowered, false)
            if not waspowered then
                inst.sg:GoToState("turn_on")
                inst:WatchWorldState("israining", WeatherCheck)
                --EnableMoistureSearch(inst, true)
                if ispipe then
                    if inst:HasTag("stormchecker") then
                        inst:ListenForEvent("ms_stormchanged",ChackStorm, TheWorld)
                        OnSandstormChanged(inst, TheWorld.components.sandstorms ~= nil and TheWorld.components.sandstorms:IsSandstormActive())
                    elseif not inst:HasTag("dummy") then
                        inst:WatchWorldState("snowlevel", WeatherCheck)
                    end
                end
                WeatherCheck(inst)
            end
        end
    end
end

local function AddBatteryPower(inst, power)
    if inst._watertask then
        inst._watertask:Cancel()
    end
    if inst:HasTag("hashole") then
        SetPowered(inst, true, power)
    elseif inst:HasTag("haspipe") and inst:HasTag("connected") then
        SetPowered(inst, true, power, true)
    else
        inst._watertask = inst:DoTaskInTime(0, AddBatteryPower, power)
    end
end

local function DoWireSparks(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/together/spot_light/electricity", nil, .5)
    --SpawnPrefab("winona_battery_sparks").entity:AddFollower():FollowSymbol(inst.GUID, "wire", 0, 0, 0)
    --[[if inst.components.updatelooper ~= nil then
        if inst._flash == nil then
            inst.components.updatelooper:AddOnUpdateFn(OnUpdateSparks)
        end
        --inst._flash = 1
        OnUpdateSparks(inst)
    end]]
end

local function OnConnectCircuit(inst)--, node)
    if not inst._wired  then
        inst._wired = true
        inst.AnimState:ClearOverrideSymbol("wire")
        if not POPULATING then
            DoWireSparks(inst)
        end
    end
    OnCircuitChanged(inst)
end

local function OnDisconnectCircuit(inst)--, node)
    if inst.components.circuitnode:IsConnected() then
        OnCircuitChanged(inst)
    elseif inst._wired then
        inst._wired = nil
        --This will remove mouseover as well (rather than just :Hide("wire"))
        --inst.AnimState:OverrideSymbol("wire", "winona_spotlight", "dummy")
        DoWireSparks(inst)
        SetPowered(inst, false)
    end
end

local function ChangeToItem(inst)
    local item = SpawnPrefab("well_winona_sprinkler_kit")
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    if inst.onhole ~= nil then
        local hole = SpawnPrefab("hole")
        hole.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif inst.pipes ~= nil then
        RetractPipes(inst)
    end
    item.AnimState:PushAnimation("idle_sprinkler_kit", false)
    item.SoundEmitter:PlaySound("meta4/winona_spotlight/collapse")
    if inst._wired then
        item.SoundEmitter:PlaySound("dontstarve/common/together/spot_light/electricity", nil, .5)
        SpawnPrefab("winona_battery_sparks").Transform:SetPosition(inst.Transform:GetWorldPosition())
    end
end

local function OnDismantle(inst)--, doer)
    ChangeToItem(inst)
    inst:Remove()
end

local function OnStartHelper(inst)--, recipename, placerinst)
    if inst.AnimState:IsCurrentAnimation("place") then
        inst.components.deployhelper:StopHelper()
    end
end

local function OnInit(inst)
    inst._inittask = nil
    inst.components.circuitnode:ConnectTo("engineeringbattery")
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

	--[[inst.AnimState:SetBank("well_winona_sprinkler")
	inst.AnimState:SetBuild("well_winona_sprinkler")]]
    inst.AnimState:SetBank("well_sprinkler")
    inst.AnimState:SetBuild("well_sprinkler")  
	inst.AnimState:PlayAnimation("idle_off")

    inst:AddTag("engineering")
    inst:AddTag("engineeringbatterypowered")
    inst:AddTag("structure")
	inst:AddTag("forfarm")
    inst:AddTag("alwayson")
    inst:AddTag("dismantleable")

	if not TheNet:IsDedicated() then
		inst:AddComponent("deployhelper")
        inst.components.deployhelper.onenablehelper = OnEnableHelper
        inst.components.deployhelper.onstarthelper = OnStartHelper
    end

    inst:AddComponent("updatelooper")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = GetStatus

	--[[inst:AddComponent("machine")
	inst.components.machine.turnonfn = TurnOn
	inst.components.machine.turnofffn = TurnOff
	inst.components.machine.cooldowntime = 0.5

    inst:AddComponent("wateringmachine")]]

	inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("dismantleable")
    inst.components.dismantleable:SetOnDismantleFn(OnDismantle)

    inst:AddComponent("circuitnode")
    inst.components.circuitnode:SetRange(TUNING.WINONA_BATTERY_RANGE)
    inst.components.circuitnode:SetFootprint(TUNING.WINONA_ENGINEERING_FOOTPRINT)
    inst.components.circuitnode:SetOnConnectFn(OnConnectCircuit)
    inst.components.circuitnode:SetOnDisconnectFn(OnDisconnectCircuit)
    inst.components.circuitnode.connectsacrossplatforms = false
    inst.components.circuitnode.rangeincludesfootprint = true

    inst:AddComponent("powerload")
    inst.components.powerload:SetLoad(TUNING.WINONA_SPOTLIGHT_POWER_LOAD_OFF, true)

    inst:ListenForEvent("engineeringcircuitchanged", OnCircuitChanged)

	inst:SetStateGraph("SGwell_winona_sprinkler")

	inst.moisturizing = 2
	inst.UpdateSpray = UpdateSpray

	inst.OnSave = OnSave 
    inst.OnLoad = OnLoad
    inst.OnLoadPostPass = OnLoadPostPass
    inst.OnEntitySleep = OnEntitySleep
    --inst.OnEntityWake = OnEntityWake
    inst.AddBatteryPower = AddBatteryPower

    inst._engineerid = nil

    inst._wired = nil
    inst._flash = nil
    inst.onhole = nil
    inst.waterSpray = nil
    inst._updatedelay = nil
    inst._ledblinkdelay = nil
    inst._watertask = nil
    inst._systemtype = "smart"
    inst._inittask = inst:DoTaskInTime(0, OnInit)

	inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("pipedone",addtags)

	MakeSnowCovered(inst, .01)

	inst:DoTaskInTime(0,PipeCheck)

	return inst
end

return Prefab("well_winona_sprinkler", fn, assets, prefabs)