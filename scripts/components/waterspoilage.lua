--Should be used with component "waterlevel" -AFS
local WaterSpoilage = Class(function(self, inst)
    self.inst = inst

    --self.max_freshness = TUNING.PERISH_FAST
    --self.freshness = nil

    self.localPerishMultiplyer = 1

    self.updatetask = nil
end,nil,nil)

function WaterSpoilage:OnRemoveEntity()
    self:StopFreshening()
end

--어차피 이 컴포넌트는 물을 꺼낼 때만 참조하게 되니 이벤트 호출을 당장 넣을 필요는 없어 보입니다
local function Update(inst, dt)
    local self = inst.components.waterspoilage
    if self ~= nil then
        dt = self.start_dt or dt
        self.start_dt = nil

        local modifier = 1

        --계절에 따른 회복력 차이
        if TheWorld.state.temperature < 0 then
            modifier = modifier * TUNING.PERISH_SUMMER_MULT
        end

        if TheWorld.state.temperature > TUNING.OVERHEAT_TEMP then
            modifier = modifier * TUNING.PERISH_WINTER_MULT
        end

        modifier = modifier * self.localPerishMultiplyer

        modifier = modifier * TUNING.PERISH_GLOBAL_MULT

        --local old_val = self.max_freshness
        local delta = dt or (10 + math.random()*FRAMES*8)
        if self.max_freshness then
            self:SetFreshness(self.freshness + delta*modifier)
        end

        if self.freshness and (self.freshness <= 0 or self.freshness >= self.max_freshness) then
            self:StopFreshening()
        end
    end
end

function WaterSpoilage:AddTime(time)
    if self.updatetask ~= nil then
        local remaintime = self.freshness
        self.freshness = remaintime + time
    end
end

function WaterSpoilage:SetFreshness(time)
    self.freshness = math.min(time, self.max_freshness)
end

function WaterSpoilage:SetLocalMultiplier(newMult)
    self.localPerishMultiplyer = newMult
end

function WaterSpoilage:GetLocalMultiplier()
    return self.localPerishMultiplyer
end

function WaterSpoilage:SetMaxFreshness(max)
    self.max_freshness = max
end

function WaterSpoilage:GetPercent()
    if self.freshness and self.max_freshness and self.freshness > 0 then
        return math.min(1, self.freshness / self.max_freshness)
    else
        return 0
    end
end

function WaterSpoilage:Dilute(timeleft)
    local old_water = self:GetPercent()
    local new_water = math.min(1, timeleft / self.max_freshness)

    if old_water > 0 then
        local fresh = timeleft + (((old_water * new_water)*self.freshness)/2)
        self:SetFreshness(fresh)
    else
        self:SetFreshness((new_water * self.max_freshness))
    end

    local percent = self:GetPercent()
    if percent > 0 or percent < 1 then
        self:StartFreshening()
    end
end

function WaterSpoilage:LongUpdate(dt)
    if self.updatetask ~= nil then
        Update(self.inst, dt or 0)
    end
end

function WaterSpoilage:StartFreshening()
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end

    local dt = 10 + math.random()*FRAMES*8
    self.start_dt = math.random()*2
    self.updatetask = self.inst:DoPeriodicTask(dt, Update, self.start_dt, dt)
end

function WaterSpoilage:StopFreshening()
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end
end

function WaterSpoilage:ResetWaterPerish()
    if self.updatetask ~= nil then
        self.updatetask:Cancel()
        self.updatetask = nil
    end
    self.max_freshness = nil
    self.freshness = nil
end

function WaterSpoilage:IsRefreshing()
    return self.updatetask ~= nil
end

function WaterSpoilage:GetDebugString()
    return string.format("%s %2.2f / %2.2f",
        self.updatetask and "Refreshing" or "Paused",
        self.freshness or 0,
        self.max_freshness or 0)
end

function WaterSpoilage:OnSave()
    return {
        paused = self.updatetask == nil or nil,
        max_time = self.max_freshness,
        time = self.freshness,
    }
end

function WaterSpoilage:OnLoad(data)
    if data ~= nil then
        if data.time ~= nil then
            self.freshness = data.time
        end

        if data.max_time ~= nil then
            self.max_freshness = data.max_time
        end

        if data.paused then
            self:StopFreshening()
        elseif data.time ~= nil then
            self:StartFreshening()
        end
    end
end

return WaterSpoilage