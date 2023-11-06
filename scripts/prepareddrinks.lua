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
		thirst = TUNING.HYDRATION_SMALLTINY,
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
		health = TUNING.HEALING_MEDSMALL/4,
		hunger = TUNING.DRINK_CALORIES/5, --1
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def={ingredients={{"berries",2},{"berries_juicy",2}}},
	},

	fruitjuice =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 3 and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED/4,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_SUPERTINY/4,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	banana_juice =
	{
		test = function(boilier, names, tags) return (names.cave_banana or names.cave_banana_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_LARGE/4,
		hunger = TUNING.CALORIES_TINY/4,
		sanity = TUNING.SANITY_SUPERTINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	pomegranate_juice =
	{
		test = function(boilier, names, tags) return (names.pomegranate or names.pomegranate_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_HUGE/4,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = TUNING.SANITY_SUPERTINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	watermelon_juice = 
	{
		test = function(boilier, names, tags) return (names.watermelon or names.watermelon_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL/4,
		hunger = TUNING.CALORIES_LARGE/4,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	fig_juice =
	{
		test = function(boilier, names, tags) return (names.fig or names.fig_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 3,
		health = TUNING.HEALING_MOREHUGE/4,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	dragonjuice =
	{
		test = function(boilier, names, tags) return (names.dragonfruit or names.dragonfruit_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDLARGE/4,
		hunger = TUNING.CALORIES_LARGE/4,
		sanity = TUNING.SANITY_MED/3,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	glowberryjuice =
	{
		test = function(boilier, names, tags) return (names.wormlight or (names.wormlight_lesser and names.wormlight_lesser >= 2)) and (Preference(names, tags) >= 0.5) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 4,
		health = TUNING.HEALING_MEDSMALL/4,
		hunger = TUNING.DRINK_CALORIES/5,
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL,
		tags = {"lightdrink"},
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
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
		health = TUNING.HEALING_TINY/4,
		hunger = 0,
		sanity = -TUNING.SANITY_SUPERTINY/4,
		thirst = TUNING.HYDRATION_SMALLTINY,
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
		health = TUNING.HEALING_MEDSMALL/4,
		hunger = (TUNING.DRINK_CALORIES/2)/4,
		sanity = TUNING.SANITY_SUPERTINY/4,
		thirst = TUNING.HYDRATION_TINY,
		perishtime = TUNING.PERISH_SUPERFAST,
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
        hunger = TUNING.DRINK_CALORIES/3,
        sanity = TUNING.SANITY_TINY/2,
        thirst = TUNING.HYDRATION_TINY,
        perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CONSERVE_KNOWLEGEE_CAFFINE,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME * 0.5
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
			if eater.components.builder and eater.components.builder.temptechbonus_count then
				eater.components.builder.temptechbonus_count = eater.components.builder.temptechbonus_count + 1
			end
		end,
	},

	-- 야채차(목마름 특화)
	
	carrot_tea =
	{
		test = function(boilier, names, tags) return (names.carrot or names.carrot_cooked) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*1.5)/4,
		hunger = TUNING.DRINK_CALORIES/5,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "high",
		potlevel_bottle = "mid",
		card_def={ingredients={{"carrot",3},{"twigs",1}},},
	},

	veggie_tea =
	{
		test = function(boilier, names, tags) return tags.veggie and not tags.lotus and Preference(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 0,
		health = (TUNING.HEALING_SMALL*2)/4,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = -TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneatenfn = function(inst, eater)
			if eater:HasTag("player") and not eater:HasTag("playermerm") then
				if eater:HasTag("masterchef") then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_EAT","RAW"))
				else
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_EAT","PAINFUL"))
				end
				eater.components.debuffable:RemoveDebuff("waterbornedebuff")
			end
		end
	},

	lumpy_tea = {
		test = function(boilier, names, tags) return (names.potato or names.potato_cooked or names.sweet_potato or names.sweet_potato_cooked or names.kyno_sweetpotato or names.kyno_sweetpotato_cooked or names.mfp_sweetpotato or names.mfp_sweetpotato_cooked) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL/4,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = TUNING.SANITY_MEDLARGE/4,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneatenfn = function(inst, eater)
			eater.components.debuffable:RemoveDebuff("waterbornedebuff")
		end,
	},

	seaweed_shake = 
	{
		test = function(boilier, names, tags) return (names.kelp or names.kelp_cooked or names.kelp_dried or names.seaweed or names.seaweed_cooked or names.seaweed_dried or names.kyno_seaweeds or names.kyno_seaweeds_cooked or names.kyno_seaweeds_dried) and tags.tags.frozen and tags.frozen >= 1 and (Preference(names, tags) >= 0.5) and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/4,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = TUNING.SANITY_MED/4,
		thirst = TUNING.HYDRATION_LARGE,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		potlevel = "high",
		potlevel_bottle = "mid",
		perishtime = TUNING.PERISH_FASTISH,
	},
	
	cactus_tea =
	{
		test = function(boilier, names, tags) return (names.cactus_meat or names.cactus_meat_cooked or names.aloe or names.aloe_cooked or names.kyno_aloe or names.kyno_aloe_cooked or names.mfp_aloe or names.mfp_aloe_cooked ) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/4,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	tomato_juice = {
		test = function(boilier, names, tags) return (names.tomato or names.tomato_cooked or names.tomato_dried) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/4,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "high",
		potlevel_bottle = "mid",
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
		health = TUNING.HEALING_MEDSMALL/4,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/4,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "high",
		prefabs = { "sleepdrinkbuff", "healthregenbuff","honeyed" },
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
		health = TUNING.HEALING_TINY/4,
		hunger = 0,
		sanity = TUNING.SANITY_SMALL/4,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	greentea =
	{
		test = function(boilier, names, tags) return IsTealeaves(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY/4,
		hunger = 0,
		sanity = TUNING.SANITY_MED/4,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	-- 녹차 건조대 말린것
	blacktea =
	{
		test = function(boilier, names, tags) return IsTealeaves_dried(names, tags) and not tags.frozen and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL/4,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def={ingredients={{"tealeaves_dried",4}}},
	},
	
	blacktea_iced =
	{
		test = function(boilier, names, tags) return IsTealeaves_dried(names, tags) and tags.frozen and tags.frozen >= 1 and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL/4,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
	
	-- 동굴 고사리(수인성 질병 해결)
	fuer =
	{
		test = function(boilier, names, tags) return IsFoliage(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL/4,
		hunger = 0,
		sanity = TUNING.SANITY_MEDLARGE/4,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneatenfn = function(inst, eater)
			eater.components.debuffable:RemoveDebuff("waterbornedebuff")
		end,
	},
	
	-- 일반 꽃잎
	hibiscustea =
	{
		test = function(boilier, names, tags) return IsFlower(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL/4,
		hunger = 0,
		sanity = TUNING.SANITY_MED/4,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
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
	},

	-- 선인장 꽃잎
	cactusflower_tea =
	{
		test = function(boilier, names, tags) return IsFlower_Cactus(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MED/2,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_HUGE/4,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "high",
		potlevel_bottle = "mid",
	},
	
	lotustea = {
		test = function(boilier, names, tags) return IsFlower_Lotus(names, tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED/4,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4,
		thirst = TUNING.HYDRATION_SMALL,
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
	},
	-- 특수차
	butterbeer = {
		test = function(boilier, names, tags) return tags.fat and tags.dairy and tags.sweetener and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
        health = TUNING.HEALING_MED/2,
        hunger = TUNING.CALORIES_SMALL/4,
        sanity = 0,
        thirst = TUNING.HYDRATION_SUPERTINY,
		perishtime = TUNING.PERISH_SLOW,
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
	ruinxocolat = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked >= 3 and ((names.pepper or 0) + (names.pepper_cooked or 0) >= 0) and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
        health = TUNING.HEALING_MED/4,
        hunger = TUNING.DRINK_CALORIES/2,
        sanity = -TUNING.SANITY_SMALL,
        thirst = TUNING.HYDRATION_SMALLTINY,
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
        health = TUNING.HEALING_TINY/4,
        hunger = 0,
        sanity = TUNING.SANITY_TINY/4,
        thirst = TUNING.HYDRATION_SMALLTINY,
        perishtime = TUNING.PERISH_SLOW,
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
		priority = 2,
        health = TUNING.HEALING_TINY/4,
        hunger = 0,
        sanity = TUNING.SANITY_TINY/4,
        thirst = TUNING.HYDRATION_SMALLTINY,
        perishtime = TUNING.PERISH_SLOW,
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
		priority = 2,
        health = TUNING.HEALING_SMALL/4,
        hunger = TUNING.DRINK_CALORIES/2,
        sanity = TUNING.SANITY_MED/4,
        thirst = TUNING.HYDRATION_TINY,
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

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.is_boilbook_recipes = true
    v.cookbook_category = "kettle"
    v.no_cookbook = true
end

return drinks
