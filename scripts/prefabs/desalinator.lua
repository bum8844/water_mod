require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/desalinator.zip"),
	Asset("ANIM", "anim/desalinator_meter_water.zip"),
    Asset("ANIM", "anim/desalinator_meter_salt.zip")
}

local function onhammered(inst, worker)
	if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
        if inst:HasTag("boilling") then
            inst.AnimState:PlayAnimation("hit_cook")
            inst.AnimState:PushAnimation("cook", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        else
    		inst.AnimState:PlayAnimation("hit_idle")
    		inst.AnimState:PushAnimation("idle")
        end
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle")
end

local function harvestsalt(inst)
    if inst._saltvalue >= 10 then
        inst.components.stewer.product = "saltrock"
        if not inst:HasTag("boilling") then
            inst.components.stewer.done = true
        end
    end
end

local function harvestfn(inst)
    if not inst:HasTag("burnt") then
        inst._saltvalue = inst._saltvalue - 10
        if not inst:HasTag("boilling") then
            inst.AnimState:PlayAnimation("idle")
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    end
end

local function BoiledDone(inst)
    if inst.components.waterlevel.currentwater < inst.components.waterlevel.maxwater then
        inst.components.waterlevel.accepting = true
    end
    inst.components.watersource.available = true
    inst.components.waterlevel.item_watertype = WATERTYPE.CLEAN
    inst.AnimState:OverrideSymbol("swap", "desalinator_meter_water", tostring(inst._waterlevel))
    inst.AnimState:PlayAnimation("idle")
    inst.SoundEmitter:KillSound("snd") 
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    inst._timer = 0
    inst:RemoveTag("boilling")
    if inst._saltvalue >= 10 then
        inst.components.stewer.done = true
        inst.components.stewer.product = "saltrock"
    end
end

local function Boiled(inst)
    inst:AddTag("boilling")
    if inst.components.stewer.done then
        inst.components.stewer.done = false
    end
    inst.components.waterlevel.accepting = false
    inst.components.watersource.available = false
    inst.AnimState:PlayAnimation("cook", true)
    inst.SoundEmitter:KillSound("snd")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
    inst:DoTaskInTime(inst._timer, BoiledDone, inst)
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    else
        data.timer = inst._timer
        data.saltvalue = inst._saltvalue
    end
end

local function onload(inst, data)
    if data ~= nil then
        if data.burnt then
            inst.components.burnable.onburnt(inst)
        end
        if data.saltvalue ~= nil or data.saltvalue ~= 0 then
            inst._saltvalue = data.saltvalue
        end
        if data.timer ~= nil then
            inst._timer = data.timer
            Boiled(inst)
        end
    end
end

local function OnDepleted(inst)
    inst.components.watersource.available = false
    inst.components.waterlevel.accepting = true
    inst.AnimState:PlayAnimation("idle")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
end

local function OnSectionChange(new, old, inst)
    local item_watertype = inst.components.waterlevel.item_watertype
    local watertype = item_watertype ~= WATERTYPE.CLEAN and "salt" or "water"
    if new ~= nil then
        if inst._waterlevel ~= new then
            inst._waterlevel = new
        end
    end
    inst.AnimState:OverrideSymbol("swap", "desalinator_meter_"..watertype, tostring(inst._waterlevel))
end

local function OnTakeWater(inst, watervalue, watertype)
    inst._saltvalue = inst._saltvalue + watervalue
    inst._timer = TUNING.DESALINATION_TIEM * watervalue
    Boiled(inst)
    if watervalue >= 15 then
    	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    elseif watervalue >= 5 then
    	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	else
    	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	end
end

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst:HasTag("boilling") and "PURIFY")
        or (inst.components.watersource.available and "HASWATER")
        or "EMPTY"
end
GetTime()
local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("desalinator.tex")
	
    MakeObstaclePhysics(inst, .4)
	
    inst.AnimState:SetBuild("desalinator")
    inst.AnimState:SetBank("desalinator")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap", "desalinator_meter_water", "0")
    
	inst:AddTag("structure")
	inst:AddTag("desalinator")
    inst:AddTag("cleanwater")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst._waterlevel = 0
    inst._timer = 0
    inst._saltvalue = 0
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("stewer")
    inst.components.stewer.onharvest = harvestfn

    inst:AddComponent("waterlevel")
    inst.components.waterlevel.watertype = WATERTYPE.SALTY
    inst.components.waterlevel:SetDepletedFn(OnDepleted)
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.maxwater = TUNING.DESALINATOR_MAX_LEVEL
    inst.components.waterlevel.accepting = true
    inst.components.waterlevel:SetSections(TUNING.DESALINATOR_MAX_LEVEL)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("watersource")
    inst.components.watersource.available = false
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("harvestsalt", harvestsalt)
	
	MakeHauntableWork(inst)
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
	
    return inst
end

return Prefab("desalinator", fn, assets),
MakePlacer("desalinator_placer", "desalinator", "desalinator", "idle")