require "utils/water_utils"

if GetModConfigData("enable_thirst") then
	require("water_debugcommands")
end

modimport("scripts/set_env")

PrefabFiles = require("water_prefablist")

Assets = require("water_assets")

if GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1467214795") then
	modimport("scripts/water_spicedfoods_mod_ia")
end

if GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1505270912") then
	modimport("scripts/water_spicedfoods_mod_te")
end

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

AddIngredientValues(mushrooms, {veggie = .5, mushroom = 1},true)
AddIngredientValues(teaingredients, {veggie = .5, decoration = 1})

AddIngredientValues({"tealeaves"}, {decoration = 1}, true)
AddIngredientValues({"caffeinberry_bean"}, {fruit=.5}, true)
AddIngredientValues({"caffeinberry_bean_cooked"}, {fruit=1})
AddIngredientValues({"tea_seed_cooked"}, {seed=1})

AddIngredientValues({"beefalo_milk"}, {milk=1, dairy=1})

AddReplicableComponent("thirst")
AddReplicableComponent("waterlevel")

RegisterItemAtlasFile("images/tea_inventoryitem.xml")

modrequire("main")
