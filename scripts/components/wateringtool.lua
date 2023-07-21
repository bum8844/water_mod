local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.maxrainfilling = TUNING.BUCKET_LEVEL_PER_USE
    self.rainfilling = 0

    self.isfull = nil

    self.cancontainrain = nil
    self.rainingtask = nil

    self.owner = nil
end,nil,nil)

local function _Update(inst, self)
    self:Update()
end

function WateringTool:Update(dt)
    if not self.owner and not self.isfull then
        local val = dt or TUNING.RAIN_GIVE_WATER
        if not TheWorld.state.israining then
            val = TUNING.LOST_WATER
        end
        self.rainfilling = self.rainfilling + val
        if self.rainfilling >= self.maxrainfilling then
            self:StopGetRaindrop()
        elseif self.rainfilling <= 0 then
            self.rainfilling = 0
            self:CheckWeather(nil)
        end
    else
        self.rainfilling = 0
        self:CheckWeather(self.owner)
    end
end

function WateringTool:IsdoDrying()
    return self.lefttime > 0
end

function WateringTool:HasWater()
    return self.rainfilling > 0
end

function WateringTool:IsFull()
    return self.isfull
end

function WateringTool:SetFull(val)
    self.isfull = val
end

function WateringTool:IsCanContainRain()
    return self.cancontainrain
end

function WateringTool:SetCanContainRain(val)
    self.cancontainrain = val or false
end

function WateringTool:LongUpdate(dt)
    if self.rainingtask ~= nil then
        self:Update(dt)
    end
end

function WateringTool:GetRainDrop()
    if self.rainingtask ~= nil then
        self.rainingtask:Cancel()
        self.rainingtask = nil
    end

    self.rainingtask = self.inst:DoPeriodicTask(1, _Update, nil, self)
end

function WateringTool:StopGetRaindrop()
    if self.cancontainrain and not self.isfull then
        if self.rainingtask ~= nil then
            self.rainingtask:Cancel()
            self.rainingtask = nil
        end

        self.isfull = true
        self.cancontainrain = false
        self.inst:PushEvent("fullwater")
    end
end

function WateringTool:CheckWeather(doer)
    if self.rainingtask ~= nil then
        self.rainingtask:Cancel()
        self.rainingtask = nil
    end

    self.owner = doer or nil

    self.rainingtask = self.inst:DoPeriodicTask(1, _Update, nil, self)
end

function WateringTool:OnSave()
    if self.inst.components.perishable ~= nil and self.inst.components.perishable.perishremainingtime then
        self.lefttime = self.inst.components.perishable.perishremainingtime or nil
    end
    if not self.cancontainrain then
        self.isfull = nil
        self.rainfilling = 0
        self.lefttime = nil
    end
    return {
        cancontainrain = self.cancontainrain == nil or nil,
        isfull = self.isfull == nil or nil,
        rainfilling = self.rainfilling > 0 and self.rainfilling,
        lefttime = self.lefttime,
        owner = self.owner,
    }
end

function WateringTool:OnLoad(data)
    if data.cancontainrain then
        self.cancontainrain = true
        self.owner = data.owner or nil
        if not data.isfull then
            self.rainfilling = data.rainfilling or 0
            if self.rainingtask ~= nil then
                self.rainingtask:Cancel()
                self.rainingtask = nil
            end
            self.rainingtask = self.inst:DoPeriodicTask(1, _Update, nil, self)
        else
            self.lefttime = data.lefttime or 0
            self.rainfilling = 0
            self.isfull = true
            self.inst:PushEvent("fullwater")
        end
    end
end

return WateringTool
