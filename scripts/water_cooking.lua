local drinks = require("prepareddrinks")
local drinks_warly = require("prepareddrinks_warly")
local ageddrinks = require("preparedageddrinks")
local spiritsdrink = require("preparedspiritsdrink")

for k, recipe in pairs(drinks) do
	AddCookerRecipe("tea_pot", recipe)
	AddCookerRecipe("portable_tea_pot", recipe)

	if recipe.card_def then
		_G.AddRecipeCard("tea_pot", recipe)
	end
end

for k, recipe in pairs(drinks_warly) do
	AddCookerRecipe("portable_tea_pot", recipe)
end

for k, recipe in pairs(ageddrinks) do
	AddCookerRecipe("brewery", recipe)

	if recipe.card_def then
		_G.AddRecipeCard("brewery", recipe)
	end
end

for k, recipe in pairs(spiritsdrink) do
	AddCookerRecipe("distillers", recipe)
end

for k, v in pairs(require("water_spicedfoods")) do
    AddCookerRecipe("portablespicer", v)
end

for k, v in pairs(require("water_spicedfoods_mod")) do
    AddCookerRecipe("portablespicer", v)
end

--스크립트 분리를 위해 별도 기입

local spoiled_drink =
{
	name = "spoiled_drink",
	weight = 1,
	test = function(boilier, names, tags) return true end,
	priority = -2,
	health = -TUNING.HEALING_SMALL,
	hunger = TUNING.SPOILED_HUNGER,
	sanity = TUNING.SANITY_POISON,
	thirst = TUNING.HYDRATION_POISON,
	cooktime = TUNING.INCORRECT_BOIL,
	potlevel = "high",
	potlevel_bottle = "mid",
	OnPutInInventory = function(inst, owner) if owner ~= nil and owner:IsValid() then owner:PushEvent("learncookbookstats", inst.food_basename or inst.prefab) end end,
    is_boilbook_recipes = true,
    cookbook_category = "brewery",
    no_cookbook = true,
}

AddCookerRecipe("brewery", spoiled_drink)
AddBoilBookRecipe(spoiled_drink)

