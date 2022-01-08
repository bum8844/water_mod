local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil then
        self.inst:RemoveTag(old_watertype.."_drinkvalue")
    end
    if watertype ~= nil then
        self.inst:AddTag(watertype.."_drinkvalue")
    end
end

local DrinkValue = Class(function(self, inst)
    self.inst = inst
    self.drinkvalue = 1
    self.watertype = nil
    self.ontaken = nil
end,
nil,
{
    watertype = onwatertype,
})

function DrinkValue:SetDrinkValue(num)
    self.drinkvalue = num
end

function DrinkValue:SetWaterType(types)
	self.watertype = types
end

function DrinkValue:OnRemoveFromEntity()
    if self.watertype ~= nil then
        self.inst:RemoveTag(self.watertype.."_drinkvalue")
    end
end

function DrinkValue:SetOnTakenFn(fn)
    self.ontaken = fn
end

function DrinkValue:Taken(taker)
    self.inst:PushEvent("drinkvaluetaken", {taker = taker})
    if self.ontaken then
        self.ontaken(self.inst, taker)
    end
end

return DrinkValue