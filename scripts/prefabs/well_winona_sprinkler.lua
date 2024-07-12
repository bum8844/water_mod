local UpvalueHacker = require("utils/upvaluehacker")

local UPDATE_TARGET_PERIOD = .5

require("constants")
local BLOCKERS_TAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "playerghost", "ghost", "flying", "structure" }
local NEED_TAGS = { "sprinkler_water" }
local range = TUNING.FIND_WATER_RANGE
local WATER_RADIUS = 3.8

local assets =
{
	Asset("ANIM", "anim/well_winona_sprinkler.zip"),
	Asset("ANIM", "anim/well_sprinkler_placement.zip"),
    Asset("ANIM", "anim/winona_battery_placement.zip"),
}

local prefabs =
{
	"well_water_pipe",
	"well_water_spray",
    "collapse_small",
}

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
        if v:HasTag("oasislake") then
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

local function NotifyCircuitChanged(inst, node)
    node:PushEvent("engineeringcircuitchanged")
end

local function OnCircuitChanged(inst)
    --Notify other connected batteries
    inst.components.circuitnode:ForEachNode(NotifyCircuitChanged)
end

local function TurnOn(inst)

    inst._on = true

    if not inst.waterSpray then
        inst.waterSpray = SpawnPrefab("well_water_spray")
        local follower = inst.waterSpray.entity:AddFollower()
        follower:FollowSymbol(inst.GUID, "top", 0, -100, 0)
    end

    inst.droptask = inst:DoPeriodicTask(0.2,function()
        spawndrop(inst) 
        spawndrop(inst)
        spawndrop(inst) 
        spawndrop(inst)
    end)

    inst.spraytask = inst:DoPeriodicTask(0.2,function()
            if inst._powertask then
                inst.UpdateSpray(inst)
            end
        end)
    inst.sg:GoToState("spin_up")
    inst.components.powerload:SetLoad(TUNING.WINONA_WELL_SPRINKLER_POWER_LOAD_ON)
    OnCircuitChanged(inst)
end

local function TurnOff(inst,noanim)

    inst._on = false

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

    if not noanim then
        inst.sg:GoToState("spin_down")
        inst.components.powerload:SetLoad(TUNING.WINONA_WELL_SPRINKLER_POWER_LOAD_OFF)
        OnCircuitChanged(inst)
    end
end

local function GetStatus(inst, viewer)
    return --[[inst.components.fueled ~= nil
            and inst.components.fueled.currentfuel / inst.components.fueled.maxfuel <= .25
            and "LOWFUEL"
            or]] inst.on and "ON"
            or "OFF"
end

local function OnSave(inst, data)
    if inst:HasTag("burnt") or inst:HasTag("fire") then
        data.burnt = true
    end

    data.onhole = inst.onhole
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
    TurnOff(inst,true)
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

local function GetTileMoistureInRange(inst)
    local range = TUNING.SPRINKLER_RANGE
    local x, y, z = inst.Transform:GetWorldPosition()
    local farm_field = 0
    local allmoisture = 0
    local maxmoisture = 100
    local curmoisture = 0

    for dx = -range, range do
        for dz = -range, range do
            local tile_x, tile_z = x + dx, z + dz
            local getmoisture = TheWorld.components.farming_manager:GetTileMoisureAtPoint(tile_x, y, tile_z)
            if getmoisture then
                curmoisture = curmoisture + getmoisture
                farm_field = farm_field + 1
            end
        end
    end
    allmoisture = math.min(maxmoisture,math.floor(curmoisture/farm_field))
    return allmoisture
end

local function MoistureWork(inst)

    local deadline = 50
    local maxline = 95

    local moisture = inst._moisture
    local needwater = moisture < deadline
    local fullwater = moisture >= maxline
    print("moisture",moisture)

    if inst._cleanwheater then
        if needwater and not inst._on then
            TurnOn(inst)
        elseif not fullwater and not inst._on then
            TurnOn(inst)
        elseif not needwater and fullwater and inst._on then
            TurnOff(inst)
        end
    elseif inst._on then
        TurnOff(inst)
    end
end

local function MoistureSearch(inst, keepsearch)
    if inst._moisturetask then
        inst._moisturetask:Cancel()
        inst._moisturetask = nil
    end
    if keepsearch then
        inst._moisture = GetTileMoistureInRange(inst)
        print("평균 수분양 : ",inst._moisture)
        MoistureWork(inst)
        inst._moisturetask = inst:DoTaskInTime(1,MoistureSearch,keepsearch)
    else
        inst._moisturetask = nil
        if inst._on then
            TurnOff(inst)
        else
            inst:PushEvent("smart_off")
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
    inst._cleanwheater = true
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
        inst._cleanwheater = false
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
    if inst:HasTag("haspipe") and (TheWorld.state.israining or OnSnowLevel(inst)) then
        inst._cleanwheater = false
    elseif inst:HasTag("hashole") and TheWorld.state.israining then
        inst._cleanwheater = false
    else
        inst._cleanwheater = true
    end
end


local function DoCheckWeather(inst)
    inst.sg:GoToState("idle_on")
    if inst:HasTag("stormchecker") then
        inst:ListenForEvent("ms_stormchanged",function(src, data)
            if data.stormtype == STORM_TYPES.SANDSTORM then
                OnSandstormChanged(inst, data.setting)
            end
        end,TheWorld)
        OnSandstormChanged(inst, TheWorld.components.sandstorms ~= nil and TheWorld.components.sandstorms:IsSandstormActive())
    elseif inst:HasTag("haspipe") then
        inst:WatchWorldState("israining", WeatherCheck)
        inst:WatchWorldState("snowlevel", WeatherCheck)
        WeatherCheck(inst)
    else
        inst:WatchWorldState("israining", WeatherCheck)
        WeatherCheck(inst)
    end
    MoistureSearch(inst,true)
end

local function SetPowered(inst, powered, duration)
    if inst:HasTag("dummy") then
        return
    end
    if not powered then
        if inst._watertask then
            inst._watertask:Cancel()
            inst._watertask = nil
        end
        if inst._powertask then
            inst._powertask:Cancel()
            inst._powertask = nil
            if inst:HasTag("stormchecker") then
                inst:RemoveEventCallback("ms_stormchanged",function(src, data)
                    if data.stormtype == STORM_TYPES.SANDSTORM then
                        OnSandstormChanged(inst, data.setting)
                    end
                end,TheWorld)
            elseif inst:HasTag("haspipe") then
                inst:StopWatchingWorldState("israining", WeatherCheck)
                inst:StopWatchingWorldState("snowlevel", WeatherCheck)
            else
                inst:StopWatchingWorldState("israining", WeatherCheck)
            end
            MoistureSearch(inst)
        end
    else
        local waspowered = inst._powertask ~= nil
        local checkwater = inst:HasTag("hashole") or inst:HasTag("connected")
        local remaining = waspowered and GetTaskRemaining(inst._powertask) or 0
        if not checkwater then
            if inst._watertask then
                inst._watertask:Cancel()
            end
            inst._watertask = inst:DoTaskInTime(0,SetPowered,powered,duration)
            return
        end
        if duration > remaining then
            if inst._powertask then
                inst._powertask:Cancel()
            end
            inst._powertask = inst:DoTaskInTime(duration, SetPowered, false)
            if not waspowered then
                inst.sg:GoToState("turn_on")
            end
        end
    end
end

local function AddBatteryPower(inst, power)
    SetPowered(inst, true, power)
end

local function OnUpdateSparks(inst)
    if inst._flash > 0 then
        local k = inst._flash * inst._flash
        inst.components.colouradder:PushColour("wiresparks", .3 * k, .3 * k, 0, 0)
        inst._flash = inst._flash - .15
    else
        inst.components.colouradder:PopColour("wiresparks")
        inst._flash = nil
        inst.components.updatelooper:RemoveOnUpdateFn(OnUpdateSparks)
    end
end

local function DoWireSparks(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/together/spot_light/electricity", nil, .5)
    SpawnPrefab("winona_battery_sparks").entity:AddFollower():FollowSymbol(inst.GUID, "wire", 0, 0, 0)
    if inst.components.updatelooper ~= nil then
        if inst._flash == nil then
            inst.components.updatelooper:AddOnUpdateFn(OnUpdateSparks)
        end
        inst._flash = 1
        OnUpdateSparks(inst)
    end
end

local function OnConnectCircuit(inst)--, node)
    if not inst._wired then
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
        inst.AnimState:OverrideSymbol("wire", "well_winona_sprinkler", "dummy")
        DoWireSparks(inst)
        SetPowered(inst, false)
    end
end

local function ChangeToItem(inst)
    local item = SpawnPrefab("well_winona_sprinkler_kit")
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    local anim = ""
    if inst.onhole ~= nil then
        anim = "_hole"
        local hole = SpawnPrefab("hole")
        hole.Transform:SetPosition(inst.Transform:GetWorldPosition())
    elseif inst.pipes ~= nil then
        RetractPipes(inst)
    end
    --item.AnimState:PlayAnimation("collapse"..anim)
    item.AnimState:PushAnimation("idle_sprinkler_kit", false)
    item.SoundEmitter:PlaySound("meta4/winona_spotlight/collapse")
    if inst._wired then
        item.SoundEmitter:PlaySound("dontstarve/common/together/spot_light/electricity", nil, .5)
        SpawnPrefab("winona_battery_sparks").Transform:SetPosition(inst.Transform:GetWorldPosition())
    end
end

local function OnDismantle(inst)--, doer)
    ChangeToItem(inst)
    TurnOff(inst,true)
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

local function OnBuilt(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ent = TheSim:FindEntities(x, y, z,1,{"water_hole"})
    local anim = "place"
    if ent then
        for k, v in pairs(ent) do
            if k then
                anim = anim.."_hole"
                inst.onhole = "hole"
                ent[k]:Remove()
            end
        end
    end
    inst.AnimState:PlayAnimation(anim)
    inst.AnimState:PushAnimation("idle_off")
    inst.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl2_place")
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

    inst.AnimState:SetBank("well_winona_sprinkler")
    inst.AnimState:SetBuild("well_winona_sprinkler")  
	inst.AnimState:PlayAnimation("idle_off")
    inst.AnimState:OverrideSymbol("wire", "well_winona_sprinkler", "dummy")

    inst:AddTag("engineering")
    inst:AddTag("engineeringbatterypowered")
    inst:AddTag("structure")
	inst:AddTag("forfarm")
    inst:AddTag("alwayson")

	if not TheNet:IsDedicated() then
		inst:AddComponent("deployhelper")
        inst.components.deployhelper.onenablehelper = OnEnableHelper
        inst.components.deployhelper.onstarthelper = OnStartHelper
    end

    inst:AddComponent("updatelooper")
    inst:AddComponent("colouradder")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = GetStatus

	inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

    inst:AddComponent("circuitnode")
    inst.components.circuitnode:SetRange(TUNING.WINONA_BATTERY_RANGE)
    inst.components.circuitnode:SetFootprint(TUNING.WINONA_ENGINEERING_FOOTPRINT)
    inst.components.circuitnode:SetOnConnectFn(OnConnectCircuit)
    inst.components.circuitnode:SetOnDisconnectFn(OnDisconnectCircuit)
    inst.components.circuitnode.connectsacrossplatforms = false
    inst.components.circuitnode.rangeincludesfootprint = true

    inst:AddComponent("powerload")
    inst.components.powerload:SetLoad(TUNING.WINONA_WELL_SPRINKLER_POWER_LOAD_OFF)

    inst:ListenForEvent("engineeringcircuitchanged", OnCircuitChanged)

	inst:SetStateGraph("SGwell_winona_sprinkler")

	inst.moisturizing = 2
	inst.UpdateSpray = UpdateSpray

	inst.OnSave = OnSave 
    inst.OnLoad = OnLoad
    inst.OnLoadPostPass = OnLoadPostPass
    inst.AddBatteryPower = AddBatteryPower

    inst._engineerid = nil
    inst._on = false
    inst._wired = nil
    inst._flash = nil
    inst.onhole = nil
    inst.waterSpray = nil
    inst._watertask = nil
    inst._moisturetask = nil
    inst._moisture = 0
    inst._cleanwheater = true
    inst._inittask = inst:DoTaskInTime(0, OnInit)

	inst:ListenForEvent("onbuilt",OnBuilt)
    inst:ListenForEvent("pipedone",addtags)
    inst:ListenForEvent("smart_off",function()inst.sg:GoToState("turn_off")end)
    inst:ListenForEvent("checkweather",DoCheckWeather)

	MakeSnowCovered(inst, .01)

    if not inst.onhole then
	   inst:DoTaskInTime(0,PipeCheck)
    end

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

    local s = 1.175/PLACER_SCALE
    inst.Transform:SetScale(s, s, s)

    inst.AnimState:SetBank("winona_battery_placement")
    inst.AnimState:SetBuild("winona_battery_placement")
    inst.AnimState:PlayAnimation("idle_small")
    inst.AnimState:SetLightOverride(1)
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(1)

    return inst
end

local function CreatePlacerSprinkler()
    local inst = CreateEntity()

    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")
    inst:AddTag("placer")

    local s = 1 / TUNING.SPRINKLER_PLACER_SCALE
    inst.Transform:SetScale(s, s, s)

    inst.AnimState:SetBank("well_sprinkler")
    inst.AnimState:SetBuild("well_sprinkler")
    inst.AnimState:PlayAnimation("idle_off")
    inst.AnimState:SetLightOverride(1)

    return inst
end

local PLACER_SNAP_DISTANCE = 2
local function placer_onupdatetransform(inst)
    local pos = inst:GetPosition()
    local hole = TheSim:FindEntities(pos.x, 0, pos.z, PLACER_SNAP_DISTANCE, { "water_hole" })

    if #hole > 0 then
        local targetpos = hole[1]:GetPosition()
        inst.Transform:SetPosition(targetpos.x, 0, targetpos.z)
        inst.accept_placement = hole[1]:HasTag("water_hole")
    else
        inst.accept_placement = GetValidWaterPointNearby(inst) ~= nil
    end
end

local function placer_override_build_point(inst)
    return inst:GetPosition()
end

local function placer_override_testfn(inst)
    local can_build, mouse_blocked = true, false

    if inst.components.placer.testfn ~= nil then
        can_build, mouse_blocked = inst.components.placer.testfn(inst:GetPosition(), inst:GetRotation())
    end

    can_build = inst.accept_placement

    return can_build, mouse_blocked
end

local function placer_postinit_fn(inst)
    --Show the spotlight placer on top of the spotlight range ground placer
    --Also add the small battery range indicator

    local placer2 = CreatePlacerBatteryRing()
    placer2.entity:SetParent(inst.entity)
    inst.components.placer:LinkEntity(placer2)

    placer2 = CreatePlacerSprinkler()
    placer2.entity:SetParent(inst.entity)
    inst.components.placer:LinkEntity(placer2)

    --inst.AnimState:SetScale(PLACER_SCALE, PLACER_SCALE)

    inst.deployhelper_key = "winona_battery_engineering"

    inst.components.placer.onupdatetransform = placer_onupdatetransform
    inst.components.placer.override_build_point_fn = placer_override_build_point

    inst.components.placer.override_testfn = placer_override_testfn

    inst.accept_placement = false
end

local function MakeSprinkler(inst)
    local sprinkler = SpawnPrefab("well_winona_sprinkler")
    sprinkler.Transform:SetPosition(inst.Transform:GetWorldPosition())
    sprinkler:PushEvent("onbuilt")
    inst:Remove()
end

local function fn_fake()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:ListenForEvent("onbuilt",MakeSprinkler)

    return inst
end

return Prefab("well_winona_sprinkler", fn, assets, prefabs),
Prefab("well_winona_sprinkler_maker",fn_fake, assets),
MakePlacer("well_winona_sprinkler_placer", "well_sprinkler_placement", "well_sprinkler_placement", "idle", true, nil, nil, TUNING.SPRINKLER_PLACER_SCALE, nil, nil, placer_postinit_fn)