local Dismantleable = Class(function(self, inst)
    self.inst = inst
    self.ondismantlefn = nil
end)

function Dismantleable:SetOnDismantleFn(fn)
    self.ondismantlefn = fn
end

function Dismantleable:Dismantle(doer)
    if self.ondismantlefn ~= nil then
        self.ondismantlefn(self.inst, doer)
    end
end

return Dismantleable
