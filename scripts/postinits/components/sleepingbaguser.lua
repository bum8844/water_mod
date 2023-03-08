local function thirst_wakeup(self)

    self.thirst_bonus_mult = 1

    function self:SetThirstBonusMult(bonus)
        self.thirst_bonus_mult = bonus
    end

    local _sleeptick = self.SleepTick

    function self:SleepTick()

        local thirst_tick = self.bed.components.sleepingbag.thirst_tick * self.thirst_bonus_mult

        _sleeptick(self)

        local isthirst = false
        if self.inst.components.thirst ~= nil then
            self.inst.components.thirst:DoDelta(thirst_tick, true, true)
            isthirst = self.inst.components.thirst:IsThirst()
        end

        if isthirst then
            self.bed.components.sleepingbag:DoWakeUp()
        end
    end
end

AddComponentPostInit("sleepingbaguser",thirst_wakeup)