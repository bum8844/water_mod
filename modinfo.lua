name 						= "a water mod - Heap of Foods Expansion"
version 					= "0.70"

russian = name.utf8len and (russian or language == "ru")
description = (
	russian
	
	and "Мод добавляет множество новых вещей и структур, а так же изменения в генерации мира!".."\nВерсия "..version
	
	or "Mod adds lots of new items, structures, and also new changes in world generation!".."\nVercion "..version
	)
forumthread = ""
author 						= "Filigrani, Cunning fox(patch by bum0303)"
forumthread 				= ""
api_version 				= 10
priority 					= 0.807363154 --id мода. Чтоб не повторяться
dont_starve_compatible 		= false
reign_of_giants_compatible 	= false
shipwrecked_compatible 		= false
dst_compatible 				= true

all_clients_require_mod 	= true 

icon_atlas 					= "preview.xml"
icon 						= "preview.tex"

server_filter_tags = {"a_water"}

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
			{description = "none", data = 0},
			{description = "Less", data = 0.7},
			{description = "Medium", data = 1.2},
			{description = "More", data = 1.7},
		},
		default = 1.2,
	},
	SEPARATOR,
	{
		name = "gen_caffeinberry",
		label = "Generate Caffeinberry?",
		options =
		{
			{description = "none", data = 0},
			{description = "Less", data = 0.7},
			{description = "Medium", data = 1.2},
			{description = "More", data = 1.7},
		},
		default = 1.2,
	},
	--[[SEPARATOR,
	Title(russian and "Настройки рецептов" or "Recipes options"),
	{
		name = "craft_bag",
		label = russian and "Можно крафтить мешок?" or "Can craft Bag with herbs?",
		options =
		{
			{description = russian and "Не-а" or "Nope", data = 0},
			{description = russian and "Ага" or "Yep", data = 1},
		},
		default = 1,
	},]]--
	--[[SEPARATOR,
	Title(russian and "Настройки жажды" or "Thirst options"),
	{
		name = "aw_thirst",
		label = russian and "Жажда" or "Thirst",
		options =
		{
			{description = russian and "Не-а" or "Nope", data = 0},
			{description = russian and "Ага" or "Yep", data = 1},
		},
		default = 1,
	},]]--
	
	--[[{
		name = "aw_thirst_max",
		label = russian and "Макс.Жажды" or "Max Thirst",
		options =
		{
		    {description = "70", data = 70},
		    {description = "100", data = 100},
			{description = "150", data = 150},
			{description = "200", data = 200},
			{description = "250", data = 250},
		},
		default = 150,
	},]]--
	--[[{
		name = "beer_wait",
		label = russian and "Время готовки пива" or "Beer cooking time",
		options =
		{
			{description = russian and "15 минут" or "15 minuts", data = 15},
			{description = russian and "30 минут" or "30 minuts", data = 30},
			{description = russian and "40 минут" or "40 minuts", data = 40},
			{description = russian and "50 минут" or "50 minuts", data = 50},
		},
		default = 30,
    },]]--
	
	--[[{
		name = "waterwell_wait",
		label = russian and "Откат колодца" or "Well cooldown",
		options =
		{
			{description = russian and "30 секунд" or "30 second", data = 30},
			{description = russian and "1 минута" or "1 minute", data = 60},
			{description = russian and "2 минуты" or "2 minute", data = 120},
			{description = russian and "3 минуты" or "3 minuts", data = 180},
		    {description = russian and "4 минуты" or "4 minuts", data = 240},
		},
		default = 120,
    },]]--
}
