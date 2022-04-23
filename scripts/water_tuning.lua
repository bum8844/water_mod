local TUNING = _G.TUNING
local hydration_per_day = 75
local wilson_thirst = GetModConfigData("thirst_max")
local seg_time = 30
local total_day_time = seg_time*16

-- 물을 담을수 있는 최대치
local tuning =
{
	HYDRATIONTYPE = {
			ROT = {
				"spoiled_food",
				"rottenegg",
				"spoiled_fish",
				"spoiled_fish_small",
			},
			--HYDRATION_SUPERTINY
			SUPERTINY = {
				"seaweed",
				"seaweed _cooked",
				"kelp",
				"kelp_cooked",
				"batwing",
				"batwing_cooked",
				"drumstick",
				"drumstick_cooked",
				"froglegs",
				"froglegs_cooked",
				"eel",
				"eel_cooked",
				"fish",
				"fish_cooked",
				"trunk_cooked",
				"plantmeat",
				"plantmeat_cooked",
				"meat",
				"cookedmeat",
				"monstermeat",
				"cookedmonstermeat",
				"kyno_humanmeat",
				"kyno_humanmeat_cooked",
				"humanmeat",
				"humanmeat_cooked",
				"smallmeat",
				"cookedsmallmeat",
				"batnose",
				"batnose_cooked",
				"fishmeat_small",
				"fishmeat_small_cooked",
				"fish_med",
				"fish_med_cooked",
				"fish_raw",
				"fishmeat",
				"fishmeat_cooked",
				"dead_swordfish",
				"fish3",
				"fish3_cooked",
				"fish4",
				"fish4_cooked",
				"fish5",
				"fish5_cooked",
				"roe",
				"roe_cooked",
				"shark_fin",
				"tropical_fish",
				"venus_stalk",
				"jellyfish_dead",
				"jellyfish_dead_cooked",
				"rainbowjellyfish_dead",
				"rainbowjellyfish_dead_cooked",
				"kyno_limpets",
				"kyno_limpets_cooked",
				"limpets",
				"limpets_cooked",
				"kyno_mussel",
				"kyno_mussel_cooked",
				"mussel",
				"mussel_cooked",
				"lobster_dead",
				"lobster_dead_cooked",
				"oceanfish_small_1",
				"oceanfish_small_2",
				"oceanfish_small_3",
				"oceanfish_small_4",
				"oceanfish_small_6",
				"oceanfish_small_7",
				"oceanfish_small_8",
				"oceanfish_small_9",
				"oceanfish_medium_1",
				"oceanfish_medium_2",
				"oceanfish_medium_3",
				"oceanfish_medium_4",
				"oceanfish_medium_6",
				"oceanfish_medium_7",
				"oceanfish_medium_8",
				"oceanfish_medium_9",
				"barnacle",
				"barnacle_cooked",
				"butter",
			},
			--HYDRATION_SMALLTINY
			TINY = {
				"pondeel",
				"pondfish",
				"trunk_summer",
				"trunk_winter",
				"minotaurhorn",
				"berries",
				"berries_cooked",
				"coconut_cooked",
				"carrot",
				"carrot_cooked",
				"mandrake",
				"cookedmandrake",
				"potato",
				"potato_cooked",
				"sweetpotato",
				"sweetpotato_cooked",
				"kyno_sweetpotato",
				"kyno_sweetpotato_cooked",
				"onion",
				"onion_cooked",
				"red_cap",
				"red_cap_cooked",
				"blue_cap",
				"blue_cap_cooked",
				"green_cap",
				"green_cap_cooked",
				"moon_cap",
				"moon_cap_cooked",
				"moon_tree_blossom",
				"petals",
				"petals_evil",
				"cactus_flower",
				"kyno_lotus_flower",
				"kyno_lotus_flower_cooked",
				"lotus_flower",
				"lotus_flower_cooked",
				"foliage",
				"cutlichen",
				"kyno_syrup",
				"honey",
				"royal_jelly",
			},
			--HYDRATION_TINY
			SMALL = {
				"deerclops_eyeball",
				"dragoonheart",
				"tigereye",
				"butterflywings",
				"moonbutterflywings",
				"bird_egg",
				"bird_egg_cooked",
				"tallbirdegg",
				"tallbirdegg_cooked",
				"doydoyegg",
				"doydoyegg_cooked",
				"corn",
				"oceanfish_small_5",
				"oceanfish_medium_5",
				"kyno_radish",
				"kyno_radish_cooked",
				"radish",
				"radish_cooked",
				"eggplant",
				"eggplant_cooked",
				"pumpkin",
				"pumpkin_cooked",
				"tomato",
				"tomato_cooked",
				"watermelon_cooked",
				"berries_juicy",
				"berries_juicy_cooked",
				"fig",
				"fig_cooked",
				"rock_avocado_fruit_ripe",
				"rock_avocado_fruit_ripe_cooked",
				"rawmilk",
				"fishyogurt",
				"cheesecake",
			},
			--HYDRATION_SMALL
			MEDSMALL = {
				"cave_banana",
				"cave_banana_cooked",
				"dragonfruit",
				"dragonfruit_cooked",
				"durian",
				"durian_cooked",
				"pomegranate",
				"pomegranate_cooked",
				"watermelon",
				"cactus_meat",
				"cactus_meat_cooked",
				"kyno_aloe",
				"kyno_aloe_cooked",
				"aloe",
				"aloe_cooked",
				"wormlight_lesser",
				"ice",
			},
			--HYDRATION_MEDSMALL
			MED = {
				"coconut_halved",
				"lightbulb",
				"succulent_picked",
				"wormlight",
				"goatmilk",
				"beefalo_milk",
				"milkywhites",
			},
			--HYDRATION_MED
			LARGE = {
				"icecream",
				"fishyogurt",
				"berryshake",
			},

	},

	CLEANSOURCE =
	{
		"oasislake",
		"hotspring",
	},

	CHILDPLAYEY =
	{
		"wendy",
		"walter",
		"wurt",
		"webber",
	},

	CUP_MAX_LEVEL = 1,
	BOTTLE_MAX_LEVEL = 10,
	BUCKET_MAX_LEVEL = 20,
	BUcKET_DRINK_WAT = 10,

	CAMP_KETTLE_MAX_LEVEL = 1,
	KETTLE_MAX_LEVEL = 5,
	BARREL_MAX_LEVEL = 100,
	BREWERY_MAX_LEVEL = 20,
	DESALINATOR_MAX_LEVEL = 20,

	-- 기초 목마름
	WILSON_THIRST = wilson_thirst, --수분량
	WILSON_HUNGER_RATE = hydration_per_day/total_day_time,

	-- 목마름 채워주는 양
	HYDRATION_SALT = hydration_per_day-90, -- 소금물
	HYDRATION_POISOE = hydration_per_day-80, -- 잘못 양조된 음료
	HYDRATION_ROT = hydration_per_day-85, -- 썩은 음식물
	HYDRATION_NONE = 0, -- 수상한 히비스커스
	HYDRATION_SUPERTINY = hydration_per_day/15,
	HYDRATION_SMALLTINY = hydration_per_day/12,
	HYDRATION_TINY = hydration_per_day/8, -- 물, 잘못된 조리법(주전자) 
	HYDRATION_SMALL = hydration_per_day/6, -- 술, 커피
	HYDRATION_MEDSMALL = hydration_per_day/4, -- 과일차(섞인것), 채소차(섞인것), 꽃차(섞인것)
	HYDRATION_MED = hydration_per_day/3, -- 찾잎이나 이름이 지정된 꽃차
	HYDRATION_LARGE = hydration_per_day/2, -- 이름이 따로 지정된 과일, 채소차, 소다, 과일 소다
	HYDRATION_HUGE = hydration_per_day, -- 특수효과 주는 차, 사이다
	HYDRATION_SUPERHUGE = hydration_per_day*2, -- 콜라(퀀텀은 OP)

	-- 목마름이 채워주는 배고픔 양
	DRINK_CALORIES_POISOE = 3,
	DRINK_CALORIES = 5,

	--알콜 부작용
	STRANG_POISOE = -2,
	ALCAHOL_POISOE = -5,
	SANITY_POISOE = -5,

	--만드는 시간(온도 조절은 특수 효과가 아님)
	INCORRECT_BOIL = 4,
	DESALINATION_TIEM = 8,
	KETTLE_WATER = 4, -- 물
	KETTLE_TEA = 10, -- 녹차, 홍차, 보이
	KETTLE_FRUIT = 11, -- 모든 과일 종류
	KETTLE_VEGGIE = 12, -- 모든 야채 종류
	KETTLE_DECORATION = 13, -- 꽃 종류
	KETTLE_LUXURY_GOODS = 25, -- 특수 효과주는 차들
	KETTLE_ABI = 27, -- 수상한 히비스커스
	BEER_WAIT = GetModConfigData("beer_wait"),
	SODA_WAIT = GetModConfigData("soda_wait"),

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


--[[KETTLE_SAVECFG = GetModConfigData("kettle_save")

local language_cfg = GetModConfigData("language_cfg")
AW_THIRST = GetModConfigData("aw_thirst")]]--