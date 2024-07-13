local Screen = require "widgets/screen"
local MapWidget = require("widgets/mapwidget")
local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local BoilbookWidget = require "widgets/redux/boilbookadvancedwidget"
local TEMPLATES = require "widgets/redux/templates"

local BoilbookAdvancedPopupScreen = Class(Screen, function(self, owner)
    self.owner = owner
    Screen._ctor(self, "BoilbookAdvancedPopupScreen")

    local black = self:AddChild(ImageButton("images/global.xml", "square.tex"))
    black.image:SetVRegPoint(ANCHOR_MIDDLE)
    black.image:SetHRegPoint(ANCHOR_MIDDLE)
    black.image:SetVAnchor(ANCHOR_MIDDLE)
    black.image:SetHAnchor(ANCHOR_MIDDLE)
    black.image:SetScaleMode(SCALEMODE_FILLSCREEN)
    black.image:SetTint(0,0,0,.5)
    black:SetOnClick(function() TheFrontEnd:PopScreen() end)
    black:SetHelpTextMessage("")

    local root = self:AddChild(Widget("root"))
    root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    root:SetHAnchor(ANCHOR_MIDDLE)
    root:SetVAnchor(ANCHOR_MIDDLE)
    root:SetPosition(0, -25)

    self.book = root:AddChild(BoilbookWidget(owner))

    self.default_focus = self.book

    SetAutopaused(true)
end)

function BoilbookAdvancedPopupScreen:OnDestroy()
    SetAutopaused(false)

    POPUPS.BOILBOOK_ADVANCED:Close(self.owner)

    TheCookbook:ClearNewFlags()
    TheCookbook:Save() -- for saving filter settings

    BoilbookAdvancedPopupScreen._base.OnDestroy(self)
end

function BoilbookAdvancedPopupScreen:OnBecomeInactive()
    BoilbookAdvancedPopupScreen._base.OnBecomeInactive(self)
end

function BoilbookAdvancedPopupScreen:OnBecomeActive()
    BoilbookAdvancedPopupScreen._base.OnBecomeActive(self)
end

function BoilbookAdvancedPopupScreen:OnControl(control, down)
    if BoilbookAdvancedPopupScreen._base.OnControl(self, control, down) then return true end

    if not down and (control == CONTROL_MAP or control == CONTROL_CANCEL) then
        TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
        TheFrontEnd:PopScreen()
        return true
    end

    return false
end

function BoilbookAdvancedPopupScreen:GetHelpText()
    local controller_id = TheInput:GetControllerID()
    local t = {}

    table.insert(t,  TheInput:GetLocalizedControl(controller_id, CONTROL_CANCEL) .. " " .. STRINGS.UI.HELP.BACK)

    return table.concat(t, "  ")
end

return BoilbookAdvancedPopupScreen
