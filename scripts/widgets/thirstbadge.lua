local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"

local ThirstBadge = Class(Badge, function(self, owner)
    Badge._ctor(self, "fili_thirst_bage", owner, nil, "fili_thirst_bage", nil, nil, true)

    self.thirstarrow = self.underNumber:AddChild(UIAnim())
    self.thirstarrow:GetAnimState():SetBank("sanity_arrow")
    self.thirstarrow:GetAnimState():SetBuild("sanity_arrow")
    self.thirstarrow:GetAnimState():PlayAnimation("neutral")
    self.thirstarrow:SetClickable(false)
    self.thirstarrow:GetAnimState():AnimateWhilePaused(false)

    self:StartUpdating()
end)

function ThirstBadge:OnUpdate(dt)
    if TheNet:IsServerPaused() then return end

    local anim = "neutral"
    if  self.owner ~= nil and
        self.owner:HasTag("sleeping") and
        self.owner.replica.thirst ~= nil and
        self.owner.replica.thirst:GetPercent() > 0 then

        anim = "arrow_loop_decrease"
    end

    if self.owner:HasDebuff("wintersfeastbuff") or self.owner:HasDebuff("thirstregenbuff") then
        anim = "arrow_loop_increase"
    end

    if self.arrowdir ~= anim then
        self.arrowdir = anim
        self.thirstarrow:GetAnimState():PlayAnimation(anim, true)
    end
end

return ThirstBadge
