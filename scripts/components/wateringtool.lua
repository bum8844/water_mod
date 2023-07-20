local WateringTool = Class(function(self, inst)
    self.inst = inst

    self.rainfilling = 0

    self.isfull = false
    self.isdirty = false
    self.isfrozen = false

    self.cancontainrain = false
    self.rainingtask = nil
end)

function WateringTool:SetCanContainRain(val)
    self.cancontainrain = val or false
end

function WateringTool:IsRaining()
    return GLOBAL.TheWorld.state.israining
end

function WateringTool:OnSave()
    if self.cancontainrain then
        return {
            cancontainrain = self.cancontainrain
            paused = self.rainingtask == nil and nil
            rainfilling = self.rainfilling > 0 and self.rainfilling or 0
            isfull = self.isfull
            isdirty = self.isdirty
            isfrozen = self.isfrozen 
        }
    else
        return {
            cancontainrain = self.cancontainrain
        }
    end
end

function WateringTool:OnLoad(data)
    if data.cancontainrain ~= nil then
        if data.rainfilling > 0 then
            self.rainfilling = data.rainfilling
        end
    end
end

return WateringTool
