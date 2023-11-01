require "tuning"

local drinks = require("prepareddrinks")
local ageddrinks = require("preparedageddrinks")
local spiritsdrink = require("preparedspiritsdrink")

local boilbook_recipes = {}

function AddBoilBookRecipe(recipe)
	if recipe.cookbook_category and recipe.is_boilbook_recipes then
		if not boilbook_recipes[recipe.cookbook_category] then
			boilbook_recipes[recipe.cookbook_category] = {}
		end
		if not boilbook_recipes[recipe.cookbook_category][recipe.name] then
			boilbook_recipes[recipe.cookbook_category][recipe.name] = recipe
		end
	end
end

for k, recipe in pairs(drinks) do
	AddBoilBookRecipe(recipe)
end

for k, recipe in pairs(ageddrinks) do
	AddBoilBookRecipe(recipe)
end

for k, recipe in pairs(spiritsdrink) do
	AddBoilBookRecipe(recipe)
end

return { boilbook_recipes = boilbook_recipes }