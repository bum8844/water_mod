--from widgets/containerwidget.lua
--Refresh button in cooker widget when filling or taking out water.
local function RefreshButton(inst, self)
    if self.isopen then
        local widget = self.container.replica.container:GetWidget()
        if widget ~= nil and widget.buttoninfo ~= nil and widget.buttoninfo.validfn ~= nil then
            if widget.buttoninfo.validfn(self.container) then
                self.button:Enable()
            else
                self.button:Disable()
            end
        end
    end
end

local function RefreshOnDirty(self, data)
    if self.button ~= nil and self.container ~= nil then
        RefreshButton(self.inst, self)
        self.inst:DoTaskInTime(0, RefreshButton, self)
    end
end

AddClassPostConstruct("widgets/containerwidget", function(self)
    self.refreshbutton = RefreshOnDirty
    self.OnWaterlevelDirty = function(inst, data) self:refreshbutton(data) end
    self.OnDistillDirty = function(inst, data) self:refreshbutton(data) end
    self.OldOpen = self.Open
    function self:Open(container, doer)
        self:OldOpen(container, doer)
        self.inst:ListenForEvent("waterleveldirty", self.OnWaterlevelDirty, container)
        self.inst:ListenForEvent("distilldirty", self.OnDistillDirty, container)
    end
end)