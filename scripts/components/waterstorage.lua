local WaterStorage = Class(function(self, inst)
    self.inst = inst
    self.maxrefrashing = TUNING.PERISH_FAST
    self.waterperish = 0
end)

function WaterStorage:GetWaterPerish(num)
    if self.waterperish == 0 then
        self.waterperish = num
    else
        local old_val = self.waterperish
        self.waterperish = math.min(num + self.waterperish, self.maxrefrashing)
    end
end

function OnSave()
    return {
        waterperish = self.waterperish
    }
end

function WaterStorage:OnLoad(data)
    self.waterperish = data.waterperish
end

--[[function WaterStorage:LongUpdate(dt)
    dt = 0
end]]

return WaterStorage