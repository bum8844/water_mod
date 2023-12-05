local function OnFill_Waterlevel(inst, from_object)
	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() 
				or from_object.components.inventoryitem ~= nil and from_object.components.inventoryitem:GetGrandOwner()
				or nil
    if from_object.components.waterlevel ~= nil then
        local waterlevel = from_object.components.waterlevel:GetWater()
    	if waterlevel > 0 then
            from_object.components.water:Taken(inst, 1)
    	else
    		return false
    	end
    elseif from_object.components.steampressure then
        from_object.components.steampressure:LostPressure()
    elseif from_object.components.stackable then
	    local obj_stack = from_object.components.stackable:StackSize()
	    if from_object.components.stackable:IsStack() then
	        from_object.components.stackable:Get(1):Remove()
	    else
	        from_object:Remove()
	    end
    end
    if owner then
    	owner.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    end
    local filleditem = SpawnPrefab(inst.components.fillable.filledprefab)
    if owner ~= nil then
        local container = owner.components.inventory or owner.components.container
        container:GiveItem(filleditem, nil, owner:GetPosition())
    else
        filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
    end
	    local item = inst.components.stackable:StackSize()
	    if inst.components.stackable:IsStack() then
	        inst.components.stackable:Get(1):Remove()
	    else
	        inst:Remove()
	    end
    return true
end

AddPrefabPostInit("mosquitosack",function(inst)
        if inst.components.fillable then
        	inst.components.fillable.overrideonfillfn = OnFill_Waterlevel
        end
    end)