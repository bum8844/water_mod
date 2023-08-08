local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.watertype = WATERTYPE.EMPTY
    --self.wateringtoolstate = BUCKETSTATE.EMPTY

    self.targettime = nil

    self.frozed = nil
    self.cancollectrainwater = nil
    
    self.wateringtooltask = nil
    self.weatherchecktask = nil

    self.setstatesfn = nil
    self.settemperaturefn = nil
end,nil,nil)

local function CheckIsRaining(inst, self, newstate)
    self.weatherchecktask = nil
    self:RestartTimer(newstate)
end

local function CheckWeather(inst, self)
    self.weatherchecktask = nil
    self:CollectRainWater(TheWorld.state.israining)
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

function WateringTool:CollectRainWater(israining)
    if self.cancollectrainwater then

        if self.watertype ~= WATERTYPE.EMPTY then
            self:StopCheckWeatherTask()
            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self)
            return true
        end

        if israining then
            local rain_timer = TUNING.BUCKET_LEVEL_PER_USE*2

            if self.targettime then
                rain_timer = self.targettime - GetTime()
            end

            self.targettime = rain_timer + GetTime()

            self:StopWateringToolTask()

            self.wateringtooltask = self.inst:DoTaskInTime(rain_timer, OnDone, self, WATERTYPE.CLEAN)
        elseif self.targettime then
            local dry_timer = self.targettime - GetTime()

            self.targettime = dry_timer + GetTime()

            self:StopWateringToolTask()

            self.wateringtooltask = self.inst:DoTaskInTime(dry_timer, OnDone, self, WATERTYPE.EMPTY)
        end

        self:StopCheckWeatherTask()

        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self)
    else
        self:StopAllTask()
    end
end

function WateringTool:SetStates(state)

    self:StopAllTask()

    self.watertype = state

    print(self.watertype)

    local timer = 0
    local water = self.watertype

    if water == WATERTYPE.CLEAN then
        timer = math.ceil(TUNING.PERISH_FAST/2)
        water = WATERTYPE.DIRTY
        print("물 채움")
    elseif water == WATERTYPE.DIRTY then
        timer = TUNING.BUCKET_LEVEL_PER_USE*4
        water = WATERTYPE.EMPTY
        print("물 썩음")
    else
        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
        self:CollectRainWater(TheWorld.state.israining)
        print("물 마름")
        return true
    end

    if self.inst.components.temperature and self.settemperaturefn then
        self.settemperaturefn(self.inst)
    end

    if TheWorld.state.israining then
        self.targettime = timer
        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true)

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
        return true
    end

    if self:IsFrozen() then
        self.targettime = timer
        return true
    end

    self.targettime = timer + GetTime()

    self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self)
    
    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringTool:RestartTimer(newstate)
    self:StopAllTask()
    local isnewstate = newstate
    if not TheWorld.state.israining then
        local timer = isnewstate and self.targettime or self.targettime - GetTime()
        self.targettime = timer + GetTime()
        isnewstate = nil
        self.wateringtooltask = self.inst:DoTaskInTime(timer, OnDone, self)
    else
        local timer = isnewstate and self.targettime or self.targettime - GetTime()
        self.targettime = timer
    end
    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, isnewstate)
end

function WateringTool:SetCanCollectRainWater(bool)
    self.cancollectrainwater = bool or nil
    if bool then
        self:CollectRainWater(TheWorld.state.israining)
        print("작동시작")
    else
        self:Initialize()
    end
end

function WateringTool:TimerChange(percent)
    local remainingtime = self.frozed and math.ceil(TUNING.PERISH_SLOW/2) or 
          self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or 
          math.ceil(TUNING.PERISH_FAST/2)

    if percent < 0 then percent = 0 end
    if percent > 1 then percent = 1 end

    self.targettime = percent*remainingtime

    self:StopAllTask()

    if self.frozed and self.watertype == WATERTYPE.DIRTY then
        return true
    end

    self.targettime = GetTime() + self.targettime

    self.wateringtooltask = self.inst:DoTaskInTime(remainingtime, OnDone, self, self.watertype)
end

function WateringTool:GetPercent()
    local spoiledingtime = self.frozed and math.ceil(TUNING.PERISH_SLOW/2) or 
          self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or 
          math.ceil(TUNING.PERISH_FAST/2)
    local remainingtime = self.targettime ~= nil and ( self.frozed and self.targettime or math.floor(self.targettime - GetTime())) or 0
    if remainingtime and remainingtime > 0 then
        return math.min(1, remainingtime / spoiledingtime)
    else
        return 0
    end
end

function WateringTool:SetFrozed(bool)
    self.frozed = bool or nil

    local timer = self:GetPercent()

    self:TimerChange(timer)

    if self.settemperaturefn then
        self.settemperaturefn(self.inst)
    end

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
        paused = self.frozed and timer or nil,
        timer = timer,
    }
end

function WateringTool:OnLoad(data)
    self:Initialize()
    if data and data.cancollectrainwater then

        self.cancollectrainwater = data.cancollectrainwater
        self.watertype = data.watertype

        local water = WATERTYPE.CLEAN

        if data.watertype == WATERTYPE.CLEAN then
            water = WATERTYPE.DIRTY
        elseif data.watertype == WATERTYPE.DIRTY then
            water = WATERTYPE.EMPTY
        elseif data.timer and not TheWorld.state.israining then
            water = WATERTYPE.EMPTY
        else
            self:CollectRainWater(TheWorld.state.israining)
            return true
        end

        if self.inst.components.temperature and self.settemperaturefn then
            self.settemperaturefn(self.inst)
        end

        if data.frozed and not water == WATERTYPE.EMPTY then
            self.frozed = data.frozed
            if data.paused then
                self.targettime = data.timer
                if self.setstatesfn then
                    self.setstatesfn(self.inst)
                end
                return true
            end
        end

        self.targettime = GetTime() + math.max(0,data.timer)
        self.wateringtooltask = self.inst:DoTaskInTime(data.timer, OnDone, self, water)

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
    end
end

function WateringTool:LongUpdate(dt)
    if self:IsTask() then
        self:StopAllTask()
        local water = WATERTYPE.CLEAN

        if self.watertype == WATERTYPE.CLEAN then
            water = WATERTYPE.DIRTY
            print("update물 썩는중")
        elseif self.watertype == WATERTYPE.DIRTY or not TheWorld.state.israining then
            water = WATERTYPE.EMPTY
            print("update물 마르는중")
        end
        if self.targettime - dt > GetTime() then
            self.targettime = self.targettime - dt
            self.wateringtooltask = self.inst:DoTaskInTime(self.targettime - GetTime(), OnDone, self, water)
            print("대기")
        else
            self:ResetTimer()
            OnDone(self.inst, self, water)
            print("완료")
        end
    end
end

return WateringTool


