env._G = GLOBAL
env.require = _G.require
env.STRINGS = _G.STRINGS

PrefabFiles = require("water_prefablist")

Assets = require("water_assets")

STRINGS.NAMES.DRINKS_TAB = "WATER"
STRINGS.TABS.DRINKS_TAB = "Water"
_G.RECIPETABS['DRINKS_TAB'] = {str = "DRINKS_TAB", sort=3, icon_atlas = "images/tea_inventoryitem.xml", icon = "watertab.tex"}

_G.WATERTYPE = 
{
	CLEAN = "CLEAN",
	DIRTY = "DIRTY",
	SALTY = "SALTY",
}

modimport("scripts/water_recipes.lua")
modimport("scripts/strings/strings.lua")
--modimport("scripts/strings/speech.lua")
modimport("scripts/water_tuning.lua")
--modimport("scripts/prepareagedrink.lua")
--modimport("scripts/preparedrink.lua")
modimport("scripts/water_actions.lua")

AddMinimapAtlas("images/tea_minimap.xml")

modimport("scripts/water_main.lua")

local drinks = require("preparedrink")
local drinks_fermented = require("prepareagedrink")

for k, v in pairs(drinks) do
	AddCookerRecipe("kettle", v)
	AddCookerRecipe("portablekettle", v)
end

for k, v in pairs(drinks_fermented) do
	AddCookerRecipe("brewery", v)
end

local teaingredients = {
	"foliage",
	"petals",
	"succulent_picked",
	"tealeaves",
	"firenettles",
	"tillweeds",
	"moon_tree_blossom",
}

AddIngredientValues(teaingredients, {decoration=1, inedible=1})
AddIngredientValues({"beefalo_milk"}, {milk=1, dairy=1})
