env._G = GLOBAL

<<<<<<< HEAD:scripts/modcompats/666155465/showme_setting.lua
local modlist = require("utils/water_modlist").active_mod_compatibility
local default = "modcompats/666155465/util"
=======
local boilwares = {
	"tea_pot",
	"kettle",
	"portable_tea_pot",
	"portablekettle",
	"campkettle",
	"campdesalinator",
	"desalinator",
	"distillers",
	"brewery",
	"barrel",
	"pond",
	"pond_cave",
	"tidalpool",
	"tidalpoolnew",
	"pond_mos",
	"grotto_pool_big",
	"grotto_pool_small",
}

local watercollators = {
	"well_waterpump",
	"well",
	"bucket_empty",
	"bucket_steel_empty",
	"bucket_woodie_empty",
	"bucket_driftwood_empty",
}

local modlist = require("utils/water_modlist").active_mod_compatibility
local default = "modinit/666155465/util"
>>>>>>> Beta_1.2.8:scripts/modinit/666155465/showme_setting.lua

local boilware = require(default.."/boilware").fn
local watercollator = require(default.."/watercollator").fn

<<<<<<< HEAD:scripts/modcompats/666155465/showme_setting.lua
env.AddPrefabPostInit("kettle",boilware)
env.AddPrefabPostInit("portablekettle",boilware)
env.AddPrefabPostInit("campkettle",boilware)
env.AddPrefabPostInit("desalinator",boilware)
env.AddPrefabPostInit("distillers",boilware)
env.AddPrefabPostInit("brewery",boilware)
env.AddPrefabPostInit("campdesalinator",boilware)
env.AddPrefabPostInit("barrel",boilware)

env.AddPrefabPostInit("well_waterpump",watercollator)
env.AddPrefabPostInit("well",watercollator)
env.AddPrefabPostInit("bucket_empty",watercollator)
env.AddPrefabPostInit("bucket_steel_empty",watercollator)
env.AddPrefabPostInit("bucket_woodie_empty",watercollator)
--env.AddPrefabPostInit("bucket_driftwood_empty",watercollator)
=======
for k, v in pairs(boilwares) do
	env.AddPrefabPostInit(v,boilware)
end

for k, v in pairs(watercollators) do
	env.AddPrefabPostInit(v,watercollator)
end
>>>>>>> Beta_1.2.8:scripts/modinit/666155465/showme_setting.lua

if GetModConfigData("enable_thirst") then
	local hovererfn = require(default.."/thirstvelue").hovererfn
	local player_classifiedfn = require(default.."/thirstvelue").player_classifiedfn
	env.AddClassPostConstruct("widgets/hoverer",hovererfn)
	env.AddPrefabPostInit("player_classified",player_classifiedfn)
end