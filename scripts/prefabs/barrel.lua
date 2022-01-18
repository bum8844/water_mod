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

--[[local function WaterLevelChange(inst, giver, item)
	if item:HasTag("bucket") then
		inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	elseif item:HasTag("preparedrink_bottle") then
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	else
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	end
	local sum = 
	inst.AnimState:OverrideSymbol("swap","barrel_meter_water", tostring(sum))
end]]

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

--[[local function onloadpostpass(inst, newents, data)
	if data.waterlevel ~= nil or 0 then
	local sum = 
	inst.AnimState:OverrideSymbol("swap","barrel_meter_water", tostring(sum))
	end
end]]

local function OnDepleted(inst)
	inst.components.watersource.available = false
end

local function OnTakeWater(inst, from_object)
	if from_object:HasTag("bucket") then
		inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	elseif item:HasTag("preparedrink_bottle") then
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	else
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	end
	inst.components.watersource.available = true

	return true
end

local function OnSectionChange(old, new, inst)
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
	inst:AddTag("waterlevel") --added on pristine state to process the action
	inst:AddTag("cleanwater")
	
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
	inst.components.waterlevel.watertype = WATERTYPE.CLEAN
	inst.components.waterlevel.consuming = false
	inst.components.waterlevel.maxwater = 100
	inst.components.waterlevel:SetSections(20)
	inst.components.waterlevel:InitializeWaterLevel(0)
	inst.components.waterlevel:SetDepletedFn(OnDepleted)
	inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
	inst.components.waterlevel.accepting = true

    --[[inst:AddComponent("fueled")
    inst.components.fueled.fueltype = FUELTYPE.MAGIC --"fueled" is only used for managing the water meter.
    inst.components.fueled.consuming = false
    inst.components.fueled.maxfuel = 100
    inst.components.fueled:SetSections(20)
    inst.components.fueled:InitializeFuelLevel(0)
    inst.components.fueled:SetDepletedFn(OnDepleted)
    --inst.components.fueled:SetTakeFuelFn(ontakefuel)
    inst.components.fueled:SetSectionCallback(OnSectionChange)
    inst.components.fueled.accepting = true

    inst:AddComponent("fillable")
    inst.components.fillable.overrideonfillfn = OnFill]]

	inst:AddComponent("watersource")
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
	--inst.OnLoadPostPass = onloadpostpass
	
    return inst
end

return Prefab("barrel", fn, assets),
MakePlacer("barrel_placer", "waterbarrel", "barrel", "idle")