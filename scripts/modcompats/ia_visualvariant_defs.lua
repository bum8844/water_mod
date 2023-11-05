require("prefabs/visualvariant_defs")

local visualvariant_defs = require("prefabs/visualvariant_defs")

local POSSIBLE_VARIANTS = require("prefabs/visualvariant_defs").POSSIBLE_VARIANTS
local SW_ICONS = require("prefabs/visualvariant_defs").SW_ICONS
local PORK_ICONS = require("prefabs/visualvariant_defs").PORK_ICONS
local VISUALVARIANT_PREFABS = require("prefabs/visualvariant_defs").VISUALVARIANT_PREFABS

local WATER_POSSIBLE_VARIANTS = {}

local WATER_VISUALVARIANT_PREFABS = {}

local WATER_SW_ICONS = 
{
	["well_sprinkler_kit"] = "well_sprinkler_kit_tropical",
	["well_waterpump_kit"] = "well_waterpump_kit_tropical",
	["distillers"] = "distillers_tropical",
}

local WATER_PORK_ICONS = 
{	
    -- ["dug_grass"] = "dug_grass_tropical",
	-- ["cutgrass"] = "cutgrass_tropical",
	-- ["log"] = "log_plateu",
	-- ["snakeskin"] = "snakeskin_scaly",
	-- ["snake"] = "snake_scaly",
	-- ["snakeskinsail"] = "snakeskinsail_scaly",
	-- ["armor_snakeskin"] = "armor_snakeskin_scaly",
	-- ["snakeskinhat"] = "snakeskinhat_scaly",
	-- ["fish"] = "coi",
	-- ["fish_cooked"] = "coi_cooked",
}

WATER_POSSIBLE_VARIANTS.well_sprinkler_kit = {
    default = {build="well_sprinkler_kit",bank="well_sprinkler_kit",invimage="default"},
    tropical = {build="well_sprinkler_kit",bank="well_sprinkler_kit_tropical"invimage="well_sprinkler_kit_tropical",testfn=IsInIAClimate},
}

WATER_POSSIBLE_VARIANTS.well_sprinkler = {
    default = {build="well_sprinkler",bank="well_sprinkler"},
    tropical = {build="well_sprinkler",bank="well_sprinkler_tropical",testfn=IsInIAClimate},
}

WATER_POSSIBLE_VARIANTS.well_waterpump_kit = {
    default = {build="well_waterpump_kit",bank="well_waterpump_kit",invimage="default"},
    tropical = {build="well_waterpump_kit",bank="well_waterpump_kit_tropical"invimage="well_waterpump_kit_tropical",testfn=IsInIAClimate},
}

WATER_POSSIBLE_VARIANTS.well_sprinkler = {
    default = {build="well_waterpump",bank="well_waterpump"},
    tropical = {build="well_waterpump",bank="well_waterpump_tropical",testfn=IsInIAClimate},
}

WATER_POSSIBLE_VARIANTS.distillers = {
    default = {build="distillers",bank="distillers"},
    tropical = {build="distillers",bank="distillers_tropical",testfn=IsInIAClimate},
}

for k, v in ipairs(WATER_SW_ICONS) do
	SW_ICONS[k] = v
end

for k, v in ipairs(WATER_POSSIBLE_VARIANTS) do
	POSSIBLE_VARIANTS[k] = v
end