local WateringTool = Class(function(self, inst)
    self.inst = inst
    self.watertype = nil
    self.frozed = false

    self.cancollectrainwater = false
    self.wateringtooltask = nil
    self.state = "dodry"

    self.setstatesfn = nil

    self:WatchWorldState("israining", self.CollectRainWater)
    self:CollectRainWater(TheWorld.state.israining)
end,nil,nil)

local function Ondone(inst, self, watertype, state)
    self.wateringtooltask = nil
    self:DoneResult(watertype, nil, state)
end

local function SetCheckWeather(inst, self)
    self.wateringtooltask = nil
    self:CollectRainWater(TheWorld.state.israining)
end

local function FreezeToIce(inst, data)
    local watertype = inst.components.wateringtool.watertype
    local cur_temp = inst.components.temperature:GetCurrent()
    local min_temp = inst.components.temperature.mintemp
    --local max_temp = inst.components.temperature.maxtemp
    if cur_temp <= min_temp then
        inst.components.wateringtool:SetFrozed(true)
        local timer = inst.components.wateringtool:GetPercent()
        inst.components.wateringtool:TimerChange(timer)
        if inst.components.wateringtool.setstatesfn then
            inst.components.wateringtool.setstatesfn(inst, watertype)
        end
    end
end

local function ThawToWater(inst, data)
    local watertype = inst.components.wateringtool.watertype
    local cur_temp = inst.components.temperature:GetCurrent()
    --local min_temp = inst.componnets.temperature.mintemp
    local max_temp = inst.components.temperature.maxtemp
    if cur_temp >= max_temp then
        inst.components.wateringtool:SetFrozed(false)
        local timer = inst.components.wateringtool:GetPercent()
        inst.components.wateringtool:TimerChange(timer)
        if inst.components.wateringtool.setstatesfn then
            inst.components.wateringtool.setstatesfn(inst, watertype)
        end
    end
end

function WateringTool:SetFrozed(value)
    self.frozed = value or false
end

function WateringTool:SetWaterType(value)
    self.watertype = value or nil
end

function WateringTool:SetCanCollectRainWater(value)
    self.cancollectrainwater = value or false
end

function WateringTool:CollectRainWater(israining, time)
    if self.cancollectrainwater then

        self:StopCollectRainWater()

        local rainwater = TUNING.BUCKET_LEVEL_PER_USE*2

        if time ~= nil and time > 0 then
            rainwater = time
        end

        self.targettime = GetTime() + rainwater

        if israining and not self.watertype then
            if self.wateringtooltask ~= nil then
                self.wateringtooltask:Cancel()
            end
            self.wateringtooltask = self.inst:DoTaskInTime(rainwater, Ondone, self, WATERTYPE.CLEAN, "dofull")
            print("물 담는중")
            return true
        end
        self:DoneResult(self.watertype, time)
    end
end

function WateringTool:DoneResult(watertype, time, state)
    local mustdry = false
    if not watertype then
        self:StopCollectRainWater()
        self.wateringtooltask = self.inst:DoTaskInTime(1, SetCheckWeather, self)
        mustdry = true
    else

        self.watertype = watertype
        self.state = state

        local remainingtime = self.frozed and TUNING.PERISH_SLOW or 
              self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or 
              TUNING.PERISH_FAST

        if time ~= nil and time > 0 then
            remainingtime = time
        end

        self.targettime = GetTime() + remainingtime

        local temp = self.frozed and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP
        local maxtamp = self.frozed and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP

        self.inst:AddComponent("temperature")

        self.inst.components.temperature.current = math.min(TheWorld.state.temperature, temp)
        self.inst.components.temperature.maxtemp = maxtamp
        self.inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
        self.inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE

        self.inst:ListenForEvent("temperaturedelta", self.frozed and ThawToWater or FreezeToIce)

        if self.wateringtooltask ~= nil then
            self.wateringtooltask:Cancel()
        end

        if self.watertype == WATERTYPE.DIRTY and not self.frozed then
            self.wateringtooltask = self.inst:DoTaskInTime(remainingtime, Ondone, self, nil, "dodry")
            print("물 마르는중")
        elseif self.watertype == WATERTYPE.CLEAN then
            self.wateringtooltask = self.inst:DoTaskInTime(remainingtime, Ondone, self, WATERTYPE.DIRTY, "dospoil")
            print("물 썩는중") 
        end
    end
    if self.setstatesfn then
        self.setstatesfn(self.inst, watertype, mustdry)
    end
end

function WateringTool:GetPercent()
    local spoiledingtime = self.frozed and TUNING.PERISH_SLOW or TUNING.PERISH_FAST
    local remainingtime = self.targettime ~= nil and math.floor(self.targettime - GetTime()) or 0
    if remainingtime and remainingtime > 0 then
        return math.min(1, remainingtime / spoiledingtime)
    else
        return 0
    end
end

function WateringTool:TimerChange(percent)
    local rainwater = self.watertype ~= nil and ( self.frozed and TUNING.PERISH_SLOW or 
        (self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4) or
        TUNING.PERISH_FAST ) or TUNING.BUCKET_LEVEL_PER_USE*2

    if percent < 0 then percent = 0 end
    if percent > 1 then percent = 1 end
    rainwater = percent*rainwater

    self:StopCollectRainWater()

    self.targettime = GetTime() + rainwater

    if self.watertype == WATERTYPE.DIRTY and not self.frozed then
        self.wateringtooltask = self.inst:DoTaskInTime(rainwater, Ondone, self, nil, "dodry")
        print("물 마르는중")
    else
        self.wateringtooltask = self.inst:DoTaskInTime(rainwater, Ondone, self, WATERTYPE.DIRTY, "dospoil")
        print("물 썩는중") 
    end
end

function WateringTool:StopCollectRainWater()
    self.targettime = nil

    if self.wateringtooltask then
        self.wateringtooltask:Cancel()
        self.wateringtooltask = nil
    end
end

function WateringTool:IsFrozen()
    return self.frozed
end

function WateringTool:HasWater()
    return self.watertype
end

function WateringTool:IsCollectRainWater()
    return self.targettime
end

function WateringTool:GetState()
    return self.state
end

function WateringTool:OnSave()
    local time = (self.targettime ~= nil and math.floor(self.targettime - GetTime())) or nil
    if time then
        time = math.max(0, time)
    end
    local data =
    {
        state = self.state,
        cancollectrainwater = self.cancollectrainwater,
        watertype = self.watertype,
        frozed = self.frozed,
        time = time,
    }
    return data
end

function WateringTool:OnLoad(data)
    if data ~= nil and data.cancollectrainwater then
        local watertype = data.watertype or nil
        self:StopCollectRainWater()
        self:SetCanCollectRainWater(true)
        self:SetFrozed(data.frozed)

        self:SetWaterType(watertype)
        self.state = data.state or "dodry"

        local time = data.time or 0
        self:CollectRainWater(TheWorld.state.israining,math.max(0, time))
        if inst.components.wateringtool.setstatesfn then
            inst.components.wateringtool.setstatesfn(inst, watertype)
        end
    end
end

function WateringTool:LongUpdate(dt)
    self:CollectRainWater(TheWorld.state.israining,math.max(0, self.targettime - dt - GetTime()))
end

return WateringTool


