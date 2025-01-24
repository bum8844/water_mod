local WaterCollection = Class(function(self, inst)
    self.inst = inst

    self.watertype = nil
    self.max_amount = 3
    self.amount = 0

    self.basetime = nil
    self.targettime = nil
    self.localtime = nil

    self.frozed = nil
    self.isfull = nil
    
    self.watercollectiontask = nil
    self.updatetask = nil
    self.weatherchecktask = nil

    self.setstatesfn = nil
end,nil,nil)

local function CheckWeather(inst, self)
    self.weatherchecktask = nil
    self.israining = TheWorld.state.israining
    self.isacidraining = TheWorld.state.isacidraining

    --local percent = 

    self:ReducePercent()
end

local function Update(inst, dt)
    local watercollection = inst.components.watercollection

    if watercollection.isfull then
        watercollection:Perish()
    else
        watercollection:Fill()
    end
end

function WaterCollection:IsFull()
    return self.isfull
end

function WaterCollection:IsFrozen()
    return self.frozed
end

function WaterCollection:StartWeatherCheck()
    if self.weatherchecktask then
        self.weatherchecktask:Cancel()
        self.weatherchecktask = nil
    end
    self.weatherchecktask = self.inst:DoTaskInTime(1,CheckWeather,self)
end

function WaterCollection:StopWeatherCheck()
    if self.weatherchecktask then
        self.weatherchecktask:Cancel()
        self.weatherchecktask = nil
    end
end

function WaterCollection:GetPercent()
    if self.basetime and self.targettime and self.targettime > 0 then
        return math.min(1, self.basetime / self.targettime)
    else
        return 0
    end
end

function WaterCollection:SetPercent(percent)
    if self.targettime then
        percent = math.clamp(percent, 0, 1)
        local timer = self.targettime - GetTime()
        self.localtime = percent*timer
    end

    if self.watercollectiontask then
        self:StartCollect()
    end
end

function WaterCollection:ReducePercent(amount)
    local cur = self:GetPercent()
    self:SetPercent(cur - amount)
end

function WaterCollection:LongUpdate(dt)
    if self.watercollectiontask ~= nil then
        Update(self.inst, dt or 0)
    end
    if self.updatetask ~= nil then
        Update(self.inst, dt or 0, true)
    end
end

function WaterCollection:StartCollect()
    print("물 모우기 시작")
    self.inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if self.watercollectiontask ~= nil then
        self.watercollectiontask:Cancel()
        self.watercollectiontask = nil
    end

    self.basetime = TUNING.PERISH_ONE_DAY/6

    local timer = self.localtime or self.basetime

    self.targettime = GetTime() + timer
    self.localtime = nil

    self.watercollectiontask = self.inst:DoTaskInTime(timer, Update)
end

function WaterCollection:StopCollect()
     print("물 모우기 멈춤")
     self.inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if self.watercollectiontask ~= nil then
        self.watercollectiontask:Cancel()
        self.watercollectiontask = nil
    end
    self.localtime = self.targettime - GetTime()
end

function WaterCollection:StartPerishing()
     print("물 썩기 시작")
     self.inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end

    local watertype = self.watertype
    local isfrozen = self:IsFrozen()
    self.basetime = isfrozen and math.ceil(TUNING.PERISH_SLOW/2) or 
          watertype == WATERTYPE.DIRTY and TUNING.PERISH_ONE_DAY/2 or 
          math.ceil(TUNING.PERISH_FAST/2)

    local timer = self.localtime or self.basetime

    self.targettime = GetTime() + timer
    self.localtime = nil
    self.updatetask = self.inst:DoTaskInTime(timer, Update)
end

function WaterCollection:StopPerishing()
     print("물 썩기 멈춤")
     self.inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end
end

function WaterCollection:Fill()
    print("물을 채웁니다")
    self.inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if self.watercollectiontask ~= nil then
        self.watercollectiontask:Cancel()
        self.watercollectiontask = nil
    end

    self.basetime = nil
    self.targettime = nil

    self.amount = self.amount + 1

    if self.max_amount == self.amount then
        self.isfull = true
        self:StartPerishing()
    else
        self:StartCollect()
    end
end

function WaterCollection:Perish()
     print("물 썩거나 마름")
     self.inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end

    self.basetime = nil
    self.targettime = nil

    if self.watertype == WATERTYPE.CLEAN then
        self.watertype = WATERTYPE.DIRTY 
        self:StartPerishing()
    else
        self.isfull = nil
        self.watertype = nil
        self:StartCollect()
    end

    self.inst:PushEvent()
end

return WaterCollection