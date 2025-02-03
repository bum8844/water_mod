env._G = GLOBAL

local modlist = require("utils/water_modlist").active_mod_compatibility
local default = "modcompats/666155465/util"

local boilware = require(default.."/boilware").fn
local watercollator = require(default.."/watercollator").fn

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

if GetModConfigData("enable_thirst") then
	local hovererfn = require(default.."/thirstvelue").hovererfn
	local player_classifiedfn = require(default.."/thirstvelue").player_classifiedfn
	env.AddClassPostConstruct("widgets/hoverer",hovererfn)
	env.AddPrefabPostInit("player_classified",player_classifiedfn)
end