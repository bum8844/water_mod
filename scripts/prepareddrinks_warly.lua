require "utils/water_brew_utils"

local drinks =
{
	toffee_latte = { -- 2커피 1버치넛 1전기우유 기준/ 체력 4 정신력 10 허기 41.625
		test = function(boilier, names, tags) return tags.seed and (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 )) > 1 and (tags.dairy or tags.milk) end,
		priority = 6,
		health = TUNING.HEALING_MEDSMALL/2, -- 4 (20)
		hunger = TUNING.CALORIES_TINY, -- 9.375 (46.875)
		sanity = (TUNING.SANITY_MED*2)/5, -- 6 (30)
		thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25 (56.25)
		perishtime = TUNING.PERISH_MED, -- 10일
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

	ruincha_latte = { -- 1커피 1카카오 1꿀 1전기우유 기준/ 체력 11 정신력 10 허기 21.875
		test = function(boilier, names, tags) return tags.sweetener and (names.caffeinberry_bean_cooked or names.kyno_coffeebeans_cooked or names.coffeebeans_cooked or names.mfp_coffeecherry_cooked ) and (tags.dairy or tags.milk) and names.ruincacao_bean_cooked end,
		priority = 6,
        health = TUNING.HEALING_MEDLARGE/5, -- 6 (30)
        hunger = (TUNING.DRINK_CALORIES*7)/5,  -- 7 (35)
        sanity = (TUNING.SANITY_MED*2)/5, -- 6 (30) 
        thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25 (56.25)
        perishtime = TUNING.PERISH_MED, -- 10일
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
	tea_ruincolate_latte = {
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 2 and names.tealeaves and (tags.dairy or tags.milk) end,
		priority = 3,
        health = TUNING.HEALING_MEDSMALL/2, -- 4 (20) 카카오2 + 우유 = 체력 13 + 유제품 버프
        hunger = TUNING.CALORIES_LARGE/5, -- 2.5 -> 7.5 (37.5) -- 재료값에 맞게 버프
        sanity = TUNING.SANITY_MEDLARGE/4, -- 5 -> 7.5 (37.5) 유제품 버프
        thirst = TUNING.HYDRATION_TINY, -- 7.5 (37.5)
        perishtime = TUNING.PERISH_MED, --10일
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
	    oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CONSERVE_KNOWLEGEE,
	    oneatenfn = function(inst, eater)
			add_tech_count(inst, eater, 1)
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	--두리안 쉐이크(조정 해야함)
	durian_shake = {
		test = function(boilier, names, tags) return (names.durian or names.durian_cooked) and ((names.durian or 0)+(names.durian_cooked or 0)) == 1 and (tags.milk or tags.dairy) and ((tags.milk or 0)+(tags.dairy or 0)) == 1 and tags.frozen and tags.sweetener end,
		priority = 2,
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
	seaweed_shake = 
	{
		test = function(boilier, names, tags) return (names.kelp or names.kelp_cooked or names.kelp_dried or names.seaweed or names.seaweed_cooked or names.seaweed_dried or names.kyno_seaweeds or names.kyno_seaweeds_cooked or names.kyno_seaweeds_dried) and tags.frozen and tags.frozen >= 1 and Preference(names, tags) and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MED/4,   -- 5 (25)
		hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
		sanity = -TUNING.SANITY_TINY, -- -5 (-25)
		thirst = TUNING.HYDRATION_MED*2, --  60 (300)
		tags = {"veggietype"},
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/5, -- 1분 36초
		potlevel = "high",
		potlevel_bottle = "mid",
		perishtime = TUNING.PERISH_FAST, -- 6일
		drinktype = DRINKTYPY.VEGGIE,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
	mulled =  --만들기 어렵다는점을 감안해서 버프
	{
		test = function(boilier, names, tags) return (names.berries or  names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked) and ((names.berries or 0)+(names.berries_cooked or 0)+(names.berries_juicy or 0)+(names.berries_juicy_cooked or 0)) == 1 and (names.onion or names.onion_cooked or names.garlic or names.garlic_cooked) and (( names.onion or 0 ) + ( names.onion_cooked or 0 ) + ( names.garlic or 0 ) + ( names.garlic_cooked or 0 )) == 2 and tags.sweetener and tags.sweetener >= 1 end,
		priority = 2,
		health = TUNING.HEALING_MED, -- 20 (100) 
		hunger = TUNING.DRINK_CALORIES, -- 5 (25)
		sanity = TUNING.SANITY_TINY/4, -- 1.25 (6.25)
		thirst = TUNING.HYDRATION_MED, --30 (150)
		tags = {"honeyed","veggietype"},
		perishtime = TUNING.PERISH_SLOW, -- 15일 --양파와 마늘의 방부효과
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/4, -- 2분 
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

	-- 특수차
	butterbeer = { --크레페보다 만들기 어렵기에 버프/ 크레페: 체+60 정+15 허기+150 (재료:버터,과일,꿀)
		test = function(boilier, names, tags) return tags.fat and (tags.dairy or tags.milk) and (((tags.dairy or 0) + (tags.milk or 0)) - tags.fat) > 0 and tags.sweetener and tags.egg end,
		priority = 1,
        health = TUNING.HEALING_HUGE/5, -- 12 (60) -- 버터+ 우유+ 꿀 = 46
        hunger = TUNING.CALORIES_HUGE/5, -- 12.5 -> 15 (75)
        sanity = (TUNING.SANITY_MED*2)/5, -- 6 (30)
        thirst = TUNING.HYDRATION_TINY, -- 7.5
		perishtime = TUNING.PERISH_SLOW, -- 15일
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
		test = function(boilier, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked >= 3 and ((names.pepper or 0) + (names.pepper_cooked or 0)) >= 1 and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
        health = TUNING.HEALING_MED/4, -- 5 (25)
        hunger = (TUNING.CALORIES_LARGE)/5, -- 5 -> 7.5 (37.5) -- 카카오3 + 고추 = 허기 37.5
        sanity = -TUNING.SANITY_HUGE/2, -- -25 (-125)
        thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25 (56.25)
        perishtime = TUNING.PERISH_SLOW, -- 15일
        temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD, 
		temperatureduration = TUNING.TOTAL_DAY_TIME/4, -- 2분
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_ANCIENT_KNOWLEGEE,
	    oneatenfn = function(inst, eater)
	    	give_tech(inst, eater, 4)
	    end,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	applepine_cappuccion	= {
		test = function(boilier, names, tags) return (names.kelp or names.kelp_cooked or names.kelp_dried or names.seaweed or names.seaweed_cooked or names.seaweed_dried or names.kyno_seaweeds or names.kyno_seaweeds_cooked or names.kyno_seaweeds_dried) and tags.frozen and tags.frozen >= 1 and Preference(names, tags) and notmeat(tags) and notname(names) and lessthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MED/4,   -- 5 (25)
		hunger = TUNING.DRINK_CALORIES/2, -- 2.5 (12.5)
		sanity = -TUNING.SANITY_TINY, -- -5 (-25)
		thirst = TUNING.HYDRATION_MED*2, --  60 (300)
		tags = {"veggietype"},
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/5, -- 1분 36초
		potlevel = "high",
		potlevel_bottle = "mid",
		perishtime = TUNING.PERISH_FAST, -- 6일
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
}

local mod_drink = require("modinit/prepareddrinks_mod")
local modlist = require("utils/water_modlist").active_mod_compatibility

if modlist.te or modlist.ia or modlist.ta then
	local sw_drink = mod_drink.sw_drink
	for k,v in pairs(sw_drink) do
		drinks[k] = v
	end
end

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.is_boilbook_recipes = true
    v.boilbook_category = "portable_tea_pot"
	v.cookbook_atlas = "images/cookbookimages/tea_cookbookimage_drinks.xml"
	v.cookbook_tex = k..".tex"
    if modlist.legion and _G.CONFIGS_LEGION.BETTERCOOKBOOK then
    	v.cook_need = nil
    	v.cook_cant = nil
    	v.recipe_count = 4
		local cookbookui_legion = require "modinit/1392778117/cookbookui_legion"
		v.custom_cookbook_details_fn = function(data, self, top, left)
			local root = cookbookui_legion(data, self, top, left)
			return root
		end
    end
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC
    v.no_cookbook = true
end

return drinks
