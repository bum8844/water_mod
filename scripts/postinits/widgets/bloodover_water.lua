AddClassPostConstruct("widgets/bloodover", function(self)
    local water_UpdateState = self.UpdateState
    function self:UpdateState()
        water_UpdateState(self)
        if (self.owner.IsFreezing ~= nil and self.owner:IsFreezing()) or
            (self.owner.IsOverheating ~= nil and self.owner:IsOverheating()) or
            (self.owner.replica.hunger ~= nil and self.owner.replica.hunger:IsStarving()) or
            (self.owner.replica.thirst ~= nil and self.owner.replica.thirst:IsThirst())  then
            self:TurnOn()
        else
            self:TurnOff()
        end
    end
end)
