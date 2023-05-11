name 						= "Don't Starve: Dehydrated"
version 					= "1.00"

description = (
	"TODO"
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
	SEPARATOR,
	Title("Generation options"),
	{
		name = "gen_tea_tree",
		label = "Generate tea trees?",
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
	{
		name = "gen_caffeinberry",
		label = "Generate Caffeinberry?",
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
		label = "Thirst Decrease Speed",
		options =
		{
		    {description = "VerySlow", data = .2, hover = "20%"},
		    {description = "Slow", data = .4, hover = "40%"},
		    {description = "Same", data = .5, hover = "50%"},
			{description = "Default", data = .7, hover = "70%"},
			{description = "Fast", data = .8, hover = "80%"},
			{description = "VeryFast", data = 1, hover = "100%"},
		},
		default = .7,
	},
	{
		name = "enable_thirst",
		label = "Thirst Status",
		options =
		{
			{description = "Enable", data = true},
			{description = "Disable", data = false},
		},
		default = 0
	},
	SEPARATOR,
	Title("Brewery options"),
	SEPARATOR,
	Title("Beer Ferment options"),
	{
		name = "beer_wait",
		label = "Extra Time",
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
	Title("Soda Ferment options"),
	SEPARATOR,
	{
		name = "soda_wait",
		label = "Extra Time",
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
	SEPARATOR,
	Title("Coffee Effect"),
	{
		name = "caffein_speed",
		label = "Speed",
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
		label = "Time",
		options = 
		{
			{description = "VeryShort", data = 0.5},
			{description = "Short", data = 0.7},
			{description = "Default", data = 1},
			{description = "Long", data = 2},
			{description = "VeryLong", data = 4},
		},
		default = 1
	},
	SEPARATOR,
	Title("Drink Sleep Effect"),
	SEPARATOR,
	{
		name = "sleeping_time",
		label = "Time",
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
	SEPARATOR,
	{
		name = "child_safety",
		label = "Child Protection",
		options =
		{
			{description = "yes", data = true},
			{description = "no", data = false},
		},
		default = 0
	},	
	{
		name = "alcohol_time",
		label = "Intoxication Time",
		options =
		{
			{description = "VeryShort", data = 0.125},
			{description = "Short", data = 0.25},
			{description = "Default", data = 0.5},
			{description = "Long", data = 0.625},
			{description = "VeryLong", data = 0.75},
		},
		default = 0.5
	},
	{
		name = "drunkard_time",
		label = "Drunkard Time",
		options =
		{
			{description = "VeryShort", data = 0.125},
			{description = "Short", data = 0.25},
			{description = "Default", data = 0.5},
			{description = "Long", data = 0.625},
			{description = "VeryLong", data = 0.75},
		},
		default = 0.5
	},
	{
		name = "immune_time",
		label = "Less Pain Time",
		options =
		{
			{description = "VeryShort", data = 0.125},
			{description = "Short", data = 0.25},
			{description = "Default", data = 0.5},
			{description = "Long", data = 0.625},
			{description = "VeryLong", data = 0.75},
		},
		default = 0.5
	},
	SEPARATOR,
	Title("Drink Alcohol Capacity"),
	SEPARATOR,
	{
		name = "max_capacity",
		label = "Set Get Drunked",
		options =
		{
			{description = "Always Drunked", data = 0},
			{description = "3 cup", data = 3},
			{description = "1 bottle", data = 5},
			{description = "2 bottle", data = 10},
			{description = "3 bottle", data = 15},
			{description = "4 bottle", data = 20},
			{description = "5 bottle", data = 25},
			{description = "6 bottle", data = 30},
		},
		default = 5
	},
	{
		name = "capacity_time",
		label = "Decrease Intoxication",
		options =
		{
			{description = "VeryShort", data = 0.125},
			{description = "Short", data = 0.25},
			{description = "Default", data = 0.5},
			{description = "Long", data = 0.625},
			{description = "VeryLong", data = 0.75},
		},
		default = 0.5
	},
	SEPARATOR,
	Title("Drink O.B.E. Effect"),
	SEPARATOR,
	{
		name = "ghost_time",
		label = "Time",
		options =
		{
			{description = "VeryShort", data = 0.0625},
			{description = "Short", data = 0.125},
			{description = "Default", data = 0.25},
			{description = "Long", data = 0.5},
			{description = "VeryLong", data = 1},
		},
		default = 0.25
	},
}
