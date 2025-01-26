local drinks = require("prepareddrinks")
local drinks_warly = require("prepareddrinks_warly")
local ageddrinks = require("preparedageddrinks")
local spiritsdrink = require("preparedspiritsdrink")
local cocktail = require("preparedcocktaildrink")
local cocktail_warly = require("preparedcocktaildrink_warly")

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

for k, recipe in pairs(cocktail) do
	AddCookerRecipe("cobbler_shaker",recipe)
	AddCookerRecipe("boston_shaker",recipe)
end

for k, recipe in pairs(cocktail_warly) do
	AddCookerRecipe("boston_shaker",recipe)
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

local goopydrink = 
{
	name = "goopydrink",
	weight = 1,
	test = function(boilier, names, tags) return true end,
	priority = -2,
	health = 0,
	hunger = 0,
	sanity = 0,
	thirst = TUNING.HYDRATION_SMALLTINY, -- 11.25
	perishtime = TUNING.PERISH_FAST, 
	cooktime = TUNING.INCORRECT_BOIL,
	wet_prefix = STRINGS.WET_PREFIX.WETGOOP,
	potlevel = "high",
	potlevel_bottle = "mid",
	no_cookbook = true,
	is_boilbook_recipes = true,
	cookbook_category = "tea_pot"
}

local table_goopydrink = {
	"tea_pot",
	"portable_tea_pot",
	"cobbler_shaker",
	"boston_shaker",
}

AddCookerRecipe("brewery", spoiled_drink)
for k, v in pairs(table_goopydrink) do
	AddCookerRecipe(v, goopydrink)
end
AddBoilBookRecipe(spoiled_drink)
AddBoilBookRecipe(goopydrink)

