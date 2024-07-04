modimport "scripts/utils/water_utils"
modimport "scripts/set_env"


PrefabFiles = require("water_prefablist")

Assets = require("water_assets")

AddMinimapAtlas("images/tea_minimap.xml")

AddReplicableComponent("thirst")
AddReplicableComponent("waterlevel")
AddReplicableComponent("distill")

RegisterItemAtlasFile("images/tea_inventoryitem.xml")
RegisterItemAtlasFile("images/tea_inventoryitem_drinks.xml")

modrequire("main")

local modlist = require("utils/water_modlist").active_mod_compatibility

if modlist.it and GetModConfigData("useinsight") then
	modrequire("modcompats/2189004162/insight_setting")
elseif modlist.sm and GetModConfigData("useshowme") then
	modrequire("modcompats/666155465/showme_setting")
end