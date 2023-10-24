local cooking = require("cooking")
local containers = require "containers"
local Vector3 = _G.Vector3
 
local params = containers.params

--[[params.barrel =
{
    widget =
    {
        slotpos = {Vector3(0,0,0)},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = Vector3(0,200,0),
        side_align_tip = 160,
    },
    type = "chest",


function params.barrel.itemtestfn(container, item, slot)
    return item:HasTag("clean")
end]]
 
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

params.distillers =
{
    widget =
    {
        slotpos =
        {
            Vector3(0, 32 + 4, 0),
            Vector3(0, -(32 + 4), 0),
        },
        slotbg =
        {
            { image = "cook_slot_drink.tex", atlas = "images/tea_ui.xml" },
            { image = "cook_slot_additive.tex", atlas = "images/tea_ui.xml" },
        },
        animbank = "ui_cookpot_1x2",
        animbuild = "ui_cookpot_1x2",
        pos = Vector3(200, 0, 0),
        side_align_tip = 100,
        buttoninfo =
        {
            text = STRINGS.ACTIONS.SPICE,
            position = Vector3(0, -93, 0),
        },
    },
    acceptsstacks = true,
    usespecificslotsforitems = true,
    type = "cooker",
}
 
function params.kettle.itemtestfn(container, item, slot)
    return cooking.IsCookingIngredient(item.prefab) and not item:HasTag("prepareddrink") and not container.inst:HasTag("burnt")
end
 
function params.kettle.widget.buttoninfo.fn(inst, doer)
    if inst.components.container ~= nil then
        BufferedAction(doer, inst, ACTIONS.BREWING):Do()
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendRPCToServer(RPC.DoWidgetButtonAction, ACTIONS.BREWING.code, inst, ACTIONS.BREWING.mod_name)
    end
end
 
function params.kettle.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and inst.replica.container:IsFull() and inst.replica.waterlevel:HasWater()
end

function params.brewery.itemtestfn(container, item, slot)
    return cooking.IsCookingIngredient(item.prefab) and not item:HasTag("prepareddrink") and not container.inst:HasTag("burnt")
end
 
function params.brewery.widget.buttoninfo.fn(inst, doer)
    if inst.components.container ~= nil then
        BufferedAction(doer, inst, ACTIONS.BREWING):Do()
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendRPCToServer(RPC.DoWidgetButtonAction, ACTIONS.BREWING.code, inst, ACTIONS.BREWING.mod_name)
    end
end
 
function params.brewery.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and inst.replica.container:IsFull() and inst.replica.waterlevel:HasWater()
end
 
containers.params.portablekettle = params.kettle

function params.distillers.itemtestfn(container, item, slot)
    return (item.prefab ~= "goopydrink" or item.prefab ~= "spoiled_drink")
        and (   
                (slot == 1 and item:HasTag("alcohol") and not item:HasTag("spirits")) or
                (slot == 2 and item:HasTag("additives")) or
                (slot == nil and (item:HasTag("additives") or (item:HasTag("alcohol") and not item:HasTag("spirits"))))
            )
        and not container.inst:HasTag("burnt")
end

-- distill

function params.distillers.widget.buttoninfo.fn(inst, doer)
    if inst.components.container ~= nil then
        BufferedAction(doer, inst, ACTIONS.BREWING):Do()
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendRPCToServer(RPC.DoWidgetButtonAction, ACTIONS.BREWING.code, inst, ACTIONS.BREWING.mod_name)
    end
end
 
function params.distillers.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and inst.replica.container:HasItemWithTag("alcohol",4)
end

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

local portablespicer_itemtestfn = params.portablespicer.itemtestfn
local function RejectDrinks(container, item, slot)
    return portablespicer_itemtestfn(container, item, slot)
        and not item:HasTag("prepareddrink")
end

containers.params.portablespicer.itemtestfn = RejectDrinks --음료의 양념을 허용하지 않으려면 이 부분을 활성화하세요

AddClassPostConstruct("widgets/containerwidget", function(self)
    self.refreshbutton = RefreshOnDirty
    self.OnWaterlevelDirty = function(inst, data) self:refreshbutton(data) end
    self.OldOpen = self.Open
    function self:Open(container, doer)
        self:OldOpen(container, doer)
        self.inst:ListenForEvent("waterleveldirty", self.OnWaterlevelDirty, container)
    end
end)
