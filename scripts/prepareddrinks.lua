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
	
	berries_juice = --베리쥬스
	{
		test = function(boilier, names, tags) return (names.berries or  names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked) and tags.fruit and tags.fruit >= 1 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL/2, --4 (20)
		hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25 (56.25)
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		card_def={ingredients={{"berries",2},{"berries_juicy",2}}},
	},

	fruitjuice =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 3 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED/4,  -- 5 (25)
		hunger = TUNING.CALORIES_LARGE/5, -- 4 -> 7.5 (37.5)
		sanity = TUNING.SANITY_SUPERTINY*2, -- 1 -> 2 (10)
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_FASTISH, -- 8일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},

	banana_juice =
	{
		test = function(boilier, names, tags) return (names.cave_banana or names.cave_banana_cooked) and tags.fruit and tags.fruit >= 2 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_LARGE/4, -- 10 (50)
		hunger = TUNING.DRINK_CALORIES, -- 4.6875 -> 5 (25)
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL, --15 (75)
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED, -- 10일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP, -- *따뜻한 음료 언급*
		temperatureduration = TUNING.FOOD_TEMP_BRIEF, -- 5초
		
	},

	pomegranate_juice =
	{
		test = function(boilier, names, tags) return (names.pomegranate or names.pomegranate_cooked) and tags.fruit and tags.fruit >= 2 and  not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_HUGE/4, -- 15 (75)
		hunger = TUNING.DRINK_CALORIES, -- 4 -> 5 (25) -- 재료값 상승으로 버프
		sanity = TUNING.SANITY_SUPERTINY, -- 1 (5)
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},

	watermelon_juice = 
	{
		test = function(boilier, names, tags) return (names.watermelon or names.watermelon_cooked) and tags.fruit and tags.fruit >= 2 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MED/4, -- 5 (25) 
		hunger = TUNING.DRINK_CALORIES, -- 4 -> 5 (25) --재료값 상승으로 버프
		sanity = (TUNING.SANITY_MED*1.5)/5, --2.5 -> 4.5 (22.5) -- 구운 수박 1.5개분 으로 상향
		thirst = TUNING.HYDRATION_MEDSMALL*3, -- 67.5 (327.5)
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP, -- 여름용, 청서작용 
		temperatureduration = TUNING.TOTAL_DAY_TIME/4, -- 하루의 1/4 2분
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD, 
	},
	
	fig_juice =
	{
		test = function(boilier, names, tags) return (names.fig or names.fig_cooked) and ((names.fig or 0)+(names.fig_cooked or 0)) >= 2 and tags.fruit and tags.fruit >= 2 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 3,
		health = TUNING.HEALING_MOREHUGE/4, -- 18.75 (93.75)
		hunger = TUNING.CALORIES_LARGE/5, --  6.25 -> 7.5 (37.5)
		sanity = 0, --피가토니 실직방지 삭제
		thirst = TUNING.HYDRATION_SMALL,  -- 15 (125)
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
	
	dragonjuice = 
	{
		test = function(boilier, names, tags) return (names.dragonfruit or names.dragonfruit_cooked) and tags.fruit and tags.fruit >= 2 and tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDLARGE/4, -- 7.5 (35.5)
		hunger = TUNING.CALORIES_LARGE/5, --  6.25 -> 7.5 (37.5) --재료값 상승으로 버프
		sanity = TUNING.SANITY_TINY, -- 5 (25)
		thirst = TUNING.HYDRATION_MEDSMALL,  -- 22.5 (122.5)
		tags = {"fruittype"},
		perishtime = TUNING.PERISH_SLOW, -- 15일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
	
	glowberryjuice = -- 작은 발광베리 3개 + 꿀 기준 = 체력 12 정신력 -30 허기 46.875
	{
		test = function(boilier, names, tags) return (names.wormlight or names.wormlight_lesser) and ((names.wormlight_lesser or 0)+(names.wormlight_lesser or 0)) >= 3 and Preference(names, tags, nil, 0.5) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 4,
		health = TUNING.HEALING_MEDSMALL/2, -- 4 (20)
		hunger = (TUNING.DRINK_CALORIES*7)/5,  -- 7 (35)
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"lightdrink","fruittype"},
		perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		prefabs = { "wormlight_light_lesser" }, -- 왈리 실직 방지
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
		card_def = {ingredients={{"wormlight_lesser",3},{"honey",1}}},
		oneatenfn = function(inst, eater)
           	drink_worm_light_lesser(inst, eater)
	    end,
	},
	
	caffeinberry_juice =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 )) >= 3 and not tags.veggie and notmeat(tags) and notname(names) end,
		priority = 5,
		health = TUNING.HEALING_TINY, -- 1 (5)
		hunger = 0,
		sanity = -TUNING.SANITY_SUPERTINY, -- -1 (-5)
		thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25 (56.25)
		perishtime = TUNING.PERISH_MED, --10일
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

	-- 야채차(목마름 특화)
	
	carrot_tea = 
	{
		test = function(boilier, names, tags) return ((names.carrot or 0)+(names.carrot_cooked or 0)) >= 2 and tags.veggie and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*1.5)/4, -- 1.125 (5.625)
		hunger = TUNING.DRINK_CALORIES, -- 1-> 5 (25)
		sanity = 0, --0.5 -> 0
		thirst = TUNING.HYDRATION_MED, -- 30 (150)
		tags = {"veggietype"},
		perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "high",
		potlevel_bottle = "mid",
		card_def={ingredients={{"carrot",3},{"twigs",1}},},
		drinktype = DRINKTYPY.VEGGIE,
	},

	veggie_tea =
	{
		test = function(boilier, names, tags) return tags.veggie and not tags.decoration and not tags.lotus and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 0,
		health = TUNING.HEALING_LARGE/4, -- 10 (50) -- 건강 쥬스 이름값, 악연 파밍용으로 갠춘할듯
		hunger = TUNING.CALORIES_SMALL/5, -- 1.25-> 2.5 (12.5) -- 버섯 한개 수준
		sanity = -TUNING.SANITY_LARGE, -- -33 (-165)
		thirst = TUNING.HYDRATION_LARGE,  -- 45 (225)
		tags = {"veggietype"},
		perishtime = TUNING.PERISH_MED, -- 8일 -> 10일 
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

	lumpy_tea = { -- 구운 감자 체력20 허기25
		test = function(boilier, names, tags) return (names.potato or names.potato_cooked or names.sweet_potato or names.sweet_potato_cooked or names.kyno_sweetpotato or names.kyno_sweetpotato_cooked or names.mfp_sweetpotato or names.mfp_sweetpotato_cooked) and ((names.potato or 0)+(names.potato_cooked or 0)+(names.sweet_potato or 0)+(names.sweet_potato_cooked or 0)+(names.kyno_sweetpotato or 0)+(names.kyno_sweetpotato_cooked or 0)+(names.mfp_sweetpotato or 0)+(names.mfp_sweetpotato_cooked or 0)) >= 2 and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_MED*2)/5, -- 5 -> 8 (40) --감자 2개 수준으로 버프
		hunger = TUNING.DRINK_CALORIES*2,  -- 5-> 10 (50)
		sanity = 0,
		thirst = TUNING.HYDRATION_MED, -- 30 (150)
		tags = {"veggietype"},
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/5, --1분 36초 
		perishtime = TUNING.PERISH_MED, -- 10일
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CURE_WATERBORNE,
		oneatenfn = function(inst, eater)
			if eater:HasTag("player") and not eater:HasTag("playerghost") then
				if eater.components.debuffable:HasDebuff("waterbornedebuff") then 
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_CURE_WATERBORNE"))
					eater.components.debuffable:RemoveDebuff("waterbornedebuff")
				end
			end
		end,
		drinktype = DRINKTYPY.VEGGIE,
	},
	
	cactus_tea = -- 구운 선인장 기준/ 체력 1 허기 12.5 정신력 15
	{
		test = function(boilier, names, tags) return (names.cactus_meat or names.cactus_meat_cooked or names.aloe or names.aloe_cooked or names.kyno_aloe or names.kyno_aloe_cooked or names.mfp_aloe or names.mfp_aloe_cooked ) and tags.veggie and tags.veggie > 1 and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/4, -- 1.5(7.5)
		hunger = TUNING.DRINK_CALORIES, -- 5 (25)
		sanity = TUNING.SANITY_LARGE/5, -- 5 -> 6.6 (33)
		thirst = TUNING.HYDRATION_LARGE, -- 45 (225)
		tags = {"veggietype"},
		perishtime = TUNING.PERISH_MED, -- 10일
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, -- 1분
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.VEGGIE,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},

	tomato_juice = { 
		test = function(boilier, names, tags) return (names.tomato or names.tomato_cooked or names.tomato_dried) and tags.veggie and tags.veggie >= 2 and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL/2, -- 4 (20) -- 구운 토마토 체력 +20 
		hunger = TUNING.DRINK_CALORIES, -- 2.5 -> 5 (25)
		sanity = TUNING.SANITY_TINY/4, -- 1.25 (6.25)
		thirst = TUNING.HYDRATION_LARGE, -- 45 (225)
		tags = {"veggietype"},
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.VEGGIE,
		perishtime = TUNING.PERISH_MED, --10일
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
	
	-- 잎&꽃차 종류(정신력 특화)

	-- 꽃을 섞으면 나오는 결과물
	mixflower =
	{
		test = function(boilier, names, tags) return Mix_Tea_Patch(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 0,
		health = TUNING.HEALING_TINY, -- 1 (5) 
		hunger = 0,
		sanity = TUNING.SANITY_SMALL/4, -- 2.25 (11.1)
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_FASTISH, -- 8일
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},
	
	greentea =
	{
		test = function(boilier, names, tags) return IsTealeaves(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 1 (5)
		hunger = 0,
		sanity = (TUNING.SANITY_SUPERTINY*23)/5,  -- 3.75 -> 4.6 (23)
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED, -- 10일
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
		health = TUNING.HEALING_TINY, -- 1 (5)
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 (41.25)
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED, -- 10일
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, --1분
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
		health = TUNING.HEALING_TINY, -- 1 (5)
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 (41.25)
		thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (112.5)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_FASTISH, -- 8일 
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, --1분
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
		drinktype = DRINKTYPY.LEAFS,
	},
	
	-- 동굴 고사리(수인성 질병 해결)
	fuer =
	{
		test = function(boilier, names, tags) return IsFoliage(names, tags) and  notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 1 (5)
		hunger = 0,
		sanity = TUNING.SANITY_MEDLARGE/4, -- 7.5 (37.5)
		thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (112.5)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED, -- 10일
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, --1분
		cooktime = TUNING.KETTLE_TEA,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CURE_WATERBORNE,
		oneatenfn = function(inst, eater)
			if eater:HasTag("player") and not eater:HasTag("playerghost") then
				if eater.components.debuffable:HasDebuff("waterbornedebuff") then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_CURE_WATERBORNE"))
					eater.components.debuffable:RemoveDebuff("waterbornedebuff")
				end
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
		sanity = (TUNING.SANITY_SUPERTINY*23)/5,  -- 3.75 -> 4.6 (23)
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED, -- 10일
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
		perishtime = TUNING.PERISH_MED, -- 10일
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
		test = function(boilier, names, tags) return IsFlower_Cactus(names, tags) and names.cactus_flower >= 1 and tags.veggie and tags.veggie >= 1 and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MED/2, -- 10 (50)
		hunger = TUNING.DRINK_CALORIES, --2.5 -> 5 (25) -- 재료값 상승 버프
		sanity = TUNING.SANITY_HUGE/4, -- 12.5 (62.5)
		thirst = TUNING.HYDRATION_MED, -- 30 (150)
		perishtime = TUNING.PERISH_MED, --10일
		tags = {"leavestype"},
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/5, -- 1분 36초
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "high",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
		drinktype = DRINKTYPY.LEAFS,

	},

	--연꽃차
	lotustea = {
		test = function(boilier, names, tags) return IsFlower_Lotus(names, tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED/4, -- 5 (25)
		hunger = TUNING.CALORIES_SMALL/5, --  2.5 (12.5)
		sanity = TUNING.SANITY_LARGE/4, -- 8.25 (41.25)
		thirst = TUNING.HYDRATION_SMALL, -- 15 (75)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_MED, -- 10일
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
		test = function(boilier, names, tags) return IsFlower_Moon(names, tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY*2, -- 2 (10)
		hunger = 0,
		sanity = TUNING.SANITY_MED, -- 15 (75)
		thirst = TUNING.HYDRATION_MEDSMALL, --22.5 (112.5)
		tags = {"leavestype"},
		perishtime = TUNING.PERISH_SLOW, -- 15일
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP, 
		temperatureduration = TUNING.FOOD_TEMP_BRIEF, -- 5초
	    prefabs = { "sweettea_buff" },
		tags = {"honeyed"},
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HOT_SANITY_REGEN,
        oneatenfn = function(inst, eater)
			eater:AddDebuff("sweettea_buff", "sweettea_buff")
        end,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.LEAFS,
	},

	ruinnibs_tea = { -- 음식값들을 수정해야함
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked <= 3 and tags.sweetener and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
        health = TUNING.HEALING_MED/4, -- 5 (25)
        hunger = (TUNING.CALORIES_LARGE)/5, -- 5 -> 7.5 (37.5) -- 카카오3 + 고추 = 허기 37.5
        sanity = -TUNING.SANITY_HUGE/2, -- -25 (-125)
        thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25 (56.25)
        perishtime = TUNING.PERISH_SLOW, -- 15일
        temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD, 
		temperatureduration = TUNING.TOTAL_DAY_TIME/4, -- 2분
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_ANCIENT_KNOWLEGEE_PIECE,
	    oneatenfn = function(inst, eater)
	    	give_tech(inst, eater, 2)
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	hotruincolate = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 2 and Preference(names,tags,"sweetener",1) and not tags.frozen and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 2,
        health = TUNING.HEALING_SMALL, -- 3 (15) 카카오2 + 꿀 = 체력 13
        hunger = (TUNING.CALORIES_TINY*3)/5, -- 2.5 -> 5.625 (28.125) 카카오+ 꿀 = 허기 28.125
        sanity = TUNING.SANITY_MED/4,  --  3.75 (18.75) 
        thirst = TUNING.HYDRATION_SMALLTINY, --11.25 (56.25)
        perishtime = TUNING.PERISH_MED, -- 10일
        temperature = TUNING.HOT_FOOD_BONUS_TEMP, -- 따듯함
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, -- 1분
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	ruincolate_smoothie = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 2 and Preference(names,tags,"sweetener",1) and tags.frozen and tags.frozen >= 1 and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 3,
        health = TUNING.HEALING_SMALL, -- 3 (15) 카카오2 + 꿀 = 체력 13
        hunger = (TUNING.CALORIES_TINY*3)/5, -- 2.5 -> 5.625 (28.125) 카카오+ 꿀 = 허기 28.125
        sanity = TUNING.SANITY_MED/4,  -- 3.75 (18.75) 
        thirst = TUNING.HYDRATION_SMALL, -- 15 (75) 
        perishtime = TUNING.PERISH_FASTISH, --8일
        temperature = TUNING.COLD_FOOD_BONUS_TEMP, -- 차가움
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, -- 1분
		cooktime = TUNING.KETTLE_DECORATION,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
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

if modlist.te or modlist.ia or modlist.hof or modlist.ta then
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
