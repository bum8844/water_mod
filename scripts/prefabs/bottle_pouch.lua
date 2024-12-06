local assets =
{
    Asset("ANIM", "anim/bottle_pouch.zip"),
    Asset("ANIM", "anim/ui_bottle_pouch_2x2.zip"),
    Asset("ANIM", "anim/bottle_pouch_swap.zip"),
}

local sections = 4
local maxstacksize = TUNING.STACK_SIZE_TINYITEM*sections

--[[local function issame()
    return maxstacksize == sections
end]]

local function getstack(inst)
    local _, currentstacksize = inst.components.container:HasItemWithTag("drink_icebox_valid",0)
    return currentstacksize
end

local function getpercent(inst)
    return maxstacksize > 0 and math.max(0, math.min(1, getstack(inst) / maxstacksize)) or 0
end

local function getsection(inst)
    return math.floor(getpercent(inst)*sections) --issame() and math.floor(getpercent(inst)*sections) or math.floor(getpercent(inst)*sections)+1
end

function getcurrentsection(inst)
    return getstack(inst) <= 0 and 0 or math.min(getsection(inst), sections)
end

function setsections(inst)
    if inst.components.container:IsOpen() then
        local get_section = getcurrentsection(inst)
        inst._itemstack = get_section
        inst.AnimState:OverrideSymbol("swap", "bottle_pouch_swap", tostring(get_section))
        inst.components.inventoryitem:ChangeImageName("bottle_pouch_open_"..tostring(get_section))
    end
end

local function onsave(inst, data)
    data.itemstack = inst._itemstack
end

local function onload(inst, data)
    if data then
        inst._itemstack = data.itemstack
    end
end

local function OnOpen(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/together/packaged")
    inst.AnimState:PlayAnimation("open")
    inst.AnimState:PushAnimation("opened", false)
    setsections(inst)
end

local function OnClose(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/sign_craft")
    inst.components.inventoryitem:ChangeImageName()
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

local floatable_swap_data = { bank = "bottle_pouch", anim = "closed" }

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("bottle_pouch.png")

    inst.AnimState:SetBank("bottle_pouch")
    inst.AnimState:SetBuild("bottle_pouch")
    inst.AnimState:PlayAnimation("closed")

    inst.AnimState:SetLightOverride(0.1)

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", 0.35, 1.15, nil, nil, floatable_swap_data)

    inst:AddTag("portablestorage")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("bottle_pouch")
    inst.components.container.onopenfn = OnOpen
    inst.components.container.onclosefn = OnClose
    inst.components.container.skipclosesnd = true
    inst.components.container.skipopensnd = true
    inst.components.container.droponopen = true

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

    inst._itemstack = 0

    inst:ListenForEvent("itemget", setsections)
    inst:ListenForEvent("itemlose", setsections)

    inst.OnSave = onsave
    inst.OnLoad = onload

    MakeHauntableLaunchAndDropFirstItem(inst)

    return inst
end

return Prefab("bottle_pouch", fn, assets)