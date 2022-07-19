require("utils/inventoryutil")
require("water_constants")
modimport("init/set_env")

PrefabFiles = require("water_prefablist")

Assets = require("water_assets")

modimport("scripts/water_tuning")
modimport("scripts/water_recipes")
modimport("scripts/strings/strings")
modimport("scripts/strings/speech")
modimport("scripts/water_actions")
modimport("scripts/water_containers")

if GetModConfigData("enable_thirst") ~= 1 then
	modimport("init/postinit/postinit_player")
	modimport("init/postinit/postinit_thirstvalue")
	modimport("scripts/widgets/thirstbadge_statusdisplays")
end

AddMinimapAtlas("images/tea_minimap.xml")

modimport("scripts/water_main.lua")

local drinks = require("preparedrink")
local drinks_fermented = require("prepareagedrink")

for k, recipe in pairs(drinks) do
	AddCookerRecipe("kettle", recipe)
	AddCookerRecipe("portablekettle", recipe)
end

for k, recipe in pairs(drinks_fermented) do
	AddCookerRecipe("brewery", recipe)
end

local teaingredients = {
	"foliage",
	"petals",
	"petals_evil",
	"succulent_picked",
	"tealeaves",
	"tealeaves_dried",
	"firenettles",
	"tillweed",
	"moon_tree_blossom",
}

AddIngredientValues(teaingredients, {decoration=1, inedible=1})
AddIngredientValues({"beefalo_milk"}, {milk=1, dairy=1})

AddIngredientValues({"caffeinberry_bean"}, {fruit=.5})
AddIngredientValues({"caffeinberry_bean_cooked"}, {fruit=1})

AddReplicableComponent("waterlevel")

if GetModConfigData("enable_thirst") ~= 1 then
	AddReplicableComponent("thirst")
end
