local Distill = Class(function(self, inst)
    self.inst = inst
    self._isfull = net_bool(inst.GUID, "distill._isfull","distilldirty")
end)

function Distill:IsFull()
   return self._isfull:value()
end

function Distill:SetIsFull(is)
    if TheWorld.ismastersim then
        self._isfull:set(is)
    end
end

return Distill