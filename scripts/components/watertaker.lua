local Watertaker = Class(function(self, inst)
	self.inst = inst
	self.capacity = 1
	self.multi_use = false
	self.prefabtest = nil
	self.onfillfn = nil
	--self.overridefn = nil --used for watercans
end)

function Watertaker:Fill(source)
	assert(self.capacity > 0, "Capacity should be over 0!")
	local filledprefab = FunctionOrValue(self.prefabtest, self.inst, source)
	print(type(filledprefab)=="string", "Upvalue 'filledprefab' should be string!")
	local taker_stacksize = self.inst.components.stackable ~= nil and self.inst.components.stackable:StackSize() or 1

	local water = source ~= nil
		and (source.components.waterlevel ~= nil and source.components.waterlevel:Watervalue()
		or source.components.water ~= nil and source.components.water:Watervalue())
		or nil

	local counts = water ~= nil and math.min(water/self.capacity, taker_stacksize) or taker_stacksize
	local percent = counts % 1
	local itemnum = math.floor(counts)

	if itemnum <= 0 then
		return false, "NOTENOUGHWATER"
	end

	if filledprefab == nil then
		return false, "INVALID"
	end

	if source ~= nil and source.components.water ~= nil then
		source.components.water:Taken(self.inst, counts*self.capacity)
	end

	if self.overridefn ~= nil then
		return self.overridefn(self.inst, source)
	end

	local owner = self.inst.components.inventoryitem ~= nil and self.inst.components.inventoryitem.owner or nil
	local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
	local x, y, z = self.inst.Transform:GetWorldPosition()

	local i = 1
	while i <= itemnum do
		local item = SpawnPrefab(filledprefab)
		if item == nil then
			return false, "INVALID"
		end
		local room = item.components.stackable ~= nil and item.components.stackable:RoomLeft() or 0
		if room > 0 then
			local stacksize = math.min(itemnum, room+1)
			item.components.stackable:SetStackSize(stacksize)
			i = i + stacksize
		else
			if i == itemnum and percent > 0 and item.components.waterlevel ~= nil then
				item.components.waterlevel:SetPercent(percent)
			end
			i = i + 1
		end

		item.Transform:SetPosition(x, y, z)

		if container ~= nil then
			container:GiveItem(item)
		end
	end

	if self.onfillfn ~= nil then
		self.onfillfn(self.inst, source)
	end

	if self.inst.components.stackable ~= nil and self.inst.components.stackable:IsStack() then
		self.inst.components.stackable:Get(itemnum):Remove()
	else
		self.inst:Remove()
	end

	return true
end

return Watertaker
