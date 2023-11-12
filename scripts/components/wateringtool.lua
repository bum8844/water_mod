local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.watertype = nil
    --self.wateringtoolstate = BUCKETSTATE.EMPTY

    self.basetime = nil
    self.targettime = nil

    self.frozed = nil
    self.cancollectrainwater = nil
    
    self.wateringtooltask = nil
    self.weatherchecktask = nil

    self.setstatesfn = nil
end,nil,nil)

local function CheckIsRaining(inst, self, newstate, israining)
    local raining = israining or TheWorld.state.israining
    self.weatherchecktask = nil
    self:RestartTimer(newstate, raining)
end

local function CheckWeather(inst, self, isdrying)
    self.weatherchecktask = nil
    self:CollectRainWater(TheWorld.state.israining, isdrying)
end

local function OnDone(inst, self, state)
    self.wateringtooltask = nil
    self:SetStates(state)
end

function WateringTool:Initialize()
    self.watertype = nil
    self.frozed = nil

    self:ResetTimer()
    self:StopAllTask()
end

function WateringTool:StopAllTask()
    self:StopWateringToolTask()
    self:StopCheckWeatherTask()
end

function WateringTool:ResetTimer()
    self.basetime = nil
    self.targettime = nil
end

function WateringTool:GetWater()
    return self.watertype
end

function WateringTool:IsTask()
    return self.targettime ~= nil
end

function WateringTool:IsFrozen()
    return self.frozed
end

function WateringTool:IsFull()
    return self:GetWater() ~= nil
end

function WateringTool:IsDirty()
    return self:GetWater() == WATERTYPE.DIRTY
end

function WateringTool:StopWateringToolTask()
    if self.wateringtooltask then
        self.wateringtooltask:Cancel()
        self.wateringtooltask = nil
    end
end

function WateringTool:StopCheckWeatherTask()
    if self.weatherchecktask then
        self.weatherchecktask:Cancel()
        self.weatherchecktask = nil
    end
end

function WateringTool:CollectRainWater(israining, isdrying, isload)
    if not self.cancollectrainwater then
        self:StopAllTask()
        return
    end

    local current_time = GetTime()

    self:StopCheckWeatherTask()

    if israining then
        if self:GetWater() then
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
        elseif self.drying then
            self:StopWateringToolTask()
            self.drying = false
        else
            local rain_timer = TUNING.PERISH_ONE_DAY / 8

            if self.targettime or isload then
                rain_timer = isload and isload or self.targettime - current_time
            end

            self.targettime = rain_timer + current_time
            self.wateringtooltask = self.inst:DoTaskInTime(rain_timer, OnDone, self, WATERTYPE.CLEAN)
        end
    elseif (self.targettime or isload) and not self.drying then
        local dry_timer = isload and isload or self.targettime - current_time
        self.targettime = dry_timer + current_time
        self:StopWateringToolTask()
        self.wateringtooltask = self.inst:DoTaskInTime(dry_timer, OnDone, self, nil)
        self.drying = true
    end

    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self, self.drying)
end

function WateringTool:SetStates(state)
    self:ResetTimer()
    self:StopAllTask()
    self.watertype = state

    local current_watertype = self:GetWater()
    local isdryed = not current_watertype

    local timer = isdryed and (current_watertype == WATERTYPE.CLEAN and math.ceil(TUNING.PERISH_FAST / 2) or TUNING.PERISH_ONE_DAY / 2) or 0
    local water = isdryed and (current_watertype == WATERTYPE.CLEAN and WATERTYPE.DIRTY or nil) or nil

    if isdryed then
        self:CollectRainWater(TheWorld.state.israining)
    else
        self.basetime = timer
        self.inst:PushEvent("settooltemperature")

        if TheWorld.state.israining or (self:IsFrozen() and current_watertype == WATERTYPE.DIRTY) then
            self.targettime = timer
            if self.setstatesfn then
                self.setstatesfn(self.inst)
            end
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true, TheWorld.state.israining)
        else
            self.targettime = timer + GetTime()
            self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self, water)
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
        end
    end
end

function WateringTool:RestartTimer(newstate, israining)
    local raining = israining or TheWorld.state.israining
    local timer = newstate and self.targettime or self.targettime - GetTime()
    local water = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or nil

    if (raining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY)) and self.wateringtooltask then
        self:StopAllTask()
    elseif not self.wateringtooltask then
        self.targettime = timer + GetTime()
        self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self, water)
        newstate = nil
    end

    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, newstate, TheWorld.state.israining)
end

function WateringTool:SetCanCollectRainWater(bool)
    self:Initialize()
    self.cancollectrainwater = bool or nil
    if bool then
        self:CollectRainWater(TheWorld.state.israining)
    end
end

function WateringTool:TimerChange(percent)
    self:StopAllTask()

    percent = math.clamp(percent, 0, 1)

    local water = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or nil
    local isfrozen = self:IsFrozen()
    local remainingtime

    if isfrozen then
        remainingtime = math.ceil(TUNING.PERISH_SLOW / 2)
    elseif self.watertype == WATERTYPE.DIRTY then
        remainingtime = TUNING.PERISH_ONE_DAY / 2
    else
        remainingtime = math.ceil(TUNING.PERISH_FAST / 2)
    end

    self.basetime = remainingtime
    self.targettime = percent * remainingtime

    if TheWorld.state.israining or (isfrozen and self.watertype == WATERTYPE.DIRTY) then
        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true, TheWorld.state.israining)
    else
        self.targettime = GetTime() + self.targettime
        self.wateringtooltask = self.inst:DoTaskInTime(remainingtime, OnDone, self, water)
        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
    end
end

function WateringTool:GetPercent()
    local isfrozen = self:IsFrozen()

    local remainingtime = self.targettime == nil and 0 or 
          (TheWorld.state.israining or (isfrozen and self.watertype == WATERTYPE.DIRTY)) and self.targettime or
          math.floor(self.targettime - GetTime())

    if remainingtime > 0 then
        return math.min(1, remainingtime / self.basetime)
    else
        return 0
    end
end

function WateringTool:SetFrozed(bool)
    self.frozed = bool or nil

    self.inst:PushEvent("settooltemperature")

    local timer = self:GetPercent()

    self:TimerChange(timer)

    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringTool:OnSave()
    local tasking = nil
    local timer = self.targettime ~= nil and ((TheWorld.state.israining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY)) and self.targettime or self.targettime - GetTime()) or 0
    return{
        cancollectrainwater = self.cancollectrainwater,
        watertype = self.watertype,
        frozed = self.frozed,
        timer = timer,
        basetime = self.basetime,
    }
end

function WateringTool:OnLoad(data)
    self:Initialize()
    
    if data and data.cancollectrainwater then
        self.cancollectrainwater = data.cancollectrainwater
        self.watertype = data.watertype
        self.basetime = data.basetime
        local timer = data.timer or 0
        self.frozed = data.frozed

        self:LoadWateringToolState(data.timer)
    end
end

function WateringTool:LoadWateringToolState(timer)
    self.inst:PushEvent("settooltemperature")

    local water = (self.watertype == WATERTYPE.CLEAN) and WATERTYPE.DIRTY or nil
    local raining = TheWorld.state.israining
    local isFrozenAndDirty = self:IsFrozen() and (self.watertype == WATERTYPE.DIRTY)

    if raining or isFrozenAndDirty then
        self.targettime = timer

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end

        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true, raining)
        return true
    end

    self.targettime = GetTime() + math.max(0, timer)
    self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self, water)

    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringTool:LongUpdate(dt)
    if self:IsTask() then
        self:StopAllTask()

        local raining = TheWorld.state.israining
        local current_water = self:GetWater()
        local isFrozenAndDirty = self:IsFrozen() and current_water == WATERTYPE.DIRTY
        local water

        if raining and current_water ~= nil then
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, raining)
            return true
        elseif isFrozenAndDirty then
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, raining)
            return true
        elseif current_water == WATERTYPE.CLEAN then
            water = WATERTYPE.DIRTY
        elseif current_water == WATERTYPE.DIRTY or self.drying then
            water = nil
        end

        if self.targettime - dt > GetTime() then
            self.targettime = self.targettime - dt
            self.wateringtooltask = self.inst:DoTaskInTime(self.targettime - GetTime(), OnDone, self, water)

            if current_water == nil then
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self)
            else
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, raining)
            end
        else
            self:ResetTimer()
            OnDone(self.inst, self, water)
        end
    end
end

return WateringTool


