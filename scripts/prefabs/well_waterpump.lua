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

local function SetSection(meter, num)
	meter.AnimState:SetPercent("idle", num)
end

local function meterfn(inst)
	if inst._meter then
		local num = inst.components.steampressure:GetPressurePercent()
		inst._meter.SetSection(inst._meter ,num)
	end
end

local function SetPressureSection(newsection, oldsection, inst)
	if inst.components.machine:IsOn() and newsection > oldsection and not inst.sg:HasStateTag("busy") then
		inst.sg:GoToState("clutch")
	end
end

local function TurnOff(inst, instant)
	inst.sg:GoToState("turn_off")
	inst.components.steampressure:StopGetPressure()
end

local function TurnOn(inst, instant)
	inst.sg:GoToState("turn_on")
	inst.components.steampressure:GetPressure()
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

local function OnTaken(inst, taker, delta)
	if not inst.sg:HasStateTag("busy") then
		local ison = inst.components.machine:IsOn()
		inst.sg:GoToState("pumping",ison)
	end
end

local function onhit(inst, worker)
	if not inst.sg:HasStateTag("busy") then
		local ison = inst.components.machine:IsOn()
		inst.sg:GoToState("hit",ison)
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

local function SetMeter(inst)
	if inst._meter then
		local num = inst.components.steampressure:GetPressurePercent()
		inst._meter.SetSection(inst._meter,num)
	end
end

local function ShowMeter(inst)
	if inst._meter then
		SetMeter(inst)
		inst._meter:Show()--.AnimState:Show("meter_needle")
	end
end

local function HideMeter(inst)
	if inst._meter then
		inst._meter:Hide()--.AnimState:Hide("meter_needle")
	end
end

local function OnSpawnIn(inst)
	inst.entity:Show()

	local x, y, z = inst.Transform:GetWorldPosition()
	local lunacyarea = TheWorld.Map:FindVisualNodeAtPoint(x, y, z , "lunacyarea") ~= nil
	inst.components.water:SetWaterType(lunacyarea and WATERTYPE.MINERAL or WATERTYPE.CLEAN)

	if not inst.sg:HasStateTag("active") then
		inst.sg:GoToState("place")
	else
		SetMeter(inst)
	end
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
    inst.entity:Hide()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("well_waterpump.tex")

	inst:AddTag("watersource")
    inst:AddTag("well_waterpump")
    inst:AddTag("structure")
    inst:AddTag("cleanwaterproduction")
    inst:AddTag("alwayson")
	
	MakeObstaclePhysics(inst, .5)

    inst:DoTaskInTime(0.5,function()
    	inst._meter = SpawnPrefab("well_waterpump_meter")
		inst:AddChild(inst._meter)
		inst._meter.entity:SetParent(inst.entity)
		inst._meter:Hide()
	end)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetBank("well_waterpump")
    inst.AnimState:SetBuild("well_waterpump")
    inst.AnimState:PlayAnimation("deactive")

    inst:AddComponent("steampressure")
    inst.components.steampressure:SetDepletedFn(OnDeplete)
    inst.components.steampressure:SetChargingDoneFn(SetChargingDoneFn)
    inst.components.steampressure:SetPressureSectionFn(SetPressureSection)
    inst.components.steampressure:SetTakeWaterFn(OnTaken)
    inst.components.steampressure:SetPressureSections(4)
    inst.components.steampressure:SetPressure(100)
    inst.components.steampressure.meterfn = meterfn
    inst._steampressure = inst.components.steampressure.pressuresection

    inst:AddComponent("machine")
    inst.components.machine.turnonfn = TurnOn
    inst.components.machine.turnofffn = TurnOff
    inst.components.machine.cooldowntime = 2

    inst:AddComponent("wateringmachine")

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

	inst:AddComponent("lootdropper")

	inst:AddComponent("water")
	inst.components.water:SetOnTakenFn(OnTaken)

	inst:AddComponent("watersource")

	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:SetStateGraph("SGwell_waterpump")

	inst:DoTaskInTime(0, OnSpawnIn)

	inst:ListenForEvent("setmeter", SetMeter)
	inst:ListenForEvent("showmeter", ShowMeter)
	inst:ListenForEvent("hidemeter", HideMeter)

	return inst
end

local function meterfn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.entity:AddTag("overridetop")

    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")

	inst.AnimState:SetBank("well_waterpump_meter")
	inst.AnimState:SetBuild("well_waterpump_meter")
	inst.AnimState:SetPercent("idle", 0)

	inst.SetSection = SetSection

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	return inst
end

return Prefab("well_waterpump", fn, assets, prefabs),
Prefab("well_waterpump_meter", meterfn, assets, prefabs)