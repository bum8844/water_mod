name 						= "Don't Starve: Dehydrated"
version 					= "Alpha 1.2.7.1c"
local info_version = "Version "..version.."\n"

description = info_version..[[
With Don't Starve: Dehydrated hunger is not the only threat coming for you.

You will have to explore the Constant and gather materials to quench your thirst if you want to survive. 

You can and should concoct your beverages in a teapot or a brewing stand instead of drinking unrefined sea water.

Another tool for survival is a book that you could accumulate information in about a variety of plants and edible food, even favorites!
]]
forumthread = ""
author 						= ""
forumthread 				= ""
api_version 				= 10
priority 					= -10000010001

dont_starve_compatible 		= false
reign_of_giants_compatible 	= false
shipwrecked_compatible 		= false

dst_compatible              = true
all_clients_require_mod     = true
client_only_mod             = false

icon_atlas 					= "preview.xml"
icon 						= "preview.tex"

server_filter_tags = {""}

local opt_Empty = {{description = "", data = 0}}
local function Title(title,hover)
	return {
		name=title,
		hover=hover,
		options=opt_Empty,
		default=0,
	}
end

local SEPARATOR = Title("")

configuration_options =
{
	Title("Select Language"),
	{
		name = "locale",
		label = "Language",
		hover = "",
		options =
		{
			{description = "Auto", data = false},
			{description = "English", data = "en", hover="By lord lee"},
			{description = "한국어", data = "ko", hover="기본지원"},
			{description = "Tiếng Việt", data = "vi", hover="Bởi Shinosan"},
			{description = "Español", data="es", hover="Traducido por Deimos y RavenCorwen"},
		},
		default = false,
	},
	{
		name = "useinsight",
		label = "Use Insight",
		hover = "",
		options =
		{
			{description = "No", data = false},
			{description = "YES", data = true},
		},
		default = true,
	},
	{
		name = "useshowme",
		label = "Use ShowMe",
		hover = "",
		options =
		{
			{description = "No", data = false},
			{description = "YES", data = true},
		},
		default = true,
	},
	SEPARATOR,
	Title("WorldGen options"),
	{
		name = "gen_tea_tree",
		label = "Tea Trees",
		hover = "How many Tea Trees do you want to generate?",
		options =
		{
			{description = "None", data = 0},
			{description = "Less", data = 0.7},
			{description = "Default", data = 1.2},
			{description = "More", data = 1.7},
			{description = "Lots", data = 1.9},
		},
		default = 1.2,
	},
	{
		name = "gen_caffeinberry",
		label = "Coffee Plants",
		hover = "How many Coffee Plants do you want to generate?",
		options =
		{
			{description = "None", data = 0},
			{description = "Less", data = 0.7},
			{description = "Default", data = 1.2},
			{description = "More", data = 1.7},
			{description = "Lots", data = 1.9},
		},
		default = 1.2,
	},
	{
		name = "gen_ruincacao_tree",
		label = "Cacao Plants",
		hover = "How many Cacao Plants do you want to generate?",
		options =
		{
			{description = "None", data = 0},
			{description = "Less", data = 0.7},
			{description = "Default", data = 1.2},
			{description = "More", data = 1.7},
			{description = "Lots", data = 1.9},
		},
		default = 1.2,
	},
	{
		name = "re_retrofit",
		label = "Re Retrofit Plants",
		hover = "When re-applying this mode",
		options = {
			{description = "Not Need", data = 0},
			{description = "All", data = 1},
			{description = "Only Tree Trees", data = 2},
			{description = "Only Coffee Plants", data = 3},
			{description = "Only Cacao Plants", data = 4},
		},
		default = 0,
	},
	SEPARATOR,
	Title("Thirst options"),
	{
		name = "enable_thirst",
		label = "Enable Thirst?",
		options =
		{
			{description = "Enabled", data = true},
			{description = "Disabled", data = false},
		},
		default = true,
	},
	{
		name = "enable_waterborne",
		label = "Enable Waterborne Disease?",
		options =
		{
			{description = "Enabled", data = true},
			{description = "Disabled", data = false},
		},
		default = true,
	},
	{
		name = "thirst_max",
		label = "Max Thirst",
		options =
		{
		    {description = "70", data = 70},
		    {description = "100", data = 100},
			{description = "150(Default)", data = 150},
			{description = "200", data = 200},
			{description = "250", data = 250},
		},
		default = 150,
	},
	{
		name = "thirst_decrease_speed",
		label = "Thirst Consumption Per Day",
		options =
		{
		    {description = "30", data = .2},
		    {description = "60", data = .4},
		    {description = "75", data = .5},
			{description = "90(Default)", data = .6},
			{description = "105", data = .7},
			{description = "135", data = .9},
		},
		default = .6,
	},
	{
		name = "waterborne_time",
		label = "Waterborne Disease Duration",
		options =
		{
			{description = "Shorter", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "Longer", data = .75},
		},
		default = .5
	},
	SEPARATOR,
	Title("Brewery options"),
	Title("Alcohol Drinks Brewing"),
	{
		name = "beer_wait",
		label = "Extra Time",
		hover = "How much longer do you want alcohols take to brew?",
		options =
		{
			{description = "None", data = 0},
			{description = "Shorter", data = .1875},
			{description = "Short", data = .375},
			{description = "Default", data = .75},
			{description = "Long", data = 1.5},
			{description = "Longer", data = 3},
		},
		default = .75
	},
	Title("Soda Brewing"),
	{
		name = "soda_wait",
		label = "Extra Time",
		hover = "How much longer do you want sodas take to brew?",
		options = 
		{
			{description = "None", data = 0},
			{description = "Shorter", data = .1875},
			{description = "Short", data = .375},
			{description = "Default", data = .75},
			{description = "Long", data = 1.5},
			{description = "Longer", data = 3},
		},
		default = .75
	},
	SEPARATOR,
	Title("Effect options"),
	Title("Coffee Speed Boost"),
	{
		name = "caffein_speed",
		label = "Boost Rate",
		options = 
		{
			{description = "Slower", data = 1.05},
			{description = "Slow", data = 1.10},
			{description = "Default", data = 1.25},
			{description = "Fast", data = 1.40},
			{description = "Faster", data = 1.83},
		},
		default = 1.25
	},
	{
		name = "caffein_time",
		label = "Duration",
		options = 
		{
			{description = "Shorter", data = .5},
			{description = "Short", data = .7},
			{description = "Default", data = 1},
			{description = "Long", data = 2},
			{description = "Longer", data = 4},
		},
		default = 1
	},
	SEPARATOR,
	Title("Drink Sleep Effect"),
	{
		name = "sleeping_time",
		label = "Duration",
		options =
		{
			{description = "Shorter", data = 3.75},
			{description = "Short", data = 7.5},
			{description = "Default", data = 15},
			{description = "Long", data = 18.75},
			{description = "Longer", data = 22.5},
		},
		default = 15
	},
	SEPARATOR,
	Title("Drink Alcohol Effect"),
	{
		name = "child_safety",
		label = "Child Protection",
		options =
		{
			{description = "Enabled", data = true},
			{description = "Disabled", data = false},
		},
		default = true
	},	
	{
		name = "alcohol_time",
		label = "Intoxication Duration",
		options =
		{
			{description = "Shorter", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "Longer", data = .75},
		},
		default = .5
	},
	{
		name = "drunkard_time",
		label = "Tipsiness Duration",
		options =
		{
			{description = "Shorter", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "Longer", data = .75},
		},
		default = .5
	},
	{
		name = "resistance_time",
		label = "Sanity Depression Arua Resistance",
		options =
		{
			{description = "Shorter", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "Longer", data = .75},
		},
		default = .5
	},
	{
		name = "immune_time",
		label = "Pain Relief Duration",
		options =
		{
			{description = "Shorter", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "Longer", data = .75},
		},
		default = .5
	},
	SEPARATOR,
	Title("Drink Alcohol Capacity"),
	{
		name = "max_capacity",
		label = "Threshold To Be Drunk",
		options =
		{
			{description = "Just A Sip", data = 0},
			{description = "3 Cups", data = 3},
			{description = "1 Bottles", data = 5},
			{description = "2 Bottles", data = 10},
			{description = "3 Bottles", data = 15},
			{description = "4 Bottles", data = 20},
			{description = "5 Bottles", data = 25},
			{description = "6 Bottles", data = 30},
		},
		default = 5
	},
	{
		name = "capacity_time",
		label = "Intoxication Decreasing Rate",
		options =
		{
			{description = "Slower", data = .75},
			{description = "Slow", data = .625},
			{description = "Default", data = .5},
			{description = "Fast", data = .25},
			{description = "Faster", data = .125},
		},
		default = .5
	},
	SEPARATOR,
	Title("Drink O.B.E. Effect"),
	{
		name = "ghost_time",
		label = "Duration",
		options =
		{
			{description = "Shorter", data = .0625},
			{description = "Short", data = .125},
			{description = "Default", data = .25},
			{description = "Long", data = .5},
			{description = "Longer", data = 1},
		},
		default = .25
	},
	SEPARATOR,
	Title("Drink Butterhunter Effect"),
	{
		name = "butterhunter_time",
		label = "Duration",
		options =
		{
			{description = "Shorter", data = .0625},
			{description = "Short", data = .125},
			{description = "Default", data = .25},
			{description = "Long", data = .5},
			{description = "Longer", data = 1},
		},
		default = .25
	},
}
