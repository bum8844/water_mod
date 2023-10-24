local function oncheckready(inst)
    if inst.components.container ~= nil and
        not inst.components.container:IsOpen() and inst.components.container:HasItemWithTag("alcohol",4) then
        inst:AddTag("readydistill")
    else
        inst:RemoveTag("readydistill")
    end
end

local Distill = Class(function(self, inst)
    self.inst = inst

    inst:ListenForEvent("itemget", oncheckready)
    inst:ListenForEvent("onclose", oncheckready)

    inst:ListenForEvent("itemlose", oncheckready)
    inst:ListenForEvent("onopen", oncheckready)
end)

return Distill