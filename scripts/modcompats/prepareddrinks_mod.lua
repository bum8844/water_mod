require "utils/water_brew_utils"

local sw_drink = {
	rainbow_shake = {
		test = function(boilier, names, tags) return (names.rainbowjellyfish or names.rainbowjellyfish_cooked or names.rainbowjellyfish_dead) and ((names.rainbowjellyfish or 0) + (names.rainbowjellyfish_cooked or 0) + (names.rainbowjellyfish_dead or 0) >= 1) and onlyrainbowjellyfish(names, tags) and ((names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + (names.coconut_halved or 0) + (names.coconut_cooked or 0) + (names.coconut_milk or 0) >= 1) and tags.frozen and tags.frozen >= 1 and notname(names) and lessthing(names) end,
		priority = 4,
		health = TUNING.HEALING_SMALL, -- 1 -> 3 (15) 해파리 체력회복량 10
		hunger = TUNING.CALORIES_MEDSMALL/4, -- 1 -> 4.6875 (23.4375) 허기회복량 18.75
		sanity = 0,
		thirst = TUNING.HYDRATION_MED, -- 30 (150)
		tags = {"lightdrink"},
		perishtime = TUNING.PERISH_MED, -- 10일
		secondaryfoodtype = FOODTYPE.MEAT,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
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
	quartz_shake = {
		test = function(boilier, names, tags) return ( names.pondpierrot_fish or names.pierrot_fish or names.pierrot_fish_cooked or names.fish4 or names.fish4_cooked ) and ((names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + (names.coconut_halved or 0) + (names.coconut_cooked or 0) + (names.coconut_milk or 0) >= 1) and tags.frozen and tags.frozen >= 1 and onlypierrot_fish(names ,tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_TINY, -- 1 (5) 
		hunger = TUNING.DRINK_CALORIES, -- 5 (25) 
		sanity = -TUNING.SANITY_TINY, -- -5 (-25)
		thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
		perishtime = TUNING.PERISH_FASTISH, --8일
		secondaryfoodtype = FOODTYPE.MEAT,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
	    prefabs = { "buff_moistureimmunity" },
		tags = {"honeyed"},
	    oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_DRY,
	    oneatenfn = function(inst, eater)
			eater:AddDebuff("buff_moistureimmunity", "buff_moistureimmunity")
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
}

local coconut_drink = {
	coconut_juice = {
		test = function(boilier, names, tags) return (names.kyno_kokonut_halved or names.kyno_kokonut_cooked or names.coconut_halved or names.coconut_cooked or names.coconut_milk) and ((names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + (names.coconut_halved or 0) + (names.coconut_cooked or 0) + (names.coconut_milk or 0) >= 2) and tags.fruit >= 1 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
        health = TUNING.HEALING_TINY, -- 1 (5)
        hunger = TUNING.DRINK_CALORIES/2, -- 0.5625 ->2.5 (12.5)
        sanity = 0,
		thirst = TUNING.HYDRATION_LARGE, --45 (125)
		perishtime = TUNING.PERISH_MED, -- 10일
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
}

local cf_drink = {
	cherry_roseberries_tea = {
		test = function(boilier, names, tags) return names.cherry_roseberries and ( names.forgetmelots or names.petals or names.moon_tree_blossom or tags.petals_legion ) and ((names.forgetmelots or 0) + (names.petals or 0) + (names.moon_tree_blossom or 0) + (tags.petals_legion or 0) >= 2) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
        health = TUNING.HEALING_SMALL, -- 3 (15)
        hunger = 0,
        sanity = TUNING.SANITY_HUGE/4, --12.5 (62.5)
        thirst = TUNING.HYDRATION_MEDSMALL, --22.5 (111)
        perishtime = TUNING.PERISH_MED, --10일
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},

	cherry_honey_tea = {
		test = function(boilier, names, tags) return names.cherry_honey and tags.sweetener and tags.sweetener >= 4 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
        health = TUNING.HEALING_MED/2, --10 (50)
        hunger = TUNING.DRINK_CALORIES, --5 (25)
        sanity = 0,
        thirst = TUNING.HYDRATION_SMALL, --15 (75)
        perishtime = TUNING.PERISH_SLOW, --15일
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		tags = {"honeyed"},
        prefabs = { "healthregenbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HEALTH_REGEN,
        oneatenfn = function(inst, eater)
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
        end,
	},
}

local umc_drink = {
	sweet_rice_drink = 	{
		test = function(boilier, names, tags) return (names.rice or names.rice_cooked or names.fwd_in_pdt_food_rice) and ((names.rice or 0) + (names.rice_cooked or 0) + (names.fwd_in_pdt_food_rice or 0)) == 2 and tags.sweetener and tags.frozen and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
        health = TUNING.HEALING_SMALL*2, --0 -> 6 (30) :현재 비타협 헤이 피버가 망가진 상태 및 자원채취의 위험성 고려해서 버프
        hunger = TUNING.DRINK_CALORIES, -- 2.5->5 (25) :쌀바(Riceloaf)의 3/1
        sanity = 0,
        thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
        perishtime = TUNING.PERISH_FASTISH,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.VEGGIE,
		tags = {"honeyed"},
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HAYFEVER_RELIEF_MED,
		oneatenfn = function(inst, eater)
			if eater.components.hayfever and eater.components.hayfever.enabled then
				eater.components.hayfever:SetNextSneezeTime(1440)
			end
		end,
	},
}

local legion_drink = {
	pineananas_juice = {
		test = function(boilier, names, tags) return (names.pineananas or names.pineananas_cooked) and tags.fruit and Preference(names, tags) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags)  end,
		priority = 2,
        health = TUNING.HEALING_HUGE/5, --9.375 -> 12 (60) --바나나와 석류 사이
        hunger = TUNING.CALORIES_MEDSMALL/4, -- 5.625 (28.125)
        sanity = 0,
        thirst = TUNING.HYDRATION_MEDSMALL,  -- 22.5
        perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
}

local mfp_drink = {
	strawberry_smoothie = {
		test = function(boilier, names, tags) return (names.mfp_strawberry or names.mfp_strawberry_cooked) and tags.frozen and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDLARGE/5, -- 6 (30),
        hunger = TUNING.DRINK_CALORIES/4, -- 1.25 (6.25)
        sanity = TUNING.SANITY_TINY, -- 3 (15)
        thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
        perishtime = TUNING.PERISH_MED, -- 10일
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
	strawberry_milk_smoothie = {
		test = function(boilier, names, tags) return (names.mfp_strawberry or names.mfp_strawberry_cooked) and (tags.dairy or tags.milk) and tags.frozen and tags.sweetener end,
		priority = 3,
		health = TUNING.HEALING_LARGE/5, -- 8 (40) (MFP모드의 딸기 라떼 참고함)
        hunger = TUNING.DRINK_CALORIES, -- 5 (25)
        sanity = TUNING.SANITY_LARGE/5, -- 6.6 (33)
        thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
        perishtime = TUNING.PERISH_MED, --10일
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
}

local orange_drink = {
	orange_juice = {
		test = function(boilier, names, tags) return (names.mfp_orange or names.mfp_orange_cooked or names.fwd_in_pdt_food_orange) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
        health = TUNING.HEALING_MEDLARGE/5, -- 6 (30) ( MFP모드의 오렌지 쥬스 참고함)
        hunger = TUNING.CALORIES_MEDSMALL/5, -- 3.75 (18.75)
        sanity = TUNING.SANITY_TINY, -- 3 (15)
        thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
        perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.FRUIT,
	},
}

return { sw_drink = sw_drink, coconut_drink = coconut_drink, cf_drink = cf_drink, umc_drink = umc_drink, legion_drink = legion_drink, mfp_drink = mfp_drink, orange_drink = orange_drink }