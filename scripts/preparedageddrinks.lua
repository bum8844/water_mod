require "utils/water_brew_utils"

local drinks =
{
	-- 탄산수 만들때 필수적으로 refined_dust 첨가
	soda =
	{
		test = function(boilier, names, tags) return tags.ferment end,
		priority = 0,
		health = TUNING.HEALING_TINY/2, --0.5 (10)  @.20잔 기준
		hunger = 0, -- TUNING.CALORIES_TINY/2 -> 0. 재료 없는 탄산수라서...
		sanity = (TUNING.SANITY_SUPERTINY*3)/2, -- 1.5 (30)
		thirst = TUNING.HYDRATION_LARGE, -- 45 일반적인 소다 기준
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_DECORATION + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def = {ingredients = {{"refined_dust", 1}, {"twigs", 3}}},
	},

	lumpy_beer = {
		test = function(boilier, names, tags) return (names.potato or names.potato_cooked or names.sweet_potato or names.sweet_potato_cooked or names.kyno_sweetpotato or names.kyno_sweetpotato_cooked or names.mfp_sweetpotato or names.mfp_sweetpotato_cooked) and tags.veggie and tags.ferment and tags.ferment >= 1 and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 0.75 -> 1 (20)
		hunger = TUNING.CALORIES_SMALL/4, -- 3.125 (62.5)
		sanity = TUNING.SANITY_MEDLARGE/5, -- 5 -> 4(80)
		thirst = TUNING.HYDRATION_MOREHUGE, -- 120  야채 소다 버프
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneatenfn = function(inst, eater)
			eater.components.debuffable:RemoveDebuff("waterbornedebuff")
		end,
	},
	
	fruitsoda =
	{
		test = function(boilier, names, tags) return tags.ferment and tags.ferment >= 1 and tags.fruit and tags.fruit >= 1 and notname(names) and lessthing(names) end,
		priority = 2,
		health = TUNING.HEALING_SMALL*2, -- 2 -> 6 (120)
		hunger = TUNING.CALORIES_SMALL/4, -- 3.125 (62.5)
		sanity = (TUNING.SANITY_SUPERTINY*3)/4, -- 0.75 (15)
		thirst = TUNING.HYDRATION_LARGE, -- 90 -> 45 일반 소다 취급
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	
	lemonlimesoda =
	{   -- 요리 재료값에 과일 하나가 꼭 들어가도록 추가 했습니다.
		test = function(boilier, names, tags) return tags.ferment and tags.ferment >= 1 and names.royal_jelly and names.royal_jelly >= 1 and tags.fruit and tags.fruit >= 1 and notname(names) and lessthing(names) end,
		priority = 3,
		health = TUNING.HEALING_MED/2, -- 5 (100) -> 10 (200)  커피를 넣어서 카페인 부스트가 있는 콜라를 만들건지, 체력회복에 특화할건지 초이스.
		hunger = TUNING.CALORIES_MEDSMALL/4, -- 4.6875 (93.75)
		sanity = TUNING.SANITY_MED/4, -- 3.75 (75)
		thirst = TUNING.HYDRATION_HUGE, -- 120 -> 90
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "healthregenbuff","honeyed" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HEALTH_REGEN,
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
            else
				eater:AddDebuff("healthregenbuff", "healthregenbuff")
			end
		end,
	},
	
	cola =
	{ -- 커피소다로 컨셉을 너프
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 ) >= 1) and tags.ferment and tags.ferment >= 1 and names.royal_jelly and names.royal_jelly >= 1 and notname(names) end,
		priority = 5,
		health = (TUNING.HEALING_MED/2)/2.5, -- 2.5 -> 4 (80)
		hunger = TUNING.CALORIES_MEDSMALL/4, -- 4.6875 (93.75)
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 (165)
		thirst = TUNING.HYDRATION_HUGE, -- 120 -> 90
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "healthregenbuff","caffeinbuff","honeyed" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLA,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = (TUNING.CAFFEIN_TIME/2)
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},
	
	colaquantum =
	{
		test = function(boilier, names, tags) return quantum_calc(names, tags) and (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0) == 1) and tags.ferment and tags.ferment == 1 end,
		priority = 6,
		health = TUNING.HEALING_SUPERHUGE/2, -- 100 -> 50 (500) @.퀀텀 너무 강함... 너프해도 무화과보다 강함.
		hunger = TUNING.CALORIES_HUGE/4, -- 75 -> 18.75 (187.5) @.허기는 요리를 합시다...
		sanity = TUNING.SANITY_HUGE/2, -- 60 -> 30 (300)
		thirst = TUNING.HYDRATION_SUPERHUGE, -- 180
		tags = { "masterfood","lightdrink","honeyed" },
		perishtime = TUNING.PERISH_SUPERSLOW, -- 대신 유통기한 강화 (강을 만들어도 미생물이 살지 못한다는 공식 설정...)
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "healthregenbuff","drunkarddebuff","wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLAQUANTUM,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = (TUNING.CAFFEIN_TIME/2)
            eater:AddDebuff("healthregenbuff", "healthregenbuff")
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
            drink_worm_light_greater(inst, eater)
	    end,
	},
	
	-- 술(물 장기 보관용도)
	corn_beer =
	{
		test = function(boilier, names, tags) return (( names.corn or 0 ) + ( names.corn_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_TINY, -- 9.375 (187.5)
		sanity = 0,
		thirst = TUNING.HYDRATION_MED, --30
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		card_def = {ingredients = {{"corn", 4}}},
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 감자, 고구마
	lumpy_wine = {
		test = function(boilier, names, tags) return ( ( names.potato or 0 ) + ( names.potato_cooked or 0 ) + ( names.kyno_sweetpotato or 0 ) + ( names.kyno_sweetpotato_cooked or 0 ) + ( names.mfp_sweetpotato or 0 ) + ( names.mfp_sweetpotato_cooked or 0 ) + ( names.sweetpotato or 0 ) + ( names.sweetpotato_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_HUGE/10, -- 9.375 (187.5) -> 7.5   맥주보다 좀 덜하지만 수분 보너스 약간
		sanity = 0,
		thirst = TUNING.HYDRATION_LARGE, --30 -> 45 야채 버프
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 선인장
	pulque = {
		test = function(boilier, names, tags) return ((names.cactus_meat or 0) + (names.cactus_meat_cooked or 0) + (names.aloe or 0) + (names.aloe_cooked or 0) + (names.kyno_aloe or 0) + (names.kyno_aloe_cooked or 0) + (names.mfp_aloe or 0) + (names.mfp_aloe_cooked or 0)) >= 3 and notmeat(tags) and notname(names) end,
		health = TUNING.HEALING_TINY*5, -- 5 (100)
		hunger = TUNING.CALORIES_MEDSMALL/3, -- 6.25 (125) 
		sanity = TUNING.SANITY_SMALL, -- 10 (200)
		thirst = TUNING.HYDRATION_MED, --30
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SLOW, -- 15일 ( 폴케는 금방 상한다고 하는...)
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		potlevel = "mid",
		potlevel_bottle = "mid",
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
		health = TUNING.HEALING_SMALL*3, -- 12 -> 9 (180) 유제품을 쓰는 크므즈로 옮기고 살짝 너프
		hunger = TUNING.CALORIES_HUGE/10, -- 9.375 (187.5) -> 7.5 (150) 허기 회복은 맥주에 집중
		sanity = TUNING.SANITY_SMALL/4, --2.5 (50)
		thirst = TUNING.HYDRATION_MED, --30
		tags = {"alcohol","honeyed"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "high",
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
		health = TUNING.HEALING_TINY, -- 0 -> 1 (20)
		hunger = TUNING.DRINK_CALORIES, -- 9.375 -> 5 (100) 가장 기본적인 술 칼로리 기준
		sanity = TUNING.SANITY_SMALL/2, -- 5 (100)
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
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
		health = TUNING.HEALING_SMALL/2, -- 0-> 1.5 (30)
		hunger = TUNING.DRINK_CALORIES, -- 9.375 -> 5 (100)
		sanity = TUNING.SANITY_MED/2, -- 7.5 (150)
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	
	sparklingwine =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) >= 2) and tags.ferment and tags.ferment >= 1 and onlydragoonheart(names, tags) and notname(names) end,
		priority = 3,
		health = TUNING.HEALING_SMALL, -- 3 (60)
		hunger = TUNING.DRINK_CALORIES, -- 9.375 -> 5 (100)
		sanity = TUNING.SANITY_HUGE/4, -- 12.5 (250)
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_GLOW,
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		card_def = {ingredients = {{"refined_dust",1},{"berries",1},{"berries_juicy",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 발광 베리류
	glowberrywine =
	{
		test = function(boilier, names, tags) return ((names.wormlight or 0) + (names.wormlight_lesser or 0) >= 3) and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.DRINK_CALORIES, -- 9.375 -> 5 (100)
		sanity = TUNING.SANITY_MED/2, -- 7.5 (150)
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol","lightdrink"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		potlevel = "high",
		potlevel_bottle = "mid",
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
		test = function(boilier, names, tags) return ( ( tags.milk or 0 ) + ( tags.dairy or 0 ) + ( names.goatmilk or 0 ) + ( names.kyno_milk_beefalo or 0 ) + ( names.kyno_milk_koalefant or 0 ) + ( names.milk_box or 0 ) + ( names.beefalo_milk or 0 ) + ( names.rawmilk or 0 ) >= 3) and notmeat(tags) and notname(names) and not tags.fat end,
		priority = 1,
		health = TUNING.HEALING_SMALL*4, -- 12 (240) 3 유제품 버프
		hunger = TUNING.CALORIES_MEDSMALL/3, -- 9.375 -> 6.25 (125)
		sanity = TUNING.SANITY_MED/2, -- 7.5 (150) 
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol"},
		perishtime = TUNING.TUNING.PERISH_SLOW, -- 15일 ( 크므즈도 금방 상한다고 하더라구욥...)
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		card_def = {ingredients = {{"goatmilk",4}}},
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
	-- 카카오 와인
	ruincacao_wine = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and tags.ruincacao_bean_cooked >= 3 and notmeat(tags) and notname(names) end,
		priority = 1,
        health = TUNING.HEALING_MED/5, -- 5 -> 4 (80)
        hunger = TUNING.DRINK_CALORIES, -- 9.375 -> 5 (100)
        sanity = 0,
        thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_ANCIENT_KNOWLEGEE,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
			if eater.components.builder then
				eater.components.builder:GiveTempTechBonus({ANCIENT = 2})
			end
		end,
	}
}


local mod_drink = require("modcompats/preparedageddrinks_mod")
local hof, ia, te, mfp = false, false, false, false

for k,mod_id in ipairs(KnownModIndex:GetModsToLoad()) do 
	if mod_id == "workshop-2334209327" then
		hof = true
	end
	if mod_id == "workshop-2762334054" then
		mfp = true
		local mfp_drink = mod_drink.mfp_drink
		for k, v in pairs(mfp_drink) do
			drinks[k] = v
		end
	end
	if mod_id == "workshop-1505270912" then
		te = true
	end
	if mod_id == "workshop-1467214795" then
		ia = true
	end
	if mod_id == "workshop-1289779251" then -- cf
		local cf_drink = mod_drink.cf_drink
		for k,v in pairs(cf_drink) do
			drinks[k] = v
		end
	end
	if mod_id == "workshop-2039181790" then -- unc
		local unc_drink = mod_drink.unc_drink
		for k,v in pairs(unc_drink) do
			drinks[k] = v
		end
	end
	if mod_id == "workshop-1392778117" then -- legion
		local legion_drink = mod_drink.legion_drink
		for k,v in pairs(legion_drink) do
			drinks[k] = v
		end
	end 
end

if te or ia then
	local sw_drink = mod_drink.sw_drink
	for k,v in pairs(sw_drink) do
		drinks[k] = v
	end
end

if te or ia or hof then
	local coconut_drink = mod_drink.coconut_drink
	for k,v in pairs(coconut_drink) do
		drinks[k] = v
	end
end

if hof or mfp then
	local wheat_drink = mod_drink.wheat_drink
	for k, v in pairs(wheat_drink) do
		drinks[k] = v
	end
end

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.is_boilbook_recipes = true
    v.cookbook_category = "brewery"
    v.no_cookbook = true
end

return drinks
