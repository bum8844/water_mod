local Purify = Class(function(self, inst)
    self.inst = inst
end)

function Purify:CanPurify(target)
    return target:HasTag("purify_pile") or target:HasTag("purify")
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
        from_object:Remove()
        owner.components[component_name]:GiveItem(new_target, slot)

    else

    	new_target.Transform:SetPosition(target.Transform:GetWorldPosition())
		local from_object =
			target.components.stackable ~= nil and
			target.components.stackable:IsStack() and
			target.components.stackable:Get() or
			target
		from_object:Remove()

    end

    if self.inst.components.stackable then
    	self.inst.components.stackable:Get():Remove()
    else
    	self.inst:Remove()
    end
    
    return true
end

return Purify