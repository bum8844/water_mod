local TUNING = _G.TUNING
local hydration_per_day = 75
local wilson_thirst = 150
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

	CUP_MAX_LEVEL = 1,
	BOTTLE_MAX_LEVEL = 10,
	BUCKET_MAX_LEVEL = 20,

	CAMP_KETTLE_MAX_LEVEL = 1,
	KETTLE_MAX_LEVEL = 5,
	BERRLE_MAX_LEVEL = 20,
	BREWERY_MAX_LEVEL = 20,
	DESALINATOR_MAX_LEVEL = 20,

-- 기초 목마름
	WILSON_THIRST = wilson_thirst, --수분량
	WILSON_HUNGER_RATE = hydration_per_day/total_day_time,

-- 목마름 채워주는 양
	HYDRATION_SALT = hydration_per_day-90, -- 소금물
	HYDRATION_POISOE = hydration_per_day-80, -- 잘못 양조된 음료
	HYDRATION_NONE = 0, -- 수상한 히비스커스
	HYDRATION_TINY = hydration_per_day/8, -- 물, 잘못된 조리법(주전자) 
	HYDRATION_SMALL = hydration_per_day/6, -- 술, 커피
	HYDRATION_MEDSMALL = hydration_per_day/4, -- 과일차(섞인것), 채소차(섞인것), 꽃차(섞인것)
	HYDRATION_MED = hydration_per_day/3, -- 찾잎이나 이름이 지정된 꽃차
	HYDRATION_LARGE = hydration_per_day/2, -- 이름이 따로 지정된 과일, 채소차, 소다, 과일 소다
	HYDRATION_HUGE = hydration_per_day, -- 특수효과 주는 차, 사이다
	HYDRATION_SUPERHUGE = hydration_per_day*2, -- 콜라(퀀텀은 OP)

	-- 목마름이 채워주는 배고픔 양
	DRINK_CALORIES_POISOE = -3,
	DRINK_CALORIES = 5,

	-- 잘못 양주된 음료의 독, 술독
	STRANG_POISOE = -2,
	ALCAHOL_POISOE = -5,
	SANITY_POISOE = -5,

	INCORRECT_BOIL = 1,
	KETTLE_WATER = 1, -- 물
	KETTLE_TEA = 1, -- 녹차, 홍차, 보이
	KETTLE_FRUIT = 1, -- 모든 과일 종류
	KETTLE_VEGGIE = 1, -- 모든 야채 종류
	KETTLE_DECORATION = 1, -- 꽃 종류
	KETTLE_LUXURY_GOODS = 1, -- 특수 효과주는 차들
	--KETTLE_MONSTER = 23, -- 쓴 차
	KETTLE_ABI = 45, -- 수상한 히비스커스
	BEER_WAIT = GetModConfigData("beer_wait"),
	SODA_WAIT = GetModConfigData("soda_wait"),

	--[[만드는 시간(온도 조절은 특수 효과가 아님)
	INCORRECT_BOIL = 4,
	KETTLE_WATER = 17, -- 물
	KETTLE_TEA = 20, -- 녹차, 홍차, 보이
	KETTLE_FRUIT = 22, -- 모든 과일 종류
	KETTLE_VEGGIE = 24, -- 모든 야채 종류
	KETTLE_DECORATION = 26, -- 꽃 종류
	KETTLE_LUXURY_GOODS = 30, -- 특수 효과주는 차들
	--KETTLE_MONSTER = 23, -- 쓴 차
	KETTLE_ABI = 45, -- 수상한 히비스커스
	BEER_WAIT = GetModConfigData("beer_wait"),
	SODA_WAIT = GetModConfigData("soda_wait"),]]

	TEA_TREE_REGROWTH_TIME_MULT = 1,
	CAFFEINBERRY_REGROWTH_TIME_MULT = 1,

	--TEASLEEP_RANGE = 00.1,
	--TEASLEEP_TIME = 15,
	--WELL_COOLDOWN = GetModConfigData("waterwell_wait"),

	COFFEE_TIME = GetModConfigData("coffee_time"),
	COFFEE_POWER = GetModConfigData("coffee_power"),
}

for i,v in pairs(tuning) do
	TUNING[i] = v
end


--[[KETTLE_SAVECFG = GetModConfigData("kettle_save")

local language_cfg = GetModConfigData("language_cfg")
AW_THIRST = GetModConfigData("aw_thirst")]]--