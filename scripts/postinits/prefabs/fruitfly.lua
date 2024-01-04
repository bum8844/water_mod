local function OnLoseChild(inst, child)
	local dead = GLOBAL.SpawnPrefab("fruitflyfruit_dead")

	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local x, y, z = inst.Transform:GetWorldPosition()

    if container then
   		container:GiveItem(dead)
   	else
   		dead.Transform:SetPosition(x, y, z)
   	end

	inst:Remove()
end

AddPrefabPostInit("lordfruitfly",function(inst)
	inst:AddTag("largecreature")
end)

AddPrefabPostInit("fruitfly",function(inst)
	inst:AddTag("smallcreature")
end)

AddPrefabPostInit("fruitflyfruit",function(inst)
	if inst.components.leader then
		inst.components.leader.onremovefollower = OnLoseChild
	end
end)