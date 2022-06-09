local assets =
{
    Asset("ANIM", "anim/campkettle.zip"),
    Asset("ANIM", "anim/campkettle_meter_water.zip"),
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
    inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename = "campkettle"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function OnSpawnIn(inst)
    if not inst.parent then
        print("must build on campfire or firepit! -- removing")
        inst:Remove()
    else
        inst._type = inst.parent.prefab == "firepit" and "B" or "A"
        inst.AnimState:SetBank("type_"..inst._type)

        inst:DoTaskInTime(0,function(inst)
            inst:Show()
            inst.AnimState:PlayAnimation("place", false)
            inst.AnimState:PushAnimation("idle_empty")
        end)
    end
end

local function ChangeToItem(inst)
    local item = SpawnPrefab("campkettle_item")
    local type = inst._type
    if inst.parent then
        inst.parent.components.burnable:OverrideBurnFXBuild("campfire_fire")
        inst.parent.components.trader:Enable()
        inst.parent._kettleinst = nil
        inst.parent._setkettle = false
    end
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    item.AnimState:PlayAnimation("collapse_"..type)
    item.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
end

local function OnDismantle(inst, doer)
    ChangeToItem(inst)
    inst:Remove()
    --[[if inst.components.waterlevel.currentwater == 0 then
        ChangeToItem(inst)
        inst:Remove()
    else
        doer.components.talker:Say(GetString(doer,"ACTIONFAIL",{"DISMANTLE","NOTEMPTY"}))
    end]]
end

local function onsave(inst, data)
    data.pittype = inst._type
    if inst._donebuild then
        data.donebuild = inst._donebuild
    end
end

local function onload(inst, data)
    if data.pittype ~= nil then
        inst._type = data.pittype
        local type = data.pittype
        inst.AnimState:SetBank("type_"..type)
        inst:Show()
    end
    if data.donebuild then
        inst._donebuild = data.donebuild
    end
end

local function fn()
    local inst = CreateEntity()
    inst:Hide()
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

    MakeHauntableLaunchAndSmash(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload

    if not inst._donebuild then
        inst:DoTaskInTime(0, OnSpawnIn)
    end

    return inst
end

return Prefab("campkettle", fn, assets, prefabs),
Prefab("campkettle_item", fn_item, assets, prefabs_item)