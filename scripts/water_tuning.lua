require("tuning")

-- GameDifficultyControl
TUNING.DIFFICULTY = GetModConfigData("difficulty")
local thirst_decrease_speed = GameDifficultyControl("thirst_decrease_speed") or GetModConfigData("thirst_decrease_speed")
local enable_waterborne = GameDifficultyControl("enable_waterborne") and ( GameDifficultyControl("enable_waterborne") > 0 and true or false ) or -1

local TUNING = _G.TUNING
local wilson_thirst = GameDifficultyControl("thirst_max") or GetModConfigData("thirst_max")
local thirst_decrease = wilson_thirst*thirst_decrease_speed
local hydration_per_day = wilson_thirst * 0.6
local bucket_max_level = 10
local caffein_time = GetModConfigData("caffein_time")
local alcohol_time = GetModConfigData("alcohol_time")
local capacity_time = GetModConfigData("capacity_time")
local immune_time = GetModConfigData("immune_time")
local resistance_time = GetModConfigData("resistance_time")
local ghost_time = GetModConfigData("ghost_time")
local drunkard_time = GetModConfigData("drunkard_time")
local waterborne_time = GetModConfigData("waterborne_time")
local butterhunter_time = GetModConfigData("butterhunter_time")
local satiety_time = GetModConfigData("satiety_time")

table.insert(TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.WARLY,"portable_tea_pot_item")
table.insert(TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.WARLY,"portablekettle_item")
<<<<<<< HEAD:scripts/tuning.lua
TUNING.WX78_CHARGING_FOODS["areuhi"] = 1
TUNING.WX78_CHARGING_FOODS["kumis"] = 1
=======
table.insert(TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.WINONA,"acid_battery")
table.insert(TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.WINONA,"acid_battery")
TUNING.WX78_CHARGING_FOODS["areuhi"] = 1
TUNING.WX78_CHARGING_FOODS["kumis"] = 1
TUNING.WX78_CHARGING_FOODS["water_acid"] = 1
TUNING.WX78_CHARGING_FOODS["acid_battery"] = 24
TUNING.GOLD_VALUES.WINE_CELLAR_PART = 12
>>>>>>> Beta_1.2.8:scripts/water_tuning.lua

-- 물을 담을수 있는 최대치
water_tuning =
{
	TYPES_CLEAN = {
		"oasislake",
		"cherry_pond",
	},

	TYPES_SALTY = {
		"quagmire_pond_salt",
		"kyno_pond_salt",
		"icefishing_hole",
	},

	TYPES_DIRTY = {
		"pond",
		"pond_cave",
		"tidalpool",
		"tidalpoolnew",
	},

<<<<<<< HEAD:scripts/tuning.lua
	TYPES_MINERAL = {
		"hotspring",
=======
	TYPES_VARY_DIRTY = {
		"pond_mos",
	},

	TYPES_MINERAL = {
		"hotspring",
	},

	TYPES_UNCLEAN_MINERAL = {
>>>>>>> Beta_1.2.8:scripts/water_tuning.lua
		"grotto_pool_big",
		"grotto_pool_small",
	},

	CHILDS =
	{
		"wendy",
		"walter",
		"wurt",
		"webber",
		"wirlywings",
	},

	WATERBORNE_IMMUNES = 
	{
		"wormwood",
		"wx78",
		"wurt",
		"webber",
		"wonderwhy",
	},

	SPOILED_DRINK_NUTRIENTS = {  12,  12,  12 },

	SPOILEDFOOD_FERTILIZE = 12,
	SPOILEDFOOD_SOILCYCLES = 12,
 	SPOILEDFOOD_WITHEREDCYCLES = 12,

	-- Maximum Amount of Water
	CUP_MAX_LEVEL = 1,
	WATERINGCAN_PER_WATER = 2,
	BUCKET_MAX_LEVEL = bucket_max_level*10,
	BUCKET_LEVEL_PER_USE = bucket_max_level,

	STEEL_BUCKET_MULT = 8,
	DRIFWOOD_BUCKET_MULT = 4,
	WOODIE_BUCKET_MULT = 0.5,

<<<<<<< HEAD:scripts/tuning.lua
	CAMPKETTLE_MAX_LEVEL = 3,
	KETTLE_MAX_LEVEL = bucket_max_level*.5,
	BARREL_MAX_LEVEL = bucket_max_level*36,
=======
	CAMPKETTLE_MAX_LEVEL = bucket_max_level*.3,
	TEA_POT_MAX_LEVEL = bucket_max_level*.1,
	KETTLE_MAX_LEVEL = bucket_max_level*.8,
	WATER_BARREL_MAX_LEVEL = bucket_max_level*36,
>>>>>>> Beta_1.2.8:scripts/water_tuning.lua
	BREWERY_MAX_LEVEL = bucket_max_level*6,
	DESALINATOR_MAX_LEVEL = bucket_max_level*2,

	-- Wateryprotection
	BUCKET_EXTINGUISH_HEAT_PERCENT = -1,
    BUCKET_TEMP_REDUCTION = 10,
    BUCKET_PROTECTION_TIME = 45,
	BUCKET_PROTECTION_DIST = 3,
    BUCKET_WATER_AMOUNT = 25,

	-- Sections
	BREWERY_SECTIONS = 20,
	REDUCE_BREWERY = 3,
	REDUCE_DISTILL = .25,

	-- Freezing & Thawing Water
	WATER_MINTEMP = -10,
	WATER_MAXTEMP = 70, --기본값을 사용
	WATER_CLEAN_MINTEMP = 2,
	WATER_DIRTY_MINTEMP = -2,
	
	WATER_FROZEN_MINTEMP = -10, --기본값을 사용
	WATER_INITTEMP = 5,
	WATER_FROZEN_INITTEMP = -5,
	WATER_CLEAN_FREEZEPOINT = -2,
	WATER_CLEAN_MELTINGPOINT = 5,
	WATER_DIRTY_FREEZEPOINT = -2,
	WATER_DIRTY_MELTINGPOINT = 5,
	
	-- Moistures and getting wet
	WATER_BARREL_WETNESS = bucket_max_level*3.6,
	TEA_POT_WETNESS = bucket_max_level*.01,
	KETTLE_WETNESS = bucket_max_level*.08,
	BREWERY_WETNESS = bucket_max_level*.6,
	DESALINATOR_WETNESS = bucket_max_level*.2,
	
	WATER_BARREL_EXTINGUISH_HEAT_PERCENT = -1,
	WATER_BARREL_TEMP_REDUCTION = 5,
	WATER_BARREL_PROTECTION_TIME = 30,
	WATER_BARREL_DIST = 15,

	WATER_BARREL_EXTINGUISH_HEAT_PERCENT = -1,
	WATER_BARREL_TEMP_REDUCTION = 5,
	WATER_BARREL_PROTECTION_TIME = 30,
	WATER_BARREL_DIST = 15,

	-- Waterlevel
	WATERLEVEL_PER_SIP = 10,

	-- Waterspoilage
	BARREL_FRESHENING_RATE = .5,
	BREWERY_FRESHENING_RATE = 0,

	-- Basic Thirst Rate
	WILSON_THIRST = wilson_thirst,
	WILSON_THIRST_RATE = thirst_decrease/TUNING.TOTAL_DAY_TIME, 

	STALE_FOOD_THIRST = .5,
	SPOILED_FOOD_THIRST = .25,

	WICKERBOTTOM_STALE_FOOD_THIRST = .25,
	WICKERBOTTOM_SPOILED_FOOD_THIRST = 0,

	-- Hydration(기준값:90)
	HYDRATION_SALT = -15,   
	HYDRATION_POISON = -5,
	HYDRATION_ROT = -10,
	HYDRATION_NONE = 0,
	HYDRATION_SUPERTINYMICROSCOPIC = hydration_per_day/64, -- 1.40625
	HYDRATION_TINYMICROSCOPIC = hydration_per_day/24, -- 3.75
	HYDRATION_SUPERTINY = hydration_per_day/16, -- 5.625
	HYDRATION_TINY = hydration_per_day/12, -- 7.5
	HYDRATION_SMALLTINY = hydration_per_day/8, -- 11.25 -- 일반물
	HYDRATION_SMALL = hydration_per_day/6, -- 15
	HYDRATION_MEDSMALL = hydration_per_day/4, -- 22.5
	HYDRATION_MED = hydration_per_day/3, -- 30
	HYDRATION_LARGE = hydration_per_day/2, -- 45
	HYDRATION_HUGE = hydration_per_day, -- 90
	HYDRATION_MOREHUGE = hydration_per_day*8/6, -- 120
	HYDRATION_SUPERHUGE = hydration_per_day*2, -- 180

	-- Hunger from Drinks
	DRINK_CALORIES_POISON = 3, --제 개인적인 생각으로는 술은 칼로리가 높아서 안써도 된다고 생각...
	DRINK_CALORIES = 5,

	-- Alcohol side-effects
	ALCOHOL_POISON = -5,
	SANITY_POISON = -5,

	-- sleep dodlet tick
	SLEEP_THIRST_PER_TICK = -1,

	-- alet
	THIRST_THRESH = .333,

	--Cooking Time
	INCORRECT_BOIL = .25,
	DESALINATION_TIME = 1,
	KETTLE_WATER = .3, -- Boiling Water
	KETTLE_TEA = .5, -- Teas
	KETTLE_FRUIT = 1.25, -- Fruit Beverage
	KETTLE_VEGGIE = 1, -- Veggie Beverage
	KETTLE_DECORATION = .8, -- Floral Infusions
	KETTLE_LUXURY_GOODS = 1.5, -- Drinks with special effects (except temperature)
	KETTLE_ABI = .85, -- Suspicious Hibiscus
	BEER_WAIT = GetModConfigData("beer_wait"), --Alcoholic Ferments
	SODA_WAIT = GetModConfigData("soda_wait"), --Non-Alcoholic Ferments

	TEA_TREE_REGROWTH_TIME_MULT = 1,
	CAFFEINBERRY_REGROWTH_TIME_MULT = 1,
	RUINCACAO_TREE_TIME_MULT = 1,

	CAFFEIN_TIME = TUNING.TOTAL_DAY_TIME*caffein_time,
	CAFFEIN_SPEED = GetModConfigData("caffein_speed"),
	TEASLEEP_TIME = GetModConfigData("sleeping_time"),
	INTOXICATION_TIME = TUNING.TOTAL_DAY_TIME*alcohol_time,
	MAX_CPACITY = GameDifficultyControl("max_capacity") or GetModConfigData("max_capacity"),
	CAPACITY_TIME = TUNING.TOTAL_DAY_TIME*capacity_time,
	ALCOHOL_CAPACITY = 1,
	SPIRITS_CAPACITY = 3,
	CHILDS_SAFE = GetModConfigData("child_safety"),
	IMMUNE_TIME = TUNING.TOTAL_DAY_TIME*immune_time,
	RESISTANCE_TIME = TUNING.TOTAL_DAY_TIME*resistance_time,
	GHOST_TIME = TUNING.TOTAL_DAY_TIME*ghost_time,
	DRUNKARD_DURATION = TUNING.TOTAL_DAY_TIME*drunkard_time,
	DETOX_DURATION = (TUNING.TOTAL_DAY_TIME*drunkard_time)*.5,
<<<<<<< HEAD:scripts/tuning.lua
	ENABLE_WATERBORNE = GetModConfigData("enable_waterborne"),
=======
	ENABLE_WATERBORNE = enable_waterborne ~= -1 and enable_waterborne or GetModConfigData("enable_waterborne"),
>>>>>>> Beta_1.2.8:scripts/water_tuning.lua
	WATERBORNE_DURATION = TUNING.TOTAL_DAY_TIME*waterborne_time,
	SATIETY_DURATION = TUNING.TOTAL_DAY_TIME*satiety_time,
	WATERBORNE_IMMUNES_CHANCE = .65,
	BUTTERHUNTER_DURATION = TUNING.TOTAL_DAY_TIME*butterhunter_time,
	WELL_DRILLING_DURATION = TUNING.SEG_TIME*2.5,
	WELL_DRILL_USES = 20,
	WINE_CELLAR_PRESERVER_RATE = 0,

	--well sprinkler
	SPRINKLER_MAX_FUEL_TIME = TUNING.TOTAL_DAY_TIME,
	MOISTURE_SPRINKLER_PERCENT_INCREASE_PER_SPRAY = 0.5,
	FIND_WATER_RANGE = 20,
	SPRINKLER_RANGE = 15,
	SPRINKLER_PLACER_SCALE = 1.55,

	DRUNKARD_SANITY_DELTA = -1,
	DRUNKARD_TICK_RATE = 2,
	WATERBORNE_TICK_RATE = 4,

	WATER_RECIPCARD_CHANCE = 0.25,

	ADD_TEA_TREE = GetModConfigData("gen_tea_tree"),
	ADD_CAFFEINBERRY_BUSH = GetModConfigData("gen_caffeinberry"),
	ADD_RUINCACAO_TREE = GetModConfigData("gen_ruincacao_tree"),

	IS_ENABLE_THIRST = GetModConfigData("enable_thirst"),
	THIRST_GAIN = (hydration_per_day/TUNING.TOTAL_DAY_TIME)*2,
	WURT_THIRST_RATE_MODIFIER = 1.25,

	CAFFEINBERRY_REGROW_TIME = TUNING.TOTAL_DAY_TIME*10,
    CAFFEINBERRY_REGROW_INCREASE = TUNING.TOTAL_DAY_TIME*.5,
    CAFFEINBERRY_REGROW_VARIANCE = TUNING.TOTAL_DAY_TIME*2,
    CAFFEINBERRY_CYCLES = 6,

	TEA_TREE_SPROUT_GROWTIME = 6*TUNING.DAY_TIME_DEFAULT,
	TEA_TREE_REGROW =
	{
		EMPTY = { BASE = 2*TUNING.DAY_TIME_DEFAULT, VAR = 2*TUNING.SEG_TIME },
		PREPICK = { BASE = 6*TUNING.SEG_TIME, VAR = 2*TUNING.SEG_TIME },
		PICK = { BASE = 4*TUNING.DAY_TIME_DEFAULT, VAR = 2*TUNING.SEG_TIME },
		CRUMBLE = { BASE = 1*TUNING.DAY_TIME_DEFAULT, VAR = 2*TUNING.SEG_TIME },
	},

	TEA_TREE_PICKABLE_CYCLES = 4,

	RUINCACAO_TREE_SPROUT_GROWTIME = 8*TUNING.DAY_TIME_DEFAULT,
	RUINCACAO_TREE_REGROW =
	{
		EMPTY = { BASE = 2*TUNING.DAY_TIME_DEFAULT, VAR = 2*TUNING.SEG_TIME },
		PREPICK = { BASE = 6*TUNING.SEG_TIME, VAR = 2*TUNING.SEG_TIME },
		PICK = { BASE = 6*TUNING.DAY_TIME_DEFAULT, VAR = 2*TUNING.SEG_TIME },
		CRUMBLE = { BASE = 1*TUNING.DAY_TIME_DEFAULT, VAR = 2*TUNING.SEG_TIME },
	},

	RUINCACAO_TREE_PICKABLE_CYCLES = 2,

	RUINCACAO_LOOT =
    {
        ANGLE = 65,
        SPEED = -1.8,
        HEIGHT = 0.5,
        BEAN_CHANCE = 0.60,
        BUTTER_CHACE = 0.02,
        SEED_CHANCE = 0.01,
        MAX_SPAWNS = 10, -- NOTES(JBK): Deprecated, kept around for mods.
    },

    FREEZE_WATER = 
    {
        ANGLE = 65,
        SPEED = -1.8,
        HEIGHT = 0.5,   
        WETGOOP_CHANCE = 0.15,
        ICE_CHANCE = 0.40, 
        MAX_SPAWNS = 10, -- NOTES(JBK): Deprecated, kept around for mods.	
    },

<<<<<<< HEAD:scripts/tuning.lua
    SALT_VALUE = 10,
    DESALINATOR_MAX_SALT = 40,
    DESALINATOR_SALT_SECTION = 9,
    SALT_PER_WATER = 1/80,

	WINONA_WELL_SPRINKLER_POWER_LOAD_ON = 0.5,
	WINONA_WELL_SPRINKLER_POWER_LOAD_OFF = 0.05,
=======
    SLUDGE_VALUE = 10,
    DESALINATOR_MAX_SLUDGE = 40,
    DESALINATOR_SLUDGE_SECTION = 9,
    SLUDGE_PER_WATER = 1/40,

	WINONA_WELL_SPRINKLER_POWER_LOAD_ON = 0.5,
	WINONA_WELL_SPRINKLER_POWER_LOAD_OFF = 0.05,

	DEFAULT_LEFT_TO_DIRTY = GameDifficultyControl("left_to_dirty") or GetModConfigData("left_to_dirty"),

	PURIIFYING = 6,

	SMALLPOUCH_PRESERVER_RATE = 1,
	BIGPOUCH_PRESERVER_RATE = 1/3,
	SMALLTHERMOS_PRESERVER_RATE = 1/3,
	SMALLTHERMOS_PRESERVER_MULT = 10,
	BIGTHERMOS_PRESERVER_RATE = -3,

	WX78_OVERCHARGE_RUNSPEED_BONUS = .5,
	WX78_OVERCHARGE_LIGHT_RED = 3,
>>>>>>> Beta_1.2.8:scripts/water_tuning.lua
}

for i,v in pairs(water_tuning) do
	TUNING[i] = v
end
