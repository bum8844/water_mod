require("wx78_moduledefs")

local wx78_moduledefs = require("wx78_moduledefs")

local function nonedrunk_activate(inst, wx)
	wx.components.dcapacity.nonedrunk = true
    wx._activate_nonedrunk_module = true
end

local function nonedrunk_deactivate(inst, wx)
	wx.components.dcapacity.nonedrunk = false
    wx._activate_nonedrunk_module = nil
end

local NONEDRUNK_MODULE_DATA =
{
    name = "nonedrunk",
    slots = 2,
    activatefn = nonedrunk_activate,
    deactivatefn = nonedrunk_deactivate,
    mod_module = true,
    sawp_build = "water_status_wx",
}

table.insert(wx78_moduledefs.module_definitions, NONEDRUNK_MODULE_DATA)

wx78_moduledefs.AddCreatureScanDataDefinition("fruitfly","nonedrunk",3)
wx78_moduledefs.AddCreatureScanDataDefinition("lordfruitfly","nonedrunk",6)

local function maxhunger_activate(inst, wx, isloading)
    if wx.components.hunger ~= nil then
        local current_hunger_percent = wx.components.hunger:GetPercent()

        wx.components.hunger:SetMax(wx.components.hunger.max + TUNING.WX78_MAXHUNGER_BOOST)

        if not isloading then
            wx.components.hunger:SetPercent(current_hunger_percent, false)
        end

        -- Tie it to the module instance so we don't have to think too much about removing them.
        wx.components.hunger.burnratemodifiers:SetModifier(inst, TUNING.WX78_MAXHUNGER_SLOWPERCENT)
    end
    if wx.components.thirst ~= nil then
        local current_thirst_percent = wx.components.thirst:GetPercent()

        wx.components.thirst:SetMax(wx.components.thirst.max + TUNING.WX78_MAXHUNGER_BOOST)

        if not isloading then
            wx.components.thirst:SetPercent(current_thirst_percent, false)
        end

        -- Tie it to the module instance so we don't have to think too much about removing them.
        wx.components.thirst.burnratemodifiers:SetModifier(inst, TUNING.WX78_MAXHUNGER_SLOWPERCENT)
    end
end

local function maxhunger_deactivate(inst, wx)
    if wx.components.hunger ~= nil then
        local current_hunger_percent = wx.components.hunger:GetPercent()

        wx.components.hunger:SetMax(wx.components.hunger.max - TUNING.WX78_MAXHUNGER_BOOST)
        wx.components.hunger:SetPercent(current_hunger_percent, false)

        wx.components.hunger.burnratemodifiers:RemoveModifier(inst)
    end
    if wx.components.thirst ~= nil then
        local current_thirst_percent = wx.components.thirst:GetPercent()

        wx.components.thirst:SetMax(wx.components.thirst.max - TUNING.WX78_MAXHUNGER_BOOST)
        wx.components.thirst:SetPercent(current_thirst_percent, false)

        wx.components.thirst.burnratemodifiers:RemoveModifier(inst)
    end
end

local function maxhunger1_activate(inst, wx, isloading)
    if wx.components.hunger ~= nil then
        local current_hunger_percent = wx.components.hunger:GetPercent()

        wx.components.hunger:SetMax(wx.components.hunger.max + TUNING.WX78_MAXHUNGER1_BOOST)

        if not isloading then
            wx.components.hunger:SetPercent(current_hunger_percent, false)
        end
    end
    if wx.components.thirst ~= nil then
        local current_thirst_percent = wx.components.thirst:GetPercent()

        wx.components.thirst:SetMax(wx.components.thirst.max + TUNING.WX78_MAXHUNGER1_BOOST)

        if not isloading then
            wx.components.thirst:SetPercent(current_thirst_percent, false)
        end
    end
end

local function maxhunger1_deactivate(inst, wx)
    if wx.components.hunger ~= nil then
        local current_hunger_percent = wx.components.hunger:GetPercent()

        wx.components.hunger:SetMax(wx.components.hunger.max - TUNING.WX78_MAXHUNGER1_BOOST)
        wx.components.hunger:SetPercent(current_hunger_percent, false)
    end
    if wx.components.thirst ~= nil then
        local current_thirst_percent = wx.components.thirst:GetPercent()

        wx.components.thirst:SetMax(wx.components.thirst.max - TUNING.WX78_MAXHUNGER1_BOOST)
        wx.components.thirst:SetPercent(current_thirst_percent, false)
    end
end

for _, definition in ipairs(wx78_moduledefs.module_definitions) do
    for k, v in pairs(definition) do
        if v == "maxhunger" then
            definition.activatefn = maxhunger_activate
            definition.deactivatefn = maxhunger_deactivate
        elseif v == "maxhunger1" then
            definition.activatefn = maxhunger1_activate
            definition.deactivatefn = maxhunger1_deactivate
        end
    end
    wx78_moduledefs.AddNewModuleDefinition(definition)
end