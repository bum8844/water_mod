local Milkingtool = Class(function(self, inst)
    self.inst = inst
end)

function Milkingtool:IsCharged(target)
    return target:HasTag("charged")
end

function Milkingtool:DoMilking(target, doer)
    local loot = nil
    if doer ~= nil and doer.components.inventory ~= nil then
        loot = SpawnPrefab("goatmilk")
        if loot ~= nil then
            doer:PushEvent("picksomething", { object = target, loot = loot })
            doer.components.inventory:GiveItem(loot, nil, target:GetPosition())
            return true
        end
    end
end

function Milkingtool:NotReady(doer)
    doer.components.talker:Say(GetString(doer,"ANNOUNCE_NOTCHARGE"))
    return true
end

return Milkingtool