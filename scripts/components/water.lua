local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil then
        self.inst:RemoveTag("water_"..old_watertype)
    end
    if watertype ~= nil then
        self.inst:AddTag("water_"..watertype)
    end
end

local function onavailable(self, available)
    if available then
        if not self.inst:HasTag("water") then
            self.inst:AddTag("water")
        end
    else
        if self.inst:HasTag("water") then
            self.inst:RemoveTag("water")
        end
    end
end

local Water = Class(function(self, inst)
    self.inst = inst
    self.watervalue = nil --overriding amount of water.
    self.watertype = nil --WATERTYPE.GENERIC
    self.ontaken = nil
    self.available = true
<<<<<<< HEAD
=======
    --self.use_WaterManager = false
    self.left_to_dirty = 0
>>>>>>> Beta_1.2.8
    self.isitem = nil --Used for item check
end,
nil,
{
    watertype = onwatertype,
    available = onavailable,
})

local function ResetWater(inst, self)
    self.watermanager_tesk = nil
    self.left_to_dirty = 0
end

function Water:OnRemoveFromEntity()
    if self.watertype ~= nil then
        self.inst:RemoveTag("water_"..self.watertype)
    end
end

function Water:GetWater()
    if self.inst.components.waterlevel ~= nil then
        return self.inst.components.waterlevel.currentwater
    end
    local stacksize = self.inst.components.stackable ~= nil and self.inst.components.stackable:StackSize() or 1
    return self.watervalue ~= nil and self.watervalue * stacksize or nil
end

function Water:GetWatertype()
    local watertype = self.watertype
    if self.use_WaterManager then
        if self.left_to_dirty > 0 then
            watertype = self.set_watertype
        end
    end
    return self.inst.components.waterlevel ~= nil and self.inst.components.waterlevel.watertype
        or watertype
end

function Water:SetWaterType(type)
    self.watertype = type
end

function Water:SetOnTakenFn(fn)
    self.ontaken = fn
end

function Water:DoWaterManaging(num)
    self.left_to_dirty = num
    if self:IsTask() then
        self.watermanager_tesk:Cancel()
        self.watermanager_tesk = nil
    end
    self.remainingtime = GetTime() - TUNING.PERISH_ONE_DAY
    self.watermanager_tesk = self.inst:DoTaskInTime(TUNING.PERISH_ONE_DAY,ResetWater)
end

function Water:SetWaterManager(num, type, def_type)
    self.use_WaterManager = true
    self.left_to_dirty = num or TUNING.DEFAULT_LEFT_TO_DIRTY
    self.set_watertype = type
    self:SetWaterType(def_type)
end

--Use taker.waterlevel.oldcurrentwater and currentwater
function Water:Taken(taker, delta)
    self.inst:PushEvent("watertaken", {taker = taker})
    if self.inst.components.waterlevel then
        self.inst.components.waterlevel:DoDelta(-delta)
    end
    if self.ontaken then
        self.ontaken(self.inst, taker, delta)
    end
    if self.use_WaterManager and self.left_to_dirty > 0 then
        self.left_to_dirty = self.left_to_dirty - 1
        if self.left_to_dirty == 0 then
            self.watermanager_tesk:Cancel()
            self.watermanager_tesk = nil
        end
    end
end

function Water:IsTask()
    return self.watermanager_tesk
end

function Water:OnSave()
    if self.use_WaterManager then
        local timer = self.remainingtime and self.remainingtime - GetTime() or nil
        return {watermanager = self.left_to_dirty, timer = timer}
    end
end

function Water:OnLoad(data)
    if data.watermanager then
        self.use_WaterManager = true
        self.left_to_dirty = data.watermanager
        if data.timer and data.watermanager ~= 0 then
            self.remainingtime = GetTime() + data.timer
            self.watermanager_tesk = self.inst:DoTaskInTime(data.timer,ResetWater)
        end
    end
end

function Water:LongUpdate(dt)
    if self:IsTask() then
        self.watermanager_tesk:Cancel()
        self.watermanager_tesk = nil

        if self.remainingtime - dt > GetTime() then
            self.remainingtime = self.remainingtime - dt
            self.watermanager_tesk = self.inst:DoTaskInTime(self.remainingtime - GetTime(), ResetWater)
        else
            ResetWater(self.inst, self)
        end
    end
end

return Water
