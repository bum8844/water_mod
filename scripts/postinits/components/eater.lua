-- bum: when you eat foods, you can restore thirst.
AddComponentPostInit("eater", function(self)
	self.thirstabsorption = 1
	local _Eat = self.Eat
	local _PrefersToEat = self.PrefersToEat

	function self:SetThristAbsorption(thirst)
		self.thirstabsorption = thirst
	end

	function self:Eat(food, feeder, ...)
		if self:PrefersToEat(food, ...) then
			local stack_mult = self.eatwholestack and food.components.stackable ~= nil and food.components.stackable:StackSize() or 1
			local base_mult = self.inst.components.foodmemory ~= nil and self.inst.components.foodmemory:GetFoodMultiplier(food.prefab) or 1
			local thirst_delta = 0

			if self.inst.components.thirst ~= nil then
				thirst_delta = food.components.edible:GetThirst(self.inst) * base_mult * self.thirstabsorption
			end

			if thirst_delta ~= 0 then
				self.inst.components.thirst:DoDelta(thirst_delta * stack_mult)
			end
			_Eat(self, food, feeder, ...)
			return true
		end
	end

	function self:SetCanDrinkAcid()
		table.insert(self.preferseating, FOODTYPE.ACID)
		table.insert(self.caneat, FOODTYPE.ACID)
		self.inst:AddTag(FOODTYPE.ACID.."_eater")
	end

	function self:SetCanEatAcidBattery()
		table.insert(self.preferseating, FOODTYPE.ACID_BATTERY)
		table.insert(self.caneat, FOODTYPE.ACID_BATTERY)
		self.inst:AddTag(FOODTYPE.ACID_BATTERY.."_eater")
	end

	if GetModConfigData("child_safety") then
		function self:PrefersToEat(food, ...)
			if food:HasTag("alcohol") and self.inst.childplayer then
				return false
			end
			return _PrefersToEat(self, food, ...)
		end
	end
end)
