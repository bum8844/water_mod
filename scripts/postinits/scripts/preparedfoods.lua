local notmeat = require"utils/water_brew_utils".notmeat

local foods = require("preparedfoods")

local water_foods = {
	ruincolate =
	{
		test = function(cooker, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked <= 3 and tags.sweetener and tags.sweetener <= 2 and ((tags.dairy or 0) + (tags.milk or 0) <= 1) and notmeat(tags) and not tags.inedible end,
		priority = 1,
		weight = 1,
		foodtype = FOODTYPE.GOODIES,
		health = TUNING.HEALING_MEDSMALL*2,
		hunger = TUNING.CALORIES_MED,
		perishtime = TUNING.PERISH_PRESERVED,
		sanity = TUNING.SANITY_SMALL,
		thirst = 0,
		cooktime = 2,
        floater = {"small", 0.05, 0.7},
		card_def = {ingredients = {{"ruincacao_bean_cooked", 3}, {"honey", 1}}},
	},
	ruin_schokakola = {
		test = function(cooker, names, tags) return names.ruincacao_bean_cooked and names.ruincacao_bean_cooked <= 2 and names.caffeinberry_bean_cooked and names.moon_cap and names.moon_cap <= 2 and ((tags.sweetener or 0) + (tags.dairy or 0) + (tags.milk or 0) <= 1) and notmeat(tags) and not tags.inedible end,
		priority = 2,
		weight = 1,
		foodtype = FOODTYPE.GOODIES,
		health = TUNING.HEALING_MEDSMALL*2,
		hunger = TUNING.CALORIES_MEDSMALL,
		perishtime = TUNING.PERISH_PRESERVED,
		sanity = TUNING.SANITY_TINY,
		thirst = 0,
		cooktime = 2,
        floater = {"small", 0.05, 0.7},
		prefabs = { "caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE_SLEEP_RESIST,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME * 0.5
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
            if eater.components.grogginess ~= nil and
			not (eater.components.health ~= nil and eater.components.health:IsDead()) and
			not eater:HasTag("playerghost") then
				eater.components.grogginess:ResetGrogginess()
            end
		end
	}
}

for k, v in pairs(water_foods) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cookbook_category = "cookpot"
	v.overridebuild = "water_cook_pot"
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