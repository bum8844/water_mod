local UIAnim = require("widgets/uianim")
local HealthBadge = require("widgets/healthbadge")

local _OnUpdate = HealthBadge.OnUpdate

function HealthBadge:OnUpdate(...)
    _OnUpdate(self, ...)

    local thirst = self.owner.replica.thirst ~= nil and self.owner.replica.thirst:IsThirst()

    --print(tostring(thirst))

    if not self.sanityarrow:GetAnimState():IsCurrentAnimation("arrow_loop_decrease_most") then
        if thirst then
            self.sanityarrow:GetAnimState():PushAnimation("arrow_loop_decrease_more", true)
        else
            self.sanityarrow:GetAnimState():PlayAnimation("neutral", true)
        end
    elseif then
    end
end

local WandaHealthBadge = require("widgets/wandaagebadge")

local _OnUpdate = WandaHealthBadge.OnUpdate
function WandaHealthBadge:OnUpdate(...)
    _OnUpdate(self, ...)

    local thirst = self.owner.replica.thirst ~= nil and self.owner.replica.thirst:IsThirst()

    if thirst then
        self.sanityarrow:GetAnimState():PushAnimation("arrow_loop_decrease_more", true)
    else
        self.sanityarrow:GetAnimState():PlayAnimation("neutral", true)
    end
end