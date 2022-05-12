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

	CHILDS =
	{
		"wendy",
		"walter",
		"wurt",
		"webber",
	},

	CUP_MAX_LEVEL = 1,
	BOTTLE_MAX_LEVEL = 10,
	BUCKET_MAX_LEVEL = 20,
	-- 모이스쳐관련 값들
	BUCKET_DRINK_WAT = 10,
    WATER_BARREL_EXTINGUISH_HEAT_PERCENT = -1,
    WATER_BARREL_TEMP_REDUCTION = 5,
    WATER_BARREL_PROTECTION_TIME = 30,
	WATER_BARREL_DIST = 15,

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
	HYDRATION_POISON = hydration_per_day-80, -- 잘못 양조된 음료
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
	DRINK_CALORIES_POISON = 3,
	DRINK_CALORIES = 5,

	--알콜 부작용
	STRANG_POISON = -2,
	ALCOHOL_POISON = -5,
	SANITY_POISON = -5,

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