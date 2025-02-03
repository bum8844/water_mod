<<<<<<< HEAD:scripts/modcompats/2189004162/insight_setting.lua
local default = "modcompats/2189004162"

local brewingfn = require(default.."/components/brewing").Descriptors
local distillerfn = require(default.."/components/distiller").Descriptors
local waterlevelfn = require(default.."/components/waterlevel").Descriptors
local waterspoilagefn = require(default.."/components/waterspoilage").Descriptors
local steampressurefn = require(default.."/components/steampressure").Descriptors
local wateringtoolfn = require(default.."/components/wateringtool").Descriptors
local wateringstructurefn = require(default.."/components/wateringstructure").Descriptors
local saltmakerfn = require(default.."/components/saltmaker").Descriptors

AddSimPostInit(brewingfn)
AddSimPostInit(distillerfn)
AddSimPostInit(waterlevelfn)
AddSimPostInit(waterspoilagefn)
AddSimPostInit(steampressurefn)
AddSimPostInit(wateringtoolfn)
AddSimPostInit(wateringstructurefn)
AddSimPostInit(saltmakerfn)

if GetModConfigData("enable_thirst") then
	require(default.."/components/edible")
	local thirstfn = require(default.."/components/thirst").Descriptors
	AddSimPostInit(thirstfn)

	if GetModConfigData("display_shared_stats") then
		local playersfn = require(default.."/prefabs/players").AddPrefabDescriptors
		AddSimPostInit(playersfn)
=======
local default = "modinit/2189004162"

local fn_tables = {
	brewingfn = require(default.."/components/brewing").Descriptors,
	distillerfn = require(default.."/components/distiller").Descriptors,
	waterlevelfn = require(default.."/components/waterlevel").Descriptors,
	waterspoilagefn = require(default.."/components/waterspoilage").Descriptors,
	steampressurefn = require(default.."/components/steampressure").Descriptors,
	wateringtoolfn = require(default.."/components/wateringtool").Descriptors,
	waterfn = require(default.."/components/water").Descriptors,
	wateringstructurefn = require(default.."/components/wateringstructure").Descriptors,
	desalinatiorablerfn = require(default.."/components/desalinatiorable").Descriptors,
}

local fn_option_tables = {
	thirstfn = require(default.."/components/thirst").Descriptors,
	playersfn = require(default.."/prefabs/players").AddPrefabDescriptors,
}

for k, v in pairs(fn_tables) do
	AddSimPostInit(v)
end

if GetModConfigData("enable_thirst") then
	require(default.."/components/edible")
	AddSimPostInit(fn_option_tables.thirstfn)
	if GetModConfigData("display_shared_stats") then
		AddSimPostInit(fn_option_tables.playersfn)
>>>>>>> Beta_1.2.8:scripts/modinit/2189004162/insight_setting.lua
	end
end