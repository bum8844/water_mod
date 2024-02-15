require "utils/water_brew_utils"

local drinks =
{
	--재료외 증류시 나올거(치료약으로 쓸예정 꿀반창고 보다 좀더 좋은 채력 회복재)
	disinfectant =
	{
		test = function(boilier, names, tags) return true end,
		priority = -2,
		health = TUNING.HEALING_HUGE,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		tags = {"disinfectant","common"},
		OnPutInInventory = function(inst, owner) if owner ~= nil and owner:IsValid() then owner:PushEvent("learncookbookstats", inst.food_basename or inst.prefab) end end,
		perishtime = 9000000,
		cooktime = (TUNING.INCORRECT_BOIL + TUNING.BEER_WAIT),
		wet_prefix = STRINGS.WET_PREFIX.WETGOOP,
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.MEDICINE
	},
	-- 증류주(위스키)
	corn_whiskey =
	{
		test = function(boilier, names, tags) return names.corn_beer and not tags.additives end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL/2,
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
	-- 감자, 고구마
	lumpy_vodka = {
		test = function(boilier, names, tags) return names.lumpy_wine and not tags.additives end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	-- 선인장
	tequila = {
		test = function(boilier, names, tags) return names.pulque and not tags.additives end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	-- 증류주(럼)
	madhu_rum =
	{
		test = function(boilier, names, tags) return (names.madhu or names.mead) and not tags.additives end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL*3,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits","honeyed"},
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
	-- 베리류
	berry_brandy =
	{
		test = function(boilier, names, tags) return (names.wine or names.noblewine or names.wine_berries_juicy or names.wine_berries) and not tags.additives end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	-- 스파클링 와인
	berry_gin = {
		test = function(boilier, names, tags) return names.sparklingwine and names.additive_seed end,
		priority = 2,
		health = TUNING.HEALING_SMALL*2,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_HUGE/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	-- 발광 배리
	glowberry_gin =
	{
		test = function(boilier, names, tags) return (names.glowberrywine or names.wine_glowberry) and names.additive_seed end,
		priority = 2,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits","lightdrink"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","wormlight_light" },
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_GLOW,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
           	drink_worm_light_less(inst, eater)
	    end,
	},
	-- 우유 증류주
	areuhi = {
		test = function(boilier, names, tags) return names.kumis and not tags.additives end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_ELECTRIC_ATTACK,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			eater:AddDebuff("buff_electricattack", "buff_electricattack")
		end,
	},
	-- 리큐르 - 카카오 와인
	ruincacao_cream_liqueur = {
		test = function(boilier, names, tags) return names.ruincacao_wine and names.additive_dairy end,
		priority = 2,
        health = TUNING.HEALING_MED/2,
        hunger = TUNING.CALORIES_MEDSMALL,
        sanity = 0,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_ANCIENT_KNOWLEGEE_THIRD,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			give_tech(inst, eater, 4, 2)
		end,
	},
	-- 커피 + 꿀술
	kahlua = {
		test = function(boilier, names, tags) return (names.madhu or names.mead) and names.additive_nut end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL*3,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits","honeyed"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_CAFFINE,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME * 2
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},
	tea_lumpy_vodka = {
		test = function(boilier, names, tags) return names.lumpy_wine and names.additive_petals end,
		priority = 2,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits",},
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
	absinthe = {
		test = function(boilier, names, tags) return (names.wine or names.noblewine or names.wine_berries_juicy or names.wine_berries) and names.additive_seed end,
		priority = 2,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	petals_berry_brandy = {
		test = function(boilier, names, tags) return (names.wine or names.noblewine or names.wine_berries_juicy or names.wine_berries) and names.additive_petals end,
		priority = 2,
		health = 0,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
		end,
	},
	nut_corn_whiskey = {
		test = function(boilier, names, tags) return names.corn_beer and names.additive_nut end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL/2,
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
	rumchata = {
		test = function(boilier, names, tags) return (names.madhu or names.mead) and names.additive_dairy end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL*3,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_SMALL/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol","spirits","honeyed"},
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

local mod_drink = require("modcompats/preparedspiritsdrink_mod")
local modlist = require("utils/water_modlist")

if modlist.cf then
	local cf_drink = mod_drink.cf_drink
	for k,v in pairs(cf_drink) do
		drinks[k] = v
	end
end
if modlist.unc then
	local unc_drink = mod_drink.unc_drink
	for k,v in pairs(unc_drink) do
		drinks[k] = v
	end
end
if modlist.legion then
	local legion_drink = mod_drink.legion_drink
	for k,v in pairs(legion_drink) do
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

if modlist.hof or modlist.mfp then
	local wheat_drink = mod_drink.wheat_drink
	for k, v in pairs(wheat_drink) do
		drinks[k] = v
	end
end

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
	v.drinktype = v.drinktype or DRINKTYPY.SPIRITS

    v.is_boilbook_recipes = true
    v.boilbook_category = "distillers"
    v.no_cookbook = true
end

return drinks