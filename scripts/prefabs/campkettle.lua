--TODO: campkettle is going to be disposible, not able to 
--cook prepared drinks, and only boils dirty water into clean water. 

require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/campkettle.zip"),
}

local prefabs =
{
    "campfirefire",
    "collapse_small",
    "ash",
}

local function onhammered(inst, worker)
    local x, y, z = inst.Transform:GetWorldPosition()
    SpawnPrefab("ash").Transform:SetPosition(x, y, z)
    SpawnPrefab("collapse_small").Transform:SetPosition(x, y, z)
    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit_empty")
    inst.AnimState:PushAnimation("idle_empty")
end

local function onextinguish(inst)
    if inst.components.fueled ~= nil then
        inst.components.fueled:InitializeFuelLevel(0)
    end
end

local function ontakefuel(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
end

local function updatefuelrate(inst)
    inst.components.fueled.rate = TheWorld.state.israining and 1 + TUNING.CAMPFIRE_RAIN_RATE * TheWorld.state.precipitationrate or 1
end

local function onupdatefueled(inst)
    if inst.components.burnable ~= nil and inst.components.fueled ~= nil then
        updatefuelrate(inst)
        inst.components.burnable:SetFXLevel(inst.components.fueled:GetCurrentSection(), inst.components.fueled:GetSectionPercent())
    end
end

local PROPAGATE_RANGES = { 1, 2, 3, 4 }
local HEAT_OUTPUTS = { 2, 5, 5, 10 }
local function onfuelchange(newsection, oldsection, inst)
    if newsection <= 0 then
        inst.components.burnable:Extinguish()
        inst.AnimState:PlayAnimation("dead")
        RemovePhysicsColliders(inst)

        SpawnPrefab("ash").Transform:SetPosition(inst.Transform:GetWorldPosition())

        inst.components.fueled.accepting = false
        inst:RemoveComponent("cooker")
        inst:RemoveComponent("propagator")
        inst:RemoveComponent("workable")
		inst:RemoveComponent("waterlevel")
        inst:RemoveComponent("watersource")
        inst.persists = false
        inst:AddTag("NOCLICK")
        inst:DoTaskInTime(1, ErodeAway)
    else
        if not inst.components.burnable:IsBurning() then
            updatefuelrate(inst)
        end
        if inst._timer == 0 then
            if inst.components.waterlevel.currentwater == 0 then
                inst.AnimState:PlayAnimation("idle_empty")
            else
                inst.AnimState:PlayAnimation("idle_full_water")
            end
        end
        inst.components.burnable:SetFXLevel(newsection, inst.components.fueled:GetSectionPercent())

        inst.components.propagator.propagaterange = PROPAGATE_RANGES[newsection]
        inst.components.propagator.heatoutput = HEAT_OUTPUTS[newsection]
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_empty", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
end

local SECTION_STATUS =
{
    [0] = "OUT",
    [1] = "EMBERS",
    [2] = "LOW",
    [3] = "NORMAL",
    [4] = "HIGH",
}
local function getstatus(inst)
    return SECTION_STATUS[inst.components.fueled:GetCurrentSection()]
end

local function OnHaunt(inst)
    if inst.components.fueled ~= nil and
        inst.components.fueled.accepting and
        math.random() <= TUNING.HAUNT_CHANCE_OCCASIONAL then
        inst.components.fueled:DoDelta(TUNING.TINY_FUEL)
        inst.components.hauntable.hauntvalue = TUNING.HAUNT_SMALL
        return true
    end
    return false
end

local function BoiledDone(inst)
    inst.components.watersource.available = true       
    inst.AnimState:PlayAnimation("cooking_pst")
    inst.AnimState:PlayAnimation("idle_full_water")
    inst.SoundEmitter:KillSound("snd") 
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    inst._timer = 0
end

local function Boiled(inst)
    inst.components.waterlevel.accepting = false
    inst.components.watersource.available = false
    inst.AnimState:PlayAnimation("cooking_loop", true)
    inst.SoundEmitter:KillSound("snd")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
    inst:DoTaskInTime(inst._timer, BoiledDone, inst)
end

local function onsave(inst, data)
    if inst._timer ~= 0 then
        data.timer = inst._timer
    end
end

local function onload(inst, data)
    if data ~= nil then 
        if data.timer ~= nil then
            inst._timer = data.timer
            Boiled(inst)
        end
        if inst._timer == 0 and inst.components.waterlevel.currentwater > 0 then
            inst.AnimState:PlayAnimation("idle_full_water")
        end
    end
end

local function OnDepleted(inst)
    inst.components.watersource.available = false
    inst.components.waterlevel.accepting = true
    inst.AnimState:PlayAnimation("idle_empty")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
end

local function OnTakeWater(inst, watervalue, watertype)
    inst._timer = TUNING.KETTLE_WATER*watervalue
    Boiled(inst)
    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, .2)

    inst.AnimState:SetBank("campkettle")
    inst.AnimState:SetBuild("campkettle")
    inst.AnimState:PlayAnimation("idle_empty", false)

    inst:AddTag("campfire")
    inst:AddTag("kettle")
    inst:AddTag("NPC_workable")

    --cooker (from cooker component) added to pristine state for optimization
    inst:AddTag("cooker")

	-- for storytellingprop component
	inst:AddTag("storytellingprop")

    inst:AddTag("cleanwater")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst._timer = 0

    -----------------------
    inst:AddComponent("propagator")
    -----------------------

    inst:AddComponent("burnable")
    --inst.components.burnable:SetFXLevel(2)
    inst.components.burnable:AddBurnFX("campfirefire", Vector3())
    inst:ListenForEvent("onextinguish", onextinguish)

    -------------------------
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
    --------------------------

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetDepletedFn(OnDepleted)
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.watertype = WATERTYPE.DIRTY
    inst.components.waterlevel.maxwater = TUNING.CAMP_KETTLE_MAX_LEVEL
    inst.components.waterlevel.accepting = true
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("watersource")
    inst.components.watersource.available = false

    -------------------------
    inst:AddComponent("cooker")
    -------------------------
    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.CAMPFIRE_FUEL_MAX
    inst.components.fueled.accepting = true

    inst.components.fueled:SetSections(4)

    inst.components.fueled:SetTakeFuelFn(ontakefuel)
    inst.components.fueled:SetUpdateFn(onupdatefueled)
    inst.components.fueled:SetSectionCallback(onfuelchange)
    inst.components.fueled:InitializeFuelLevel(TUNING.CAMPFIRE_FUEL_START)

    -----------------------------
    inst:AddComponent("storytellingprop")

    -----------------------------

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    --------------------

    inst.components.burnable:Ignite()
    inst:ListenForEvent("onbuilt", onbuilt)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
    inst.components.hauntable.cooldown = TUNING.HAUNT_COOLDOWN_HUGE
    inst.components.hauntable:SetOnHauntFn(OnHaunt)

    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

return Prefab("campkettle", fn, assets, prefabs),
MakePlacer("campkettle_placer", "campkettle", "campkettle", "preview")

