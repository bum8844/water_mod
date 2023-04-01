local UIAnim = require("widgets/uianim")
local MoistureMeter = require("widgets/moisturemeter")

local _SetValue = MoistureMeter.SetValue

local RATE_SCALE_ANIM =
{
    [GLOBAL.RATE_SCALE.INCREASE_HIGH] = "arrow_loop_increase_most",
    [GLOBAL.RATE_SCALE.INCREASE_MED] = "arrow_loop_increase_more",
    [GLOBAL.RATE_SCALE.INCREASE_LOW] = "arrow_loop_increase",
    [GLOBAL.RATE_SCALE.DECREASE_HIGH] = "arrow_loop_decrease_most",
    [GLOBAL.RATE_SCALE.DECREASE_MED] = "arrow_loop_decrease_more",
    [GLOBAL.RATE_SCALE.DECREASE_LOW] = "arrow_loop_decrease",
}

function MoistureMeter:SetValue(moisture, max, ratescale)
    if moisture > 0 then
        if not self.active then
            self.active = true
            self:Activate()
        end
        self.anim:GetAnimState():SetPercent("anim", 1 - moisture / max)
        self.num:SetString(tostring(math.ceil(moisture)))
    elseif self.active then
        self.active = false
        self:Deactivate()
    end

    print(moisture)
    print(max)
    print(ratescale)

    -- Update arrow
    local anim = "neutral"
    if ratescale == GLOBAL.RATE_SCALE.INCREASE_LOW or
        ratescale == GLOBAL.RATE_SCALE.INCREASE_MED or
        ratescale == GLOBAL.RATE_SCALE.INCREASE_HIGH then
        if moisture < max then
            anim = RATE_SCALE_ANIM[ratescale]
        end
    elseif ratescale == GLOBAL.RATE_SCALE.DECREASE_LOW or
        ratescale == GLOBAL.RATE_SCALE.DECREASE_MED or
        ratescale == GLOBAL.RATE_SCALE.DECREASE_HIGH then
        if moisture > 0 then
            anim = RATE_SCALE_ANIM[ratescale]
        end
    end
    if self.arrowdir ~= anim then
        self.arrowdir = anim
        self.arrow:GetAnimState():PlayAnimation(anim, true)
    end
end