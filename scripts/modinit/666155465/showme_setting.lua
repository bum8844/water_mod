env._G = GLOBAL

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

local boilware = require(default.."/boilware").fn
local watercollator = require(default.."/watercollator").fn

for k, v in pairs(boilwares) do
	env.AddPrefabPostInit(v,boilware)
end

for k, v in pairs(watercollators) do
	env.AddPrefabPostInit(v,watercollator)
end

if GetModConfigData("enable_thirst") then
	local hovererfn = require(default.."/thirstvelue").hovererfn
	local player_classifiedfn = require(default.."/thirstvelue").player_classifiedfn
	env.AddClassPostConstruct("widgets/hoverer",hovererfn)
	env.AddPrefabPostInit("player_classified",player_classifiedfn)
end