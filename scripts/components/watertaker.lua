local Watertaker = Class(function(self, inst)
	self.inst = inst
	self.capacity = 1
	self.multi_use = false
	self.onfillfn = nil
	self._laststack = 0
	--self.overridefn = nil --used for watercans
end)

function Watertaker:Fill(source, doer, watertype)
	
	local watertype = source ~= nil and source.components.water:GetWatertype() or watertype or WATERTYPE.SALTY
	local wateramount = source ~= nil and source.components.water:GetWater() or self.capacity
	local waterperish = source ~= nil and source.components.waterspoilage ~= nil and source.components.waterspoilage:GetPercent() or nil

	if self.inst.components.finiteuses ~= nil then
    	if self.inst.components.finiteuses:GetUses() < wateramount then
        	wateramount = self.inst.components.finiteuses:GetUses()
    	end
    end
	if watertype ~= nil and wateramount > 0 then
		local item = SpawnPrefab(watertype)
		if item ~= nil then
			if waterperish then
				item.components.perishable:SetPercent(waterperish)
				if source.components.waterlevel:IsEmpty() then
					source.components.waterstorage:ResetWaterPerish()
				end
			end
			local stacksize = math.min(self.capacity, wateramount)
			self._laststack = stacksize

			local container = doer ~= nil and (doer.components.inventory or doer.components.container) or nil
			local x, y, z = self.inst.Transform:GetWorldPosition()
			
			while stacksize > 0 do
				local room = item.components.stackable ~= nil and item.components.stackable:RoomLeft() or 0
				if room > 0 then
					local itemstack = math.min(stacksize, room+1)
					item.components.stackable:SetStackSize(itemstack)
					stacksize = stacksize - itemstack
				else
					stacksize = stacksize - 1
				end

				if container ~= nil then
					container:GiveItem(item, nil, doer:GetPosition())
				else
					LaunchAt(item, doer, nil, 1, 1)
				end
			end

			if self.onfillfn ~= nil then
				self.onfillfn(self.inst, source, doer)
			end

			self._laststack = 0

			return true
		end
	end

	return false
end

return Watertaker
