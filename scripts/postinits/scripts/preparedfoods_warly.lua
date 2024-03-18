local water_brew_utils = require"utils/water_brew_utils"
local modlist = require("utils/water_modlist").active_mod_compatibility

local notmeat = water_brew_utils.notmeat
local give_tech = water_brew_utils.give_tech
local add_tech_count = water_brew_utils.add_tech_count

local foods = require("preparedfoods_warly")

local water_foods = {
	dark_ruincolate =
	{
		test = function(cooker, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 3 and names.nightmarefuel and names.nightmarefuel == 1 end,
		priority = 1,
		weight = 1,
		foodtype = FOODTYPE.GOODIES,
		health = TUNING.HEALING_MEDSMALL*4, -- 32
		hunger = TUNING.CALORIES_MEDSMALL, -- 22.5
		perishtime = TUNING.PERISH_PRESERVED, --20일 
		sanity = -TUNING.SANITY_MED, -- -15
		thirst = 0,
		cooktime = 2,
        floater = {"small", 0.05, 0.7},
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_ANCIENT_KNOWLEGEE_THIRD,
		oneatenfn = function(inst, eater)
			give_tech(inst, eater, 4, 2)
		end
	},
	white_ruincolate = {
		test = function(cooker, names, tags) return names.ruincacao_bean_cooked and tags.fat and (tags.dairy or tags.milk) and (((tags.dairy or 0) + (tags.milk or 0)) - tags.fat) > 0 and tags.sweetener end,
		priority = 2,
		weight = 1,
		foodtype = FOODTYPE.GOODIES, 
		health = TUNING.HEALING_MEDSMALL*7, -- 16 -> 56 (버터+ 꿀 + 카카오 + 우유 = 51)
		hunger = TUNING.CALORIES_MEDSMALL*3, -- 18.75 -> 56.25 (재료총합 =56.25)
		perishtime = TUNING.PERISH_PRESERVED, --20일
		sanity = TUNING.SANITY_MEDLARGE, -- 5 -> 20 (우유 10)
		thirst = 0,
		cooktime = 2,
        floater = {"small", 0.05, 0.7},
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CONSERVE_KNOWLEGEE_HUGE,
		oneatenfn = function(inst, eater)
			add_tech_count(inst, eater, 6)
		end
	}
}

for k, v in pairs(water_foods) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cookbook_category = "cookpot"
    if modlist.legion and _G.CONFIGS_LEGION.BETTERCOOKBOOK then
    	v.cook_need = nil
    	v.cook_cant = nil
    	v.recipe_count = 0
		local cookbookui_legion = require "modcompats/1392778117/cookbookui_legion"
		v.custom_cookbook_details_fn = function(data, self, top, left)
			local root = cookbookui_legion(data, self, top, left)
			return root
		end
    end
	v.overridebuild = "water_cook_pot"
end

for k, v in pairs(water_foods) do
	foods[k] = v
end

for k,recipe in pairs (water_foods) do
	AddCookerRecipe("portablecookpot", recipe)
end

local spicedfoods = GLOBAL.shallowcopy(require("spicedfoods"))
GLOBAL.GenerateSpicedFoods(water_foods)
local spiced = {}
local new_spicedfoods = require("spicedfoods")
for k,v in pairs(new_spicedfoods) do
    if not spicedfoods[k] then
        spiced[k] = v
    end
end
for k,v in pairs(spiced) do
    AddCookerRecipe("portablespicer", v)
end

return foods