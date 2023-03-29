local Milkingtool = Class(function(self, inst)
    self.inst = inst
end)

function Milkingtool:IsCharged(target)
    return target:HasTag("charged")
end

function Milkingtool:DoMilking(target, doer)
    local loot = nil
    local current_fin = math.ceil(self.inst.components.finiteuses:GetUses()/4) or 1
    if doer ~= nil and doer.components.inventory ~= nil then
        loot = SpawnPrefab("goatmilk")
        loot.components.stackable:SetStackSize(current_fin)
        doer:PushEvent("picksomething", { object = target, loot = loot })
        doer.components.inventory:GiveItem(loot, nil, target:GetPosition())

        if self.donemilkingfn ~= nil then
            self.donemilkingfn(doer)
        end

        self.inst:Remove()
        return true
    end
end

function Milkingtool:NotReady(doer)
    doer.components.talker:Say(GetString(doer,"ANNOUNCE_NOTCHARGE"))
    return true
end

return Milkingtool
