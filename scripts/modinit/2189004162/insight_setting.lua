local default = "modinit/2189004162"

local brewingfn = require(default.."/components/brewing").Descriptors
local distillerfn = require(default.."/components/distiller").Descriptors
local waterlevelfn = require(default.."/components/waterlevel").Descriptors
local waterspoilagefn = require(default.."/components/waterspoilage").Descriptors
local steampressurefn = require(default.."/components/steampressure").Descriptors
local wateringtoolfn = require(default.."/components/wateringtool").Descriptors
local waterfn = require(default.."/components/water").Descriptors
local wateringstructurefn = require(default.."/components/wateringstructure").Descriptors
local desalinatiorablerfn = require(default.."/components/desalinatiorable").Descriptors

AddSimPostInit(brewingfn)
AddSimPostInit(distillerfn)
AddSimPostInit(waterlevelfn)
AddSimPostInit(waterspoilagefn)
AddSimPostInit(steampressurefn)
AddSimPostInit(wateringtoolfn)
AddSimPostInit(waterfn)
AddSimPostInit(wateringstructurefn)
AddSimPostInit(desalinatiorablerfn)

if GetModConfigData("enable_thirst") then
	require(default.."/components/edible")
	local thirstfn = require(default.."/components/thirst").Descriptors
	AddSimPostInit(thirstfn)

	if GetModConfigData("display_shared_stats") then
		local playersfn = require(default.."/prefabs/players").AddPrefabDescriptors
		AddSimPostInit(playersfn)
	end
end