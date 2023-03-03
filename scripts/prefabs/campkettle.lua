local assets =
{
    Asset("ANIM", "anim/campkettle.zip"),
    Asset("ANIM", "anim/campkettle_meter_water.zip"),
    Asset("ANIM", "anim/campkettle_meter_dirty.zip"),
    Asset("IMAGE", "images/tea_inventoryitem.tex"),
    Asset("ATLAS", "images/tea_inventoryitem.xml"),
    Asset("ATLAS_BUILD", "images/tea_inventoryitem.xml", 256),
}

local prefabs_item =
{
    "campkettle",
}

local prefabs =
{
    "campkettle_item",
}

local function fn_item()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)  

    inst.AnimState:SetBuild("campkettle")
    inst.AnimState:SetBank("item")
    inst.AnimState:PlayAnimation("idle_ground")

    inst.entity:SetPristine()

    inst:AddTag("campkettle")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("tradable")

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:ChangeImageName("campkettle")

    inst:AddComponent("upgrader")
    inst.components.upgrader.upgradetype = UPGRADETYPES.CAMPFIRE
    inst.components.upgrader.upgradevalue = 1

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function onbuilt(inst)
    if not inst._fire then
        print("must build on campfire or firepit! -- removing")
        inst:Remove()
    else
        inst._type = inst.parent.prefab == "firepit" and "B" or "A"
        inst.AnimState:SetBank("type_"..inst._type)

        inst:DoTaskInTime(0,function(inst)
            inst:Show()
            inst.AnimState:PlayAnimation("place", false)
            inst.AnimState:PushAnimation("idle_empty")
            inst.SoundEmitter:PlaySound("dontstarve/common/cook_pot_craft")
        end)
    end
end

local function ChangeToItem(inst)
    local item = SpawnPrefab("campkettle_item")
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
    inst._fire:RemoveChild(inst)
end

local function waterlevelchk(inst)
    if inst.components.waterlevel:IsFull() then
        inst.components.waterlevel.accepting = false
    else
        inst.components.waterlevel.accepting = true
    end
    if inst.components.waterlevel:GetWater() ~= 0 then
        inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
        inst.components.pickable.canbepicked = true
    else
        inst.components.pickable.canbepicked = false
    end
end

local function stopboil(inst)
    inst:RemoveTag("boiling")
    waterlevelchk(inst)
    inst.AnimState:PlayAnimation("idle_empty")
    inst.SoundEmitter:KillSound("snd")
    if inst._timer == 0 then
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
    else
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close", "snd")
    end
    if inst.boilingtask ~= nil then
        inst.boilingtask:Cancel()
        inst.boilingtask = nil
    end
end

local function ondoneboil(inst)
    inst._timer = 0
    stopboil(inst)
    inst.components.waterlevel.watertype = WATERTYPE.CLEAN
    inst.AnimState:OverrideSymbol("swap_meter", "campkettle_meter_water", tostring(inst._waterlevel))
end

local function doboil(inst)
    if inst._fire ~= nil and inst._fire.components.fueled:GetCurrentSection() > 0
        and inst.components.waterlevel:GetPercent() > 0 and inst.components.waterlevel.watertype == WATERTYPE.DIRTY then
        inst:AddTag("boiling")
        inst.components.waterlevel.accepting = false
        inst.components.pickable.canbepicked = false
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
        inst.boilingtask = inst:DoTaskInTime(inst._timer, ondoneboil, inst)
    end
end
    
local function OnTakeWater(inst)
    if not inst:HasTag("burnt") then
        inst._timer = TUNING.BASE_COOK_TIME * TUNING.KETTLE_WATER * inst.components.waterlevel:GetPercent()
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
        doboil(inst)
    end
end

local function OnSectionChange(new, old, inst)
    local watertype = inst.components.waterlevel.watertype ~= WATERTYPE.CLEAN and "dirty" or "water"
    if new ~= nil then
        if inst._waterlevel ~= new then
            inst._waterlevel = new
        end
    end
    inst.AnimState:OverrideSymbol("swap_meter", "campkettle_meter_"..watertype, tostring(new))
end

local function OnDismantle(inst, doer)
    if inst.components.waterlevel.currentwater == 0 or doer == nil then
        ChangeToItem(inst)
        inst:Remove()
    else
        doer.components.talker:Say(GetString(doer,"ACTIONFAIL",{"DISMANTLE","NOTEMPTY"}))
    end
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
            inst.AnimState:SetBank("type_"..inst._type)
        end
        if data.timer ~= nil then
            inst._timer = data.timer
            doboil(inst)
        end
    end
end

local function OnPickedFn(inst,picker,loot)
    inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    waterlevelchk(inst)
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

    inst.AnimState:SetBuild("campkettle")
    inst.AnimState:SetBank("type_"..inst._type)
    inst.AnimState:PlayAnimation("idle_empty")
    inst.AnimState:OverrideSymbol("swap_meter", "campkettle_meter_water", "0")

    inst.entity:SetPristine()

    inst:AddTag("kettle")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

    inst:AddComponent("inspectable")

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetCanAccepts({WATERTYPE.DIRTY})
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel:SetSections(3)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel.maxwater = TUNING.CAMPKETTLE_MAX_LEVEL
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("pickable")
    inst.components.pickable.canbepicked = false
    inst.components.pickable.product = "water_clean"
    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
    inst.components.pickable:SetOnPickedFn(OnPickedFn)

    MakeHauntableLaunchAndSmash(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.doboil = doboil
    inst.stopboil = stopboil

    inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("onwaterlevelsectionchanged", waterlevelchk)

    return inst
end

return Prefab("campkettle", fn, assets, prefabs),
    Prefab("campkettle_item", fn_item, assets, prefabs_item)
