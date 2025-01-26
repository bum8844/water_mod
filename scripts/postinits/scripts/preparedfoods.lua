local notmeat = require"utils/water_brew_utils".notmeat
local modlist = require("utils/water_modlist").active_mod_compatibility

local foods = require("preparedfoods")

local water_foods = {
	ruincolate =
	{
		test = function(cooker, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 2 and tags.sweetener and tags.sweetener >= 1 and (tags.fat or tags.dairy or tags.milk or tags.egg ) and ((tags.fat or 0) + (tags.dairy or 0) + (tags.milk or 0) + (tags.egg or 0)) >= 1 end,
		priority = 1,
		weight = 1,
		foodtype = FOODTYPE.GOODIES,
		health = TUNING.HEALING_MEDSMALL*2, -- 16
		hunger = TUNING.CALORIES_TINY*3, -- 25 -> 28.125 ( 2카카오 + 1꿀 수치 )
		perishtime = TUNING.PERISH_PRESERVED, -- 20일
		sanity = TUNING.SANITY_SMALL, -- 10 
		tags = {"cocktail_ingredient"},
		thirst = 0,
		cooktime = 2,
        floater = {"small", 0.05, 0.7},
		card_def = {ingredients = {{"ruincacao_bean_cooked", 3}, {"honey", 1}}},
	},
	ruin_schokakola = {
		test = function(cooker, names, tags) return (names.caffeinberry_bean_cooked or names.coffeebeans_cooked or names.kyno_coffeebeans_cooked or names.mfp_coffeecherry_cooked) and (( names.caffeinberry_bean_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 )) == 1 and names.ruincacao_bean_cooked and names.ruincacao_bean_cooked == 1 and names.moon_cap and names.moon_cap == 1 and (tags.egg or tags.sweetener or tags.fat or tags.dairy or tags.milk ) and ((tags.egg or 0) + (tags.sweetener or 0) + (tags.fat or 0) +  (tags.dairy or 0) + (tags.milk or 0)) >= 1 end,
		priority = 2,
		weight = 1,
		foodtype = FOODTYPE.GOODIES,
		health = TUNING.HEALING_MEDSMALL*3, -- 16 -> 24
		hunger = TUNING.CALORIES_TINY*4.4, -- 18.75  -> 41.25 [꿀+커피+카카오+파란버섯의 총 허기 회복량 = 40.625]
		perishtime = TUNING.PERISH_PRESERVED, --20일
		sanity = TUNING.SANITY_TINY, -- 5
		tags = {"cocktail_ingredient"},
		thirst = 0,
		cooktime = 2,
        floater = {"small", 0.05, 0.7},
		prefabs = { "caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE_SLEEP_RESIST,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
            if eater.components.grogginess ~= nil and
			not (eater.components.health ~= nil and eater.components.health:IsDead()) and
			not eater:HasTag("playerghost") then
				eater.components.grogginess:ResetGrogginess()
            end
		end
	},
	applepine_pie = {
		test = function(cooker, names, tags)  return names.applepin and tags.meat end,
		priority = 1,
		foodtype = FOODTYPE.MEAT,
		health = TUNING.HEALING_LARGE,
		hunger = TUNING.CALORIES_HUGE,
		perishtime = TUNING.PERISH_SLOW,
		sanity = TUNING.SANITY_TINY,
		cooktime = 2,
        floater = {"med", nil, 0.8},
	},
	applepine_fried_rice = {
		test = function(cooker, names, tags) return tags.applepin_cooked and tags.meat and tags.veggie and not tags.inedible end,
		priority = -1,
		foodtype = FOODTYPE.MEAT,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.CALORIES_SMALL*5,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_TINY,
		cooktime = .75,
        potlevel = "high",
        floater = {"small", nil, nil},
	},
	citroyuzu_bbq =
	{
		test = function(cooker, names, tags) return tags.meat and tags.meat == 2 and names.tealeaves and (names.citroyuzu or names.citroyuzu_cooked) end,
		priority = 30,
		foodtype = FOODTYPE.MEAT,
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.CALORIES_LARGE*2,
		perishtime = TUNING.PERISH_MED,
		sanity = TUNING.SANITY_LARGE,
		cooktime = 1,
		potlevel = "high",
		floater = {"med", 0.05, {0.65, 0.6, 0.65}},
	},
}

for k, v in pairs(water_foods) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cookbook_category = "cookpot"
	if modlist.legion and _G.CONFIGS_LEGION.BETTERCOOKBOOK then
    	v.cook_need = nil
    	v.cook_cant = nil
    	v.recipe_count = 1
		local cookbookui_legion = require "modinit/1392778117/cookbookui_legion"
		v.custom_cookbook_details_fn = function(data, self, top, left)
			local root = cookbookui_legion(data, self, top, left)
			return root
		end
    end
	v.overridebuild = "water_cook_pot"
	v.minisign_atlas = "minisign_dehy_items_swap"
end

for k, v in pairs(water_foods) do
	foods[k] = v
end

for k,recipe in pairs (water_foods) do
	AddCookerRecipe("cookpot", recipe)
	AddCookerRecipe("portablecookpot", recipe)
	AddCookerRecipe("archive_cookpot", recipe)

	if recipe.card_def then
		GLOBAL.AddRecipeCard("cookpot", recipe)
	end
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