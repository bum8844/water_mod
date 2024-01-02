require("wx78_moduledefs")

local wx78_moduledefs = require("wx78_moduledefs")

local function nonedrunk_activate(inst, wx)
	wx.components.dcapacity.nonedrunk = true
end

local function nonedrunk_deactivate(inst, wx)
	wx.components.dcapacity.nonedrunk = false
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

for _, definition in ipairs(wx78_moduledefs.module_definitions) do
    wx78_moduledefs.AddNewModuleDefinition(definition)
end