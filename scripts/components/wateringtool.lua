local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.watertype = WATERTYPE.EMPTY
    --self.wateringtoolstate = BUCKETSTATE.EMPTY

    self.basetime = nil
    self.targettime = nil

    self.frozed = nil
    self.cancollectrainwater = nil
    
    self.wateringtooltask = nil
    self.weatherchecktask = nil

    self.setstatesfn = nil
    self.settemperaturefn = nil
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
    self.watertype = WATERTYPE.EMPTY
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
    return self.targettime
end

function WateringTool:IsFrozen()
    return self.frozed
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
    if self.cancollectrainwater then

        self.drying = isdrying or false
        local loadtimer = isload or nil

        if israining then
            if self:GetWater() ~= WATERTYPE.EMPTY then
                self:StopCheckWeatherTask()
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
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

            local rain_timer = TUNING.BUCKET_LEVEL_PER_USE*2

            if self.targettime then
                rain_timer = self.targettime - GetTime()
            else
                rain_timer = loadtimer
            end

            self.targettime = rain_timer + GetTime()

            self.wateringtooltask = self.inst:DoTaskInTime(rain_timer, OnDone, self, WATERTYPE.CLEAN)
        elseif ( self.targettime or loadtimer ) and not self.drying then
            local dry_timer = loadtimer and loadtimer or self.targettime - GetTime()

            self.targettime = dry_timer + GetTime()

            self:StopWateringToolTask()

            self.wateringtooltask = self.inst:DoTaskInTime(dry_timer, OnDone, self, WATERTYPE.EMPTY)

            self.drying = true
        end

        self:StopCheckWeatherTask()

        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self, self.drying)
    else
        self:StopAllTask()
    end
end

function WateringTool:SetStates(state)

    local isfrozen = self:IsFrozen()
    local timer = 0
    local water = state

    print(water)

    self:Initialize()

    self.frozed = isfrozen
    self.watertype = state

    if water == WATERTYPE.CLEAN then
        timer = math.ceil(TUNING.PERISH_FAST/2)
        water = WATERTYPE.DIRTY
        print("SetStates : 물 채움")
    elseif water == WATERTYPE.DIRTY then
        timer = TUNING.BUCKET_LEVEL_PER_USE*4
        water = WATERTYPE.EMPTY
        print("SetStates : 물 썩음")
    else
        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
        self:Initialize()
        self:CollectRainWater(TheWorld.state.israining)
        print("SetStates : 물 마름")
        return true
    end

    self.basetime = timer

    if self.inst.components.temperature and self.settemperaturefn then
        self.settemperaturefn(self.inst)
    end

    if TheWorld.state.israining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY) then

        self.targettime = timer

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end

        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true, TheWorld.state.israining)
        print("SetStates : 비가 오거나 더러운 물이 얼어서 안 썩고 안 마릅니다")
        return true
    end

    self.targettime = timer + GetTime()

    self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self)
    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
    
    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringTool:RestartTimer(newstate, israining)

    self:StopCheckWeatherTask()

    local isnewstate = newstate
    local raining = israining or TheWorld.state.israining
    local timer = isnewstate and self.targettime or self.targettime - GetTime()
    local water = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or WATERTYPE.EMPTY

    if raining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY) then
        if self.wateringtooltask then
            self:StopWateringToolTask()
            self.targettime = timer
            print("RestartTimer : 비가 오거나 더러운 물이 얼어서 썩지 안고 마르지도 않습니다")
        end
    elseif self.wateringtooltask == nil then
        if isnewstate then
            isnewstate = nil
        end
        self.targettime = timer + GetTime()
        self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self, water)
        print("RestartTimer : 비가 멈춰서 썩거나 마릅니다")
    end

    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, isnewstate, TheWorld.state.israining)
end

function WateringTool:SetCanCollectRainWater(bool)
    self.cancollectrainwater = bool or nil
    self:Initialize()
    if bool then
        self:CollectRainWater(TheWorld.state.israining)
        print("SetCanCollectRainWater : 작동시작")
    end
end

function WateringTool:TimerChange(percent)

    self:StopAllTask()

    local water = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or WATERTYPE.EMPTY
    local isfrozen = self:IsFrozen()
    local remainingtime = isfrozen and math.ceil(TUNING.PERISH_SLOW/2) or 
          self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or 
          math.ceil(TUNING.PERISH_FAST/2)

    if percent < 0 then percent = 0 end
    if percent > 1 then percent = 1 end

    self.basetime = remainingtime
    self.targettime = percent*remainingtime

    if TheWorld.state.israining or (isfrozen and self.watertype == WATERTYPE.DIRTY) then
        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true, TheWorld.state.israining)
        print("TimerChange : 비가 오거나 더러운 물이 얼어서 안 썩고 안 마릅니다")
        return true
    end

    self.targettime = GetTime() + self.targettime

    self.wateringtooltask = self.inst:DoTaskInTime(remainingtime, OnDone, self, water)
    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
    print("TimerChange : 썩거나 마르는중")
end

function WateringTool:GetPercent()
    local isfrozen = self:IsFrozen()

    local remainingtime = self.targettime == nil and 0 or 
          isfrozen and self.watertype == WATERTYPE.DIRTY and self.targettime or
          math.floor(self.targettime - GetTime())

    if remainingtime > 0 then
        return math.min(1, remainingtime / self.basetime)
    else
        return 0
    end
end

function WateringTool:SetFrozed(bool)
    self.frozed = bool or nil

    if self.settemperaturefn then
        self.settemperaturefn(self.inst)
    end

    local timer = self:GetPercent()

    self:TimerChange(timer)

    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringTool:OnSave()
    local tasking = nil
    local timer = self.targettime ~= nil and self.targettime - GetTime() or 0
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

        if data.watertype == WATERTYPE.EMPTY and data.timer then
            self:CollectRainWater(TheWorld.state.israining, nil, data.timer)
            print("OnLoad : 받던 물이 있으므로 빗물을 다시 받거나 마릅니다")
            return true
        end

        self.basetime = data.basetime

        local water = data.watertype == WATERTYPE.CLEAN and WATERTYPE.DIRTY or WATERTYPE.EMPTY

        if self.inst.components.temperature and self.settemperaturefn then
            self.settemperaturefn(self.inst)
        end

        self.frozed = data.frozed or nil

        if TheWorld.state.israining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY) then

            self.targettime = data.timer

            if self.setstatesfn then
                self.setstatesfn(self.inst)
            end

            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true, TheWorld.state.israining)
            print("OnLoad : 비가 오거나 더러운 물이 얼어서 안 썩고 안 마릅니다")
            return true
        end

        self.targettime = GetTime() + math.max(0,data.timer)
        self.wateringtooltask = self.inst:DoTaskInTime(data.timer, OnDone, self, water)
        print("OnLoad : 타이머 작동시작")
        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
    end
end

function WateringTool:LongUpdate(dt)
    if self:IsTask() then

        self:StopAllTask()

        if self:IsFrozen() and self:GetWater() == WATERTYPE.DIRTY then
            print("LongUpdate : 더러운 물이 얼어서 안 마릅니다")
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
            return true
        end

        local water = WATERTYPE.CLEAN

        if self:GetWater() == WATERTYPE.CLEAN then
            water = WATERTYPE.DIRTY
            print("LongUpdate : 썩기가")
        elseif self:GetWater() == WATERTYPE.DIRTY or self.drying then
            print("LongUpdate : 마르기가")
            water = WATERTYPE.EMPTY
        end

        if self.targettime - dt > GetTime() then
            self.targettime = self.targettime - dt
            self.wateringtooltask = self.inst:DoTaskInTime(self.targettime - GetTime(), OnDone, self, water)
            if self:GetWater() == WATERTYPE.EMPTY then
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self)
            else
                self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
            end
            print("LongUpdate : 진행중")
        else
            self:ResetTimer()
            OnDone(self.inst, self, water)
            print("LongUpdate : 완료")
        end
    end
end

return WateringTool


