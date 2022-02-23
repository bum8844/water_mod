require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/barrel.zip"),
	Asset("ANIM", "anim/barrel_meter_water.zip"),
}

local prefabs =
{
	"collapse_small",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("hit_idle")
		inst.AnimState:PushAnimation("idle")
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place",false)
	inst.SoundEmitter:PlaySound("dontstarve/common/rain_meter_craft")
end

local function onburnt(inst)
	local amount = math.ceil(inst.components.waterlevel:GetPercent() * inst.components.wateryprotection.addwetness * MOISTURE_ON_BURNT_MULTIPLIER)
	if amount > 0 then
		local x, y, z = inst.Transform:GetWorldPosition()
		TheWorld.components.farming_manager:AddSoilMoistureAtPoint(x, 0, z, amount)
	end
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function OnDepleted(inst)
	inst.components.watersource.available = false
	inst.components.propagator.acceptsheat = true
end

local function OnTakeWater(inst, watervalue)
	if watervalue >= 15 then
		inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	elseif watervalue >= 5 then
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	else
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	end
end

local function OnSectionChange(new, old, inst)
	if inst._waterlevel ~= new then
		inst._waterlevel = new
		inst.AnimState:OverrideSymbol("swap", "barrel_meter_water", tostring(new))
	end
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("barrel.tex")
	
    MakeObstaclePhysics(inst, .1)
	
    inst.AnimState:SetBuild("barrel")
    inst.AnimState:SetBank("waterbarrel")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","barrel_meter_water", "0")
	
	inst:AddTag("structure")
	inst:AddTag("barrel")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst._waterlevel = 0
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("waterlevel")
	inst.components.waterlevel:SetDepletedFn(OnDepleted)
	inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
	inst.components.waterlevel.maxwater = TUNING.BERRLE_MAX_LEVEL
	inst.components.waterlevel.accepting = true
	inst.components.waterlevel:SetSections(TUNING.BREWERY_MAX_LEVEL)
	inst.components.waterlevel:SetSectionCallback(OnSectionChange)
	inst.components.waterlevel:InitializeWaterLevel(0)

	inst:AddComponent("watersource")
	inst.components.watersource.available = false
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)
	MakeHauntableWork(inst)

	inst:ListenForEvent("onbuilt", onbuilt)
	inst:ListenForEvent("onburnt", onburnt)

    inst.OnSave = onsave
    inst.OnLoad = onload
	--inst.OnLoadPostPass = onloadpostpass
	
    return inst
end

return Prefab("barrel", fn, assets),
MakePlacer("barrel_placer", "waterbarrel", "barrel", "idle")