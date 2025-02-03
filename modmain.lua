modimport "scripts/utils/water_utils"
modimport "scripts/set_env"

PrefabFiles = require("water_prefablist")

Assets = require("water_assets")

AddMinimapAtlas("images/tea_minimap.xml")

AddReplicableComponent("thirst")
AddReplicableComponent("waterlevel")
AddReplicableComponent("distill")
<<<<<<< HEAD

RegisterItemAtlasFile("images/tea_inventoryitem.xml")
RegisterItemAtlasFile("images/tea_inventoryitem_drinks.xml")
=======
AddReplicableComponent("cocktailmaker")
AddReplicableComponent("dismantletooluser")

RegisterItemAtlasFile("images/inventoryitems/tea_inventoryitem.xml")
RegisterItemAtlasFile("images/inventoryitems/tea_inventoryitem_drinks.xml")
RegisterItemAtlasFile("images/cookbookimages/tea_cookbookimage.xml")
RegisterItemAtlasFile("images/cookbookimages/tea_cookbookimage_drinks.xml")
>>>>>>> Beta_1.2.8

modrequire("main")

local modlist = require("utils/water_modlist").active_mod_compatibility

if modlist.it and GetModConfigData("useinsight") then
<<<<<<< HEAD
	modrequire("modcompats/2189004162/insight_setting")
elseif modlist.sm and GetModConfigData("useshowme") then
	modrequire("modcompats/666155465/showme_setting")
=======
	modrequire("modinit/2189004162/insight_setting")
elseif modlist.sm and GetModConfigData("useshowme") then
	modrequire("modinit/666155465/showme_setting")
>>>>>>> Beta_1.2.8
end