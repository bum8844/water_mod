local Purify = Class(function(self, inst)
    self.inst = inst
end)

function Purify:CanPurify(target)
    return target:HasTag("purify_pill") or target:HasTag("purify")
end

function Purify:CheckStack(target, doer)
    local from_object =
        target.components.stackable ~= nil and
        target.components.stackable:IsStack() and
        target.components.stackable:Get() or
        target
        
    from_object:Remove()
end

function Purify:DoPurify(target, doer)

	local new_target = SpawnPrefab((self.inst:HasTag("preparedrink_bottle") or target:HasTag("preparedrink_bottle")) and "bottle_water" or "cup_water")
    
    if target.components.inventoryitem and target.components.inventoryitem.owner ~= nil then
        local owner = target.components.inventoryitem.owner
        local component_name = owner.components.inventory ~= nil and "inventory" or "container"
        local slot = owner.components[component_name]:GetItemSlot(target)
        local from_object =
            target.components.stackable ~= nil and
            target.components.stackable:IsStack() and
            target.components.stackable:Get() or
            target
        owner.components[component_name]:RemoveItem(from_object, false)
        owner.components[component_name]:GiveItem(new_target, slot)
    elseif doer ~= nil and doer.components.inventory ~= nil then
        doer:PushEvent("picksomething", { object = target, loot = new_target })
        doer.components.inventory:GiveItem(new_target, nil, target:GetPosition())
        self:CheckStack(target, doer)
    else
        new_target.Transform:SetPosition(target.Transform:GetWorldPosition())
        self:CheckStack(target, doer)
    end

    if self.inst.components.stackable then
    	self.inst.components.stackable:Get():Remove()
    else
    	self.inst:Remove()
    end
    
    return true
end

return Purify
