--when an item 'inst' is used, the 'refund' will be given. (similar mechanism with fillable:Fill)
function RefundItem(inst, refund)
    if type(refund) == "string" then
        refund = SpawnPrefab(refund)
    end
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    if owner ~= nil then
        local container = owner.components.inventory or owner.components.container
        local item_prefab = container:RemoveItem(inst, false) or inst
        item_prefab:Remove()
        if refund ~= nil then
        	container:GiveItem(refund, nil, owner:GetPosition())
        end
    else
    	if refund ~= nil then
        	refund.Transform:SetPosition(inst.Transform:GetWorldPosition())
        end
        local item_prefab =
            inst.components.stackable ~= nil and
            inst.components.stackable:IsStack() and
            inst.components.stackable:Get() or
            inst
        item_prefab:Remove()
    end
end
