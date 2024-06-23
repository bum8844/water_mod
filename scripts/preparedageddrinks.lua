require "utils/water_brew_utils"

local drinks =
{
	-- 탄산수 만들때 필수적으로 refined_dust 첨가
	soda =
	{
		test = function(boilier, names, tags) return tags.ferment end,
		priority = 0,
		health = TUNING.HEALING_TINY/2, --0.5 [2.5] (10)  ※[] <-5잔 () <-20잔 기준
		hunger = 0,
		sanity = (TUNING.SANITY_SUPERTINY*3)/2, -- 1.5 [3.5] (30)
		thirst = TUNING.HYDRATION_LARGE, -- 45 [225] (900) 일반적인 소다 기준
		temperature = TUNING.COLD_FOOD_BONUS_TEMP, 
		temperatureduration = TUNING.FOOD_TEMP_BRIEF, -- 5초
		perishtime = TUNING.PERISH_SLOW, -- 15일
		cooktime = (TUNING.KETTLE_DECORATION + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def = {ingredients = {{"refined_dust", 1}, {"twigs", 3}}},
	},

	lumpy_beer = {
		test = function(boilier, names, tags) return tags.ferment and tags.ferment >= 1 and tags.sweetener and tags.sweetener >=1 and Root_calc(names, tags) end, --(names.potato or names.potato_cooked or names.sweet_potato or names.sweet_potato_cooked or names.kyno_sweetpotato or names.kyno_sweetpotato_cooked or names.mfp_sweetpotato or names.mfp_sweetpotato_cooked) and tags.veggie and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_SMALL*2, -- 6 [30] (120)
		hunger = TUNING.CALORIES_SMALL/2, --  6.25 [31.25] (125)
		sanity = TUNING.SANITY_SUPERTINY, -- 1 [5] (20)
		thirst = TUNING.HYDRATION_MEDSMALL*3, -- 67.5 [327.5] (1350) 야채 소다 버프
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE, -- 15초
		perishtime = TUNING.PERISH_SLOW, -- 15일
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		tags = {"honeyed"},
	},
	
	fruitsoda =
	{
		test = function(boilier, names, tags) return tags.ferment and tags.ferment == 1 and tags.fruit and tags.fruit >= 2 and tags.sweetener and tags.sweetener >=1 and notmeat(tags) and not names.twigs and notname(names) end,
		priority = 2,
		health = TUNING.HEALING_SMALL*3, -- 9 [45] (180)
		hunger = TUNING.CALORIES_SMALL/4, -- 3.125 [15.625] (62.5)
		sanity = TUNING.SANITY_SUPERTINY, -- 1 [5] (20)
		thirst = TUNING.HYDRATION_LARGE, -- 45 [225] (900)
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE, --10초
		perishtime = TUNING.PERISH_SLOW, -- 15일
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		tags = {"honeyed"},
	},
	
	
	lemonlimesoda =
	{   
		test = function(boilier, names, tags) return tags.ferment and tags.ferment == 1 and tags.sweetener and tags.sweetener >=3 and notmeat(tags) and not names.twigs and notname(names) end,
		priority = 2,
		health = TUNING.HEALING_SMALL*2, -- 6 [30] (120)  
		hunger = TUNING.CALORIES_SMALL/4, -- 3.125 [15.625] (62.5)
		sanity = TUNING.SANITY_MED/2, -- 7.5 [37.5] (150)
		thirst = TUNING.HYDRATION_LARGE, -- 45 [225] (900)
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE, --10초
		perishtime = TUNING.PERISH_SLOW, --15일
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		tags = {"honeyed"},
	},
	
	cola =
	{ -- 
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 )) >= 1 and tags.ferment and tags.ferment == 1 and names.royal_jelly and names.royal_jelly == 1 and names.nightmarefuel and names.nightmarefuel == 1 end,
		priority = 5,
		health = TUNING.HEALING_SMALL*2, -- 6 [30] (120)  
		hunger = TUNING.CALORIES_TINY, -- 9.375 [46.875] (93.75)
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 [41.25] (165)
		thirst = TUNING.HYDRATION_MEDSMALL*3, -- 67.5 [337.5] (6750)
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG, --15초
		perishtime = TUNING.PERISH_PRESERVED, --20일
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		tags = {"honeyed"},
		prefabs = { "healthregenbuff","caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLA,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = (TUNING.CAFFEIN_TIME/2)
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
			eater:AddDebuff("sweettea_buff", "sweettea_buff")
		end,
	},
	
	colaquantum =
	{
		test = function(boilier, names, tags) return quantum_calc(names, tags) and (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0) + ( names.coffeebeans_cooked or 0 )) == 1 and tags.ferment and tags.ferment == 1 and names.royal_jelly and names.royal_jelly == 1 end,
		priority = 6,
		health = TUNING.HEALING_MOREHUGE*2, -- 150 [750] (1500) 
		hunger = TUNING.CALORIES_TINY, -- 9.375 [46.875] (46.875)
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 [41.25] (165)
		thirst = TUNING.HYDRATION_MEDSMALL*3, -- 67.5 [337.5] (6750)
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG, --15초
		tags = { "masterfood","lightdrink","honeyed" },
		perishtime = TUNING.PERISH_PRESERVED, -- 20일 
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "drunkarddebuff","wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLAQUANTUM,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = (TUNING.CAFFEIN_TIME/2)
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
            drink_worm_light_greater(inst, eater)
	    end,
	},
	--에너지 드링크(비팔로-비[Beefalo-B])(조정 해야함)
	moon_cap_drink = {
		test = function(boilier, names, tags) return (names.durian or names.durian_cooked) and ((names.durian or 0)+(names.durian_cooked or 0)) == 1 and and (names.moon_cap or names.moon_cap_cooked) and ((names.moon_cap or 0)+(names.moon_cap_cooked or 0)) == 1 and tags.ferment and tags.ferment == 1 and names.nightmarefuel and names.nightmarefuel == 1 end,
		priority = 2,
		health = TUNING.HEALING_MED/4,  -- 5 (25)
		hunger = TUNING.CALORIES_LARGE/5, -- 4 -> 7.5 (37.5)
		sanity = TUNING.SANITY_SUPERTINY*2, -- 1 -> 2 (10)
		thirst = TUNING.HYDRATION_LARGE, -- 45 [225] (900)
		tags = {},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "buff_sleepresistance","drunkarddebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE_SLEEP_RESIST,
		oneatenfn = function(inst, eater)
            if eater.components.grogginess ~= nil and
			not (eater.components.health ~= nil and eater.components.health:IsDead()) and
			not eater:HasTag("playerghost") then
				eater.components.grogginess:ResetGrogginess()
            end
			eater:AddDebuff("shroomsleepresist", "buff_sleepresistance")
			eater.caffeinbuff_duration = (TUNING.CAFFEIN_TIME/2)
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
	    end,
	},
	
	-- 술(물 장기 보관용도)
	corn_beer =
	{
		test = function(boilier, names, tags) return (( names.corn or 0 ) + ( names.corn_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL, -- 3 [15] (60) 
		hunger = TUNING.CALORIES_TINY, -- 9.375 [46.875] (187.5)
		sanity = 0,
		thirst = TUNING.HYDRATION_MED, --30 [120] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		card_def = {ingredients = {{"corn", 4}}},
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 감자, 고구마
	lumpy_wine = {
		test = function(boilier, names, tags) return (( names.potato or 0 ) + ( names.potato_cooked or 0 ) + ( names.kyno_sweetpotato or 0 ) + ( names.kyno_sweetpotato_cooked or 0 ) + ( names.mfp_sweetpotato or 0 ) + ( names.mfp_sweetpotato_cooked or 0 ) + ( names.sweetpotato or 0 ) + ( names.sweetpotato_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL, -- 3 [15] (60) 
		hunger = TUNING.CALORIES_HUGE/10, -- 7.5 [37.5] (150)
		sanity = 0,
		thirst = TUNING.HYDRATION_LARGE, -- 45 [225] (900)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, --20일
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, -- 1분
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 선인장
	pulque = {
		test = function(boilier, names, tags) return ((names.succulent_picked or 0) + (names.cactus_meat or 0) + (names.cactus_meat_cooked or 0) + (names.aloe or 0) + (names.aloe_cooked or 0) + (names.kyno_aloe or 0) + (names.kyno_aloe_cooked or 0) + (names.mfp_aloe or 0) + (names.mfp_aloe_cooked or 0)) >= 3 and notmeat(tags) and notname(names) end,
		health = TUNING.HEALING_TINY*5, -- 5 [25] (100)
		hunger = TUNING.CALORIES_MEDSMALL/3, -- 6.25 [31.25] (125) 
		sanity = TUNING.SANITY_SMALL, -- 10 [50] (200)
		thirst = TUNING.HYDRATION_MED, --30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SLOW, -- 15일 ( 폴케는 금방 상한다고 하는...)
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		temperature = TUNING.COLD_FOOD_BONUS_TEMP, -- 차가움
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, -- 1분
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	--꿀술
	madhu =
	{
		test = function(boilier, names, tags) return tags.sweetener and tags.sweetener >= 3 and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL*3, -- 9 [45] (180) 
		hunger = TUNING.CALORIES_HUGE/10, -- 7.5 [37.5] (150) 허기 회복은 맥주에 집중
		sanity = TUNING.SANITY_SMALL/4, --2.5 [12.5] (50) 
		thirst = TUNING.HYDRATION_MED, --30 [150] [600]
		tags = {"alcohol","honeyed"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "high",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},

	-- 베리류
	wine =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 2,
		health = TUNING.HEALING_TINY*4, --  1 -> 4 [20] (80)
		hunger = TUNING.DRINK_CALORIES, -- 5 [25] (100) 가장 기본적인 술 칼로리 기준
		sanity = TUNING.SANITY_SMALL/2, -- 5 [25] (100)
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},

	noblewine = 
	{
		test = function(boilier, names, tags) return (( names.berries_cooked or 0 ) + ( names.berries_juicy_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 2,
		health = TUNING.HEALING_SMALL*2, -- 1.5 -> 6 [30] (120)
		hunger = TUNING.DRINK_CALORIES, -- 5 [25] (100)
		sanity = TUNING.SANITY_MED/2, -- 7.5 [37.5](150)
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	
	sparklingwine =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) == 3) and tags.ferment and tags.ferment == 1 and notname(names) end,
		priority = 3,
		health = TUNING.HEALING_MEDSMALL, -- 3 -> 8 [40] (160)
		hunger = TUNING.DRINK_CALORIES, -- 5 [25] (100)
		sanity = TUNING.SANITY_HUGE/4, -- 12.5 [62.5] (250)
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		card_def = {ingredients = {{"refined_dust",1},{"berries",1},{"berries_juicy",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 발광 베리류
	glowberrywine =
	{
		test = function(boilier, names, tags) return ((names.wormlight or 0) + (names.wormlight_lesser or 0) == 3) and tags.sweetener and tags.sweetener >=1 and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL, -- 0-> 3 [15] (60)
		hunger = TUNING.DRINK_CALORIES, -- 5 [25] (100)
		sanity = TUNING.SANITY_MED/2, -- 7.5 [37.5](150)
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol","lightdrink"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff","wormlight_light" },
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_GLOW,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
           	drink_worm_light_less(inst, eater)
	    end,
	},
	-- 우유
	kumis = {
		test = function(boilier, names, tags) return (( tags.milk or 0 ) + ( tags.dairy or 0 ) + ( names.goatmilk or 0 ) + ( names.kyno_milk_beefalo or 0 ) + ( names.kyno_milk_koalefant or 0 ) + ( names.milk_box or 0 ) + ( names.beefalo_milk or 0 ) + ( names.rawmilk or 0 ) >= 3) and notmeat(tags) and notname(names) and not tags.fat end,
		priority = 1,
		health = TUNING.HEALING_SMALL*4, -- 12 [60] (240) 3 유제품 버프
		hunger = TUNING.CALORIES_MEDSMALL/3, -- 6.25 [31.25] (125)
		sanity = TUNING.SANITY_MED/2, -- 7.5 [37.5] (150) 
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SLOW, -- 15일 ( 크므즈도 금방 상한다고 하더라구욥...)
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		card_def = {ingredients = {{"goatmilk",4}}},
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 카카오 와인
	ruincacao_wine = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked >= 3 and notmeat(tags) and notname(names) end,
		priority = 1,
        health = TUNING.HEALING_MED/5, -- 4 [20] (80)
        hunger = TUNING.DRINK_CALORIES, -- 5 [25] (100)
        sanity = 0,
        thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_ANCIENT_KNOWLEGEE,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
			give_tech(inst, eater, 2)
		end,
	}
}


local mod_drink = require("modcompats/preparedageddrinks_mod")
local modlist = require("utils/water_modlist").active_mod_compatibility

for active, _ in pairs(modlist) do
	local test = active.."_drink"
	for mod_drinks, drink_table in pairs(mod_drink) do
		if test == mod_drinks then
			for k, v in pairs(drink_table) do
				drinks[k] = v
			end
		end
	end
end

if modlist.mfp or modlist.fwd then
	local orange_drink = mod_drink.orange_drink
	for k,v in pairs(orange_drink) do
		drinks[k] = v
	end
end

if modlist.te or modlist.ia or modlist.ta then
	local sw_drink = mod_drink.sw_drink
	for k,v in pairs(sw_drink) do
		drinks[k] = v
	end
end

if modlist.te or modlist.ia or modlist.hof or modlist.ta then
	local coconut_drink = mod_drink.coconut_drink
	for k,v in pairs(coconut_drink) do
		drinks[k] = v
	end
end

if modlist.hof or modlist.mfp then
	local wheat_drink = mod_drink.wheat_drink
	for k, v in pairs(wheat_drink) do
		drinks[k] = v
	end
end

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC

    v.is_boilbook_recipes = true
    v.boilbook_category = "brewery"
    if modlist.legion and _G.CONFIGS_LEGION.BETTERCOOKBOOK then
    	v.cook_need = nil
    	v.cook_cant = nil
    	v.recipe_count = 4
		local cookbookui_legion = require "modcompats/1392778117/cookbookui_legion"
		v.custom_cookbook_details_fn = function(data, self, top, left)
			local root = cookbookui_legion(data, self, top, left)
			return root
		end
    end
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC
    v.no_cookbook = true
end

return drinks
