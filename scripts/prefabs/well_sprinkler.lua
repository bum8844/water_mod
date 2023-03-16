local assets =
{
	Asset("ANIM", "anim/well_sprinkler.zip"),

	Asset("ANIM", "anim/well_sprinkler_placement.zip"),
	Asset("ANIM", "anim/well_sprinkler_meter.zip"),
	Asset("MINIMAP_IMAGE", "firesuppressor"),
}

local projectile_assets =
{
	Asset("ANIM", "anim/firefighter_projectile.zip")
}

local prefabs =
{
	"well_water_spray",
}

local function spawndrop(inst)
	local drop = SpawnPrefab("raindrop")
	local pt = Vector3(inst.Transform:GetWorldPosition())
	local angle = math.random()*2*math.pi
	local dist = math.random()*TUNING.SPRINKLER_RANGE
	local offset = Vector3(dist * math.cos( angle ), 0, -dist * math.sin( angle ))
	drop.Transform:SetPosition(pt.x+offset.x,0,pt.z+offset.z)
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


	if inst.moisture_targets then
		for GUID, i in pairs(inst.moisture_targets)do
			print("TURN OFF",i.prefab)
			if i.components.moisture then
				i.components.moisture.moisture_sources[inst.GUID] = nil
			end
			if i.growwithsprinkler then
				i:RemoveTag("sprinkled")
				i.testForGrowth(i)
			end
		end
	end

	inst.sg:GoToState("turn_off")
end

local function OnFuelEmpty(inst)
	inst.components.machine:TurnOff()
end

local function OnFuelSectionChange(new, old, inst)
    if inst._fuellevel ~= new then
        inst._fuellevel = new
        inst.AnimState:OverrideSymbol("swap_meter", "sprinkler_meter", tostring(new))
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

local function OnSave(inst, data)
	if inst:HasTag("burnt") or inst:HasTag("fire") then
        data.burnt = true
    end

    data.on = inst.on

    local refs = {}

    if inst.waterSpray then
	    data.waterSpray = inst.waterSpray.GUID
	    table.insert(refs, inst.waterSpray.GUID)
	end

    return refs
end

local function OnLoad(inst, data)
	if data and data.burnt and inst.components.burnable and inst.components.burnable.onburnt then
        inst.components.burnable.onburnt(inst)
    end

    inst.on = data.on and data.on or false
end

local function OnLoadPostPass(inst, newents, data)
	if data and data.waterSpray then
		inst.waterSpray = newents[data.waterSpray].entity
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle_off")
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/firesupressor_craft")
end

local function UpdateSpray(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, RANGE)

	if not inst.moisture_targets then
		inst.moisture_targets = {}
	end
	inst.moisture_targets_old = {}
	for GUID,v in pairs(inst.moisture_targets) do
    	inst.moisture_targets_old[GUID] = v
	end
    inst.moisture_targets = {} 

    for k,v in pairs(ents) do
    	inst.moisture_targets[v.GUID] = v
		if v.components.moisture then
			if not v.components.moisture.moisture_sources then
				v.components.moisture.moisture_sources = {}
			end
			v.components.moisture.moisture_sources[inst.GUID] = inst.moisturizing			
		end

		if v.components.moisturelistener and not (v.components.inventoryitem and v.components.inventoryitem.owner) then
			v.components.moisturelistener:AddMoisture(TUNING.MOISTURE_SPRINKLER_PERCENT_INCREASE_PER_SPRAY)		
		end


		if v.components.crop and v.components.crop.task then

			v.components.crop.growthpercent = v.components.crop.growthpercent + (0.001)
		end

		if v.components.burnable and not (v.components.inventoryitem and v.components.inventoryitem.owner) then
			v.components.burnable:Extinguish()
		end

		if v.growwithsprinkler then
			v:AddTag("sprinkled")
			v.testForGrowth(v)
		end		
	end

	for GUID,v in pairs(inst.moisture_targets_old)do
		local still_affected = false
		for iGUID, i in pairs(inst.moisture_targets)do
			if GUID == iGUID then
				still_affected = true
				break
			end
		end
		if not still_affected then	
			if v.components.moisture then
				v.components.moisture.moisture_sources[inst.GUID] = nil
			end

			if v.growwithsprinkler then
				v:RemoveTag("sprinkled")
				v.testForGrowth(v)
			end			
		end
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
	inst.SoundEmitter:KillSound("idleloop")
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end


local function fn()
	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()

	local minimap = inst.entity:AddMiniMapEntity()	
	minimap:SetPriority(5)
	minimap:SetIcon("sprinkler.png")

	MakeObstaclePhysics(inst, 1)

	anim:SetBank("sprinkler")
	anim:SetBuild("sprinkler")
	anim:PlayAnimation("idle_off")
	inst.on = false

	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = GetStatus

	inst:AddComponent("machine")
	inst.components.machine.turnonfn = TurnOn
	inst.components.machine.turnofffn = TurnOff
	inst.components.machine.caninteractfn = CanInteract
	inst.components.machine.cooldowntime = 0.5

	inst:AddComponent("fueled")
	inst.components.fueled:SetDepletedFn(OnFuelEmpty)
	inst.components.fueled.accepting = true
	inst.components.fueled:SetSections(10)
	inst.components.fueled:SetSectionCallback(OnFuelSectionChange)
	inst.components.fueled:InitializeFuelLevel(TUNING.SPRINKLER_MAX_FUEL_TIME)
	inst.components.fueled.bonusmult = 5
	inst.components.fueled.secondaryfueltype = "CHEMICAL"

	inst.AnimState:OverrideSymbol("swap_meter", "sprinkler_meter", 10)

	inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:SetStateGraph("SGsprinkler")

	inst.moisturizing = 2
	inst.UpdateSpray = UpdateSpray

	inst.OnSave = OnSave 
    inst.OnLoad = OnLoad
    inst.OnLoadPostPass = OnLoadPostPass
    inst.OnEntitySleep = OnEntitySleep

	inst:ListenForEvent("onbuilt", onbuilt)

	MakeSnowCovered(inst, .01)

	inst.waterSpray = nil

	return inst
end

return Prefab("well_sprinkler", fn, assets, prefabs)