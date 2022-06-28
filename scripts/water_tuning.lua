local TUNING = _G.TUNING
local hydration_per_day = 75
local wilson_thirst = GetModConfigData("thirst_max")
local seg_time = 30
local total_day_time = seg_time*16

-- 물을 담을수 있는 최대치
local tuning =
{
	CLEANSOURCE =
	{
		"oasislake",
		"hotspring",
	},

	FIXFUELSMALL = {
		"cutgrass",
		"twigs",
		"pinecone",
		"firenettles",
	},

	FIXFUELTINY = {
		"foliage",
		"forgetmelots",
		"petals",
		"petals_evil",
		"moon_cap_cooked",
		"green_cap_cooked",
		"red_cap_cooked",
		"blue_cap_cooked",
		"tillweed",
	},

	FIXYOTB = {
		"yotb_beefalo_doll_war",
		"yotb_beefalo_doll_doll",
		"yotb_beefalo_doll_festive",
		"yotb_beefalo_doll_nature",
		"yotb_beefalo_doll_robot",
		"yotb_beefalo_doll_ice",
		"yotb_beefalo_doll_formal",
		"yotb_beefalo_doll_victorian",
		"yotb_beefalo_doll_beast",
		"yotb_pattern_fragment_1",
		"yotb_pattern_fragment_2",
		"yotb_pattern_fragment_3",
	},

	CHILDS =
	{
		"wendy",
		"walter",
		"wurt",
		"webber",
	},

	-- Maximum Amount of Water
	CUP_MAX_LEVEL = 10,
	BOTTLE_MAX_LEVEL = 100,
	BUCKET_MAX_LEVEL = 200,
	CAMP_KETTLE_MAX_LEVEL = 1,
	KETTLE_MAX_LEVEL = 50,
	BARREL_MAX_LEVEL = 3600,
	BREWERY_MAX_LEVEL = 200,
	DESALINATOR_MAX_LEVEL = 200,

	-- Sections
	BREWERY_SECTIONS = 20,

	-- Ice Bucket
	BUCKET_ICE_MINETEMP = -40,
	BUCKET_ICE_MAXTEMP = 5,
	ICE_STARTING_TEMP = 0,

	BUCKET_FULL_MINETEMP = 0,
	BUCKET_FULL_MAXTEMP = 40,
	WATER_STARTING_TEMP = 25,
	
	-- Moistures and getting wet
	BUCKET_DRINK_WET = 10,
	WATER_BARREL_WETNESS = 0.25,
	WATER_BARREL_EXTINGUISH_HEAT_PERCENT = -1,
	WATER_BARREL_TEMP_REDUCTION = 5,
	WATER_BARREL_PROTECTION_TIME = 30,
	WATER_BARREL_DIST = 15,

	-- Waterlevel
	WATERLEVEL_PER_SIP = 10,

	-- Basic Thirst Rate
	WILSON_THIRST = wilson_thirst, --Max Thirst
	WILSON_HUNGER_RATE = hydration_per_day/total_day_time,

	-- Hydration
	HYDRATION_SALT = hydration_per_day-90, -- Saltwater
	HYDRATION_POISON = hydration_per_day-80, -- Failed Fermentation
	HYDRATION_ROT = hydration_per_day-85, -- Rotten
	HYDRATION_NONE = 0, -- Suspicious Hibiscus
	HYDRATION_TINYMICROSCOPIC = hydration_per_day/24,
	HYDRATION_SUPERTINY = hydration_per_day/16,
	HYDRATION_TINY = hydration_per_day/12,
	HYDRATION_SMALLTINY = hydration_per_day/8, -- Normal Water, Failed Cooking
	HYDRATION_SMALL = hydration_per_day/6, -- Alcohols and Coffee
	HYDRATION_MEDSMALL = hydration_per_day/4, -- Mixed Beverage
	HYDRATION_MED = hydration_per_day/3, -- Tea and Florals
	HYDRATION_LARGE = hydration_per_day/2, -- Drinks made of specific ingredient(i.e. Dragonfruit Juice)
	HYDRATION_HUGE = hydration_per_day, -- Drinks with Special Effect, Lemon & Lime Soda
	HYDRATION_SUPERHUGE = hydration_per_day*2, -- Cola

	-- Hunger from Drinks
	DRINK_CALORIES_POISON = 3,
	DRINK_CALORIES = 5,

	-- Alcohol side-effects
	ALCOHOL_POISON = -5,
	SANITY_POISON = -5,

	--Cooking Time
	INCORRECT_BOIL = .25,
	DESALINATION_TIME = 1,
	KETTLE_WATER = .3, -- Boiling Water
	KETTLE_TEA = .5, -- Teas
	KETTLE_FRUIT = .8, -- Fruit Beverage
	KETTLE_VEGGIE = .8, -- Veggie Beverage
	KETTLE_DECORATION = .85, -- Floral Infusions
	KETTLE_LUXURY_GOODS = 1, -- Drinks with special effects (except temperature)
	KETTLE_ABI = .85, -- Suspicious Hibiscus
	BEER_WAIT = GetModConfigData("beer_wait"), --Alcoholic Ferments
	SODA_WAIT = GetModConfigData("soda_wait"), --Non-Alcoholic Ferments

	TEA_TREE_REGROWTH_TIME_MULT = 1,
	CAFFEINBERRY_REGROWTH_TIME_MULT = 1,

	CAFFEIN_TIME = GetModConfigData("caffein_time"),
	CAFFEIN_SPEED = GetModConfigData("caffein_speed"),
	TEASLEEP_TIME = GetModConfigData("sleeping_time"),
	INTOXICATION_TIME = GetModConfigData("alcohol_time"),
	IMMUNE_TIME = GetModConfigData("immune_time"),
	GHOST_TIME = GetModConfigData("ghost_time"),
}

for i,v in pairs(tuning) do
	TUNING[i] = v
end

local WATERTYPE =
{
	GENERIC = "GENERIC",
	CLEAN = "CLEAN",
	DIRTY = "DIRTY",
	SALTY = "SALTY",
	DRINK = "DRINK",
	ROTTEN = "ROTTEN",
}

local WATERGROUP =
{
	OMNI =
	{
		name = "OMNI",
		types =
		{
			WATERTYPE.GENERIC,
			WATERTYPE.CLEAN,
			WATERTYPE.DIRTY,
			WATERTYPE.SALTY,
			WATERTYPE.DRINK,
			WATERTYPE.ROTTEN,
		}
	},

	RAW =
	{
		name = "RAW",
		types =
		{
			WATERTYPE.DIRTY,
			WATERTYPE.SALTY,
			WATERTYPE.ROTTEN,
		},
	},

	DRINKABLE =
	{
		name = "DRINKABLE",
		types =
		{
			WATERTYPE.GENERIC,
			WATERTYPE.CLEAN,
			WATERTYPE.DRINK,
		},
	},

	BOILABLE = 
	{
		name = "BOILABLE",
		types = {
			WATERTYPE.CLEAN,
			WATERTYPE.DIRTY,
		},
	},
}

_G.WATERTYPE = WATERTYPE
_G.WATERGROUP = WATERGROUP
