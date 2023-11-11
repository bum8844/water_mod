require "utils/water_brew_utils"

local sw_drink = {
	aurobow =
	{
		test = function(boilier, names, tags) return ((names.rainbowjellyfish or 0) + (names.rainbowjellyfish_cooked or 0) + (names.rainbowjellyfish_dead or 0) >= 3) and onlyrainbowjellyfish(names, tags) and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL/2,
		sanity = TUNING.SANITY_MED/2,
		thirst = TUNING.HYDRATION_MED,
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
}

local coconut_drink = {
	coconut_wine = {
		test = function(boilier, names, tags) return ((names.kyno_kokonut_halved or 0) + (names.kyno_kokonut_cooked or 0) + (names.coconut_halved or 0) + (names.coconut_cooked or 0) or (names.coconut_milk or 0) >= 2) and tags.fruit and tags.fruit >= 1 and not tags.veggie and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/2,
		hunger = TUNING.CALORIES_MEDSMALL/2,
		sanity = (TUNING.SANITY_HUGE/2)/2,
		thirst = TUNING.HYDRATION_MED,
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
}

local cf_drink = {
	cherry_doctor_cola = {
		test = function(boilier, names, tags) return ( names.caffeinberry_bean_cooked or names.kyno_coffeebeans_cooked or names.mfp_coffeecherry_cooked ) and (names.cherry or names.cherry_cooked) and tags.ferment and names.royal_jelly end,
		priority = 5,
		health = (TUNING.HEALING_MED/2)/2,
		hunger = TUNING.CALORIES_MEDSMALL/2,
		sanity = TUNING.SANITY_LARGE/2,
		thirst = TUNING.HYDRATION_MOREHUGE,
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "healthregenbuff","caffeinbuff","honeyed" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLA,
		oneatenfn = function(inst, eater)
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},
	cherry_bloom_madhu = {
		test = function(boilier, names, tags) return names.cherry_honey and names.cherry_honey == 3 and ( names.forgetmelots or names.petals or names.moon_tree_blossom or tags.petals_legion ) and notmeat(tags) and notname(names) end,
		priority = 2,
        health = (TUNING.HEALING_SMALL*5)/2,
        hunger = (TUNING.CALORIES_MEDSMALL/2)/2,
        sanity = (TUNING.SANITY_SMALL/3)/2,
        thirst = TUNING.HYDRATION_SMALL,
		tags = {"alcohol","honeyed"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
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

local unc_drink = {
	giant_blueberry_wine = 
	{
		test = function(boilier, names, tags) return name.giant_blueberry and names.giant_blueberry >= 2 and names.viperfruit and names.viperfruit >= 1 and not tags.veggie and notmeat(tags) and notname(names) end,
		priority = 2,
        health = -TUNING.HEALING_MED/2,
        hunger = TUNING.CALORIES_MED/2,
        sanity = TUNING.SANITY_MEDLARGE/2,
        thirst = TUNING.HYDRATION_MED,
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
	rice_wine = 
	{
		test = function(boilier, names, tags) return names.rice_cooked and names.rice_cooked == 3 and names.greenfoliage and notmeat(tags) and notname(names) end,
		priority = 2,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL/2,
		sanity = TUNING.SANITY_MED/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
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
		test = function(boilier, names, tags) return ((names.kyno_wheat or 0) + (names.kyno_wheat_cooked or 0) + (names.wheat or 0) + (names.wheat_cooked or 0) or (names.mfp_wheat or 0) or (names.mfp_wheat_cooked) >= 2) and tags.veggie and tags.veggie >= 1 and not tags.fruit and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/2,
		hunger = TUNING.CALORIES_MEDSMALL/2,
		sanity = (TUNING.SANITY_HUGE/2)/2,
		thirst = TUNING.HYDRATION_MED,
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
	}
}

local legion_drink = {
	pale_beer = {
		test = function(boilier, names, tags) return names.squamousfruit and names.squamousfruit >= 2 and notmeat(tags) and notname(names) and lessthing(names) and notages(tags) end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*2)/2,
		hunger = TUNING.CALORIES_MEDSMALL/2,
		sanity = (TUNING.SANITY_HUGE/2)/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_NAG_AURA_RESIST_DRY,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
            if eater.components.moisture ~= nil then
                eater.components.moisture:DoDelta(-100)
            end
		end,
	}
}

--[[local mfp_drink = {}]]

return { sw_drink = sw_drink, coconut_drink = coconut_drink, cf_drink = cf_drink, unc_drink = unc_drink , wheat_drink = wheat_drink, legion_drink = legion_drink } --, mfp_drink = mfp_drink}