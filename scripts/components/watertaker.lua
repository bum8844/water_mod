local Watertaker = Class(function(self, inst)
	self.inst = inst
	self.capacity = 1
	self.multi_use = false
	self.prefabtest = nil
	self.onfillfn = nil

	inst:AddTag("watertaker")
end)

function Watertaker:Fill(source)
	assert(self.capacity > 0, "Capacity should be over 0!")
	local filledprefab = self.prefabtest(self.inst, source)
	local taker_stacksize = self.inst.components.stackable ~= nil and self.inst.components.stackable:StackSize() or 1
	local delta = 0

	if filledprefab == nil then
		return false
	end

	local water = source ~= nil
		and (source.components.waterlevel ~= nil and source.components.waterlevel.currentwater
		or source.components.water ~= nil and source.components.water.watervalue)

	local num = water ~= nil and math.min(math.ceil(water/self.capacity), taker_stacksize) or taker_stacksize
	local percent = num % 1

	for i=1,num do
		local item = SpawnPrefab(filledprefab)
		if i == num and percent > 0 and item.components.waterlevel ~= nil then
			item.components.waterlevel:SetPercent(percent)
		end
		RefundItem(self.inst, item)
	end

	local delta = num * self.capacity

	if source ~= nil then
		if source.components.water ~= nil then
			source.components.water:Taken(self.inst, delta)
		elseif source.components.waterlevel ~= nil then
			source.components.waterlevel:DoDelta(-delta)
		elseif source.components.watersource ~= nil then
			source.components.watersource:Use()
		end
	end

	if self.onfillfn ~= nil then
		self.onfillfn(self.inst)
	end

	return true
end

return Watertaker
