require "utils/water_brew_utils"

local sw_drink = {
	aurobow =
	{
		test = function(boilier, names, tags) return (names.rainbowjellyfish or names.rainbowjellyfish_cooked or names.rainbowjellyfish_dead) and ((names.rainbowjellyfish or 0) + (names.rainbowjellyfish_cooked or 0) + (names.rainbowjellyfish_dead or 0) >= 3) and onlyrainbowjellyfish(names, tags) and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_TINY, -- 9.375 [45] (180)
		sanity = TUNING.SANITY_MED/2, -- 7.5 [37.5] (150)
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol","lightdrink"},
		perishtime = TUNING.PERISH_PRESERVED, --20일
		secondaryfoodtype = FOODTYPE.MEAT,
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff","wormlight_light" },
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_GLOW,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
			drink_worm_light_less(inst, eater)
	    end,
	},
}

local ham_drink = {
	nettle_wine = {
		test = function(boilier, names, tags) return tags.antihistamine and tags.antihistamine >= 3 and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_TINY, -- 9.375 [45] (180)
		sanity = TUNING.SANITY_MED/2, -- 7.5 [37.5] (150)
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol","lightdrink"},
		perishtime = TUNING.PERISH_PRESERVED, --20일
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		antihistamine = 0,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		cooktime = (TUNING.KETTLE_TEA + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
	    end,	
	}
}

local coconut_drink = {
	coconut_wine = {
		test = function(boilier, names, tags) return (names.kyno_kokonut_halved or names.kyno_kokonut_cooked or names.coconut_halved or names.coconut_cooked or names.coconut_milk) and (names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + ((names.coconut_halved or 0) + (names.coconut_cooked or 0) or (names.coconut_milk or 0)) == 4 end,
		priority = 1,
		health = TUNING.HEALING_SMALL, -- 3 [15] (60)
		hunger = TUNING.CALORIES_TINY, -- 9.375 [45] (180)
		sanity = TUNING.SANITY_HUGE/4, -- 12.5 [63.5] (250)
		thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		temperature = TUNING.COLD_FOOD_BONUS_TEMP, 
		temperatureduration = TUNING.TOTAL_DAY_TIME/8, -- 1분
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, --20일
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	},
}

local cf_drink = {
	cherry_doctor_cola = {
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 )+ (names.coffeebeans_cooked or 0)) >= 1 and tags.ferment and tags.ferment >= 1 and names.royal_jelly and names.royal_jelly >= 1 and (names.cherry or names.cherry_cooked) and (names.cherry or 0) + (names.cherry_cooked or 0) >=1 end,
		priority = 5,
		health = TUNING.HEALING_SMALL*5, -- 15 [75] (300)  
		hunger = TUNING.CALORIES_MEDSMALL/4, -- 4.6875 [21.637] (93.75)
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
		end,
	},
	cherry_bloom_madhu = {
		test = function(boilier, names, tags) return names.cherry_honey and names.cherry_honey == 3 and ( names.forgetmelots or names.petals or names.moon_tree_blossom or tags.petals_legion ) and ((names.forgetmelots or 0)+(names.petals or 0)+(names.moon_tree_blossom or 0)+(tags.petals_legion or 0) == 1) end,
		priority = 2,
        health = TUNING.HEALING_MED/2, -- 7.5-> 10 [50] (200) 꿀술보다 구린걸 더 낫게 조정
        hunger = TUNING.CALORIES_TINY, -- 4.6875 -> 9.375 [45] (180) 
        sanity = TUNING.SANITY_SMALL/4, --1.666 -> 2.5 [12.5] (50) 
        thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol","honeyed"},
		perishtime = TUNING.PERISH_PRESERVED, --20일
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff","buff_bloomyhoney" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_CHERRY_TAFFY,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
			if eater.components.health ~= nil and eater.components.hunger ~= nil and eater.components.debuffable ~= nil then
				local poison = eater.components.debuffable:GetDebuff("cherry_beepoisonbuff")
				if eater.components.hunger:GetPercent() <= TUNING.BLOOMYHONEY_HUNGERLIMIT then
					local buff = eater.components.debuffable:AddDebuff("buff_bloomyhoney", "buff_bloomyhoney")
					if buff ~= nil then
						if buff.stacks ~= nil then
							buff.stacks = buff.stacks + (TUNING.BLOOMYHONEY_HEALTHBOOST * 3)
						else
							buff.stacks = TUNING.BLOOMYHONEY_HEALTHBOOST * 3
						end
					end
					--eater.SoundEmitter:PlaySound("cherryforest/bloomyhoney/up")
				elseif eater:HasTag("player") then
					eater.components.talker:Say(GetString(eater, "ANNOUNCE_BLOOMYHONEY_FULL"))
				end
				eater.components.debuffable:RemoveDebuff("cherry_beepoisonbuff")
				if poison ~= nil and poison.stacks then
					poison.stacks = poison.stacks + TUNING.BLOOMYHONEY_POISONSTACK * 3
				end
			end
		end,
	},
}

local umc_drink = {
	giant_blueberry_wine = 
	{
		test = function(boilier, names, tags) return names.giant_blueberry and names.giant_blueberry >= 2 and names.zaspberry and names.zaspberry >= 1 and not tags.veggie and notmeat(tags) and notname(names) end,
		priority = 2,
        health = TUNING.HEALING_MEDLARGE/6, -- 0-> 5 [25] (100) -- 붐베리2 + 자스베리1 고려
        hunger = TUNING.CALORIES_MED/2, -- 12.5 [62.5] (250)
        sanity = TUNING.SANITY_SMALL, -- 10 [50] (200) 
        thirst = TUNING.HYDRATION_MED, -- 30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, --20일
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
}

local rice_drink = {
	rice_wine = 
	{
		test = function(boilier, names, tags) return (names.rice or names.rice_cooked or names.kyno_rice or names.kyno_rice_cooked or names.fwd_in_pdt_food_rice) and ((names.rice or 0) + (names.kyno_rice or 0) + (names.kyno_rice_cooked or 0) + (names.rice_cooked or 0) + (names.fwd_in_pdt_food_rice or 0) >= 3) and notmeat(tags) and notname(names) end,
		priority = 2,
		health = TUNING.HEALING_SMALL*2, -- 0 -> 6 (30) [120]
		hunger = TUNING.CALORIES_TINY, -- 9.375 [45] (180)
		sanity = TUNING.SANITY_MED/2,-- 7.5 (37.5) (150)
		thirst = TUNING.HYDRATION_MED, --30 [150] (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_HAYFEVER_RELIEF_HUGE,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
			if eater.components.hayfever and eater.components.hayfever.enabled then
				eater.components.hayfever:SetNextSneezeTime(1440)
			end
		end,
	},
}

local wheat_drink = {
	wheat_beer = {
		test = function(boilier, names, tags) return (names.kyno_wheat or names.kyno_wheat_cooked or names.wheat or names.wheat_cooked or names.mfp_wheat or names.mfp_wheat_cooked) and ((names.kyno_wheat or 0) + (names.kyno_wheat_cooked or 0) + (names.wheat or 0) + (names.wheat_cooked or 0) + (names.mfp_wheat or 0) + (names.mfp_wheat_cooked or 0)) >= 3 and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL, -- 3 [15] (60) 
		hunger = TUNING.CALORIES_TINY, -- 9.375 [46.875] (187.5)
		sanity = TUNING.SANITY_HUGE/4, --12.5 [61] (250)
		thirst = TUNING.HYDRATION_MED,  -- 30 (150) (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,
	}
}

local legion_drink = {
	pale_beer = {
		test = function(boilier, names, tags) return names.squamousfruit and names.squamousfruit >= 3 and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL, -- 3 [15] (60)
		hunger = TUNING.CALORIES_TINY, -- 9.375 [46.875] (187.5)
		sanity = TUNING.SANITY_HUGE/4, --12.5 [61] (250)
		thirst = TUNING.HYDRATION_MED,  -- 30 (150) (600)
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_DRY,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
            if eater.components.moisture ~= nil then
                eater.components.moisture:DoDelta(-25)
            end
		end,
	},
}

local mfp_drink = {
	strawberrysoda =
	{
		test = function(boilier, names, tags) return tags.ferment and tags.ferment == 1 and tags.sweetener and tags.sweetener >= 1 and (names.mfp_strawberry or names.mfp_strawberry_cooked) and ((names.mfp_strawberry or 0) + (names.mfp_strawberry_cooked or 0)) == 2 and notname(names) and lessthing(names) end,
		priority = 4,
		health = TUNING.HEALING_SMALL*3, -- 9 [45] (180)
		hunger = TUNING.CALORIES_SMALL/2, --  6.25 [31.25] (125)
		sanity = TUNING.SANITY_MED/2, -- 7.5 [37.5] (150) 
		thirst = TUNING.HYDRATION_LARGE, -- 45 [225] (900)
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG, --15초
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
}

return { sw_drink = sw_drink, ham_drink = ham_drink, coconut_drink = coconut_drink, cf_drink = cf_drink, umc_drink = umc_drink , wheat_drink = wheat_drink, legion_drink = legion_drink, mfp_drink = mfp_drink, rice_drink = rice_drink}
