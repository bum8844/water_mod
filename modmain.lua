require "utils/water_utils"

modimport("scripts/set_env")

PrefabFiles = require("water_prefablist")

Assets = require("water_assets")

AddMinimapAtlas("images/tea_minimap.xml")

AddReplicableComponent("thirst")
AddReplicableComponent("waterlevel")
AddReplicableComponent("distill")

RegisterItemAtlasFile("images/tea_inventoryitem.xml")
RegisterItemAtlasFile("images/tea_inventoryitem_drinks.xml")

modrequire("main")