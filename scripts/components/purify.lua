local Purify = Class(function(self, inst)
    self.inst = inst
end)

function Purify:CanPurify(target)
    return target:HasTag("can_purify")
end

function Purify:DoPurify(target, doer)

    local water = target.components.water or target.components.wateringtool

    if not water then
        return false
    end 

    local done = false

    if water.isitem then
        local watertype = water:GetWatertype()
        watertype = watertype == WATERTYPE.DIRTY and WATERTYPE.CLEAN or WATERTYPE.MINERAL
        local wateritem = SpawnPrefab("water_"..watertype)
        local stacksize = target.components.stackable:StackSize()

        wateritem.components.stackable:SetStackSize(stacksize)
        wateritem.components.perishable:SetPercent(0.8)

        if target.components.inventoryitem and target.components.inventoryitem.owner ~= nil then
            local owner = target.components.inventoryitem.owner
            local component_name = owner.components.inventory ~= nil and "inventory" or "container"
            local slot = owner.components[component_name]:GetItemSlot(target)
            owner.components[component_name]:GiveItem(wateritem, slot)
        elseif doer ~= nil and doer.components.inventory ~= nil then
            doer:PushEvent("picksomething", { object = target, loot = wateritem })
            doer.components.inventory:GiveItem(wateritem, nil, target:GetPosition())
        else
            wateritem.Transform:SetPosition(target.Transform:GetWorldPosition())
        end
        target:Remove()
        done = true
    elseif water.use_WaterManager then
        water:DoWaterManaging(TUNING.PURIIFYING)
        done = true
    else
        local wateringtooltask = water.wateringtooltask
        if wateringtooltask then
            wateringtooltask:Cancel()
            wateringtooltask = nil
        end
        water:SetStates(WATERTYPE.CLEAN)
        done = true
    end

    if done then
        if self.inst.components.stackable then
            self.inst.components.stackable:Get():Remove()
        else
            self.inst:Remove()
        end
        if target then
            target:PushEvent("done_purify")
        else
            doer.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
        end
        return true
    end

    return false
end

return Purify
