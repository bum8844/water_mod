require "utils/water_brew_utils"

local sw_drink = {
	rainbow_shake = {
		test = function(boilier, names, tags) return onlyrainbowjellyfish(names, tags) and ((names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + (names.coconut_halved or 0) + (names.coconut_cooked or 0) + (names.coconut_milk or 0) >= 1) and tags.frozen and tags.frozen >= 1 and notname(names) and lessthing(names) end,
		priority = 4,
		health = TUNING.HEALING_MEDSMALL/4,
		hunger = TUNING.DRINK_CALORIES/5,
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL,
		tags = {"lightdrink"},
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
		card_def = {ingredients={{"wormlight_lesser",3},{"honey",1}}},
		oneatenfn = function(inst, eater)
           	if eater.wormlight ~= nil then
	            if eater.wormlight.prefab == "wormlight_light_greater" then
	                eater.wormlight.components.spell.lifetime = 0
	                eater.wormlight.components.spell:ResumeSpell()
	                return
	            else
	                eater.wormlight.components.spell:OnFinish()
	            end
	        end

	        local light = SpawnPrefab("wormlight_light_greater")
	        light.components.spell:SetTarget(eater)
	        if light:IsValid() then
	            if light.components.spell.target == nil then
	                light:Remove()
	            else
	    	        light.components.spell:StartSpell()
	            end
	        end
	    end,
	},
	quartz_shake = {
		test = function(boilier, names, tags) return ( names.pondpierrot_fish or names.pierrot_fish or names.pierrot_fish_cooked or names.fish4 or names.fish4_cooked ) and ((names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + (names.coconut_halved or 0) + (names.coconut_cooked or 0) + (names.coconut_milk or 0) >= 1) and tags.frozen and tags.frozen >= 1 and onlypierrot_fish(names ,tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED/4,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/4,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
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
		test = function(boilier, names, tags) return ((names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + (names.coconut_halved or 0) + (names.coconut_cooked or 0) or (names.coconut_milk or 0) >= 2) and tags.fruit and tags.fruit >= 1 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
        health = TUNING.HEALING_TINY/4,
        hunger = (TUNING.DRINK_CALORIES/2)/4,
        sanity = 0,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_FASTISH,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "high",
		potlevel_bottle = "mid",
	},
}

local cf_drink = {
	cherry_roseberries_tea = {
		test = function(boilier, names, tags) return names.cherry_roseberries and ( names.forgetmelots or names.petals or names.moon_tree_blossom ) and ((names.forgetmelots or 0) + (names.petals or 0) + (names.moon_tree_blossom or 0) >= 2) and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
        health = TUNING.HEALING_SMALL/4,
        hunger = 0,
        sanity = (TUNING.SANITY_HUGE/4)/4,
        thirst = TUNING.HYDRATION_MEDSMALL,
        perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "high",
		potlevel_bottle = "mid",
	},
	cherry_honey_tea = {
		test = function(boilier, names, tags) return names.cherry_honey and tags.sweetener and tags.sweetener >= 4 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
        health = (TUNING.HEALING_MED/2)/4,
        hunger = TUNING.DRINK_CALORIES/4,
        sanity = (TUNING.SANITY_HUGE/4)/4,
        thirst = TUNING.HYDRATION_SMALL,
        perishtime = TUNING.PERISH_SLOW,
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

local unc_drink = {
	sweet_rice_drink = 	{
		test = function(boilier, names, tags) return names.rice_cooked and names.rice_cooked == 2 and tags.sweetener and tags.frozen and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 2,
        health = 0,
        hunger = (TUNING.DRINK_CALORIES/2)/4,
        sanity = 0,
        thirst = TUNING.HYDRATION_SMALL,
        perishtime = TUNING.PERISH_FASTISH,
		temperature = TUNING.COLD_FOOD_CHILLING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		tags = {"honeyed"},
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HAYFEVER_RELIEF_MED,
		oneatenfn = function(inst, eater)
			if eater.components.hayfever and eater.components.hayfever.enabled then
				eater.components.hayfever:SetNextSneezeTime(1440)
			end
		end,
	},
}

return { sw_drink = sw_drink, coconut_drink = coconut_drink, cf_drink = cf_drink, unc_drink = unc_drink }