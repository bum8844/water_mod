local Widget = require "widgets/widget"
local BoilbookWidget = require "widgets/redux/boilbookwidget"

local BoilbookPanel = Class(Widget, function(self, parent_screen)
    Widget._ctor(self, "BoilbookPanel")

    self.root = self:AddChild(Widget("ROOT"))

    self.root:SetPosition(0, -15)

    TheCookbook:ClearFilters()

    self.book = self.root:AddChild(BoilbookWidget(self))

    self.focus_forward = self.book
end)

return BoilbookPanel
