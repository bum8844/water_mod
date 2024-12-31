require "utils/water_brew_utils"

local drinks =
{
	--재료외 증류시 나올거(치료약으로 쓸예정 꿀반창고 보다 좀더 좋은 력 회복재)
	-- ☆은 증류보너스 ★은 첨가제 보너스
	disinfectant =
	{
		test = function(boilier, names, tags) return true end,
		priority = -2,
		health = TUNING.HEALING_HUGE, -- 60
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
		health = TUNING.HEALING_SMALL*3, -- 9
		hunger = TUNING.CALORIES_TINY*3, -- 28.125
		sanity = TUNING.SANITY_SMALL, -- ☆10
		thirst = TUNING.HYDRATION_MED, -- 30 
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW, -- 40일
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
		health = TUNING.HEALING_SMALL*3, -- 9
		hunger = (TUNING.CALORIES_HUGE/10)*3 + (TUNING.CALORIES_TINY), -- 22.5 + ☆10 = 32.5
		sanity = 0,
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/3, -- 2분 40초
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
		health = (TUNING.HEALING_TINY*5)*3 + (TUNING.HEALING_MED/2), -- 15 + ☆10 = 25
		hunger = TUNING.CALORIES_MEDSMALL, -- 18.75
		sanity = TUNING.SANITY_MED*2, -- 30
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW, --40일
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.TOTAL_DAY_TIME/3, --2분 40초
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
		health = (TUNING.HEALING_SMALL*3)*3 + (TUNING.HEALING_MED/2), -- 27 + ☆10 = 37
		hunger = (TUNING.CALORIES_HUGE/10)*3, -- 22.5
		sanity = (TUNING.SANITY_SMALL/4)*3, --7.5
		thirst = TUNING.HYDRATION_MED, -- 30
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
		health = (TUNING.HEALING_SMALL*6)*3, -- 18
		hunger = TUNING.DRINK_CALORIES*3, -- 15
		sanity = (TUNING.SANITY_SMALL/2)*3 + (TUNING.SANITY_SMALL), -- 22 + ☆10 = 32
		thirst = TUNING.HYDRATION_MED, -- 30 
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
	applepine_brandy =
	{
		test = function(boilier, names, tags) return names.applepine_cider and not tags.additives end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*6)*3, -- 18
		hunger = TUNING.DRINK_CALORIES*3, -- 15
		sanity = (TUNING.SANITY_SMALL/2)*3 + (TUNING.SANITY_SMALL), -- 22 + ☆10 = 32
		thirst = TUNING.HYDRATION_MED, -- 30 
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
		health = (TUNING.HEALING_MEDSMALL*3) + (TUNING.HEALING_MED), -- 24 + ☆10 + ★10 = 44
		hunger = TUNING.DRINK_CALORIES*3, -- 15
		sanity = (TUNING.SANITY_HUGE/4)*3, -- 37.5
		thirst = TUNING.HYDRATION_MED, -- 30
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
		health = (TUNING.HEALING_SMALL)*3 + (TUNING.HEALING_MED), -- 9 + ☆10 + ★10 = 29
		hunger = TUNING.DRINK_CALORIES*3, -- 15
		sanity = (TUNING.SANITY_MED/2)*3, -- 22.5 
		thirst = TUNING.HYDRATION_MED, -- 30 
		tags = {"alcohol","spirits","lightdrink"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","wormlight_light_greater" },
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_GLOW,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
           	drink_worm_light_greater(inst, eater)
	    end,
	},
	-- 우유 증류주
	areuhi = {
		test = function(boilier, names, tags) return names.kumis and not tags.additives end,
		priority = 1,
		health = (TUNING.HEALING_SMALL*12), -- 36
		hunger = (TUNING.CALORIES_MEDSMALL) + (TUNING.CALORIES_TINY), -- 18.75 + ☆9.375 = 28.125
		sanity = (TUNING.SANITY_MED/2)*3, -- 22.5
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","buff_electricattack" },
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
        health = ((TUNING.HEALING_MED/5)*3) + (TUNING.HEALING_MED), -- 12 + ★20 = 32
        hunger = (TUNING.DRINK_CALORIES*3)  + (TUNING.CALORIES_MEDSMALL), -- 15 + ★18.75 = 33.75
        sanity = TUNING.SANITY_SMALL, -- ☆10
        thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol","spirits"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_ANCIENT_KNOWLEGEE_THIRD,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			give_tech(inst, eater, 4, 3)
		end,
	},
	-- 커피 + 꿀술
	kahlua = {
		test = function(boilier, names, tags) return (names.madhu or names.mead) and names.additive_nut end,
		priority = 2,
		health = (TUNING.HEALING_SMALL*3) + (TUNING.HEALING_MED/2) , -- 27 + ☆10 = 37
		hunger = (TUNING.CALORIES_HUGE/10)*3 + (TUNING.CALORIES_TINY), -- 22.5 + ★9.375 = 31.875
		sanity = (TUNING.SANITY_SMALL/4)*3, --7.5
		thirst = TUNING.HYDRATION_MED, --30 
		tags = {"alcohol","spirits","honeyed"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff","caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_CAFFINE,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME * 3
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},
	tea_lumpy_vodka = {
		test = function(boilier, names, tags) return names.lumpy_wine and names.additive_petals end,
		priority = 2,
		health = 0,
		hunger = (TUNING.CALORIES_HUGE/10)*3, -- 21.5
		sanity = TUNING.SANITY_MEDLARGE, -- ☆10 + ★10 = 20
		thirst = TUNING.HYDRATION_MED, -- 30
		tags = {"alcohol","spirits",},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","drunkarddebuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			spirits(inst, eater)
			eater:AddDebuff("sweettea_buff", "sweettea_buff")
		end,
	},

	absinthe = {
		test = function(boilier, names, tags) return (names.wine or names.noblewine or names.wine_berries_juicy or names.wine_berries) and names.additive_seed end,
		priority = 2,
		health = (TUNING.HEALING_SMALL*2)*3 + (TUNING.HEALING_MED), -- 18 +☆10 +★10 =38
		hunger = TUNING.DRINK_CALORIES*3, -- 15,
		sanity = (TUNING.SANITY_MED/2)*3, -- 22.5
		thirst = TUNING.HYDRATION_MED, -- 30
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
		health = (TUNING.HEALING_SMALL*2)*3, -- 18
		hunger = TUNING.DRINK_CALORIES*3, -- 15,
		sanity = (TUNING.SANITY_MED/2)*3 + (TUNING.SANITY_SMALL)*2, -- 22.5 + +☆10 +★10 = 42.5
		thirst = TUNING.HYDRATION_MED, -- 30
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
		health = 0,
		hunger = (TUNING.CALORIES_TINY*3) + (TUNING.CALORIES_TINY), -- 28.125 + ★9.375 = 37.5
		sanity = TUNING.SANITY_SMALL, -- ☆10
		thirst = TUNING.HYDRATION_MED, -- 30
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
		health = (TUNING.HEALING_SMALL*3)*3 + (TUNING.HEALING_MED/2)*3 , -- 27 +☆10 +★20 = 57
		hunger = (TUNING.CALORIES_HUGE/10)*3 + (TUNING.CALORIES_MEDSMALL), -- 22.5 + ★18.75 = 41.25
		sanity = (TUNING.SANITY_SMALL/4)*3,
		thirst = TUNING.HYDRATION_MED, -- 30
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

	void = {
		test = function(boilier, names, tags) return names.midnight_storm end,
		priority = 2,
        health = TUNING.HEALING_LARGE/5, -- 8 (40) ( MFP모드의 오렌지 쥬스 참고함)
        hunger = TUNING.CALORIES_MEDSMALL/5, -- 3.75 (18.75)
        sanity = TUNING.SANITY_TINY, -- 3 (15)
        thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
        tags = {"alcohol","spirits"},
        perishtime = TUNING.PERISH_MED, --10일
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_GOODNIGHTVISION,
		oneatenfn = function(inst, eater)
			eater.gnv_muit = 2
			eater:AddDebuff("goodnightvisionbuff", "goodnightvisionbuff")
			alcohol(inst, eater)
		end,
	},

	citroyuzu_curacao = {
		test = function(boilier, names, tags) return names.citroyuzu_wine end,
		priority = 2,
        health = TUNING.HEALING_LARGE/5, -- 8 (40) ( MFP모드의 오렌지 쥬스 참고함)
        hunger = TUNING.CALORIES_MEDSMALL/5, -- 3.75 (18.75)
        sanity = TUNING.SANITY_TINY, -- 3 (15)
        thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
        tags = {"alcohol","spirits"},
        perishtime = TUNING.PERISH_MED, --10일
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,	
	},

	mentha_spicata_curacao = {
		test = function(boilier, names, tags) return names.mentha_spicata_wine end,
		priority = 2,
        health = TUNING.HEALING_LARGE/5, -- 8 (40) ( MFP모드의 오렌지 쥬스 참고함)
        hunger = TUNING.CALORIES_MEDSMALL/5, -- 3.75 (18.75)
        sanity = TUNING.SANITY_TINY, -- 3 (15)
        thirst = TUNING.HYDRATION_MEDSMALL, -- 22.5 (111)
        tags = {"alcohol","spirits"},
        perishtime = TUNING.PERISH_MED, --10일
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		drinktype = DRINKTYPY.BREWER,
		prefabs = { "alcoholdebuff","drunkarddebuff","resistancebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			alcohol(inst, eater)
		end,	
	},
}

local mod_drink = require("modinit/preparedspiritsdrink_mod")
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

if modlist.hof or modlist.umc then
	local rice_drink = mod_drink.rice_drink
	for k,v in pairs(rice_drink) do
		drinks[k] = v
	end
end

if modlist.te or modlist.ia or modlist.ta then
	local sw_drink = mod_drink.sw_drink
	for k,v in pairs(sw_drink) do
		drinks[k] = v
	end
end

if modlist.te or modlist.ac or modlist.ta then
	local ham_drink = mod_drink.ham_drink
	for k,v in pairs(ham_drink) do
		drinks[k] = v
	end
end

if modlist.te or modlist.ia or modlist.hof or modlist.ta then
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