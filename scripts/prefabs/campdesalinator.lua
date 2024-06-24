local assets =
{
    Asset("ANIM", "anim/campdesalinator.zip"),
    Asset("ANIM", "anim/campdesalinator_item.zip"),
    Asset("ANIM", "anim/campdesalinator_meter_water.zip"),
    Asset("ANIM", "anim/campdesalinator_meter_salt.zip"),
    Asset("IMAGE", "images/tea_inventoryitem.tex"),
    Asset("ATLAS", "images/tea_inventoryitem.xml"),
    Asset("ATLAS_BUILD", "images/tea_inventoryitem.xml", 256),
}

local prefabs_item =
{
    "campdesalinator",
}

local prefabs =
{
    "collapse_small",
    "campdesalinator_item",
}

local function onbuilt(inst)
    if not inst.parent then
        print("must build on campfire or firepit! -- removing")
        inst:Remove()
    else
        inst:Hide()
        inst._type = inst.parent.prefab == "firepit" and "B" or "A"
        inst.AnimState:SetBank("campdesalinator_"..inst._type)

        inst:DoTaskInTime(0,function(inst)
            inst:Show()
            inst.AnimState:PlayAnimation("place", false)
            inst.AnimState:PushAnimation("idle_empty")
            inst.SoundEmitter:PlaySound("dontstarve/common/cook_pot_craft")
        end)
    end
end

local function ChangeToItem(inst)
    local item = SpawnPrefab("campdesalinator_item")
    if inst._fire then
        inst._fire.components.burnable:OverrideBurnFXBuild("campfire_fire")
        if inst._fire.components.trader ~= nil then
            inst._fire.components.trader:Enable()
        end
        inst._fire.components.upgradeable.upgradetype = UPGRADETYPES.CAMPFIRE
        inst._fire.components.upgradeable.numupgrades = 0
    end
    
    item.AnimState:PlayAnimation("collapse_"..inst._type)
    item.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    if inst._fire then
        inst._fire:RemoveChild(inst)
    end
end

local function onstopboilingfn(inst)
    inst.AnimState:PlayAnimation("idle_empty")
    inst.SoundEmitter:KillSound("snd")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close", "snd")
end

local function ondoneboilingfn(inst)
    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
    inst.components.pickable.canbepicked = true
    inst.AnimState:PlayAnimation("idle_empty")
    inst.SoundEmitter:KillSound("snd")
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
    inst.AnimState:OverrideSymbol("swap_meter", "campdesalinator_meter_water", tostring(inst._waterlevel))
end

local function onstartboilingfn(inst)
    inst.AnimState:PlayAnimation("cooking_loop", true)
    inst.SoundEmitter:KillSound("snd")
    inst.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl1_idle_LP", "snd")
end
    
local function OnTakeWater(inst)
    inst.AnimState:PlayAnimation("take_water")
    inst.AnimState:PushAnimation("idle_empty", false)
    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    inst:DoTaskInTime(1,function(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        if inst._fire.components.fueled:GetCurrentSection() > 0 then
            onstartboilingfn(inst)
        end
    end)
end

local function OnSectionChange(new, old, inst)
    local watertype = (inst.components.waterlevel.watertype == WATERTYPE.SALTY) and "salt" or "water"
    if new ~= nil then
        if inst._waterlevel ~= new then
            inst._waterlevel = new
        end
    end
    inst.AnimState:OverrideSymbol("swap_meter", "campdesalinator_meter_"..watertype, tostring(new))
end

local function OnDismantle(inst, doer)
    if inst.components.waterlevel.currentwater == 0 or doer == nil then
        ChangeToItem(inst)
        inst:Remove()
    else
        doer.components.talker:Say(GetString(doer,"ACTIONFAIL",{"DISMANTLE","NOTEMPTY"}))
    end
end

local function getstatus(inst)
    return (inst.components.waterlevel:GetWater() == 0 and "GENERIC")
        or (inst.components.distiller:isDone() and "DONE")
        or (inst._fire.components.fueled ~= nil and inst._fire.components.fueled.currentfuel / inst._fire.components.fueled.maxfuel <= 0 and "STOP")
        or (inst.components.distiller:GetTimeToBoil() > 15 and "BOILING_LONG")
        or "BOILING_SHORT"
end

local function onsave(inst, data)
    data.pittype = inst._type
    if inst._timer ~= nil then
        data.timer = inst._timer
    end
end

local function onload(inst, data)
    if data ~= nil then
        if data.pittype ~= nil then
            inst._type = data.pittype
            inst.AnimState:SetBank("campdesalinator_"..inst._type)
        end
    end
end

local function OnPickedFn(inst,picker,loot)
    loot.components.inventoryitemmoisture:SetMoisture(0)
    inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
    inst.AnimState:PlayAnimation("get_water")
    inst.AnimState:PushAnimation("idle_empty", false)
    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    inst.components.pickable.canbepicked = false
    inst.components.waterlevel.accepting = true
end 

local function fn()
    local inst = CreateEntity()
    inst._type = "A"
    inst._donebuild = nil

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBuild("campdesalinator")
    inst.AnimState:SetBank("campdesalinator_"..inst._type)
    inst.AnimState:PlayAnimation("idle_empty")
    inst.AnimState:OverrideSymbol("swap_meter", "campdesalinator_meter_water", "0")
    inst.scrapbook_anim = "campdesalinator_A"

    inst.entity:SetPristine()

    inst:AddTag("kettle")
    inst:AddTag("campkettle")
    inst:AddTag("cleanwaterproduction")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetCanAccepts({WATERTYPE.SALTY})
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel:SetSections(3)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel.maxwater = TUNING.CAMPKETTLE_MAX_LEVEL
    inst.components.waterlevel.isputoncetime = true
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("distiller")
    inst.components.distiller.onstartboiling = OnTakeWater
    inst.components.distiller.oncontinueboiling = onstartboilingfn
    inst.components.distiller.ondoneboiling = ondoneboilingfn
    inst.components.distiller.onstopboiling = onstopboilingfn

    inst:AddComponent("pickable")
    inst.components.pickable.canbepicked = false
    inst.components.pickable.product = "water_clean"
    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
    inst.components.pickable:SetOnPickedFn(OnPickedFn)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst.OnSave = onsave
    inst.OnLoad = onload

    inst:ListenForEvent("onbuilt", onbuilt)

    return inst
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function fn_item()
    local inst = CreateEntity()

    inst.kettletype = "campdesalinator"

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)  

    inst.minisign_atlas = "minisign_dehy_items_swap"
    inst.minisign_prefab_name = true
    
    inst.AnimState:SetBuild("campdesalinator_item")
    inst.AnimState:SetBank("campdesalinator_item")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    inst:AddTag("campdesalinator_item")

    if not TheWorld.ismastersim then
        return inst
    end
    
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:ChangeImageName("campdesalinator")

    inst:AddComponent("upgrader")
    inst.components.upgrader.upgradetype = UPGRADETYPES.CAMPFIRE
    inst.components.upgrader.upgradevalue = 1

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("campdesalinator", fn, assets, prefabs),
    Prefab("campdesalinator_item", fn_item, assets, prefabs_item)
