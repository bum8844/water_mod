local WateringTool = Class(function(self, inst)
    self.inst = inst
end)

return WateringTool

--[[local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.maxrainfilling = TUNING.BUCKET_LEVEL_PER_USE
    self.rainfilling = 0

    self.precipitation = TUNING.BUCKET_RAINFALL
    self.evaporation = TUNING.BUCKET_EVAPORATION

    self.cancontainrain = true
    self.rainingtask = nil

    self.owner = nil
end,nil,nil)

local function _Update(inst, self)
    self:Update()
end

function WateringTool:Update(dt)
    if not self.isfull then
        local multiplier = 1
        if TheWorld.state.israining then
            local precipitationrate = TheWorld.state.precipitationrate
            multiplier = multiplier * self.precipitation * precipitationrate
        else
            multiplier = multiplier * self.evaporation
        end

        local preciprate = (dt or 1) * multiplier
        self:AddRainFilling(preciprate)

        if (preciprate > 0 and self:IsFull())
            or (preciprate < 0 and not self:HasWater()) then
            self:StopCheckWeather()
        elseif self.rainingtask ~= nil then
            self:StartCheckWeather()
        end
    end
end

function WateringTool:GetRainFilling()
    return self.rainfilling
end

function WateringTool:SetRainFilling(rainfilling)
    self.rainfilling = math.clamp(self.rainfilling, 0, self.capacity)
end

function WateringTool:AddRainFilling(delta)
    self:SetRainFilling(self.rainfilling + delta)
end

function WateringTool:IsFull()
    return self.rainfilling >= self.capacity
end

function WateringTool:HasWater()
    return self.rainfilling > 0
end

function WateringTool:StartCheckWeather()
    if self.rainingtask == nil then
        self.rainingtask = self.inst:DoPeriodicTask(1, Update, nil, self)
    end
end

function WateringTool:StopCheckWeather()
    if self.rainingtask ~= nil then
        self.rainingtask:Cancel()
        self.rainingtask = nil
    end

    if self:IsFull() then
        self.inst:PushEvent("fullwater")
    end
end

function WateringTool:LongUpdate(dt)
    if self.rainingtask ~= nil then
        Update(self, dt)
    end
end

function WateringTool:OnSave()
    return 
    {
        rainfilling = self.rainfilling > 0 and self.rainfilling,
    }
end

function WateringTool:OnLoad(data)
    self.rainfilling = data.rainfilling
    local owner = self.inst.components.inventoryitem and self.inst.components.inventoryitem.owner
    if owner == nil then
        self.inst:DoTaskInTime(0, Update, nil, self)
    end
end

return WateringTool
]]


