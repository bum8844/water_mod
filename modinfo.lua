name 						= "Don't Starve: Dehydrated"
version 					= "Alpha 1.0.0"

description = (
	"The test build of DSD"
	)
forumthread = ""
author 						= ""
forumthread 				= ""
api_version 				= 10
priority 					= -10001
dont_starve_compatible 		= false
reign_of_giants_compatible 	= false
shipwrecked_compatible 		= false
dst_compatible 				= true

all_clients_require_mod 	= true 

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
		options =
		{
			{description = "Auto", data = false},
			{description = "English", data = "en"},
			{description = "한국어", data = "ko"},
		},
		default = false,
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
		label = "Decreasing Rate of Thirst",
		options =
		{
		    {description = "VerySlow", data = .2, hover = "30/day"},
		    {description = "Slow", data = .4, hover = "60/day"},
		    {description = "Same as Hunger", data = .5, hover = "75/day"},
			{description = "Default", data = .7, hover = "105/day"},
			{description = "Fast", data = .8, hover = "120/day"},
			{description = "VeryFast", data = 1, hover = "150/day"},
		},
		default = .7,
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
			{description = "VeryShort", data = .1875},
			{description = "Short", data = .375},
			{description = "Default", data = .75},
			{description = "Long", data = 1.5},
			{description = "VeryLong", data = 3},
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
			{description = "VeryShort", data = .1875},
			{description = "Short", data = .375},
			{description = "Default", data = .75},
			{description = "Long", data = 1.5},
			{description = "VeryLong", data = 3},
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
			{description = "VerySlow", data = 1.21},
			{description = "Slow", data = 1.42},
			{description = "Default", data = 1.83},
			{description = "Fast", data = 2.04},
			{description = "VeryFast", data = 2.25},
		},
		default = 1.83
	},
	{
		name = "caffein_time",
		label = "Duration",
		options = 
		{
			{description = "VeryShort", data = .5},
			{description = "Short", data = .7},
			{description = "Default", data = 1},
			{description = "Long", data = 2},
			{description = "VeryLong", data = 4},
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
			{description = "VeryShort", data = 3.75},
			{description = "Short", data = 7.5},
			{description = "Default", data = 15},
			{description = "Long", data = 18.75},
			{description = "VeryLong", data = 22.5},
		},
		default = 15
	},
	SEPARATOR,
	Title("Drink Alcohol Effect"),
	{
		name = "child_safety",
		label = "Child Protection",
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
			{description = "VeryShort", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "VeryLong", data = .75},
		},
		default = .5
	},
	{
		name = "drunkard_time",
		label = "Tipsiness Duration",
		options =
		{
			{description = "VeryShort", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "VeryLong", data = .75},
		},
		default = .5
	},
	{
		name = "immune_time",
		label = "Pain Relief Duration",
		options =
		{
			{description = "VeryShort", data = .125},
			{description = "Short", data = .25},
			{description = "Default", data = .5},
			{description = "Long", data = .625},
			{description = "VeryLong", data = .75},
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
			{description = "VerySlow", data = .75},
			{description = "Slow", data = .625},
			{description = "Default", data = .5},
			{description = "Fast", data = .25},
			{description = "VeryFast", data = .125},
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
			{description = "VeryShort", data = .0625},
			{description = "Short", data = .125},
			{description = "Default", data = .25},
			{description = "Long", data = .5},
			{description = "VeryLong", data = 1},
		},
		default = .25
	},
}
