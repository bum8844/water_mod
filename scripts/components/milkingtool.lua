local Milkingtool = Class(function(self, inst)
    self.inst = inst
end)

function Milkingtool:IsCharged(target)
    return target:HasTag("charged")
end

function Milkingtool:DoMilking(target, doer)
    local loot = nil
    local finiteuses = self.inst.components.finiteuses:GetUses()
    local stacksize = ( finiteuses >= TUNING.BUCKET_LEVEL_PER_USE ) and TUNING.BUCKET_LEVEL_PER_USE*.5 or finiteuses *.5
    print(stacksize)
    if doer ~= nil and doer.components.inventory ~= nil then
        loot = SpawnPrefab("goatmilk")
        loot.components.stackable:SetStackSize(math.ceil(stacksize))

        doer:PushEvent("picksomething", { object = target, loot = loot })
        doer.components.inventory:GiveItem(loot, nil, target:GetPosition())

        if self.donemilkingfn ~= nil then
            self.donemilkingfn(doer)
        end

        finiteuses = finiteuses - (stacksize*2)
        if finiteuses > 0 then
            self.inst.components.finiteuses:SetUses(finiteuses)
        else
            self.inst:Remove()
        end
        return true
    end
end

function Milkingtool:NotReady(doer)
    doer.components.talker:Say(GetString(doer,"ANNOUNCE_NOTCHARGE"))
    return true
end

return Milkingtool
