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
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","wormlight_light" },
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_GLOW,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
           	if eater.wormlight ~= nil then
	            if eater.wormlight.prefab == "wormlight_light" then
	                eater.wormlight.components.spell.lifetime = 0
	                eater.wormlight.components.spell:ResumeSpell()
	                return
	            else
	                eater.wormlight.components.spell:OnFinish()
	            end
	        end
	        local light = SpawnPrefab("wormlight_light")
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
}

local coconut_drink = {
	arrack = {
		test = function(boilier, names, tags) return names.coconut_wine and not tags.additives end,
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
}

local cf_drink = {
	cherry_bloom_rum = {
		test = function(boilier, names, tags) return names.cherry_bloom_wine and not tags.additives end,
		priority = 1,
        health = TUNING.HEALING_SMALL*5,
        hunger = TUNING.CALORIES_MEDSMALL/2,
        sanity = TUNING.SANITY_SMALL/3,
        thirst = TUNING.HYDRATION_SMALL,
		tags = {"alcohol","honeyed","spirits"},
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
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
		test = function(boilier, names, tags) return names.giant_blueberry_wine and tags.seed end,
		priority = 2,
        health = -TUNING.HEALING_MED,
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
        health = -TUNING.HEALING_MED,
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
			if eater.components.hayfever and eater.components.hayfever.enabled then
				eater.components.hayfever:SetNextSneezeTime(1920)
			end
		end,
	}
}

return { sw_drink = sw_drink, coconut_drink = coconut_drink, cf_drink = cf_drink, unc_drink = unc_drink }
