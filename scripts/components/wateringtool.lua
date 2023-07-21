local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.maxrainfilling = TUNING.BUCKET_LEVEL_PER_USE
    self.rainfilling = 0

    self.isfull = false
    self.isdirty = false
    self.isfrozen = false

    self.cancontainrain = false
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
        print("물 양 :"..val)
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
    print("현재 물 양 : "..self.rainfilling)
end

function WateringTool:HasWater()
    return self.rainfilling > 0
end

function WateringTool:IsFull()
    return self.isfull
end

function WateringTool:IsDirty()
    return self.isdirty
end

function WateringTool:IsFrozen()
    return self.isfrozen
end

function WateringTool:SetFull(val)
    self.isfull = val
end

function WateringTool:SetDirty(val)
    self.isdirty = val
end

function WateringTool:SetFrozen(val)
    self.isfrozen = val
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
    if self.cancontainrain then
        return {
            cancontainrain = self.cancontainrain,
            rainfilling = self.rainfilling > 0 and self.rainfilling or 0,
            isfull = self.isfull,
            isdirty = self.isdirty,
            isfrozen = self.isfrozen ,
            owner = self.owner,
        }
    else
        return {
            cancontainrain = self.cancontainrain,
        }
    end
end

function WateringTool:OnLoad(data)
    if data.cancontainrain ~= nil then
        self.owner = data.owner or nil
        if not data.isfull then
            if data.rainfilling >= 0 then
                self.rainfilling = data.rainfilling
            end
            if self.rainingtask ~= nil then
                self.rainingtask:Cancel()
                self.rainingtask = nil
            end
            self.rainingtask = self.inst:DoPeriodicTask(1, _Update, nil, self)
        else
            self.rainfilling = 0
            self.isfull = data.isfull
            self.isdirty = data.isdirty
            self.isfrozen = data.isfrozen
            self.inst:PushEvent("fullwater")
        end
    end
end

return WateringTool
