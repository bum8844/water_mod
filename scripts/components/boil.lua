local function onready_check(inst)
    if inst.components.container ~= nil and
       inst.components.waterlevel ~= nil and
       inst.components.container:IsFull() and
       inst.components.waterlevel.currentwater == 0 then
        inst:RemoveTag("readytocook")
        inst:RemoveTag("stewer")
        inst:RemoveComponent("stewer")
    end
end


local Boil = Class(function(self, inst)
    self.inst = inst

    inst:ListenForEvent("onopen", onready_check)
end,
nil)


return Boil
