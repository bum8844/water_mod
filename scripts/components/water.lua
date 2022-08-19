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
    self.watervalue = nil --assume filling full-up if watervalue == nil
    self.watertype = WATERTYPE.GENERIC
    self.ontaken = nil
    --self.returnprefab = nil --Used for item check
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

--Use taker.waterlevel.oldcurrentwater and currentwater
function Water:Taken(taker, delta)
    self.inst:PushEvent("watertaken", {taker = taker})
    if self.ontaken then
        self.ontaken(self.inst, taker, delta)
    end
end

return Water
