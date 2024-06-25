local asset = {
   Asset("ANIM", "anim/steamdesalinator.zip"),
   Asset("ANIM", "anim/steamdesalinator_meter.zip"),
}

local function SetPressureSection(newsection, oldsection, inst)
    local new_val = math.floor(newsection/4)
    local old_vel = math.floor(oldsection/4)
    if inst.components.machine:IsOn() and new_val > old_vel and not inst.sg:HasStateTag("busy") then
        inst.sg:GoToState("clutch")
    end
    if inst._steampressure ~= newsection then
        inst._steampressure = newsection
        inst.AnimState:OverrideSymbol("swap", "steamdesalinator_meter", tostring(newsection))
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

local function SetPickedFn(inst,picker,loot)
    if inst.components.steampressure.depleted then
        inst.components.pickable.canbepicked = false
    else
        inst.components.pickable.canbepicked = true
    end
end

local function OnLostPressureFn(inst,picker,loot)
    inst.components.steampressure:LostPressure()
end 

local function SetChargingDoneFn(inst)
    inst.components.pickable.canbepicked = true
    inst:DoTaskInTime(0,function(inst)
        inst.components.machine.ison = false
        inst.components.machine.turnofffn(inst)
    end)
end

local function OnDeplete(inst)
    inst.components.pickable.canbepicked = false
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

local function SetProduct(inst, chk)
    inst.components.pickable.canbepicked = true
    inst.components.pickable.product = "water_clean"
    if chk then
        inst.components.pickable.product = "saltrock"
    end
    if inst.components.steampressure.depleted then
        inst.components.pickable.canbepicked = false
    end
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

    inst:AddTag("watersource")
    inst:AddTag("structure")
    inst:AddTag("cleanwaterproduction")
    inst:AddTag("alwayson")

    inst.AnimState:SetBuild("steamdesalinator")
    inst.AnimState:SetBank("steamdesalinator")
    inst.AnimState:PlayAnimation("deactive")
    inst.AnimState:OverrideSymbol("swap_meter", "steamdesalinator_meter", "0")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("steampressure")
    inst.components.steampressure:SetDepletedFn(OnDeplete)
    inst.components.steampressure:SetProductFn(SetProduct)
    inst.components.steampressure:SetChargingDoneFn(SetChargingDoneFn)
    inst.components.steampressure:SetPressureSectionFn(SetPressureSection)
    inst.components.steampressure:SetTakeWaterFn(OnTaken)
    inst.components.steampressure:SetPressureSections(32)
    inst.components.steampressure:SetPressure(100)
    inst._steampressure = inst.components.steampressure.pressuresection

    inst:AddComponent("machine")
    inst.components.machine.turnonfn = TurnOn
    inst.components.machine.turnofffn = TurnOff
    inst.components.machine.cooldowntime = 2

    inst:AddComponent("waterlevel")
    inst.components.waterlevel.noneboil = false

    inst:AddComponent("saltmaker")
    inst.components.saltmaker.canchangestate = true

    inst:AddComponent("wateringmachine")

    inst:AddComponent("inspectable")
    --inst.components.inspectable.getstatus = getstatus

	inst:AddComponent("lootdropper")

	inst:AddComponent("pickable")
    inst.components.pickable.canbepicked = true
    inst.components.pickable.product = "water_clean"
    inst.components.pickable:SetOnPickedFn(OnLostPressureFn)

	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

    inst:ListenForEvent("picked",SetPickedFn)

    inst:SetStateGraph("SGwell_waterpump")

	return inst
end

local function PlaceTestFn(inst, pt, mouseover, deployer)
    return TheWorld.Map:IsDockAtPoint(pt.x, 0, pt.z) or TheWorld.Map:IsPassableAtPointWithPlatformRadiusBias(x,y,z,false,false,TUNING.BOAT.NO_BUILD_BORDER_RADIUS,true)
end

local function ondeploy(inst, pt, deployer)
    local steamdesalinator = SpawnPrefab("steamdesalinator")
    if steamdesalinator ~= nil then
        steamdesalinator.Physics:SetCollides(false)
        steamdesalinator.Physics:Teleport(pt.x, 0, pt.z)
        steamdesalinator.Physics:SetCollides(true)
        steamdesalinator.AnimState:PlayAnimation("place")
        steamdesalinator.AnimState:PushAnimation("deactive")
        steamdesalinator.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl2_place")
        inst:Remove()
    end
end

local function fn_kit()
	local inst = CreateEntity()

	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBuild("steamdesalinator")
    inst.AnimState:SetBank("item")
    inst.AnimState:PlayAnimation("steamdesalinator_kit")

    MakeInventoryPhysics(inst)

    inst._custom_candeploy_fn = PlaceTestFn

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst.components.deployable.ondeploy = ondeploy

    inst:AddComponent("inspectable")

	inst:AddComponent("inventoryitem")

	return inst
end

return Prefab("steamdesalinator",fn,asset),
Prefab("steamdesalinator_kit",fn_kit,asset),
MakePlacer("steamdesalinator_placer","steamdesalinator","steamdesalinator","idle",nil)
