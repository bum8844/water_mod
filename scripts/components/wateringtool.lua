local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.pre_watertype = nil
    self.watertype = nil

    self.basetime = nil
    self.targettime = nil

    self.frozed = nil
    self.cancollectrainwater = nil
    self.iscollectacid = nil
    self.delay = false
    
    self.wateringtooltask = nil
    self.weatherchecktask = nil

    self.setstatesfn = nil
end,nil,nil)

local function CheckIsRaining(inst, self, newstate)
    local raining = TheWorld.state.israining
    local acidraining = TheWorld.state.isacidraining
    self.weatherchecktask = nil
    self:RestartTimer(newstate, raining, acidraining)
end

local function CheckWeather(inst, self, isdrying)
    local raining = TheWorld.state.israining
    local acidraining = TheWorld.state.isacidraining
    self.weatherchecktask = nil
    self:CollectRainWater(raining, acidraining, isdrying)
end

local function OnDone(inst, self, state)
    self.iscollectacid = false
    self.delay = false
    self.pre_watertype = nil
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

function WateringTool:GetTimeLeft()
    return self.targettime ~= nil and self.targettime - GetTime() or 0
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

function WateringTool:DoDrying(loadtimer,rain_timer,delay)
    local dry_timer = 0

    local default_timer = TUNING.PERISH_ONE_DAY/8

    if loadtimer then
        dry_timer = loadtimer
    else
        dry_timer = delay and default_timer - rain_timer or rain_timer - (self.targettime - GetTime())
    end

    self.targettime = GetTime() + dry_timer

    self:StopWateringToolTask()
    
    self.wateringtooltask = self.inst:DoTaskInTime(dry_timer, OnDone, self, nil)

    self.delay = delay
    self.drying = true
end

function WateringTool:CollectRainWater(israining, isacidraining, isdrying, isload)
    if self.cancollectrainwater then
        self.drying = isdrying or false

        local raining = israining or TheWorld.state.israining
        local acidraining = isacidraining or TheWorld.state.isacidraining

        if acidraining then
            self.iscollectacid = true
        end

        local loadtimer = isload or nil
        local rain_timer = TUNING.PERISH_ONE_DAY/8

        if raining or acidraining then
            if self:GetWater() ~= nil then
                self:StopCheckWeatherTask()
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self)
                return true
            end

            if self.drying then
                self:StopWateringToolTask()
                self.drying = false
            end

            if self.wateringtooltask then
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self)
                return true
            end

            if self.targettime then
                rain_timer = rain_timer - (self.targettime - GetTime())
            elseif loadtimer then
                rain_timer = loadtimer
            end

            self.targettime = GetTime() + rain_timer
            local fillwater = self.iscollectacid and WATERTYPE.ACID or WATERTYPE.CLEAN

            if not self.pre_watertype then
                self.pre_watertype = fillwater
            end
            if not self.pre_watertype or (self.pre_watertype and self.pre_watertype == fillwater) then
                self.wateringtooltask = self.inst:DoTaskInTime(rain_timer, OnDone, self, fillwater)
            elseif ( self.targettime or loadtimer ) and not self.drying then
                self:DoDrying(loadtimer,rain_timer,true)
            end
        elseif (self.targettime or loadtimer) and not self.drying then
            self:DoDrying(loadtimer,rain_timer)
        end

        self:StopCheckWeatherTask()

        self.weatherchecktask = self.inst:DoTaskInTime(0.1, CheckWeather, self, self.drying)
    else
        self:StopAllTask()
    end
end

function WateringTool:SetStates(state)
    self:ResetTimer()
    self:StopAllTask()

    self.watertype = state

    if self.watertype ~= WATERTYPE.ACID then
        local current_watertype = self:GetWater()
        local timer = TUNING.PERISH_ONE_DAY/2
        local water = nil
        local isdryed = false

        if current_watertype == WATERTYPE.CLEAN then
            timer = math.ceil(TUNING.PERISH_FAST/2)
            water = WATERTYPE.DIRTY
        elseif not current_watertype then
            isdryed = true
        end

        if not isdryed then
            self.basetime = timer

            self.inst:PushEvent("settooltemperature")

            if TheWorld.state.israining or (self:IsFrozen() and current_watertype == WATERTYPE.DIRTY) then

                self.targettime = timer

                if self.setstatesfn then
                    self.setstatesfn(self.inst)
                end

                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true)
                return true
            end

            self.targettime = timer + GetTime()

            self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self, water)
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self)
        else
            self:CollectRainWater(TheWorld.state.israining, TheWorld.state.isacidraining)
        end
    end

    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringTool:RestartTimer(newstate, israining, isacidraining)
    local isnewstate = newstate
    local raining = israining or TheWorld.state.israining
    local acidraining = isacidraining or TheWorld.state.isacidraining

    local timer = isnewstate and self.targettime or self.targettime and self.targettime - GetTime() or 0

    local water = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or nil

    if not acidraining then
        if raining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY) then
            if self.wateringtooltask then
                self:StopAllTask()
                 self.targettime = timer
            end
        elseif self.wateringtooltask == nil then
            if isnewstate then
                isnewstate = nil
            end
            self.targettime = timer + GetTime()
            self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self, water)
        end
    end

    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, isnewstate)
end

function WateringTool:SetCanCollectRainWater(bool)
    self:Initialize()
    self.cancollectrainwater = bool or nil
    if bool then
        self:CollectRainWater(TheWorld.state.israining, TheWorld.state.isacidraining)
    end
end

function WateringTool:TimerChange(percent)
    self:StopAllTask()

    local water = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or nil
    local isfrozen = self:IsFrozen()
    local remainingtime = isfrozen and math.ceil(TUNING.PERISH_SLOW/2) or 
          self.watertype == WATERTYPE.DIRTY and TUNING.PERISH_ONE_DAY/2 or 
          math.ceil(TUNING.PERISH_FAST/2)

    if percent < 0 then percent = 0 end
    if percent > 1 then percent = 1 end

    self.basetime = remainingtime
    self.targettime = percent*remainingtime

    if TheWorld.state.israining or (isfrozen and self.watertype == WATERTYPE.DIRTY) then
        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true)
        return true
    end

    self.targettime = GetTime() + self.targettime

    self.wateringtooltask = self.inst:DoTaskInTime(percent*remainingtime, OnDone, self, water)
    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self)
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
        iscollectacid = self.iscollectacid,
        watertype = self.watertype,
        frozed = self.frozed,
        timer = timer,
        basetime = self.basetime,
    }
end

function WateringTool:OnLoad(data)
    self:Initialize()
    if data and data.cancollectrainwater then

        self.iscollectacid = data.iscollectacid
        self.watertype = data.watertype

        if data.watertype == nil and data.timer then
            self:CollectRainWater(TheWorld.state.israining, TheWorld.state.isacidraining, nil, data.timer)
            return true
        end

        if not data.watertype == WATERTYPE.ACID then
            self.basetime = data.basetime

            local water = data.watertype == WATERTYPE.CLEAN and WATERTYPE.DIRTY or nil

            self.inst:PushEvent("settooltemperature")

            self.frozed = data.frozed or nil

            if TheWorld.state.israining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY) then

                self.targettime = data.timer

                if self.setstatesfn then
                    self.setstatesfn(self.inst)
                end

                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true)
                return true
            end

            self.targettime = GetTime() + math.max(0,data.timer)
            
            self.wateringtooltask = self.inst:DoTaskInTime(data.timer, OnDone, self, water)
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self)
        end

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
    end
end

function WateringTool:LongUpdate(dt)
    if self:IsTask() then

        self:StopAllTask()

        if ((TheWorld.state.israining or TheWorld.state.isacidraining) and self:GetWater() ~= nil) or (self:IsFrozen() and self:GetWater() == WATERTYPE.DIRTY) then
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self)
            return true
        end

        local water = self.iscollectacid and WATERTYPE.ACID or WATERTYPE.CLEAN

        if self:GetWater() == WATERTYPE.CLEAN then
            water = WATERTYPE.DIRTY
        elseif self:GetWater() == WATERTYPE.DIRTY or self.drying then
            water = nil
        end

        if self.targettime - dt > GetTime() then
            self.targettime = self.targettime - dt
            self.wateringtooltask = self.inst:DoTaskInTime(self.targettime - GetTime(), OnDone, self, water)
            if self:GetWater() == nil then
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self)
            else
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil)
            end
        else
            self:ResetTimer()
            OnDone(self.inst, self, water)
        end
    end
end

return WateringTool


