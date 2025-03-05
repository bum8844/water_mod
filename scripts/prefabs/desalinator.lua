require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/desalinator.zip"),
    Asset("ANIM", "anim/desalinator_body_dirty.zip"),
    Asset("ANIM", "anim/desalinator_body_salty.zip"),
    Asset("ANIM", "anim/desalinator_body_glass.zip"),
    Asset("ANIM", "anim/desalinator_body_mineral.zip"),
    Asset("ANIM", "anim/desalinator_body_clean.zip"),
	Asset("ANIM", "anim/desalinator_meter_dirty.zip"),
    Asset("ANIM", "anim/desalinator_meter_salty.zip"),
    Asset("ANIM", "anim/desalinator_meter_glass.zip"),
    Asset("ANIM", "anim/desalinator_meter_mineral.zip"),
    Asset("ANIM", "anim/desalinator_meter_clean.zip"),
    Asset("ANIM", "anim/desalinator_rope_salty.zip"),
    Asset("ANIM", "anim/desalinator_rope_glass.zip"),
}

local function GetWaterType(inst)
    return inst.components.waterlevel.watertype or "clean"
end

local function isdoneboiling(inst)
    local isopen = "_open"
    if not inst.AnimState:IsCurrentAnimation("idle_open") then
        isopen = ""
    end
    return isopen
end

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
	if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    local sludgevalue = inst.components.desalinatiorable:GetSludge()
    local sludge_per_sludge = inst.components.desalinatiorable.sludge_per_sludge
    local sludgetype = inst.components.desalinatiorable.sludgetype

    while sludgevalue >= sludge_per_sludge do
        local old_sludgevalue = sludgevalue
        sludgevalue = old_sludgevalue - sludge_per_sludge
        if sludgevalue >= sludge_per_sludge then
            inst.components.lootdropper:SpawnLootPrefab(sludgetype)
        end
    end
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
    GetWet(inst)
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
        if inst.components.distiller:isBoiling() then
            inst.AnimState:PlayAnimation("hit_cook")
            inst.AnimState:PushAnimation("cook", true)
        else
            local isopen = isdoneboiling(inst)
    		inst.AnimState:PlayAnimation("hit_idle"..isopen)
    		inst.AnimState:PushAnimation("idle"..isopen)
        end
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.SoundEmitter:PlaySound("saltydog/common/saltbox/place")
    inst:DoTaskInTime(1, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/meat_rack_craft")
        inst:DoTaskInTime(.8, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/stagehand/hit")end)
    end) 
	inst.AnimState:PushAnimation("idle")
end

local function onpickedfn(inst, picker)
    local isopen = isdoneboiling(inst)
    if not inst:HasTag("burnt") then
        inst.components.pickable.numtoharvest = 0 --어차피 한 번에 다 주게 하니까 상관없음
        inst.components.desalinatiorable:ResetSludge()
        inst.SoundEmitter:PlaySound("saltydog/common/saltbox/open")
        inst:DoTaskInTime(0.13, function(inst) inst.AnimState:PlayAnimation("get_salt"..isopen) 
            inst:DoTaskInTime(1.1, function(inst) 
                inst.SoundEmitter:PlaySound("saltydog/common/saltbox/close") 
                inst.AnimState:PushAnimation("idle"..isopen)
            end)
        end)
    end
end

local function CalculateSludge(inst, sludge, sludgetype)
    if not inst:HasTag("burnt") then
        if sludge > 0 then
            inst.components.pickable.product = sludgetype
            inst.components.pickable.numtoharvest = sludge
            if not inst.components.distiller:isBoiling() then
                inst.SoundEmitter:PlaySound("hookline/common/trophyscale_fish/place_fish")
                inst.SoundEmitter:PlaySound("saltydog/common/saltbox/open")
                inst.components.pickable.canbepicked = true
            else
                inst.components.pickable.canbepicked = false
            end
        end
    end
end

local function SetSludgeSection(inst,result)
    local sludgetype = inst.components.desalinatiorable.sludgetype == "moonglass" and "glass" or "salty"
    inst.AnimState:OverrideSymbol("swap_salt", "desalinator_rope_"..sludgetype, tostring(result))
end

local function ondoneboilingfn(inst)
    if not inst:HasTag("burnt") then
        local watertype = GetWaterType(inst)
        inst.AnimState:OverrideSymbol("swap_body", "desalinator_body_"..watertype, tostring(inst._waterlevel))
        inst.AnimState:OverrideSymbol("swap", "desalinator_meter_"..watertype, tostring(inst._waterlevel))
        inst.AnimState:PlayAnimation("cook_pst")
        if inst.components.waterlevel:GetWater() > 0 then
            inst.AnimState:PushAnimation("idle_open")
        else
            inst.AnimState:PushAnimation("idle")
        end
        inst.components.desalinatiorable:CalculateSludge()
        inst.SoundEmitter:KillSound("desalinator_sound")
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    end
end

local function onstartboilingfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.pickable.canbepicked = false
        inst.AnimState:PlayAnimation("cook", true)
        inst.SoundEmitter:PlaySound("dontstarve/halloween_2018/madscience_machine/cooking_LP", "desalinator_sound", 0.3)
    end
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
    if data ~= nil then
        if data.burnt then
            inst.components.burnable.onburnt(inst)
        end
    end
end

local function OnSectionChange(new, old, inst)
    local watertype = GetWaterType(inst)
    if new ~= nil then
        if inst._waterlevel ~= new then
            inst._waterlevel = new
        end
    end
    inst.AnimState:OverrideSymbol("swap_body", "desalinator_body_"..watertype, tostring(inst._waterlevel))
    inst.AnimState:OverrideSymbol("swap", "desalinator_meter_"..watertype, tostring(inst._waterlevel))
end

local function OnTakeWater(inst)
    if not inst:HasTag("burnt") then
        local water = inst.components.waterlevel.currentwater
        local water_old = inst.components.waterlevel.oldcurrentwater
        local watertype = inst.components.waterlevel.watertype
        inst.AnimState:PlayAnimation("take_water")
        inst.AnimState:PushAnimation("idle")
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
        inst.components.desalinatiorable:MakeSludge(water, water_old, watertype)
        inst:DoTaskInTime(1,function(inst)
            inst.SoundEmitter:PlaySound("dontstarve/common/wardrobe_close")
            onstartboilingfn(inst)
        end)
    end
end

local function OnTaken(inst, taker, water_amount)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("get_water")
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
        if inst.components.waterlevel:GetWater() > 0 then
            inst.AnimState:PushAnimation("idle_open")
        else
            inst:DoTaskInTime(1.1, function(inst) inst.AnimState:PlayAnimation("get_weter_pst")
                inst:DoTaskInTime(0.13, function(inst) 
                    inst.SoundEmitter:PlaySound("dontstarve/common/wardrobe_close")
                    inst.AnimState:PushAnimation("idle")
                end)
            end)
        end
    end
end

local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst.components.distiller:GetTimeToBoil() > 15 and "PURIFY_LONG")
        or (inst.components.distiller:isBoiling() and inst.components.distiller:GetTimeToBoil() < 15 and "PURIFY_SHORT")
        or (inst.components.waterlevel:GetWater() > 0 and "HASWATER")
        or (inst.components.pickable.numtoharvest > 0 and "HASSALT")
        or "EMPTY"
end

local function onpercentusedchange(inst, data)
    inst.components.wateryprotection.addwetness = data.percent * TUNING.DESALINATOR_WETNESS
end

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
    inst.AnimState:OverrideSymbol("swap_body", "desalinator_body_salt", "0")
	inst.AnimState:OverrideSymbol("swap", "desalinator_meter_clean", "0")
    inst.AnimState:OverrideSymbol("swap_salt", "desalinator_rope_salt", "0")
    inst.scrapbook_anim = "idle"
    
	inst:AddTag("structure")
	inst:AddTag("desalinator")
    inst:AddTag("cleanwaterproduction")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("waterlevel")
    inst.components.waterlevel.onlysamewater = true
    inst.components.waterlevel:SetCanAccepts({WATERGROUP.CAMP_DESALINATIORABLE})
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.maxwater = TUNING.DESALINATOR_MAX_LEVEL
    inst.components.waterlevel.isputoncetime = true
    inst.components.waterlevel:SetSections(TUNING.DESALINATOR_MAX_LEVEL)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("desalinatiorable")
    inst.components.desalinatiorable:SetPersludge(TUNING.SLUDGE_VALUE)
    inst.components.desalinatiorable:SetMax(TUNING.DESALINATOR_MAX_SLUDGE)
    inst.components.desalinatiorable:SetSludgeFn(CalculateSludge)
    inst.components.desalinatiorable:SetSectionsFn(SetSludgeSection)
    inst.components.desalinatiorable:SetSections(TUNING.DESALINATOR_SLUDGE_SECTION)

    inst:AddComponent("pickable")
    inst.components.pickable.onpickedfn = onpickedfn
    --inst.components.pickable.product = "saltrock"
    inst.components.pickable.numtoharvest = 0

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

    inst:AddComponent("distiller")
    inst.components.distiller.onstartboiling = OnTakeWater
    inst.components.distiller.oncontinueboiling = onstartboilingfn
    inst.components.distiller.ondoneboiling = ondoneboilingfn
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("onburnt", onburnt)
    inst:ListenForEvent("percentusedchange", onpercentusedchange)

	MakeHauntableWork(inst)
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
	
    return inst
end

return Prefab("desalinator", fn, assets),
MakePlacer("desalinator_placer", "desalinator", "desalinator", "idle")