local TUNING = _G.TUNING
local hydration_per_day = 75
local wilson_thirst = 150
local seg_time = 30
local total_day_time = seg_time*16

-- 기초 목마름
TUNING.WILSON_THIRST = wilson_thirst, --수분량
TUNING.WILSON_HUNGER_RATE = hydration_per_day/total_day_time

-- 목마름 채워주는 양
TUNING.HYDRATION_POISOE = hydration_per_day-80 -- 잘못 양조된 음료
TUNING.HYDRATION_NONE = 0 -- 수상한 히비스커스
TUNING.HYDRATION_TINY = hydration_per_day/8 -- 물, 잘못된 조리법(주전자) 
TUNING.HYDRATION_SMALL = hydration_per_day/6 -- 술, 커피
TUNING.HYDRATION_MEDSMALL = hydration_per_day/4 -- 과일차(섞인것), 채소차(섞인것), 꽃차(섞인것)
TUNING.HYDRATION_MED = hydration_per_day/3 -- 찾잎이나 이름이 지정된 꽃차
TUNING.HYDRATION_LARGE = hydration_per_day/2 -- 이름이 따로 지정된 과일, 채소차, 소다, 과일 소다
TUNING.HYDRATION_HUGE = hydration_per_day -- 특수효과 주는 차, 사이다
TUNING.HYDRATION_SUPERHUGE = hydration_per_day*2 -- 콜라(퀀텀은 OP)

-- 목마름이 채워주는 배고픔 양
TUNING.DRINK_CALORIES_POISOE = -3
TUNING.DRINK_CALORIES = 5

-- 잘못 양주된 음료의 독
TUNING.HEALING_POISOE = -2
TUNING.SANITY_POISOE = -5

-- 만드는 시간(온도 조절은 특수 효과가 아님)
TUNING.INCORRECT_BOIL = 4
TUNING.KETTLE_WATER = 17 -- 물
TUNING.KETTLE_TEA = 20 -- 녹차, 홍차, 보이
TUNING.KETTLE_FRUIT = 22 -- 모든 과일 종류
TUNING.KETTLE_VEGGIE = 24 -- 모든 야채 종류
TUNING.KETTLE_DECORATION = 26 -- 꽃 종류
TUNING.KETTLE_LUXURY_GOODS = 30 -- 특수 효과주는 차들
TUNING.KETTLE_MONSTER = 23 -- 쓴 차
TUNING.KETTLE_ABI = 45 -- 수상한 히비스커스
TUNING.BEER_WAIT = GetModConfigData("beer_wait")
TUNING.SODA_WAIT = GetModConfigData("soda_wait")

--TUNING.TEASLEEP_RANGE = 00.1
--TUNING.TEASLEEP_TIME = 15
--TUNING.WELL_COOLDOWN = GetModConfigData("waterwell_wait")

TUNING.COFFEE_TIME = GetModConfigData("coffee_time") 
TUNING.COFFEE_POWR = GetModConfigData("coffee_power") 

TUNING.KETTLE_SAVECFG = GetModConfigData("kettle_save")

local language_cfg = GetModConfigData("language_cfg"
TUNING.AW_THIRST = GetModConfigData("aw_thirst")