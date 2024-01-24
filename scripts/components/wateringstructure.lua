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
    self.wellanim = ""
    self.old_wellanim = self.wellanim

    self.toolfiniteuses = 0
    self.toolfiniteuses_old = 0
    self.wateramount = 0

    self.basetime = nil
    self.targettime = nil

    self.checktemp = nil
    self.frozed = nil
    self.dried = nil
    
    self.watertask = nil
    self.islunacy = nil

    self.setstatesfn = nil
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
    self.wateringtool = nil
    self.frozed = nil

    self:ResetTimer()
    self:StopWatertask()

    self.inst:PushEvent("setwateringtool_temperature")
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
    self.old_wellanim = self.wellanim
    self.wellanim = item.wellanim
    self.toolfiniteuses = finiteuses
    self.toolfiniteuses_old = finiteuses
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

    self:SetWaterTimer(self.islunacy and WATERTYPE.MINERAL or WATERTYPE.CLEAN, true)
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

function WateringStructure:GetBucketAnim()
    return self.wellanim
end

function WateringStructure:IsFrozen()
    return self.frozed
end

function WateringStructure:IsTask()
    return self.targettime
end

function WateringStructure:IsDried()
    return self.dired
end

function WateringStructure:IsFrozenDirtyWater()
    return self:GetWater() == WATERTYPE.DIRTY and self:IsFrozen()
end

function WateringStructure:SetWaterTimer(watertype, isnew)
    self:ResetTimer()
    self:StopWatertask()

    local resultwater = WATERTYPE.EMPTY
    local timer = TUNING.PERISH_ONE_DAY / 2
    local state = watertype

    self:SetWater(state)

    if self:GetWater() == WATERTYPE.CLEAN or self:GetWater() == WATERTYPE.MINERAL then
        resultwater = WATERTYPE.DIRTY
        timer = self:GetWater() == WATERTYPE.CLEAN and math.ceil(TUNING.PERISH_FAST / 2) or math.ceil(TUNING.PERISH_SUPERFAST / 2)
    elseif self:GetWater() ~= WATERTYPE.DIRTY then
        self.wateramount = 0
        self.dried = true
        self.checktemp = nil
        self.inst:PushEvent("setwateringtool_water")

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
        return true
    end

    self.inst:PushEvent("setwateringtool_temperature")

    self.basetime = timer
    self.targettime = timer + GetTime()

    self.watertask = self.inst:DoTaskInTime(timer, OnDone, self, resultwater)
    self.inst:PushEvent("setwateringtool_water")

    if not isnew and self.setstatesfn then
        self.setstatesfn(self.inst)
    end
end

function WateringStructure:TimerChange(percent)
    self:StopWatertask()

    local resultwater = self:GetWater() == WATERTYPE.CLEAN and WATERTYPE.DIRTY or WATERTYPE.EMPTY
    local isfrozen = self:IsFrozen()
    local remainingtime = math.ceil(TUNING.PERISH_FAST / 2)

    if isfrozen then
        remainingtime = math.ceil(TUNING.PERISH_SLOW / 2)
    elseif self.watertype == WATERTYPE.DIRTY then
        remainingtime = TUNING.BUCKET_LEVEL_PER_USE * 4
    end

    percent = math.clamp(percent, 0, 1)

    self.basetime = remainingtime
    self.targettime = percent * remainingtime

    if isfrozen and self.watertype == WATERTYPE.DIRTY then
        return true
    end

    self.targettime = GetTime() + self.targettime

    self.watertask = self.inst:DoTaskInTime(remainingtime, OnDone, self, resultwater)
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

    self.inst:PushEvent("setwateringtool_temperature")

    local timer = self:GetPercent()

    self:TimerChange(timer)

    self.inst:PushEvent("setwateringtool_water")
    if self.setstatesfn then
        self.setstatesfn(self.inst, true)
    end
end

function WateringStructure:OnSave()
    local timer = self.targettime ~= nil and (self:IsFrozenDirtyWater() and self.targettime or self.targettime - GetTime()) or 0
    return{
        wateringtool = self.wateringtool,
        wellanim = self.wellanim,
        toolfiniteuses = self.toolfiniteuses,
        toolfiniteuses_old = self.toolfiniteuses_old,
        wateramount = self.wateramount,
        watertype = self.watertype,
        frozed = self.frozed,
        dired = self.dired,
        timer = timer,
        basetime = self.basetime,
    }
end

function WateringStructure:OnLoad(data)
    self:Initialize()

    if data and data.wateringtool then

        self.wateringtool = data.wateringtool or nil
        self.wellanim = data.wellanim or ""
        self.inst:PushEvent("setbucketanim")
        self.toolfiniteuses = data.toolfiniteuses
        self.toolfiniteuses_old = data.toolfiniteuses_old

        local water = (data.watertype == WATERTYPE.CLEAN or data.watertype == WATERTYPE.MINERAL) and WATERTYPE.DIRTY or WATERTYPE.EMPTY

        if data.dried then
            self.dried = data.dried
            self.inst:PushEvent("setwateringtool_water")
            if self.setstatesfn then
                self.setstatesfn(self.inst)
            end
            return true
        else
            self.checktemp = true
            self.frozed = data.frozed or nil
        end

        if self.finiteuses == self.toolfiniteuses_old then
            self:SetWaterAmount()
            return true
        end

        self.watertype = data.watertype
        self.wateramount = data.wateramount
        self.basetime = data.basetime
        self.inst:PushEvent("setwateringtool_temperature")

        local isFrozenAndDirty = self:IsFrozen() and self.watertype == WATERTYPE.DIRTY

        if isFrozenAndDirty then
            self.targettime = data.timer
            self.inst:PushEvent("setwateringtool_water")
            if self.setstatesfn then
                self.setstatesfn(self.inst)
            end
            return true
        end

        self.targettime = GetTime() + math.max(0, data.timer)
        self.watertask = self.inst:DoTaskInTime(data.timer, OnDone, self, water)
        self.inst:PushEvent("setwateringtool_water")

        if self.setstatesfn then
            self.setstatesfn(self.inst)
        end
    end
end

function WateringStructure:LongUpdate(dt)
    if self:IsTask() then

        self:StopWatertask()

        if self:IsFrozen() and self:GetWater() == WATERTYPE.DIRTY then
            return true
        end

        local water = WATERTYPE.CLEAN
        local watertype = self:GetWater()

        if watertype == WATERTYPE.CLEAN or watertype == WATERTYPE.MINERAL then
            water = WATERTYPE.DIRTY
        elseif watertype == WATERTYPE.DIRTY then
            water = WATERTYPE.EMPTY
        end

        if self.targettime - dt > GetTime() then
            self.targettime = self.targettime - dt
            self.watertask = self.inst:DoTaskInTime(self.targettime - GetTime(), OnDone, self, water)
        else
            self:ResetTimer()
            OnDone(self.inst, self, water)
        end
    end
end

return WateringStructure


