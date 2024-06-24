local asset = {
   Asset("ANIM", "anim/steamdesalinator.zip"),
   Asset("ANIM", "anim/steamdesalinator_meter.zip"),
}

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
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:OverrideSymbol("swap_meter", "steamdesalinator_meter", "0")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("steampressure")
    inst.components.steampressure:SetDepletedFn(OnDeplete)
    inst.components.steampressure:SetChargingDoneFn(SetChargingDoneFn)
    inst.components.steampressure:SetPressureSectionFn(SetPressureSection)
    inst.components.steampressure:SetTakeWaterFn(OnTaken)
    inst.components.steampressure:SetPressureSections(32)
    inst.components.steampressure:SetPressure(100)
    --inst.components.steampressure.meterfn = meterfn
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
    inst.components.inspectable.getstatus = getstatus

	inst:AddComponent("lootdropper")

	inst:AddComponent("water")
	inst.components.water:SetOnTakenFn(OnTaken)

	inst:AddComponent("pickable")
    inst.components.pickable.canbepicked = true
    inst.components.pickable.product = "water_clean"
    inst.components.pickable:SetOnPickedFn(OnPickedFn)

	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

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
        steamdesalinator.AnimState:PushAnimation("idle")
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
Prefab("steamdesalinator_kit",fn_kitm,asset),
MakePlacer("steamdesalinator_placer","steamdesalinator","steamdesalinator","idle",nil)
