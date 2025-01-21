local assets =
{
    Asset("ANIM", "anim/thermos_bottle.zip"),
    Asset("ANIM", "anim/ui_thermos_bottle_1x1.zip"),
    Asset("ANIM", "anim/bottle_pouch.zip"),
    Asset("ANIM", "anim/ui_bottle_pouch_2x2.zip"),
    --Asset("ANIM", "anim/ui_bottle_pouch_2x1.zip"),
    Asset("ANIM", "anim/bottle_pouch_swap.zip"),
    
}

-----------------------------------------------------------------------------------------------
--[[
SMALLPOUCH_PRESERVER_RATE = 1
BIGPOUCH_PRESERVER_RATE = 1/3
SMALLTHERMOS_PRESERVER_RATE = 1/3
SMALLTHERMOS_PRESERVER_MULT = 10
BIGTHERMOS_PRESERVER_RATE = -3]]
-----------------------------------------------------------------------------------------------
local function Pouch_Update(inst)
    local cmp = inst.components.container
    local slot = cmp:GetNumSlots()
    return cmp and (cmp:NumItems() / slot) or 0, slot
end
local function pouchitemupdate(inst)
    if inst.components.container:IsOpen() then
        local have, slots = Pouch_Update(inst)
        inst.components.inventoryitem:ChangeImageName("bottle_pouch_open_"..have * slots)
    end
end
local function PouchOnOpen(inst)
    inst.AnimState:PlayAnimation("open")
    local have, slots = Pouch_Update(inst)
    inst.components.inventoryitem:ChangeImageName("bottle_pouch_open_"..have * slots)
end

local function PouchOnClose(inst)
    inst.components.container:Close()
    inst.components.inventoryitem:ChangeImageName("bottle_pouch")

	if not inst.components.inventoryitem:IsHeld() then
        inst.AnimState:PlayAnimation("close")
        inst.AnimState:PushAnimation("closed", false)
    else
        inst.AnimState:PlayAnimation("closed", false)
    end
end
local function ThermosOnOpen(inst)
    inst.AnimState:PlayAnimation("open")
    inst.components.inventoryitem:ChangeImageName("thermos_bottle_open")
end

local function ThermosOnClose(inst)
    inst.components.container:Close()
    inst.components.inventoryitem:ChangeImageName("thermos_bottle")

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
local function checkstackoverflow(item, data, inst)
    if data ~= nil and data.stacksize then
        if not item:IsValid() then
            return
        end
        local stackable = item and item.components.stackable
        if stackable then
            local initial_stack = stackable.stacksize
            local max_stack = stackable.originalmaxsize * (inst.stackmult or 1)
            local stack = initial_stack - max_stack
            if stack > 0 then
                inst:DoTaskInTime(0, function()
                    local drop = stackable:Get(stack)
                    local owner = inst.components.inventoryitem.owner
                    local inventory = owner and (owner.components.container or owner.components.inventory) or nil
                    if inventory then
                        inventory:GiveItem(drop)
                    else
                        inst.components.container:DropItem(drop)
                    end
                end)
            end
        end
    end
end
--[[local function checkstackoverflow(item, data, inst)--많으면 많을수록 빠르게 떨구는 코드인데 그냥 남겨만 뒀습니다
    if not item.pushoverflow then
        if data ~= nil and data.stacksize then
            if not item:IsValid() then
                return
            end
            local stackable = item and item.components.stackable
            if stackable then
                local initial_stack = stackable.stacksize
                local max_stack = stackable.originalmaxsize * (inst.stackmult or 1)
                local stack = initial_stack - max_stack
                if stack > 0 then
                    item.pushoverflow = true
                    local past = 0
                    inst:DoTaskInTime(0, function()
                        local function drop_next()
                            if not item:IsValid() then
                                return
                            end
                            local current_stack = stackable.stacksize
                            local updated_stack = current_stack - max_stack
                            if updated_stack > 0 then
                                local drop = stackable:Get()
                                local time = (1 / updated_stack)
                                time = math.min(time, 0.5)
                                time = math.max(time, 0.03)
                                past = time
                                inst:DoTaskInTime(time, function()
                                    if not item:IsValid() then
                                        return
                                    end
                                    inst.components.container:DropItem(drop)
                                    drop_next()
                                end)
                            else
                                inst:DoTaskInTime(past, function()
                                    item.pushoverflow = false
                                end)
                            end
                        end
                        drop_next()
                    end)
                end
            end
        end
    end
end]]
local function item(inst, data)
    if inst._stacksizechange_handler == nil then
        inst._stacksizechange_handler = function(stackitem, stackdata)
            checkstackoverflow(stackitem, stackdata, inst)
        end
    end
    if data ~= nil and data.prev_item then
        inst:RemoveEventCallback("stacksizechange", inst._stacksizechange_handler, data.prev_item)
    end
    if data ~= nil and data.item then
        inst:ListenForEvent("stacksizechange", inst._stacksizechange_handler, data.item)
    end
end
local function Regen(inst)
    if inst and inst.components.container then
        for i, v in ipairs(inst.components.container.slots) do
            if v and v.components.perishable then
                v.components.perishable:ReducePercent(-0.05)
            end
        end
    end
end
local function StopRepair(inst, data)
    if inst.regentask then
        inst.regentask:Cancel()
        inst.regentask = nil
    end
    inst.components.preserver:SetPerishRateMultiplier(TUNING.SMALLTHERMOS_PRESERVER_RATE)
end
local function Repair(inst, data)
    if inst.regentask then
        inst.regentask:Cancel()
        inst.regentask = nil
    end
    inst.components.preserver:SetPerishRateMultiplier(0)
    inst.regentask = inst:DoPeriodicTask(1, Regen)
end
local function OnFullMoon(inst, isfullmoon)
    if isfullmoon then
        inst:ListenForEvent("ondropped", Repair)
        inst:ListenForEvent("onpickup", StopRepair)
        if not inst.components.inventoryitem.owner then
            Repair(inst)
        end
    else
        inst.components.preserver:SetPerishRateMultiplier(TUNING.SMALLTHERMOS_PRESERVER_RATE)
        inst:RemoveEventCallback("ondropped", Repair)
        inst:RemoveEventCallback("onpickup", StopRepair)
    end
end
local function makewatercontainer(name, master_postinit, pouch)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddMiniMapEntity()
        inst.entity:AddNetwork()
        if pouch then
            inst.MiniMapEntity:SetIcon("bottle_pouch.png")
            inst.AnimState:SetBank("bottle_pouch")
            inst.AnimState:SetBuild("bottle_pouch")
            inst.AnimState:PlayAnimation("closed")
            inst:AddTag("pouch")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "small", 0.35, 1.15, nil, nil, { bank = "bottle_pouch", anim = "closed" })
        else
            inst.MiniMapEntity:SetIcon("thermos_bottle.png")
            inst.AnimState:SetBank("thermos_bottle")
            inst.AnimState:SetBuild("thermos_bottle")
            inst.AnimState:PlayAnimation("closed")
            inst:AddTag("thermos")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "small", 0.35, 1.15, nil, nil, { bank = "thermos_bottle", anim = "closed" })
        end


        inst:AddTag("portablestorage")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")

        inst:AddComponent("container")
        inst.components.container:WidgetSetup(name)
        inst.components.container:EnableInfiniteStackSize(true)
        if pouch then
            inst.components.container.onopenfn = PouchOnOpen
            inst.components.container.onclosefn = PouchOnClose
        else
            inst.components.container.onopenfn = ThermosOnOpen
            inst.components.container.onclosefn = ThermosOnClose
        end
        inst.components.container.skipclosesnd = true
        inst.components.container.skipopensnd = true
        inst.components.container.droponopen = true
        inst:AddComponent("preserver")

        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.imagename = pouch and "bottle_pouch" or "thermos_bottle"
        inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)

        inst.stackmult = 1
        if master_postinit then
            master_postinit(inst)
        end
        inst:ListenForEvent("itemget", item)
        inst:ListenForEvent("itemlose", item)
        if pouch then
            inst:ListenForEvent("itemget", pouchitemupdate)
            inst:ListenForEvent("itemlose", pouchitemupdate)
        end
        MakeHauntableLaunchAndDropFirstItem(inst)
        return inst
    end
    return Prefab(name, fn, assets)
end
local function smallpouchpostinit(inst)
    inst.components.preserver:SetPerishRateMultiplier(TUNING.SMALLPOUCH_PRESERVER_RATE)
end
local function bigpouchpostinit(inst)
    inst.components.preserver:SetPerishRateMultiplier(TUNING.BIGPOUCH_PRESERVER_RATE)
    inst.stackmult = 2
end
local function smallthermospostinit(inst)
    inst.components.preserver:SetPerishRateMultiplier(TUNING.SMALLTHERMOS_PRESERVER_RATE)
    inst.stackmult = 2
    inst:WatchWorldState("isfullmoon", OnFullMoon)
end
local function bigthermospostinit(inst)
    inst.components.preserver:SetPerishRateMultiplier(TUNING.BIGTHERMOS_PRESERVER_RATE)
    inst.stackmult = 4
end
return makewatercontainer("bottle_pouch_small", smallpouchpostinit, true),
       makewatercontainer("bottle_pouch_big", bigpouchpostinit, true),
       makewatercontainer("thermos_bottle_small", smallthermospostinit),
       makewatercontainer("thermos_bottle_big", bigthermospostinit)