require "utils/water_brew_utils"

local drinks =
{
	-- 조합법이 잘못되면 나오는 결과물
	goopydrink = 
	{
		test = function(boilier, names, tags) return true end,
		priority = -2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25
		perishtime = TUNING.PERISH_FAST,
		cooktime = TUNING.INCORRECT_BOIL,
		wet_prefix = STRINGS.WET_PREFIX.WETGOOP,
		potlevel = "high",
		potlevel_bottle = "mid",
	},

	-- 과일차 종류(채력특화)
	
	berries_juice = --베리주스
	{
		test = function(boilier, names, tags) return (names.berries or  names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL/4, --2 (10)
		hunger = TUNING.DRINK_CALORIES/5, --1 (5)
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED, 
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		card_def={ingredients={{"berries",2},{"berries_juicy",2}}},
	},

	fruitjuice =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 3 and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED/4,  --5 (25)
		hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
		sanity = TUNING.SANITY_SUPERTINY, -- 1 (5)
		thirst = TUNING.HYDRATION_SMALL, -- 15
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},

	banana_juice =
	{
		test = function(boilier, names, tags) return (names.cave_banana or names.cave_banana_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_LARGE/4, -- 10 (50)
		hunger = TUNING.CALORIES_TINY/4, -- 4.6875 (23.4375)
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL, --15
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},

	pomegranate_juice =
	{
		test = function(boilier, names, tags) return (names.pomegranate or names.pomegranate_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_HUGE/4, -- 15 (75)
		hunger = TUNING.DRINK_CALORIES/4, -- 1.25 (6.35)
		sanity = TUNING.SANITY_SUPERTINY, -- 1 (5)
		thirst = TUNING.HYDRATION_SMALL, -- 15
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},

	watermelon_juice = 
	{
		test = function(boilier, names, tags) return (names.watermelon or names.watermelon_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL/4, --2 (10)
		hunger = TUNING. CALORIES_MED/4, -- 6.25(31.25) large -> med
		sanity = TUNING.SANITY_TINY/2, --2.5 (12.5)
		thirst = TUNING.HYDRATION_MEDSMALL*3, -- 45 -> 67.5
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED, -- slow -> med
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
	
	fig_juice =
	{
		test = function(boilier, names, tags) return (names.fig or names.fig_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 3,
		health = TUNING.HEALING_MOREHUGE/4, --18.75 (93.75)
		hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
		sanity = TUNING.SANITY_TINY/2, -- 2.5 (12.5)
		thirst = TUNING.HYDRATION_SMALL,  -- 15
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
	
	dragonjuice =
	{
		test = function(boilier, names, tags) return (names.dragonfruit or names.dragonfruit_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDLARGE/4, -- 7.5 (35.5)
		hunger = TUNING. CALORIES_MED/4, -- 6.25 (31.25)
		sanity = TUNING.SANITY_TINY, -- 5 (25)
		thirst = TUNING.HYDRATION_MEDSMALL,  -- 15 -> 22.5
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
	
	glowberryjuice =
	{
		test = function(boilier, names, tags) return (names.wormlight or (names.wormlight_lesser and names.wormlight_lesser >= 2)) and (Preference(names, tags) >= 0.5) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 4,
		health = TUNING.HEALING_MEDSMALL/4, -- 2
		hunger = TUNING.DRINK_CALORIES/5,  -- 1
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL, -- 15
		tags = {"lightdrink","fruittype"},
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		prefabs = { "wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
		card_def = {ingredients={{"wormlight_lesser",3},{"honey",1}}},
		oneatenfn = function(inst, eater)
           	drink_worm_light_greater(inst, eater)
	    end,
	},
	
	caffeinberry_juice =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 ) >= 3) and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) end,
		priority = 5,
		health = TUNING.HEALING_TINY, -- 1 (5)
		hunger = 0,
		sanity = -TUNING.SANITY_SUPERTINY, -- -1 (-5)
		thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE,
		card_def={ingredients={{"caffeinberry_bean_cooked",3},{"honey",1}}},
		oneatenfn = function(inst, eater)
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},

	toffee_latte = {
		test = function(boilier, names, tags) return tags.seed and (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 ) > 1) and (tags.dairy or tags.milk) end,
		priority = 6,
		health = TUNING.HEALING_SMALL, -- 3 (15)
		hunger = TUNING.CALORIES_TINY/2, -- 4.6875 (23.4375)
		sanity = TUNING.SANITY_SUPERTINY*3, -- 1 -> 3 (15) 유제품 버프
		thirst = TUNING.HYDRATION_SMALLTINY, -- 7.5 -> 11.25
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME * 1.5
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},

	ruincha_latte = {
		test = function(boilier, names, tags) return tags.sweetener and (names.caffeinberry_bean_cooked or names.kyno_coffeebeans_cooked or names.coffeebeans_cooked or names.mfp_coffeecherry_cooked ) and (tags.dairy or tags.milk) and names.ruincacao_bean_cooked end,
		priority = 6,
        health = 0,
        hunger = TUNING.DRINK_CALORIES/3, -- 1.7 (8.5)
        sanity = (TUNING.SANITY_MED*2)/5, -- 2.5 -> 6 (30) 유제품 버프
        thirst = TUNING.HYDRATION_SMALLTINY, -- 7.5 -> 11.25
        perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CONSERVE_KNOWLEGEE_CAFFINE,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME * 0.5
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
			add_tech_count(inst, eater, 1)
		end,
	},

	-- 야채차(목마름 특화)
	
	carrot_tea =
	{
		test = function(boilier, names, tags) return (names.carrot or names.carrot_cooked) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*1.5)/4, --1.125 (5.625)
		hunger = TUNING.DRINK_CALORIES/5, -- 1
		sanity = 0, --0.5 -> 0
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"veggietype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "high",
		potlevel_bottle = "mid",
		card_def={ingredients={{"carrot",3},{"twigs",1}},},
		drinktype = DRINKTYPY.VEGGIE,
	},

	veggie_tea =
	{
		test = function(boilier, names, tags) return tags.veggie and not tags.lotus and Preference(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 0,
		health = (TUNING.HEALING_SMALL*2)/4, -- 1.5 (7.5)
		hunger = TUNING.DRINK_CALORIES/4, -- 1.25 (6.25)
		sanity = -TUNING.SANITY_LARGE, -- -33 (-165) -> 음료 괴물고기판이라 이렇게 작업함.
		thirst = TUNING.HYDRATION_LARGE,  -- 45
		tags = {"veggietype"},
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CURE_WATERBORNE,
		oneatenfn = function(inst, eater)
			if eater:HasTag("player") and not eater:HasTag("playermerm") then
				if eater:HasTag("masterchef") then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_EAT","RAW"))
				else
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_EAT","PAINFUL"))
				end
				if eater.components.debuffable:HasDebuff("waterbornedebuff") then
					eater.components.debuffable:RemoveDebuff("waterbornedebuff")
				end
			end
		end,
		drinktype = DRINKTYPY.VEGGIE,
	},

	lumpy_tea = {
		test = function(boilier, names, tags) return (names.potato or names.potato_cooked or names.sweet_potato or names.sweet_potato_cooked or names.kyno_sweetpotato or names.kyno_sweetpotato_cooked or names.mfp_sweetpotato or names.mfp_sweetpotato_cooked) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 0.75-> 1 (5)
		hunger = (TUNING.DRINK_CALORIES/5)*4,  -- 1.25 -> 4(20) (정신력 회복을 아예 없에는 대신 허기값 보너스를 줌)
		sanity = 0,
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"veggietype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CURE_WATERBORNE,
		oneatenfn = function(inst, eater)
			if eater.components.debuffable:HasDebuff("waterbornedebuff") then 
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_CURE_WATERBORNE"))
				eater.components.debuffable:RemoveDebuff("waterbornedebuff")
			end
		end,
		drinktype = DRINKTYPY.VEGGIE,
	},

	seaweed_shake = 
	{
		test = function(boilier, names, tags) return (names.kelp or names.kelp_cooked or names.kelp_dried or names.seaweed or names.seaweed_cooked or names.seaweed_dried or names.kyno_seaweeds or names.kyno_seaweeds_cooked or names.kyno_seaweeds_dried) and tags.frozen and tags.frozen >= 1 and (Preference(names, tags) >= 0.5) and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/4, --1.5 (7.5)
		hunger = TUNING.DRINK_CALORIES/4, --1.25 (6.25)
		sanity = -TUNING.SANITY_TINY, -- -5 (-25) -> 수치가 너무 높다고 판단되 깍음
		thirst = TUNING.HYDRATION_LARGE, -- 45
		tags = {"veggietype"},
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		potlevel = "high",
		potlevel_bottle = "mid",
		perishtime = TUNING.PERISH_FAST, -- 8 -> 6일
		drinktype = DRINKTYPY.VEGGIE,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
	
	cactus_tea =
	{
		test = function(boilier, names, tags) return (names.cactus_meat or names.cactus_meat_cooked or names.aloe or names.aloe_cooked or names.kyno_aloe or names.kyno_aloe_cooked or names.mfp_aloe or names.mfp_aloe_cooked ) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/4, --1.5(7.5)
		hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
		sanity = TUNING.SANITY_TINY, -- 1 (5)
		thirst = TUNING.HYDRATION_LARGE, -- 45
		tags = {"veggietype"},
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.VEGGIE,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},

	tomato_juice = {
		test = function(boilier, names, tags) return (names.tomato or names.tomato_cooked or names.tomato_dried) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*1.5)/4, --1.125 (5.625) 
		hunger = TUNING.DRINK_CALORIES/2, --2.5 (12.5)
		sanity = TUNING.SANITY_TINY/4, -- 1.25 (6.25)
		thirst = TUNING.HYDRATION_LARGE, -- 45
		tags = {"veggietype"},
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.VEGGIE,
		perishtime = TUNING.PERISH_MED,
		prefabs = { "detoxbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_DETOX,
		oneatenfn = function(inst, eater)
			if eater:HasTag("drunk") then
				eater:AddDebuff("detoxbuff", "detoxbuff")
			elseif eater.components.dcapacity ~= nil and eater.components.dcapacity:GetCapacity() > 0 then
				eater.components.dcapacity:Remove_Capacity(1)
			end
		end,
	},

	mulled =
	{
		test = function(boilier, names, tags) return (( names.onion or 0 ) + ( names.onion_cooked or 0 ) + ( names.garlic or 0 ) + ( names.garlic_cooked or 0 ) >= 2) and tags.sweetener and tags.sweetener >= 1 and Preference(names, tags) and not tags.frozen and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL/2, -- 2 -> 4 (20) 
		hunger = TUNING.DRINK_CALORIES/2, --2.5
		sanity = TUNING.SANITY_TINY/4, -- 1.25 (6.25)
		thirst = TUNING.HYDRATION_MED, --30
		tags = {"honeyed","veggietype"},
		perishtime = TUNING.PERISH_SLOW, -- 10-> 15일 마늘과 양파의 방부효과 
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "high",
		drinktype = DRINKTYPY.VEGGIE,
		prefabs = { "sleepdrinkbuff", "healthregenbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_MULLED,
		oneatenfn = function(inst, eater)
			eater:AddDebuff("sleepdrinkbuff", "sleepdrinkbuff")
		end,
	},
	
	-- 잎&꽃차 종류(정신력 특화)

	-- 꽃을 섞으면 나오는 결과물
	mixflower =
	{
		test = function(boilier, names, tags) return Mix_Tea_Patch(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 0,
		health = TUNING.HEALING_TINY, -- 1 (5) 
		hunger = 0,
		sanity = TUNING.SANITY_SMALL/4, --2.25 (11.1)
		thirst = TUNING.HYDRATION_SMALL, -- 11.25 -> 15
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},
	
	greentea =
	{
		test = function(boilier, names, tags) return IsTealeaves(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 1
		hunger = 0,
		sanity = TUNING.SANITY_MED/4,  -- 3.75 (18.75)
		thirst = TUNING.HYDRATION_SMALL, -- 11.25 -> 15
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},
	
	-- 녹차 건조대 말린것
	blacktea =
	{
		test = function(boilier, names, tags) return IsTealeaves_dried(names, tags) and not tags.frozen and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 1
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 (41.25)
		thirst = TUNING.HYDRATION_SMALL,
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def={ingredients={{"tealeaves_dried",4}}},
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HOT_FOOD,
		drinktype = DRINKTYPY.LEAFS,
	},
	
	blacktea_iced =
	{
		test = function(boilier, names, tags) return IsTealeaves_dried(names, tags) and tags.frozen and tags.frozen >= 1 and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 1
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4, --8.25 (41.25)
		thirst = TUNING.HYDRATION_MEDSMALL, --22.5
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_FASTISH, -- 10-> 8일 얼음
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
		drinktype = DRINKTYPY.LEAFS,
	},
	
	-- 동굴 고사리(수인성 질병 해결)
	fuer =
	{
		test = function(boilier, names, tags) return IsFoliage(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, --1
		hunger = 0,
		sanity = TUNING.SANITY_MEDLARGE/4, --7.5 (37.5)
		thirst = TUNING.HYDRATION_MEDSMALL, --22.5
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CURE_WATERBORNE,
		oneatenfn = function(inst, eater)
			if eater.components.debuffable:HasDebuff("waterbornedebuff") then
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_CURE_WATERBORNE"))
				eater.components.debuffable:RemoveDebuff("waterbornedebuff")
			end
		end,
		drinktype = DRINKTYPY.LEAFS,
	},
	
	-- 일반 꽃잎
	hibiscustea =
	{
		test = function(boilier, names, tags) return IsFlower(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL/4, --2 (10)
		hunger = 0,
		sanity = TUNING.SANITY_MED/4, -- 3.75 (18.75)
		thirst = TUNING.HYDRATION_SMALL, -- 11.25 -> 15
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},
	
	--일시적으로 유령으로 만드는 차
	sushibiscus =
	{
		test = function(boilier, names, tags) return IsFlower_Evil(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = -1,
		thirst = 0,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_ABI,
		potlevel = "mid",
		potlevel_bottle = "mid",
		secondaryfoodtype = FOODTYPE.VEGGIE,
		prefabs = { "obebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SUS,
		card_def={ingredients={{"petals_evil",1},{"firenettles",1},{"tillweed",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
			eater:AddDebuff("obebuff", "obebuff")
		end,
		drinktype = DRINKTYPY.LEAFS,
	},

	-- 선인장 꽃잎
	cactusflower_tea =
	{
		test = function(boilier, names, tags) return IsFlower_Cactus(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MED/2, -- 10 (50)
		hunger = TUNING.DRINK_CALORIES/2, --2.5 (12.5)
		sanity = TUNING.SANITY_HUGE/4, -- 12.5 (62.5)
		thirst = TUNING.HYDRATION_MED, --22.5 -> 30
		perishtime = TUNING.PERISH_MED,
		tags = {"leavestype"},
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},
	
	lotustea = {
		test = function(boilier, names, tags) return IsFlower_Lotus(names, tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED/4, -- 5 (25)
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 (41.25)
		thirst = TUNING.HYDRATION_SMALL, -- 15
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
	    prefabs = { "buff_moistureimmunity" },
		tags = {"honeyed"},
	    oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_DRY,
	    oneatenfn = function(inst, eater)
			eater:AddDebuff("buff_moistureimmunity", "buff_moistureimmunity")
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},
	-- 달꽃차
	moon_blossom_tea = {
		test = function(boilier, names, tags) return IsFlower_Moon(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY*2,
		hunger = 0,
		sanity = TUNING.SANITY_HUGE/4, 
		thirst = TUNING.HYDRATION_MEDSMALL,
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
	    prefabs = { "buff_moistureimmunity" },
		tags = {"honeyed"},
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HOT_SANITY_REGEN,
        oneatenfn = function(inst, eater)
			eater:AddDebuff("sweettea_buff", "sweettea_buff")
        end,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},
	-- 특수차
	butterbeer = {
		test = function(boilier, names, tags) return tags.fat and tags.dairy and tags.sweetener and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
        health = TUNING.HEALING_MEDLARGE/5, -- 10 -> 6 (30) -- 버터나 유제품 들어간 요리가 대체로 체력 아니면 정신력을 60 회복하는것에 감안.
        hunger = TUNING.CALORIES_SMALL, -- 9.375 (46.875) -> 12.5 (62.5) -- 버터랑 유제품이 같히 들어가는걸 감안. 그래도 딸기 크레페보다는 회복량이 반토막
        sanity = (TUNING.SANITY_MED*2)/5, -- 0-> 6 (30)
        thirst = TUNING.HYDRATION_TINY, --5.625 -> 7.5
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
	    prefabs = { "butterhunterbuff" },
		tags = {"honeyed"},
	    oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_BUTTERHUNTER,
	    oneatenfn = function(inst, eater)
			eater:AddDebuff("butterhunterbuff", "butterhunterbuff")
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	ruinxocolatl = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked >= 3 and ((names.pepper or 0) + (names.pepper_cooked or 0) >= 1) and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
        health = TUNING.HEALING_MED/4, -- 5 (25)
        hunger = TUNING.DRINK_CALORIES/2, --2.5 (12.5)
        sanity = -TUNING.SANITY_HUGE/2, -- -25 (-125)
        thirst = TUNING.HYDRATION_SMALLTINY, --11.25
        perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_ANCIENT_KNOWLEGEE,
	    oneatenfn = function(inst, eater)
	    	give_tech(inst, eater, 4)
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	hotruincolate = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked >= 2 and (Preference(names, tags) >= 1) and not tags.frozen and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 2,
        health = 0,
        hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
        sanity = TUNING.SANITY_TINY/4, -- 1.875 (9.375)
        thirst = TUNING.HYDRATION_SMALLTINY, --11.25
        perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
	    oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_ANCIENT_KNOWLEGEE_PIECE,
	    oneatenfn = function(inst, eater)
			give_tech(inst, eater, 2)
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	ruincolate_smoothie = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 2 and tags.sweetener and tags.frozen and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 3,
        health = 0,
        hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
        sanity = TUNING.SANITY_TINY/4,  -- 1.875 (9.375)
        thirst = TUNING.HYDRATION_SMALL, --11.25 -> 15
        perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
	    oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_ANCIENT_KNOWLEGEE_PIECE,
	    oneatenfn = function(inst, eater)
			give_tech(inst, eater, 2)
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	tea_ruincolate_latte = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 2 and names.tealeaves and (tags.dairy or tags.milk) end,
		priority = 3,
        health = 0,
        hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
        sanity = (TUNING.SANITY_MED*2)/5, -- 5 -> 6 (30) 유제품 버프
        thirst = TUNING.HYDRATION_TINY, -- 7.5 
        perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
	    oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CONSERVE_KNOWLEGEE,
	    oneatenfn = function(inst, eater)
			add_tech_count(inst, eater, 1)
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
}

local mod_drink = require("modcompats/prepareddrinks_mod")
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

if modlist.te or modlist.ia then
	local sw_drink = mod_drink.sw_drink
	for k,v in pairs(sw_drink) do
		drinks[k] = v
	end
end

if modlist.te or modlist.ia or modlist.hof then
	local coconut_drink = mod_drink.coconut_drink
	for k,v in pairs(coconut_drink) do
		drinks[k] = v
	end
end

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.is_boilbook_recipes = true
    v.boilbook_category = "kettle"
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
