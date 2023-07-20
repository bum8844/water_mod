local WaterStorage = Class(function(self, inst)
    self.inst = inst

    self.maxrefrashing = TUNING.PERISH_FAST
    self.waterperish = 0

    self.updatetask = nil
end,nil,nil)

function WaterStorage:SetWaterPerish(num)
    if self.waterperish == 0 then
        self.waterperish = math.ceil(num)
    else
        local old_val = self.waterperish
        local new_val = math.ceil(num)
        local min_val = math.min(new_val, old_val)
        local max_val = math.max(new_val, old_val)
        self.waterperish = math.ceil((2/(max_val - min_val)) + min_val)
    end
end

function WaterStorage:GetWaterPerish()
    return self.waterperish
end

local function Update(inst, dt)
    local self = inst.components.waterstorage
    if self ~= nil then
        dt = self.start_dt or dt
        self.start_dt = nil

        local modifier = 1

        local old_val = self.waterperish
        local delta = dt or (10 + math.random()*FRAMES*8)
        self.waterperish = math.min(self.maxrefrashing, self.waterperish + delta*modifier)
        if self.waterperish == self.maxrefrashing or ( self.inst.components.waterlevel and self.inst.components.waterlevel:IsEmpty() ) then
            self:StopReFreshinging()
        end
    end
end

function WaterStorage:LongUpdate(dt)
    if self.updatetask ~= nil then
        Update(self.inst, dt or 0)
    end
end

function WaterStorage:StartReFreshinging()
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end

    local dt = 10 + math.random()*FRAMES*8
    self.start_dt = math.random()*2
    self.updatetask = self.inst:DoPeriodicTask(dt, Update, self.start_dt, dt)
end

function WaterStorage:StopReFreshinging()
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end
end

function WaterStorage:ResetWaterPerish()
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end
    self.waterperish = 0
end

function WaterStorage:OnSave()
    print(self.waterperish)
    return {
        paused = self.updatetask == nil or nil,
        waterperish = self.waterperish
    }
end

function WaterStorage:OnLoad(data)
    if data ~= nil then
        if data.waterperish ~= nil then
            self.waterperish = data.waterperish
            print(self.waterperish)
        end

        if data.paused then
            self:StartReFreshinging()
        elseif data.time ~= nil then
            self:StopReFreshinging()
        end
    end
end

return WaterStorage