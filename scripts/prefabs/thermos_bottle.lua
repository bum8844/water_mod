local assets =
{
    Asset("ANIM", "anim/thermos_bottle.zip"),
    Asset("ANIM", "anim/ui_alterguardianhat_1x1.zip"),
}

local function OnOpen(inst)
    inst.AnimState:PlayAnimation("open")
end

local function OnClose(inst)
    if not inst.components.inventoryitem:IsHeld() then
        inst.AnimState:PlayAnimation("close")
        inst.AnimState:PushAnimation("closed", false)
    else
        inst.AnimState:PlayAnimation("closed", false)
    end
end

local function OnPutInInventory(inst)
    inst.components.container:Close()
    inst.AnimState:PlayAnimation("closed", false)
end

local floatable_swap_data = { bank = "beargerfur_sack", anim = "closed" }

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("beargerfur_sack.png")

    inst.AnimState:SetBank("beargerfur_sack")
    inst.AnimState:SetBuild("beargerfur_sack")
    inst.AnimState:PlayAnimation("closed")

    inst.AnimState:SetLightOverride(0.1)

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", 0.35, 1.15, nil, nil, floatable_swap_data)

    inst:AddTag("portablestorage")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst._sounds = sounds
    inst._frostfx = nil

    inst:AddComponent("inspectable")

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("thermos_bottle")
    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    inst.components.container.skipclosesnd = true
    inst.components.container.skipopensnd = true
    inst.components.container.droponopen = true

    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(TUNING.BEARGERFUR_SACK_PRESERVER_RATE)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

    --inst.OnRemoveEntity = OnRemoveEntity

    MakeHauntableLaunchAndDropFirstItem(inst)

    return inst
end

return Prefab("thermos_bottle", fn, assets)