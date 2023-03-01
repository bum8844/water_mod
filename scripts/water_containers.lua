local cooking = require("cooking")
local containers = require "containers"
local Vector3 = _G.Vector3
 
local params = containers.params
 
params.kettle =
{
    widget =
    {
        slotpos =
        {
            Vector3(0, 64 + 32 + 8 + 4, 0),
            Vector3(0, 32 + 4, 0),
            Vector3(0, -(32 + 4), 0),
            Vector3(0, -(64 + 32 + 8 + 4), 0),
        },
        animbank = "ui_cookpot_1x4",
        animbuild = "ui_cookpot_1x4",
        pos = Vector3(200, 0, 0),
        side_align_tip = 100,
        buttoninfo =
        {
            text = STRINGS.ACTIONS.BOIL,
            position = Vector3(0, -165, 0),
        }
    },
    acceptsstacks = false,
    type = "cooker",
}

params.brewery =
{
    widget =
    {
        slotpos =
        {
            Vector3(0, 64 + 32 + 8 + 4, 0),
            Vector3(0, 32 + 4, 0),
            Vector3(0, -(32 + 4), 0),
            Vector3(0, -(64 + 32 + 8 + 4), 0),
        },
        animbank = "ui_cookpot_1x4",
        animbuild = "ui_cookpot_1x4",
        pos = Vector3(200, 0, 0),
        side_align_tip = 100,
        buttoninfo =
        {
            text = STRINGS.ACTIONS.FERMENT,
            position = Vector3(0, -165, 0),
        }
    },
    acceptsstacks = false,
    type = "cooker",
}
 
function params.kettle.itemtestfn(container, item, slot)
    return cooking.IsCookingIngredient(item.prefab) and not container.inst:HasTag("burnt")
end
 
function params.kettle.widget.buttoninfo.fn(inst, doer)
    if inst.components.container ~= nil then
        BufferedAction(doer, inst, ACTIONS.COOK):Do()
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendRPCToServer(RPC.DoWidgetButtonAction, ACTIONS.COOK.code, inst, ACTIONS.COOK.mod_name)
    end
end
 
function params.kettle.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and inst.replica.container:IsFull() and inst.replica.waterlevel:HasWater()
end

function params.brewery.itemtestfn(container, item, slot)
    return cooking.IsCookingIngredient(item.prefab) and not container.inst:HasTag("burnt")
end
 
function params.brewery.widget.buttoninfo.fn(inst, doer)
    if inst.components.container ~= nil then
        BufferedAction(doer, inst, ACTIONS.COOK):Do()
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendRPCToServer(RPC.DoWidgetButtonAction, ACTIONS.COOK.code, inst, ACTIONS.COOK.mod_name)
    end
end
 
function params.brewery.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and inst.replica.container:IsFull() and inst.replica.waterlevel:HasWater()
end
 
containers.params.portablekettle = params.kettle

--from widgets/containerwidget.lua
--Below allows to refresh button in cooker widget on filling or draining water.
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
    self.OldOpen = self.Open
    function self:Open(container, doer)
        self:OldOpen(container, doer)
        self.inst:ListenForEvent("waterleveldirty", self.OnWaterlevelDirty, container)
    end
end)

