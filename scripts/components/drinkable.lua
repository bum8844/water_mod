local function oncheckbadwater(self)
	if self.thirstvalue < 0 or
		(self.healthvalue ~= nil and self.healthvalue < 0) or
		(self.sanityvalue ~= nil and sellf.sanityvalue <0) then
		self.inst:AddTag("baddrink")
	else
		self.inst:RemoveTag("baddrink")
	end
end

local Drinkable = Class(function(self, inst)
	self.inst = inst
	self.healthvalue = 0
	self.hungervalue = 0
	self.sanityvalue = 0
	self.thirstvalue = 10
	self.ondrink = nil
	self.gethealthfn = nil
	
	self.temperaturedelta = 0
	self.temperatureduration = 0
	
	--chill is a percentage [0, 1] of .temperatureduration
    --don't change this from 0 unless .temperaturedelta > 0	
	self.chill = 0
	--self.nochill = false
	
	self.drinktype = DRINKTYPE.GENERIC
end,
nil,
{
	healthvalue = oncheckbadwater,
	sanityvalue = oncheckbadwater,
	thirstvalue = oncheckbadwater,
})

function Drinkable:OnRemoveFromEntity()
	self.inst:RemoveTag("badwater")
end

--There are nothing special for those getter method for now,
--but they are for future expandablility

function Drinkable:GetSanity(eater)
	return self.sanityvalue
end

function Drinkable:GetHunger(eater)
	return self.hungervalue
end

function Drinkable:GetHealth(eater)
	return self.healthvalue
end

function Drinkable:GetThirst(eater)
	return self.thirstvalue
end

function Drinkable:GetDebugString()
	return string.format("Drink type: %s, health: %2.2f, hunger: %2.2f, sanity: %2.2f, thirst: %2.2f", self.foodtype, self.healthvalue, self.sanityvalue, self.thirstvalue)
end

function Drinkable:SetOnDrinkFn(fn)
	self.ondrink = fn
end

function Drinkable:SetGethealthFn(fn)
	self.gethealthfn = fn
end

function Drinkable:OnDrink(eater)
	if self.ondrink ~= nil then
		self.ondrink(self.inst, eater)
	end
	
	local delta_multiplier = 1
	local duration_multiplier = 1
	
	if self.temperaturedelta ~= 0 and
		self.temperatureduration ~= 0 and
		self. chill < 1 and
		eater ~= nil and
		eater.components.temperature ~= nil then
		eater.components.temperature:SetTemperatureInBelly(self.temperaturedelta * (1 - self.chill) * delta_multiplier, self.temperatureduration * duration_multiplier)
	end
	
	self.inst:PushEvent("ondrink", { eater = eater })
end

function Drinkable:AddChill(delta)
	if self.temperaturedelta > 0 and not self.nochill then
		self.chill = math.clamp(self.chill + delta / self.temperatureduration, 0, 1)
	end
end

function Drinkable:OnSave()
	return self.chill > 0 and { chill = self.chill } or nil
end

function Drinkable:OnLoad(data)
	if data.chill ~= nil and self.temperaturedelta > 0 and not self.nochill then
		self.chill = math.clamp(data.chill, 0, 1)
	end
end

return Edible