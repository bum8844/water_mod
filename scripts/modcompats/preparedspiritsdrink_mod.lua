require "utils/water_brew_utils"

local sw_drink = {
	moonway =
	{
		test = function(boilier, names, tags) return names.aurobow and not tags.additives end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits","lightdrink"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		secondaryfoodtype = FOODTYPE.MEAT,
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","wormlight_light" },
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_GLOW,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
           	drink_worm_light_less(inst, eater)
	    end,
	},
}

local coconut_drink = {
	arrack = {
		test = function(boilier, names, tags) return (names.coconut_wine or names.wine_kokonut) and not tags.additives end,
		priority = 1,
		health = TUNING.HEALING_SMALL*2,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_HUGE/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	nut_coconut_brandy = {
		test = function(boilier, names, tags) return (names.coconut_wine or names.wine_kokonut) and names.additive_nut end,
		priority = 2,
		health = TUNING.HEALING_SMALL*2,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_HUGE/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
}

local cf_drink = {
	cherry_bloom_rum = {
		test = function(boilier, names, tags) return names.cherry_bloom_madhu and not tags.additives end,
		priority = 1,
        health = TUNING.HEALING_SMALL*5,
        hunger = TUNING.CALORIES_MEDSMALL/2,
        sanity = TUNING.SANITY_SMALL/3,
        thirst = TUNING.HYDRATION_SMALL,
		tags = {"alcohol","honeyed","spirits"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","buff_bloomyhoney" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_CHERRY_TAFFY,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			if eater.components.health ~= nil and eater.components.hunger ~= nil and eater.components.debuffable ~= nil then
				local poison = eater.components.debuffable:GetDebuff("cherry_beepoisonbuff")
				if eater.components.hunger:GetPercent() <= TUNING.BLOOMYHONEY_HUNGERLIMIT then
					local buff = eater.components.debuffable:AddDebuff("buff_bloomyhoney", "buff_bloomyhoney")
					if buff ~= nil then
						if buff.stacks ~= nil then
							buff.stacks = buff.stacks + (TUNING.BLOOMYHONEY_HEALTHBOOST * 6)
						else
							buff.stacks = TUNING.BLOOMYHONEY_HEALTHBOOST * 6
						end
					end
					--eater.SoundEmitter:PlaySound("cherryforest/bloomyhoney/up")
				elseif eater:HasTag("player") then
					eater.components.talker:Say(GetString(eater, "ANNOUNCE_BLOOMYHONEY_FULL"))
				end
				eater.components.debuffable:RemoveDebuff("cherry_beepoisonbuff")
				if poison ~= nil and poison.stacks then
					poison.stacks = poison.stacks + TUNING.BLOOMYHONEY_POISONSTACK * 6
				end
			end
		end,
	},
}

local unc_drink = {
	giant_blueberry_gin = {
		test = function(boilier, names, tags) return names.giant_blueberry_wine and names.additive_seed end,
		priority = 2,
        health = 0,
        hunger = TUNING.CALORIES_MED,
        sanity = TUNING.SANITY_MEDLARGE,
        thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits","explosive"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	rice_spirits = {
		test = function(boilier, names, tags) return names.rice_wine and not tags.additives end,
		priority = 2,
        health = 0,
        hunger = TUNING.CALORIES_MED,
        sanity = TUNING.SANITY_MEDLARGE,
        thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			if eater.components.hayfever and eater.components.hayfever.enabled then
				eater.components.hayfever:SetNextSneezeTime(1920)
			end
		end,
	}
}

local wheat_drink = {
	wheat_whiskey = {
		test = function(boilier, names, tags) return (names.wheat_beer or names.beer) and not tags.additives end,
		priority = 2,
        health = TUNING.HEALING_SMALL*2,
        hunger = TUNING.CALORIES_MED,
        sanity = TUNING.SANITY_MEDLARGE,
        thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	}
}

local legion_drink = {
	pale_whiskey = {
		test = function(boilier, names, tags) return names.pale_beer and not tags.additives end,
		priority = 2,
        health = TUNING.HEALING_SMALL*2,
        hunger = TUNING.CALORIES_MED,
        sanity = TUNING.SANITY_MEDLARGE,
        thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_DRY,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			eater:AddDebuff("buff_moistureimmunity", "buff_moistureimmunity")
		end,
	}
}

return { sw_drink = sw_drink, coconut_drink = coconut_drink, cf_drink = cf_drink, unc_drink = unc_drink, wheat_drink = wheat_drink, legion_drink = legion_drink }
