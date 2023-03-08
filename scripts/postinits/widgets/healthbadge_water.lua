local UIAnim = require("widgets/uianim")
local HealthBadge = require("widgets/healthbadge")

local _OnUpdate = HealthBadge.OnUpdate

local function isdecrease_mostchk(self)
    return (self.owner.IsFreezing ~= nil and self.owner:IsFreezing()) or
        (self.owner.replica.health ~= nil and self.owner.replica.health:IsTakingFireDamageFull()) or
        (self.owner.replica.hunger ~= nil and self.owner.replica.hunger:IsStarving()) or
        GLOBAL.next(self.corrosives) ~= nil
end

local function overheatingchk(self)
    return self.owner.IsOverheating ~= nil and self.owner:IsOverheating() and not self.owner:HasTag("heatresistant")
end

function HealthBadge:OnUpdate(...)
    if TheNet:IsServerPaused() then return end

    local thirst = self.owner.replica.thirst ~= nil and self.owner.replica.thirst:IsThirst()

    _OnUpdate(self, ...)

    local isdecrease_most = self.sanityarrow:GetAnimState():IsCurrentAnimation("arrow_loop_decrease_most")
    local isdecrease_more = self.sanityarrow:GetAnimState():IsCurrentAnimation("arrow_loop_decrease_more")
    local isincrease_most = self.sanityarrow:GetAnimState():IsCurrentAnimation("arrow_loop_increase_most")
    local isincrease = self.sanityarrow:GetAnimState():IsCurrentAnimation("arrow_loop_increase")
    local isneutral = self.sanityarrow:GetAnimState():IsCurrentAnimation("neutral")

    if thirst then
        if not isdecrease_more then
            self.sanityarrow:GetAnimState():PushAnimation("arrow_loop_decrease_most",true)
        end
    else
        if not isdecrease_more and not isincrease_most and not isincrease and not isneutral and not isdecrease_mostchk(self) and not overheatingchk(self) then
            self.sanityarrow:GetAnimState():PlayAnimation("neutral")
        end
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
        self.sanityarrow:GetAnimState():PushAnimation("neutral", true)
    end
end