local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil then
        self.inst:RemoveTag("water_"..old_watertype)
    end
    if watertype ~= nil then
        self.inst:AddTag("water_"..watertype)
    end
end

local Water = Class(function(self, inst)
    self.inst = inst
    self.watervalue = 1
    self.watertype = nil
    self.ontaken = nil
    --self.returnprefab = nil
    --self.drinktype = nil --Used for drinks. for probable use
end,
nil,
{
    watertype = onwatertype,
})

function Water:SetWatervalue(num)
    self.watervalue = num
end

function Water:SetWaterType(type)
	self.watertype = type
end

function Water:OnRemoveFromEntity()
    if self.watertype ~= nil then
        self.inst:RemoveTag(self.watertype.."_water")
    end
end

function Water:SetOnTakenFn(fn)
    self.ontaken = fn
end

function Water:Taken(taker, amount)
    local refund = nil
    local uses = 0
    local delta = 0
    local shouldrefund = true

    self.inst:PushEvent("watertaken", {taker = taker})
    if self.ontaken then
        self.ontaken(self.inst, taker) --the entity might get removed in the 
    end

    if self.inst.components.waterlevel ~= nil then
        self.inst.components.waterlevel:DoDelta(amount)
        shouldreturn = self.inst.components.waterlevel:IsEmpty()
    end
    
    if self.returnprefab ~= nil and shouldrefund then
        RefundItem(self.inst, refund)
    end
end

return Water
