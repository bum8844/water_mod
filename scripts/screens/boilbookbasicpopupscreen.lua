local Screen = require "widgets/screen"
local MapWidget = require("widgets/mapwidget")
local Widget = require "widgets/widget"
local ImageButton = require "widgets/imagebutton"
local BoilbookWidget = require "widgets/redux/boilbookbasicwidget"
local TEMPLATES = require "widgets/redux/templates"

local BoilbookBasicPopupScreen = Class(Screen, function(self, owner)
    self.owner = owner
    Screen._ctor(self, "BoilbookBasicPopupScreen")

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

function BoilbookBasicPopupScreen:OnDestroy()
    SetAutopaused(false)

    POPUPS.BOILBOOK_BASIC:Close(self.owner)

    TheCookbook:ClearNewFlags()
    TheCookbook:Save() -- for saving filter settings

    BoilbookBasicPopupScreen._base.OnDestroy(self)
end

function BoilbookBasicPopupScreen:OnBecomeInactive()
    BoilbookBasicPopupScreen._base.OnBecomeInactive(self)
end

function BoilbookBasicPopupScreen:OnBecomeActive()
    BoilbookBasicPopupScreen._base.OnBecomeActive(self)
end

function BoilbookBasicPopupScreen:OnControl(control, down)
    if BoilbookBasicPopupScreen._base.OnControl(self, control, down) then return true end

    if not down and (control == CONTROL_MAP or control == CONTROL_CANCEL) then
        TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
        TheFrontEnd:PopScreen()
        return true
    end

    return false
end

function BoilbookBasicPopupScreen:GetHelpText()
    local controller_id = TheInput:GetControllerID()
    local t = {}

    table.insert(t,  TheInput:GetLocalizedControl(controller_id, CONTROL_CANCEL) .. " " .. STRINGS.UI.HELP.BACK)

    return table.concat(t, "  ")
end

return BoilbookBasicPopupScreen
