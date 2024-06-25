local function oncanchangestate(self, canchangestate)
	if canchangestate then
		self.inst:AddTag("onlyoneget")
	else
		self.inst:RemoveTag("onlyoneget")
	end
end

local SaltMaker = Class(function(self, inst)
	self.inst = inst

	self.maxsaltvalue = 0
	self.saltvalue = 0
	self.pickablevalue = 0

	self.saltvalue_per_salt = 1
	self.saltvalue_per_water = self.saltvalue_per_salt * TUNING.SALT_PER_WATER
	self.saltsections = 1

	self.canchangestate = false
	self.nonemakesalt = false

	self.calculatesaltfn = nil
	self.saltsectionfn = nil
	self.setproductfn = nil
end,
nil,
{
    canchangestate = oncanchangestate,
})

function SaltMaker:SetPersalt(num)
	self.saltvalue_per_salt = num
	self.saltvalue_per_water = self.saltvalue_per_salt * TUNING.SALT_PER_WATER
end

function SaltMaker:SetMax(num)
	self.maxsaltvalue = num * self.saltvalue_per_salt
end

function SaltMaker:GetSalt()
	return self.saltvalue
end

function SaltMaker:GetPickSalt()
	return self.pickablevalue
end

function SaltMaker:SetSaltFn(fn)
	self.calculatesaltfn = fn
end

function SaltMaker:SetSections(num)
	self.saltsections = num
end

function SaltMaker:SetSectionsFn(fn)
	self.saltsectionfn = fn
end

function SaltMaker:SetProductFn(fn)
	self.setproductfn = fn
end

function SaltMaker:IsEmptySalt()
    return self.saltvalue <= 0
end

function SaltMaker:IsSameSalt()
    return self.maxsaltvalue == self.saltsections
end

function SaltMaker:GetSaltPercent()
    return self.saltvalue > 0 and math.max(0, math.min(1, self.saltvalue / self.maxsaltvalue)) or 0
end

function SaltMaker:GetSaltSection()
    return self:IsEmptySalt() and 0 or self:IsSameSalt() and math.min( math.ceil(self:GetSaltPercent()*self.saltsections), self.saltsections) or math.min( math.ceil(self:GetSaltPercent()*self.saltsections)+1, self.saltsections)
end

function SaltMaker:SetProduct()
	if not self.inst.components.waterlevel then
		return
	end
	if self.nonemakesalt then
		self.inst.components.waterlevel.noneboil = true
		self.nonemakesalt = false
	else
		self.inst.components.waterlevel.noneboil = false
		self.nonemakesalt = true
	end
	if self.setproductfn then
		self.setproductfn(self.inst, self.nonemakesalt)
	end
	return true
end

function SaltMaker:CalculateSalt()
    self.pickablevalue = math.floor(self.saltvalue / self.saltvalue_per_salt)
    if self.calculatesaltfn then
    	self.calculatesaltfn(self.inst,self.pickablevalue)
    end
    if self.saltsectionfn then
    	self.saltsectionfn(self.inst,self:GetSaltSection())
    end
end

function SaltMaker:MakeSalt(water, water_old)
    self.saltvalue = self.saltvalue + self.saltvalue_per_water * (water - water_old)
    self.saltvalue = math.clamp(self.saltvalue, 0, self.maxsaltvalue)
end

function SaltMaker:ResetSalt()
	self.saltvalue = self.saltvalue-(self.pickablevalue*self.saltvalue_per_salt)
	self:CalculateSalt()
end

function SaltMaker:OnSave()
	return {
		maxsaltvalue = self.maxsaltvalue,
		saltvalue = self.saltvalue,
		canchangestate = self.canchangestate,
		nonemakesalt = self.nonemakesalt,
	}
end

function SaltMaker:OnLoad(data)
	if data then
		self.maxsaltvalue = data.maxsaltvalue
		self.saltvalue = data.saltvalue
		self:CalculateSalt()
		if data.canchangestate then
			self.canchangestate = data.canchangestate
			if data.nonemakesalt then
				self:SetProduct()
			end
		end
	end
end

return SaltMaker