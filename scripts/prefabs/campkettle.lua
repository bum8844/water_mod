local assets =
{
    Asset("ANIM", "anim/campkettle.zip"),
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

    --[[inst.AnimState:SetBuild("campkettle")
    inst.AnimState:SetBank("campkettle")--"campkettle_item"
    inst.AnimState:PlayAnimation("idle_empty")]]

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
    inst:Show()
    inst.AnimState:PlayAnimation("place", false)
    inst.AnimState:PushAnimation("idle_empty")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)  

    inst.AnimState:SetBuild("campkettle")
    inst.AnimState:SetBank("campkettle")
    inst.AnimState:PlayAnimation("idle_empty")

    inst.entity:SetPristine()

    inst:AddTag("kettle")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:ListenForEvent("onbuilt", onbuilt)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
    inst.components.hauntable.cooldown = TUNING.HAUNT_COOLDOWN_HUGE
    inst.components.hauntable:SetOnHauntFn(OnHaunt)

    MakeHauntableLaunchAndSmash(inst)

    inst:DoTaskInTime(0, OnSpawnIn)


    return inst
end

return Prefab("campkettle", fn, assets, prefabs),
Prefab("campkettle_item", fn_item, assets, prefabs_item)