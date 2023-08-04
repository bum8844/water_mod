local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.watertype = nil

    self.targettime = nil
    self.spoiltime = nil
    self.drytime = nil

    self.frozed = nil
    self.cancollectrainwater = nil
    
    self.wateringtooltask = nil
    self.weatherchecktask = nil

    self.setstatesfn = nil
end,nil,nil)

local function ThawToWater(inst, data)
    local watertype = inst.components.wateringtool:GetWater()
    local cur_temp = inst.components.temperature:GetCurrent()
    --local min_temp = inst.componnets.temperature.mintemp
    local max_temp = inst.components.temperature.maxtemp
    if cur_temp >= max_temp then
        inst.components.wateringtool:SetFrozed(false)
    end
end

local function FreezeToIce(inst, data)
    local watertype = inst.components.wateringtool:GetWater()
    local cur_temp = inst.components.temperature:GetCurrent()
    local min_temp = inst.components.temperature.mintemp
    --local max_temp = inst.components.temperature.maxtemp
    if cur_temp <= min_temp then
        inst.components.wateringtool:SetFrozed(true)
    end
end

local function CheckWeather(inst, self)
    self.weatherchecktask = nil
    self:CollectRainWater(TheWorld.state.israining)
end

local function OnDone(inst, self, state)
    self.wateringtooltask = nil
    self:SetStates(state)
end

function WateringTool:StopAllTask()
    self.watertype = nil
    self.frozed = nil

    self:ResetTimer()
    self:StopWateringToolTask()
    self:StopCheckWeatherTask()
end

function WateringTool:ResetTimer()
    self.targettime = nil
    self.spoiltime = nil
    self.drytime = nil
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

            self.wateringtooltask = self.inst:DoTaskInTime(dry_timer, OnDone, self, nil)
        end

        self:StopCheckWeatherTask()

        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self)
    else
        self:StopAllTask()
    end
end

function WateringTool:SetStates(state)

    self:StopWateringToolTask()
    self:StopCheckWeatherTask()

    self.watertype = state
    print(self.watertype or "값이빔")

    --더러운물이나 깨끗한물이 얼 수 있도록 온도컴포넌트 추가
    if self.watertype == WATERTYPE.CLEAN or self.watertype == WATERTYPE.DIRTY then
        local temp = self.frozed and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP
        local maxtamp = self.frozed and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP

        self.inst:AddComponent("temperature")

        self.inst.components.temperature.current = math.min(TheWorld.state.temperature, temp)
        self.inst.components.temperature.maxtemp = maxtamp
        self.inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
        self.inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE

        --self.inst:ListenForEvent("temperaturedelta", self.frozed and FreezeToIce or ThawToWater)
    end

    --물이 꽉차거나 차는 도중 비가 그처 말라버림
    if self.targettime then

        self:ResetTimer()

        if not self.watertype then

            self.weatherchecktask = self.inst:DoTaskInTime(0, CheckWeather, self)

            return true
        end

        local spoil_timer = math.ceil(TUNING.PERISH_FAST)

        self.spoiltime = spoil_timer + GetTime()

        self.wateringtooltask = self.inst:DoTaskInTime(spoil_timer, OnDone, self, WATERTYPE.DIRTY)

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end

        return true
    end

    --물이 더러워짐
    if self.spoiltime then

        self:ResetTimer()

        local dry_timer = math.ceil(TUNING.PERISH_FAST)

        self.drytime = dry_timer + GetTime()

        self.wateringtooltask = self.inst:DoTaskInTime(dry_timer, OnDone, self, nil)

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end

        return true

    end

    --물이 말라버림
    if self.drytime then

        self:ResetTimer()

        self.inst:RemoveComponent("temperature")

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end

        self:CollectRainWater(TheWorld.state.israining)

        return true

    end
end

function WateringTool:SetCanCollectRainWater(bool)
    self.cancollectrainwater = bool or nil
    if bool then
        self:CollectRainWater(TheWorld.state.israining)
    else
        self:StopAllTask()
    end
end

function WateringTool:TimerChange(percent)
    local isdry = self.drytime or nil
    local watertype = not isdry and WATERTYPE.DIRTY or nil
    local remainingtime = self.frozed and math.ceil(TUNING.PERISH_SLOW/2) or 
          self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or 
          math.ceil(TUNING.PERISH_FAST/2)

    if percent < 0 then percent = 0 end
    if percent > 1 then percent = 1 end

    remainingtime = percent*remainingtime

    self:StopAllTask()

    if self.frozed and self.watertype == WATERTYPE.DIRTY then
        self.drytime = remainingtime
        return true
    end

    if isdry then
        self.drytime = GetTime() + remainingtime
    else
        self.spoiltime = GetTime() + remainingtime
    end

    self.wateringtooltask = self.inst:DoTaskInTime(remainingtime, OnDone, self, watertype)
end

function WateringTool:GetPercent()
    local spoiledingtime = self.frozed and math.ceil(TUNING.PERISH_SLOW/2) or 
          self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or 
          math.ceil(TUNING.PERISH_FAST/2)
    local remainingtime = self.spoiltime ~= nil and math.floor(self.spoiltime - GetTime()) or 0
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

    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringTool:OnSave()
    local tasking = nil
    local timer = nil
    if self.targettime then
        tasking = 0
        timer = self.targettime - GetTime()
    elseif self.spoiltime then
        tasking = 1
        timer = self.spoiltime - GetTime()
    elseif self.drytime then
        tasking = 2
        timer = self.drytime - GetTime()
    end
    return{
        cancollectrainwater = self.cancollectrainwater,
        watertype = self.watertype,
        frozed = self.frozed,
        paused = self.frozed and timer or nil,
        tasking = tasking,
        timer = timer,
    }
end

function WateringTool:OnLoad(data)
    if data and data.cancollectrainwater then
        self.cancollectrainwater = data.cancollectrainwater
        self:StopAllTask()
        if data.tasking then
            self.watertype = data.watertype or nil
            local tasking = data.tasking
            if tasking == 0 then
                local watertype = TheWorld.state.israining and WATERTYPE.CLEAN or nil
                self.targettime = GetTime() + math.max(0, data.timer)
                self.wateringtooltask = self.inst:DoTaskInTime(data.timer, OnDone, self, watertype)
            elseif tasking == 1 then
                self.spoiltime = GetTime() + math.max(0, data.timer)
                self.wateringtooltask = self.inst:DoTaskInTime(data.timer, OnDone, self, WATERTYPE.DIRTY)
            else
                self.drytime = GetTime() + math.max(0, data.timer)
                self.wateringtooltask = self.inst:DoTaskInTime(data.timer, OnDone, self, nil)
            end
            if self.watertype and self.setstatesfn then
                self.setstatesfn(self.inst)
            end
        else
            self:CollectRainWater(TheWorld.state.israining)
        end
    end
end

function WateringTool:GetWater()
    return self.watertype
end

function WateringTool:IsCollectRainWater()
    return self.targettime
end

function WateringTool:IsSpoiledRainWater()
    return self.spoiltime
end

function WateringTool:IsdriedRainWater()
    return self.drytime
end

function WateringTool:IsFrozen()
    return self.frozed
end

function WateringTool:LongUpdate(dt)

    self:StopWateringToolTask()
    self:StopCheckWeatherTask()

    if self:IsCollectRainWater() then
        local watertype = TheWorld.state.israining and WATERTYPE.CLEAN or nil

        if self.targettime - dt > GetTime() then

            self.targettime = self.targettime - dt
            self.wateringtooltask = self.inst:DoTaskInTime(self.targettime - GetTime(), OnDone, self, watertype)
        else
            self:ResetTimer()
            OnDone(self.inst, self, watertype)
        end

    elseif self:IsSpoiledRainWater()then

        if self.spoiltime - dt > GetTime() then
            self.spoiltime = self.spoiltime - dt
            self.wateringtooltask = self.inst:DoTaskInTime(self.spoiltime - GetTime(), OnDone, self, WATERTYPE.DIRTY)
        else
            self:ResetTimer()
            OnDone(self.inst, self, WATERTYPE.DIRTY)
        end
    
    elseif self:IsdriedRainWater() then

        if self.drytime - dt > GetTime() then
            self.drytime = self.drytime - dt
            self.wateringtooltask = self.inst:DoTaskInTime(self.drytime - GetTime(), OnDone, self, nil)
        else
            self:ResetTimer()
            OnDone(self.inst, self, nil)
        end

    end
end

return WateringTool


