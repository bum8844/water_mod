local function onready_check(inst)
    if inst.components.container ~= nil and
        inst.components.waterlevel ~= nil and
        inst.components.container:IsFull() and
        inst.components.waterlevel.currentwater ~= 0 and 
        inst._timer == 0 then
        if not inst:HasTag("stewer") then
            inst:AddComponent("stewer")
        end
    else
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
