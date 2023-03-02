require "utils/water_utils"

if GetModConfigData("enable_thirst") then
	require("water_debugcommands")
end

modimport("scripts/set_env")

PrefabFiles = require("water_prefablist")

Assets = require("water_assets")

AddMinimapAtlas("images/tea_minimap.xml")

local teaingredients =
{
	"foliage",
	"petals",
	"petals_evil",
	"succulent_picked",
	"firenettles",
	"tillweed",
	"moon_tree_blossom",
}

AddIngredientValues(teaingredients, {decoration=1, inedible=1})
AddIngredientValues({"beefalo_milk"}, {milk=1, dairy=1})

AddIngredientValues({"caffeinberry_bean"}, {fruit=.5}, true)
AddIngredientValues({"caffeinberry_bean_cooked"}, {fruit=1})

AddIngredientValues({"tealeaves"}, {decoration=1, inedible=1}, false, true)

AddReplicableComponent("thirst")
AddReplicableComponent("waterlevel")

RegisterItemAtlasFile("images/tea_inventoryitem.xml")

modrequire("main")
