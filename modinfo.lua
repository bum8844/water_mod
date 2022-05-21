name 						= "Don't Starve: Dehydrated"
version 					= "1.00"

description = (
	"TODO"
	)
forumthread = ""
author 						= ""
forumthread 				= ""
api_version 				= 10
priority 					= 0.807363154 
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
		name = "enable_thirst",
		label = "Thirst Status",
		options =
		{
			{description = "Enable", data = 0},
			{description = "Disable", data = 1},
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
			{description = "VeryShort", data = 15},
			{description = "Short", data = 30},
			{description = "Default", data = 60},
			{description = "Long", data = 75},
			{description = "VeryLong", data = 90},
			--{description = "Random", data = _G.math.random(0, 90)},
		},
		default = 60
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
			{description = "VeryShort", data = 15},
			{description = "Short", data = 30},
			{description = "Default", data = 60},
			{description = "Long", data = 75},
			{description = "VeryLong", data = 90},
			--{description = "Random", data = "random"},
		},
		default = 60
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
			{description = "VeryShort", data = 120},
			{description = "Short", data = 240},
			{description = "Default", data = 480},
			{description = "Long", data = 600},
			{description = "VeryLong", data = 720},
		},
		default = 480
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
			{description = "yes", data = 0},
			{description = "no", data = 1},
		},
		default = 0
	},
	{
		name = "alcohol_time",
		label = "Intoxication Time",
		options =
		{
			{description = "VeryShort", data = 60},
			{description = "Short", data = 120},
			{description = "Default", data = 240},
			{description = "Long", data = 300},
			{description = "VeryLong", data = 360},
		},
		default = 240
	},
	{
		name = "immune_time",
		label = "Less Pain Time",
		options =
		{
			{description = "VeryShort", data = 60},
			{description = "Short", data = 120},
			{description = "Default", data = 240},
			{description = "Long", data = 300},
			{description = "VeryLong", data = 360},
		},
		default = 240
	},
	SEPARATOR,
	Title("Drink O.B.E. Effect"),
	SEPARATOR,
	{
		name = "ghost_time",
		label = "Time",
		options =
		{
			{description = "VeryShort", data = 10},
			{description = "Short", data = 20},
			{description = "Default", data = 40},
			{description = "Long", data = 50},
			{description = "VeryLong", data = 60},
		},
		default = 40
	},
}
