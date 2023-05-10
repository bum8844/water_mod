
local SourceModifierList = require("util/sourcemodifierlist")

local function onmax(self, max)
    self.inst.replica.thirst:SetMax(max)
end

local function oncurrent(self, current)
    self.inst.replica.thirst:SetCurrent(current)
end

local function OnTaskTick(inst, self, period)
    self:DoDec(period)
end

local function tempcheck(self, inst)
    local tempcheck = self.inst.components.temperature:GetCurrent()
    return (tempcheck > TUNING.OVERHEAT_TEMP - 15 and 4) or
           (tempcheck > TUNING.OVERHEAT_TEMP - 30 and 2) or 
           (tempcheck < 10 and 0.5) or  
            1
end

local Thirst = Class(function(self, inst)
    self.inst = inst
    self.max = 100
    self.current = self.max

    self.thirstrate = 1
    self.hurtrate = 1
    self.overridestarvefn = nil

    self.burning = true
    --100% burn rate. Currently used only by belt of thirst, will have to change unequip if use in something else
    self.burnrate = 1 -- DEPRECATED, please use burnratemodifiers instead
    self.burnratemodifiers = SourceModifierList(self.inst)

    local period = 1
    self.inst:DoPeriodicTask(period, OnTaskTick, nil, self, period)

end,
nil,
{
    max = onmax,
    current = oncurrent,
})

function Thirst:OnSave()
    return self.current ~= self.max and { thirst = self.current } or nil
end

function Thirst:OnLoad(data)
    if data.thirst ~= nil and self.current ~= data.thirst then
        self.current = data.thirst
        self:DoDelta(0)
    end
end

function Thirst:SetOverrideStarveFn(fn)
    self.overridestarvefn = fn
end

function Thirst:LongUpdate(dt)
    self:DoDec(dt, true)
end

function Thirst:Pause()
    self.burning = false
end

function Thirst:Resume()
    self.burning = true
end

function Thirst:IsPaused()
    return self.burning
end

function Thirst:GetDebugString()
    return string.format("%2.2f / %2.2f, rate: (%2.2f * %2.2f)", self.current, self.max, self.thirstrate, self.burnrate*self.burnratemodifiers:Get())
end

function Thirst:SetMax(amount)
    self.max = amount
    self.current = amount
end

function Thirst:IsThirst()
    return self.current <= 0
end

function Thirst:DoDelta(delta, overtime, ignore_invincible)
    if self.redirect ~= nil then
        self.redirect(self.inst, delta, overtime)
        return
    end

    if not ignore_invincible and self.inst.components.health and self.inst.components.health:IsInvincible() or self.inst.is_teleporting then
        return
    end

    local old = self.current
    self.current = math.clamp(self.current + delta, 0, self.max)

    self.inst:PushEvent("thirstdelta", { oldpercent = old / self.max, newpercent = self.current / self.max, overtime = overtime, delta = self.current-old })

    if old > 0 then
        if self.current <= 0 then
            self.inst:PushEvent("startstarving")
            ProfileStatsSet("started_starving", true)
        end
    elseif self.current > 0 then
        self.inst:PushEvent("stopstarving")
        ProfileStatsSet("stopped_starving", true)
    end
end

function Thirst:GetPercent()
    return self.current / self.max
end

function Thirst:SetPercent(p, overtime)
    local old = self.current
    self.current  = p * self.max
    self.inst:PushEvent("thirstdelta", { oldpercent = old / self.max, newpercent = p, overtime = overtime })

    if old > 0 then
        if self.current <= 0 then
            self.inst:PushEvent("startstarving")
            ProfileStatsSet("started_starving", true)
        end
    elseif self.current > 0 then
        self.inst:PushEvent("stopstarving")
        ProfileStatsSet("stopped_starving", true)
    end
end

function Thirst:DoDec(dt, ignore_damage)
    local old = self.current
    local tempmuit = tempcheck(self, self.inst)

    if self.burning then
        if self.current > 0 then
            self:DoDelta(-self.thirstrate * dt * self.burnrate * self.burnratemodifiers:Get() * tempmuit, true)
        elseif not ignore_damage then
            if self.overridestarvefn ~= nil then
                self.overridestarvefn(self.inst, dt)
            else
                self.inst.components.health:DoDelta(-self.hurtrate * dt, true, "thirst") --  ich haber thirst
            end
        end
    end
end

function Thirst:SetKillRate(rate)
    self.hurtrate = rate
end

function Thirst:SetRate(rate)
    self.thirstrate = rate
end

return Thirst
