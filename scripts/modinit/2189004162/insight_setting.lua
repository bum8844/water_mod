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
	end
end