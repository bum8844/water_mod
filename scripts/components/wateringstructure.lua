local function onwateringtool(self, wateringtool)
    if wateringtool then
        self.inst:RemoveTag("ready")
    else
        self.inst:AddTag("ready")
    end
end

local WateringStructure = Class(function(self, inst)
    self.inst = inst

    self.watertype = WATERTYPE.EMPTY
    self.wateringtool = nil
    self.toolfiniteuses = 0
    self.wateramount = 0

    self.basetime = nil
    self.targettime = nil

    self.frozed = nil
    
    self.watertask = nil

    self.setstatesfn = nil
    self.settemperaturefn = nil
end,
nil,
{
    wateringtool = onwateringtool
})

local function OnDone(inst, self, resultwater)
    self.watertask = nil
    self:SetWaterTimer(resultwater)
end

function WateringStructure:Initialize()
    self.watertype = WATERTYPE.EMPTY
    self.frozed = nil

    self:ResetTimer()
    self:StopWatertask()
end

function WateringStructure:StopWatertask()
    if self.watertask then
        self.watertask:Cancel()
        self.watertask = nil
    end
end

function WateringStructure:ResetTimer()
    self.basetime = nil
    self.targettime = nil
end

function WateringStructure:RegistrationWateringTool(item,finiteuses)
    self.wateringtool = item.prefab
    self.toolfiniteuses = finiteuses
end

function WateringStructure:SetWaterAmount()
    local amount = TUNING.BUCKET_LEVEL_PER_USE
    local finiteuses = self.toolfiniteuses

    if finiteuses < amount then
        amount = self.toolfiniteuses
        self.toolfiniteuses = 0
    else
        self.toolfiniteuses = finiteuses - amount
    end

    self.wateramount = amount

    self:SetWaterTimer(WATERTYPE.CLEAN)
end

function WateringStructure:SetWater(watertype)
   self.watertype = watertype and watertype or WATERTYPE.EMPTY
end

function WateringStructure:SetFrozen(bool)
    self.frozed = bool and bool or nil
end

function WateringStructure:GetWateringTool()
    return self.wateringtool
end

function WateringStructure:GetWater()
    return self.watertype
end

function WateringStructure:GetWaterAmount()
    return self.wateramount
end

function WateringStructure:GetToolFiniteuses()
    return self.toolfiniteuses
end

function WateringStructure:IsFrozen()
    return self.frozed
end

function WateringStructure:IsFrozenDirtyWater()
    return self:GetWater() == WATERTYPE.DIRTY and self:IsFrozen()
end

function WateringStructure:SetWaterTimer(watertype)

    local isfrozen = self:IsFrozen()
    local resultwater = WATERTYPE.EMPTY
    local timer = TUNING.BUCKET_LEVEL_PER_USE*4
    local state = watertype

    self:Initialize()

    self.frozed = isfrozen

    self:SetWater(state)

    if WateringStructure:GetWater() == WATERTYPE.CLEAN then
        resultwater = WATERTYPE.DIRTY
        timer = math.ceil(TUNING.PERISH_FAST/2)
    elseif not state == WATERTYPE.DIRTY then
        print("SetWaterTimer:물이 마름")
        return true
    end

    self.inst:PushEvent("setwateringtool_temperature")

    self.basetime = timer
    self.watertime = timer + GetTime()

    self.watertask = self.inst:DoTaskInTime(timer, OnDone, self, resultwater)
    self.inst:PushEvent("setwateringtool_water")
end


function WateringStructure:TimerChange(percent)

    self:StopWatertask()

    local resultwater = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or WATERTYPE.EMPTY
    local isfrozen = self:IsFrozen()
    local remainingtime = isfrozen and math.ceil(TUNING.PERISH_SLOW/2) or 
          self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or 
          math.ceil(TUNING.PERISH_FAST/2)

    if percent < 0 then percent = 0 end
    if percent > 1 then percent = 1 end

    self.basetime = remainingtime
    self.targettime = percent*remainingtime

    if isfrozen and self.watertype == WATERTYPE.DIRTY then
        print("TimerChange : 더러운 물이 얼어서 마르지 않습니다")
        return true
    end

    self.targettime = GetTime() + self.targettime

    self.watertask = self.inst:DoTaskInTime(remainingtime, OnDone, self, resultwater)
    print("TimerChange : 썩거나 마르는중")
end

function WateringStructure:GetPercent()
    local isfrozen = self:IsFrozen()

    local remainingtime = self.targettime == nil and 0 or 
          (isfrozen and self.watertype == WATERTYPE.DIRTY) and self.targettime or
          math.floor(self.targettime - GetTime())

    if remainingtime > 0 then
        return math.min(1, remainingtime / self.basetime)
    else
        return 0
    end
end

function WateringStructure:SetFrozed(bool)
    self.frozed = bool or nil

    if self.inst.components.temperature and self.settemperaturefn = nil then
        self.settemperaturefn(self.inst)
    end

    local timer = self:GetPercent()

    self:TimerChange(timer)

    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringStructure:OnSave()
    local timer = self.targettime ~= nil and (self:IsFrozenDirtyWater() and self.targettime or self.targettime - GetTime()) or 0
    return{
        wateringtool = self.wateringtool,
        toolfiniteuses = self.toolfiniteuses,
        wateramount = self.wateramount,
        watertype = self.watertype,
        frozed = self.frozed,
        timer = timer,
        basetime = self.basetime,
    }
end

function WateringStructure:OnLoad(data)
    self:Initialize()
    if data then

        self.frozed = data.frozed
        self.wateringtool = data.wateringtool

        local watertype = data.watertype or WATERTYPE.EMPTY
        local finiteuses = data.toolfiniteuses or 0
        local amount = data.wateramount or 0

            if 

        if amount > 0 then
    end
end


--[[local function OnDone(inst, self, state)
    self.watertask = nil
    self:SetStates(state)
end

function WateringStructure:Initialize()
    self.watertype = WATERTYPE.EMPTY
    self.frozed = nil

    self:ResetTimer()
    self:StopAllTask()
end


function WateringStructure:GetWater()
    return self.watertype
end

function WateringStructure:IsTask()
    return self.targettime
end

function WateringStructure:IsFrozen()
    return self.frozed
end

function WateringStructure:IsFull()
    return self:GetWater() ~= WATERTYPE.EMPTY
end

function WateringStructure:IsDirty()
    return self:GetWater() == WATERTYPE.DIRTY
end

function WateringStructure:Stopwatertask()
    if self.watertask then
        self.watertask:Cancel()
        self.watertask = nil
    end
end

function WateringStructure:SetStates(state)

    local isfrozen = self:IsFrozen()
    local timer = 0
    local water = state

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
        self:Initialize()
        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
        print("SetStates : 물 마름")
        return true
    end

    self.basetime = timer

    if self.inst.components.temperature and self.settemperaturefn then
        self.settemperaturefn(self.inst)
    end

    if self:IsFrozen() and self.watertype == WATERTYPE.DIRTY then

        self.targettime = timer

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end

        print("SetStates : 더러운 물이 얼어서 안 마릅니다")
        return true
    end

    self.targettime = timer + GetTime()

    self.watertask = self.inst:DoTaskInTime(timer, OnDone, self)
    self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, nil, TheWorld.state.israining)
    
    if self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringStructure:TimerChange(percent)

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

    if isfrozen and self.watertype == WATERTYPE.DIRTY then
        self.weatherchecktask = self.inst:DoTaskInTime(0, CheckIsRaining, self, true, TheWorld.state.israining)
        print("RestartTimer : 더러운 물이 얼어서 마르지 않습니다")
        return true
    end

    self.targettime = GetTime() + self.targettime

    self.watertask = self.inst:DoTaskInTime(remainingtime, OnDone, self, water)
    print("TimerChange : 썩거나 마르는중")
end

function WateringStructure:GetPercent()
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

function WateringStructure:SetFrozed(bool)
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

function WateringStructure:OnSave()
    local timer = self.targettime ~= nil and ((TheWorld.state.israining or (self:IsFrozen() and self.watertype == WATERTYPE.DIRTY)) and self.targettime or self.targettime - GetTime()) or 0
    return{
        wateringtool = self.wateringtool,
        toolfiniteuses = self.toolfiniteuses,
        wateramount = self.wateramount,
        watertype = self.watertype,
        frozed = self.frozed,
        timer = timer,
        basetime = self.basetime,
    }
end

function WateringStructure:OnLoad(data)
    self:Initialize()
    if data then

        self.watertype = data.watertype
        self.basetime = data.basetime
        self.wateringtool = data.wateringtool
        self.toolfiniteuses = data.toolfiniteuses
        self.wateramount = data.wateramount

        local water = data.watertype == WATERTYPE.CLEAN and WATERTYPE.DIRTY or WATERTYPE.EMPTY

        if self.inst.components.temperature and self.settemperaturefn then
            self.settemperaturefn(self.inst)
        end

        self.frozed = data.frozed or nil

        if self:IsFrozen() and self.watertype == WATERTYPE.DIRTY then

            self.targettime = data.timer

            if self.setstatesfn then
                self.setstatesfn(self.inst)
            end

            print("OnLoad : 더러운 물이 얼어서 안 마릅니다")
            return true
        end

        self.targettime = GetTime() + math.max(0,data.timer)
        self.watertask = self.inst:DoTaskInTime(data.timer, OnDone, self, water)
        print("OnLoad : 타이머 작동시작")
        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
    end
end

function WateringStructure:LongUpdate(dt)
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
            self.watertask = self.inst:DoTaskInTime(self.targettime - GetTime(), OnDone, self, water)
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
end]]

return WateringStructure


