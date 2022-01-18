local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil then
        self.inst:RemoveTag(old_watertype.."_Water")
    end
    if watertype ~= nil then
        self.inst:AddTag(watertype.."_Water")
    end
end

local Water = Class(function(self, inst)
    self.inst = inst
    self.Water = 1
    self.watertype = nil
    self.ontaken = nil
    --self.returnprefab = nil
end,
nil,
{
    watertype = onwatertype,
})

function Water:SetWater(num)
    self.Water = num
end

function Water:SetWaterType(types)
	self.watertype = types
end

function Water:OnRemoveFromEntity()
    if self.watertype ~= nil then
        self.inst:RemoveTag(self.watertype.."_Water")
    end
end

function Water:SetOnTakenFn(fn)
    self.ontaken = fn
end

function Water:Taken(taker)
    self.inst:PushEvent("Watertaken", {taker = taker})
    if self.ontaken then
        self.ontaken(self.inst, taker)
    end
end

return Water