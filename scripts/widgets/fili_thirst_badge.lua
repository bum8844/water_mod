local Badge = require "widgets/badge"
local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Image = require "widgets/image"

local function OnEffigyDeactivated(inst)
    if inst.AnimState:IsCurrentAnimation("deactivate") then
        inst.widget:Hide()
    end
end

local Fili_Thirst_Badge = Class(Badge, function(self, owner)
    Badge._ctor(self, "fili_thirst_bage", owner)

    self.topperanim = self.underNumber:AddChild(UIAnim())
    self.topperanim:GetAnimState():SetBank("effigy_topper")
    self.topperanim:GetAnimState():SetBuild("effigy_topper")
    self.topperanim:GetAnimState():PlayAnimation("anim")
    self.topperanim:SetClickable(false)

    self.sanityarrow = self.underNumber:AddChild(UIAnim())
    self.sanityarrow:GetAnimState():SetBank("sanity_arrow")
    self.sanityarrow:GetAnimState():SetBuild("sanity_arrow")
    self.sanityarrow:GetAnimState():PlayAnimation("neutral")
    self.sanityarrow:SetClickable(false)

    self.anim:GetAnimState():Hide("frame")

    self.name = self:AddChild(Text(BODYTEXTFONT, 20))
    self.name:SetHAlign(ANCHOR_MIDDLE)
    self.name:SetString("")
	self.name:SetPosition(0, 40, 0)


end)

function Fili_Thirst_Badge:SetName(namestring)
    self.name:SetString(namestring)
end

function Fili_Thirst_Badge:SetPercent(val, max)
    local frv = val/max
    Badge.SetPercent(self, max, frv)
    self.topperanim:GetAnimState():SetPercent("anim", 0)
	self.anim:GetAnimState():SetPercent("anim", 1-(frv/1))
	if val < 40 then
		self:StartWarning(0.8,0,0,0.5)
	else
		self:StopWarning()
	end
end

function Fili_Thirst_Badge:HideBadge()
	self.anim:Hide()
	self.sanityarrow:Hide()
	self.topperanim:Hide()
    self.name:Hide()
    self:Hide()
end

function Fili_Thirst_Badge:ShowBadge()
    self:Show()
	self.anim:Show()
	self.sanityarrow:Show()
	self.topperanim:Show()
    self.name:Show()
	self.anim:GetAnimState():Hide("frame")
end

function Fili_Thirst_Badge:ShowDead()
    self:Show()
    self.anim:Hide()
    self.sanityarrow:Hide()
    self.topperanim:Hide()
    self.name:Show()
end

return Fili_Thirst_Badge
