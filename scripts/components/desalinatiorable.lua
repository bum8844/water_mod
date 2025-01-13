local function setwatertype(self, sludgetype, old_sludgetype)
	local sludge
	if old_sludgetype then
		sludge = old_sludgetype == "moonglass" and "glass" or "salty"
		self.inst:RemoveTag("sludge_"..sludge)
	end
	if not sludgetype then
		self.inst:RemoveTag("checksludge")
	else
		if not self.inst:HasTag("checksludge") then
			self.inst:AddTag("checksludge")
		end
		sludge = sludgetype == "moonglass" and "glass" or "salty"
		self.inst:AddTag("sludge_"..sludge)
	end
end

local DesalinatiorAble = Class(function(self, inst)
	self.inst = inst

	self.maxsludge = 0
	self.sludge = 0
	self.sludgetype = nil
	self.pickablevalue = 0

	self.sludge_per_sludge = 1
	self.sludge_per_water = self.sludge_per_sludge * TUNING.SLUDGE_PER_WATER
	self.sludgesections = 1

	self.calculatesludgefn = nil
	self.sludgesectionfn = nil
	self.setproductfn = nil
end,
nil,{
	sludgetype = setwatertype,
})

function DesalinatiorAble:SetPersludge(num)
	self.sludge_per_sludge = num
	self.sludge_per_water = self.sludge_per_sludge * TUNING.SLUDGE_PER_WATER
end

function DesalinatiorAble:SetMax(num)
	self.maxsludge = num * self.sludge_per_sludge
end

function DesalinatiorAble:GetSludge()
	return self.sludge
end

function DesalinatiorAble:GetPickSludge()
	return self.pickablevalue
end

function DesalinatiorAble:SetSludgeFn(fn)
	self.calculatesludgefn = fn
end

function DesalinatiorAble:SetSections(num)
	self.sludgesections = num
end

function DesalinatiorAble:SetSectionsFn(fn)
	self.sludgesectionfn = fn
end

function DesalinatiorAble:SetProductFn(fn)
	self.setproductfn = fn
end

function DesalinatiorAble:IsEmptySludge()
    return self.sludge <= 0
end

function DesalinatiorAble:IsSameSludge()
    return self.maxsludge == self.sludgesections
end

function DesalinatiorAble:GetSludgePercent()
    return self.sludge > 0 and math.max(0, math.min(1, self.sludge / self.maxsludge)) or 0
end

function DesalinatiorAble:GetSludgeSection()
    return self:IsEmptySludge() and 0 or self:IsSameSludge() and math.min( math.ceil(self:GetSludgePercent()*self.sludgesections), self.sludgesections) or math.min( math.ceil(self:GetSludgePercent()*self.sludgesections)+1, self.sludgesections)
end

function DesalinatiorAble:CalculateSludge()
    self.pickablevalue = math.floor(self.sludge / self.sludge_per_sludge)
    if self.calculatesludgefn then
    	self.calculatesludgefn(self.inst,self.pickablevalue,self.sludgetype)
    end
    if self.sludgesectionfn then
    	self.sludgesectionfn(self.inst,self:GetSludgeSection())
    end
end

function DesalinatiorAble:MakeSludge(water, water_old, watertype)
	self.sludgetype = watertype == WATERTYPE.UNCLEAN_MINERAL and "moonglass" or "saltrock"
    self.sludge = self.sludge + self.sludge_per_water * (water - water_old)
    self.sludge = math.clamp(self.sludge, 0, self.maxsludge)
end

function DesalinatiorAble:ResetSludge()
	self.sludge = self.sludge-(self.pickablevalue*self.sludge_per_sludge)
	if self.sludge == 0 then
		self.sludgetype = nil
	end
	self:CalculateSludge()
end

function DesalinatiorAble:OnSave()
	return {
		maxsludge = self.maxsludge,
		sludge = self.sludge,
		sludgetype = self.sludgetype,
	}
end

function DesalinatiorAble:OnLoad(data)
	if data then
		self.maxsludge = data.maxsludge
		self.sludge = data.sludge
		self.sludgetype = data.sludgetype
		self:CalculateSludge()
	end
end

return DesalinatiorAble