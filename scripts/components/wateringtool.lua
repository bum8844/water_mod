local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.maxrainfilling = TUNING.BUCKET_LEVEL_PER_USE
    self.rainfilling = 0

    self.isfull = false
    self.isdirty = false
    self.isfrozen = false

    self.cancontainrain = false
    self.rainingtask = nil
end,nil,nil)

local function IsRainStart()
    if GLOBAL.TheWorld.state.israining then
        self:GetRainDrop()
    end
end

local function Update(rainfilling, value)
    local self = inst.components.wateringtool
    if self ~= nil then
        if not GLOBAL.TheWorld.state.israining then
            value = -TUNING.LOST_WATER
        end
        rainfilling = rainfilling + value
        if rainfilling >= self.maxrainfilling then
            self:StopGetRaindrop()
        elseif inst.rainfilling <= 0 then
            self.StopLostRaindrop()
        end
    end
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

function WateringTool:SetCanContainRain(val)
    self.cancontainrain = val or false
end

function WateringTool:LongUpdate(dt)
    if self.rainingtask ~= nil then
        Update(self.rainfilling, dt or 0)
    end
end

function WateringTool:GetRainDrop()
    if self.rainingtask ~= nil then
        self.rainingtask:Cancel()
        self.rainingtask = nil
    end

    self.rainingtask = self.inst:DoPeriodicTask(1, Update, self.rainfilling, TUNING.RAIN_GIVE_WATER)
end

function WateringTool:StopGetRaindrop()
    if self.cancontainrain and not self.isfull then
        if self.rainingtask ~= nil then
            self.rainingtask:Cancel()
            self.rainingtask = nil
        end

        self.isfull = true
        self.inst:PushEvent("fullwater")
    end
end

function WateringTool:StopLostRaindrop()
    if self.rainingtask ~= nil then
        self.rainingtask:Cancel()
        self.rainingtask = nil
    end

    self.rainfilling = 0
    self.rainingtask = self.inst:DoPeriodicTask(1, IsRainStart)
end

function WateringTool:OnSave()
    if self.cancontainrain then
        return {
            cancontainrain = self.cancontainrain,
            paused = self.rainingtask == nil and nil,
            rainfilling = self.rainfilling > 0 and self.rainfilling or 0,
            isfull = self.isfull,
            isdirty = self.isdirty,
            isfrozen = self.isfrozen ,
        }
    else
        return {
            cancontainrain = self.cancontainrain,
        }
    end
end

function WateringTool:OnLoad(data)
    if data.cancontainrain ~= nil then
        if data.rainfilling > 0 then
            self.rainfilling = data.rainfilling

            if not data.isfull then
                if data.paused then
                    if GLOBAL.TheWorld.state.israining then
                        self:GetRainDrop()
                    else
                        self:LostRainDrop()
                    end
                else
                    self:StopLostRaindrop()
                end
            else
                self.isfull = data.isfull
                self.isdirty = data.isdirty
                self.isfrozen = data.isfrozen
                self.inst:PushEvent("fullwater")
            end
        end
    end
end

return WateringTool
