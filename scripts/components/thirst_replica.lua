
local Thirst = Class(function(self, inst)
    self.inst = inst

    if TheWorld.ismastersim then
        self.classified = inst.player_classified
    elseif self.classified == nil and inst.player_classified ~= nil then
        self:AttachClassified(inst.player_classified)
    end
end)

--------------------------------------------------------------------------

function Thirst:OnRemoveFromEntity()
    if self.classified ~= nil then
        if TheWorld.ismastersim then
            self.classified = nil
        else
            self.inst:RemoveEventCallback("onremove", self.ondetachclassified, self.classified)
            self:DetachClassified()
        end
    end
end

Thirst.OnRemoveEntity = Thirst.OnRemoveFromEntity

function Thirst:AttachClassified(classified)
    self.classified = classified
    self.ondetachclassified = function() self:DetachClassified() end
    self.inst:ListenForEvent("onremove", self.ondetachclassified, classified)
end

function Thirst:DetachClassified()
    self.classified = nil
    self.ondetachclassified = nil
end

--------------------------------------------------------------------------

function Thirst:SetCurrent(current)
    if self.classified ~= nil then
        self.classified:SetValue("currentthirst", current)
    end
end

function Thirst:SetMax(max)
    if self.classified ~= nil then
        self.classified:SetValue("maxthirst", max)
    end
end

function Thirst:Max()
    if self.inst.components.thirst ~= nil then
        return self.inst.components.thirst.max
    elseif self.classified ~= nil then
        return self.classified.maxthirst:value()
    else
        return 100
    end
end

function Thirst:GetPercent()
    if self.inst.components.thirst ~= nil then
        return self.inst.components.thirst:GetPercent()
    elseif self.classified ~= nil then
        return self.classified.currentthirst:value() / self.classified.maxthirst:value()
    else
        return 1
    end
end

function Thirst:GetCurrent()
    if self.inst.components.thirst ~= nil then
        return self.inst.components.thirst.current
    elseif self.classified ~= nil then
        return self.classified.currentthirst:value()
    else
        return 100
    end
end


function Thirst:IsThirst()
    if self.inst.components.thirst ~= nil then
        return self.inst.components.thirst:IsThirst()
    else
        return self.classified ~= nil and self.classified.currentthirst:value() <= 0
    end
end

return Thirst