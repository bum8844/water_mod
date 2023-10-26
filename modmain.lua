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

local mushrooms =
{
	"red_cap",
	"green_cap",
	"blue_cap",
	"moon_cap",
}

local ferment = {
	"refined_dust",
}

local additives = {
	"additives_seed",
	--[["additives_petals",
	"additives_ruincacao",]]
}

AddIngredientValues(mushrooms, {veggie = .5, mushroom = 1},true)
AddIngredientValues(teaingredients, {veggie = .5, decoration = 1})
AddIngredientValues(ferment, {ferment=1})
AddIngredientValues(additives, {additives=1})

AddIngredientValues({"tealeaves"}, {decoration = 1}, false, true)
AddIngredientValues({"caffeinberry_bean"}, {fruit=.5}, true)
AddIngredientValues({"caffeinberry_bean_cooked"}, {fruit=1})
AddIngredientValues({"ruincacao_bean_cooked"}, {decoration = 1})

AddIngredientValues({"beefalo_milk"}, {milk=1, dairy=.5})
AddIngredientValues({"goatmilk"}, {milk=1, dairy=1})
AddIngredientValues({"coral_brain"}, {meat=1})

AddReplicableComponent("thirst")
AddReplicableComponent("waterlevel")

RegisterItemAtlasFile("images/tea_inventoryitem.xml")

modrequire("main")