local WateringTool = Class(function(self, inst)
    self.inst = inst
    self.watertype = nil
    self.frozed = false

    self.cancollectrainwater = false
    self.wateringtooltask = nil

    self.makeemptyfn = nil
    self.makefullfn = nil

    self:WatchWorldState("israining", self.CollectRainWater)
    self:CollectRainWater(GLOBAL.TheWorld.state.israining)
end,nil,nil)

local function Ondone(inst, self, value)
    self.wateringtooltask = nil
    self:DoneResult(value)
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

    self:StopCollectRainWater()

    local rainwater = self.watertype == WATERTYPE.DIRTY and TUNING.BUCKET_LEVEL_PER_USE*4 or TUNING.BUCKET_LEVEL_PER_USE*2
    local spoiledingtime = self.frozed and TUNING.PERISH_SLOW or TUNING.PERISH_FAST

    if time ~= nil then
        rainwater = time
    end

    self.targettime = GetTime() + time

    if israining and not self.watertype then
        if self.wateringtooltask ~= nil then
            self.wateringtooltask:Cancel()
        end
        self.wateringtooltask = self.inst:DoTaskInTime(rainwater, Ondone, self, WATERTYPE.CLEAN)
    else
        local water = self.watertype
        if self.wateringtooltask ~= nil then
            self.wateringtooltask:Cancel()
        end
        if water == WATERTYPE.CLEAN or water == WATERTYPE.CLEAN_ICE then
            local watertype = self.frozed and WATERTYPE.DIRTY_ICE or WATERTYPE.DIRTY
            self.wateringtooltask = self.inst:DoTaskInTime(spoiledingtime, Ondone, self, watertype)
        elseif not self.frozed then
            self.wateringtooltask = self.inst:DoTaskInTime(rainwater, Ondone, self, nil)
        end
    end
end

function WateringTool:DoneResult(value)
    self.watertype = value

    self:StopCollectRainWater()

    if not self.watertype and self.makeemptyfn then
        self.makeemptyfn(self.inst)
    elseif self.makefullfn then
        self.makefullfn(self.inst, self.watertype)
    end
end

function WateringTool:StopCollectRainWater()
    self.targettime = nil

    if self.wateringtooltask then
        self.wateringtooltask:Cancel()
        self.wateringtooltask = nil
    end
end

function WateringTool:OnSave()
    local time = (self.targettime ~= nil and math.floor(self.targettime - GetTime())) or nil
    if time then
        time = math.max(0, time)
    end
    local data =
    {
        cancollectrainwater = self.cancollectrainwater,
        watertype = self.watertype,
        frozed = self.frozed,
        time = time,
    }
    return data
end

function WateringTool:OnLoad(data)
    if data ~= nil and data.cancollectrainwater then
        self:SetCanCollectRainWater(true)
        self:SetCanCollectRainWater(data.frozed)
        self:SetWaterType(data.watertype)
        local time = data.time or nil
        self:StartGrowing(GLOBAL.TheWorld.state.israining,math.max(0, time))
    end
end

function WateringTool:LongUpdate(dt)
    self:CollectRainWater(GLOBAL.TheWorld.state.israining,math.max(0, self.targettime - dt - GetTime()))
end

return WateringTool


