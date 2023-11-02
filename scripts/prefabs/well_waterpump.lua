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

local function SetChargingDoneFn(inst)
	inst.components.water.available = true
	inst.components.watersources.available = true
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/upgrade")
	inst.AnimState:PlayAnimation("activeing")
	inst.AnimState:PushAnimation("idle_active",true)
	inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp", "loop_sound")
end

local function OnDeplete(inst)
	inst.components.water.available = false
	inst.components.watersources.available = false
	inst.SoundEmitter:KillSound("loop_sound")
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/downgrade")
	inst.AnimState:PlayAnimation("stopping")
	inst.AnimState:PushAnimation("idle_stop",true)
end

local function SetPressureSection(newsection, oldsection, inst)
    if new ~= nil then
        if inst._steampressure ~= new then
            inst._steampressure = new
        end
    end
    inst.AnimState:OverrideSymbol("swap", "well_waterpump_meter", tostring(inst._steampressure)))
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/upgrade")
end

local function OnTaken(inst, taker, delta)
	inst.components.steampressure:LostPressure()
	inst.AnimState:PlayAnimation("pumping")
	inst.AnimState:PushAnimation("idle_active",true)
	inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/downgrade")
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	inst.SoundEmitter:PlaySound("grotto/common/turf_crafting_station/hit")
	if inst.components.steampressure.depleted then
		inst.steampressure:KillSound("loop_sound")
		inst.AnimState:PushAnimation("idle_stop",true)
	else
        if not inst.SoundEmitter:PlayingSound("loop_sound") then
            inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp", "loop_sound")
        end
		inst.AnimState:PushAnimation("idle_active",true)
	end
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.machine.turnofffn(inst)
	inst.SoundEmitter:KillSound("loop_sound")
    local fx = SpawnPrefab("collapse_small")

    local hole = SpawnPrefab("hole")
    hole.Transform:SetPosition(inst.Transform:GetWorldPosition())

    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
	inst.components.lootdropper:DropLoot()
	inst:Remove()
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

    inst:AddTag("well_waterpump")
    inst:AddTag("structure")
    inst:AddTag("cleanwaterproduction")
	
	MakeObstaclePhysics(inst, .5)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetBank("well_waterpump")
    inst.AnimState:SetBuild("well_waterpump")
    inst.AnimState:PlayAnimation("idle_active",true)

    inst:AddComponent("steampressure")
    inst.components.steampressure:SetDepletedFn(OnDeplete)
    inst.components.steampressure:SetChargingDoneFn(SetChargingDoneFn)
    inst.components.steampressure:SetPressureSectionFn(SetPressureSection)

    inst._steampressure = inst.components.steampressure.pressuresection

    inst.AnimState:OverrideSymbol("swap", "well_waterpump_meter", tostring(math.ceil(inst._steampressure/2)))

    inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp", "loop_sound")

    inst:AddComponent("inspectable")

	inst:AddComponent("lootdropper")

	inst:AddComponent("water")
	inst.components.water:SetWaterType(WATERTYPE.CLEAN)
	inst.components.water:SetOnTakenFn(OnTaken)

	inst:AddComponent("watersource")
	inst.components.watersources.onusefn = OnTaken

	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	return inst
end

return Prefab("well_waterpump", fn, assets, prefabs)