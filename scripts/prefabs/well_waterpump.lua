require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/well_waterpump.zip"),
	Asset("ANIM", "anim/well_waterpump_meter.zip"),
}

local prefabs =
{
	"water_clean",
	"collapse_small",
}

local function TurnOff(inst, instant)
	inst.components.steampressure:StopGetPressure()
	inst.SoundEmitter:KillSound("loop_active")
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/downgrade")
	inst.AnimState:PlayAnimation("stopping")
	inst.AnimState:PushAnimation("idle_stop",true)
	inst.SoundEmitter:PlaySound("dontstarve/common/together/dragonfly_furnace/fire_LP", "loop_deactive")
end

local function TurnOn(inst, instant)
	inst.components.steampressure:GetPressure()
	inst.SoundEmitter:KillSound("loop_deactive")
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/upgrade")
	inst.AnimState:PlayAnimation("activeing")
	inst.AnimState:PushAnimation("idle_active",true)
	inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp", "loop_active")
end

local function SetChargingDoneFn(inst)
	inst.components.water.available = true
	inst.components.watersource.available = true
	inst:DoTaskInTime(0,function(inst)
		inst.components.machine.ison = false
		inst.components.machine.turnofffn(inst)
	end)
end

local function OnDeplete(inst)
	inst.components.water.available = false
	inst.components.watersource.available = false
	inst:DoTaskInTime(0,function(inst)
		inst.components.machine.ison = true
		inst.components.machine.turnonfn(inst)
	end)
end

local function SetPressureSection(newsection, oldsection, inst)
    if new ~= nil then
        if inst._steampressure ~= new then
            inst._steampressure = new
        end
    end
    inst.AnimState:OverrideSymbol("swap", "well_waterpump_meter", tostring(inst._steampressure))
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/upgrade")
end

local function OnTaken(inst, taker, delta)
	inst.SoundEmitter:KillSound("loop_active")
	inst.SoundEmitter:KillSound("loop_deactive")
	inst.AnimState:PlayAnimation("pumping")
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/downgrade")
	if inst.components.machine:IsOn() then
		inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp", "loop_active")
		inst.AnimState:PushAnimation("idle_active",true)
	else
		inst.SoundEmitter:PlaySound("dontstarve/common/together/dragonfly_furnace/fire_LP", "loop_deactive")
		inst.AnimState:PushAnimation("idle_stop",true)
	end
end

local function onhit(inst, worker)
	inst.SoundEmitter:KillSound("loop_active")
	inst.SoundEmitter:KillSound("loop_deactive")
	inst.AnimState:PlayAnimation("hit")
	inst.SoundEmitter:PlaySound("grotto/common/turf_crafting_station/hit")
	if inst.components.machine:IsOn() then
		inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp", "loop_active")
		inst.AnimState:PushAnimation("idle_active",true)
	else
		inst.SoundEmitter:PlaySound("dontstarve/common/together/dragonfly_furnace/fire_LP", "loop_deactive")
		inst.AnimState:PushAnimation("idle_stop",true)
	end
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.machine.turnofffn(inst)
	inst.SoundEmitter:KillSound("loop_active")
    local fx = SpawnPrefab("collapse_small")

    local hole = SpawnPrefab("hole")
    hole.Transform:SetPosition(inst.Transform:GetWorldPosition())

    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
	inst.components.lootdropper:DropLoot()
	inst:Remove()
end

local function getstatus(inst, viewer)
	return not inst.components.steampressure:IsDepleted() 
		   and (inst.components.steampressure:IsLowPressure() and "LOW_PRESSURE"
		   or inst.components.steampressure:IsHighPressure() and "HIGH_PRESSURE" 
		   or "MIDDLE_PRESSURE" ) or "RECHARG_PRESSURE"
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("well_waterpump.tex")

	inst:AddTag("watersource")
    inst:AddTag("well_waterpump")
    inst:AddTag("structure")
    inst:AddTag("cleanwaterproduction")
    inst:AddTag("alwayson")

    inst:AddComponent("steampressure")
	
	MakeObstaclePhysics(inst, .5)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetBank("well_waterpump")
    inst.AnimState:SetBuild("well_waterpump")
    inst.AnimState:PlayAnimation("idle_stop",true)

    inst.components.steampressure:SetDepletedFn(OnDeplete)
    inst.components.steampressure:SetChargingDoneFn(SetChargingDoneFn)
    --inst.components.steampressure:SetPressureSectionFn(SetPressureSection)
    inst.components.steampressure:SetTakeWaterFn(OnTaken)
    inst.components.steampressure:SetPressureSections(50)
    inst.components.steampressure:SetPressure(100)
    inst._steampressure = inst.components.steampressure.pressuresection

    --inst.AnimState:OverrideSymbol("swap", "well_waterpump_meter", tostring(math.ceil(inst._steampressure/2)))

    inst:AddComponent("machine")
    inst.components.machine.turnonfn = TurnOn
    inst.components.machine.turnofffn = TurnOff
    inst.components.machine.cooldowntime = 0.5

    inst:AddComponent("wateringmachine")

    -- inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp", "loop_active")
    inst.SoundEmitter:PlaySound("dontstarve/common/together/dragonfly_furnace/fire_LP", "loop_deactive")

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

	inst:AddComponent("lootdropper")

	inst:AddComponent("water")
	inst.components.water:SetWaterType(WATERTYPE.CLEAN)
	inst.components.water:SetOnTakenFn(OnTaken)

	inst:AddComponent("watersource")

	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:ListenForEvent("depleted_pressure")

	return inst
end

return Prefab("well_waterpump", fn, assets, prefabs)