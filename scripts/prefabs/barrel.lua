require "prefabutil"

local MOISTURE_ON_BURNT_MULTIPLIER = 0.1
local MAXREFRASHING = TUNING.PERISH_FAST

local assets =
{
    Asset("ANIM", "anim/barrel_dehy.zip"),
	Asset("ANIM", "anim/barrel_dehy_meter_water.zip"),
}

local prefabs =
{
	"collapse_small",
}

local function GetWet(inst)
	if not inst:HasTag("burnt") then
		if inst.components.waterlevel:GetPercent() > 0 then 
			SpawnPrefab("waterballoon_splash").Transform:SetPosition(inst.Transform:GetWorldPosition())
			inst.SoundEmitter:KillSound("destroy")
			inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
			inst.components.wateryprotection:SpreadProtection(inst)
		end
	end
end

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone", "destroy")
	GetWet(inst)
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
	inst.components.waterlevel.accepting = false
	inst.components.water.available = false
	inst.components.waterlevel:SetPercent(0)
	local amount = math.ceil(inst.components.wateryprotection.addwetness * MOISTURE_ON_BURNT_MULTIPLIER)
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

local function OnTakeWater(inst)
	inst.AnimState:PlayAnimation("take_water")
	inst.AnimState:PushAnimation("idle")
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	inst:DoTaskInTime(1,function() inst.SoundEmitter:PlaySound("dontstarve/common/wardrobe_close") end)
end

local function OnDeplete( ... )
	-- body
end

local function OnTaken(inst, taker, water_amount)
	inst.AnimState:PlayAnimation("get_water")
	inst.AnimState:PushAnimation("idle")
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	inst:DoTaskInTime(1,function() inst.SoundEmitter:PlaySound("dontstarve/common/wardrobe_close") end)
end

local function OnSectionChange(new, old, inst)
	--local watertype = inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN and "mineral" or "water"
	local watertype = "water"
	if inst._waterlevel ~= new then
		inst._waterlevel = new
		inst.AnimState:OverrideSymbol("swap", "barrel_dehy_meter_"..watertype, tostring(new))
	end
end

local function onpercentusedchange(inst, data)
	inst.components.wateryprotection.addwetness = data.percent * TUNING.WATER_BARREL_WETNESS
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
	
    inst.AnimState:SetBuild("barrel_dehy")
    inst.AnimState:SetBank("barrel_dehy")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","barrel_dehy_meter_water", "0")
	
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

	inst:AddComponent("waterspoilage")
	inst.components.waterspoilage.localPerishMultiplyer = TUNING.BARREL_FRESHENING_RATE
	
	inst:AddComponent("waterlevel")
	inst.components.waterlevel.onlysamewater = true
	inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
	inst.components.waterlevel:SetDepletedFn(OnDeplete)
	inst.components.waterlevel:SetCanAccepts({WATERTYPE.CLEAN, WATERTYPE.MINERAL})
	inst.components.waterlevel.maxwater = TUNING.BARREL_MAX_LEVEL
	inst.components.waterlevel:SetSections(TUNING.BREWERY_SECTIONS)
	inst.components.waterlevel:SetSectionCallback(OnSectionChange)
	inst.components.waterlevel:InitializeWaterLevel(0)

	inst:AddComponent("water")
	inst.components.water.available = false
	inst.components.water:SetOnTakenFn(OnTaken)

	inst:AddComponent("watersource")
	inst.components.watersource.available = false

	inst:AddComponent("wateryprotection")
    inst.components.wateryprotection.extinguishheatpercent = TUNING.WATER_BARREL_EXTINGUISH_HEAT_PERCENT
    inst.components.wateryprotection.temperaturereduction = TUNING.WATER_BARREL_TEMP_REDUCTION
    inst.components.wateryprotection.witherprotectiontime = TUNING.WATER_BARREL_PROTECTION_TIME
    inst.components.wateryprotection.addwetness = 0 -- 물의 양에 따라 변형
    inst.components.wateryprotection.protection_dist = TUNING.WATER_BARREL_DIST
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)
	MakeHauntableWork(inst)

	inst:ListenForEvent("onbuilt", onbuilt)
	inst:ListenForEvent("onburnt", onburnt)
	inst:ListenForEvent("percentusedchange", onpercentusedchange)

    inst.OnSave = onsave
    inst.OnLoad = onload
	
    return inst
end

return Prefab("barrel", fn, assets),
MakePlacer("barrel_placer", "barrel_dehy", "barrel_dehy", "idle")
