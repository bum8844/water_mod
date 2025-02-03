require "tuning"

local drinks = require("prepareddrinks")
local drinks_warly = require("prepareddrinks_warly")
local ageddrinks = require("preparedageddrinks")
local spiritsdrink = require("preparedspiritsdrink")

local boilbook_recipes = {}

function AddBoilBookRecipe(recipe)
	if recipe.boilbook_category and recipe.is_boilbook_recipes then
		if not boilbook_recipes[recipe.boilbook_category] then
			boilbook_recipes[recipe.boilbook_category] = {}
		end
		if not boilbook_recipes[recipe.boilbook_category][recipe.name] then
			boilbook_recipes[recipe.boilbook_category][recipe.name] = recipe
		end
	end
end

for k, recipe in pairs(drinks) do
	AddBoilBookRecipe(recipe)
end

for k, recipe in pairs(drinks_warly) do
	AddBoilBookRecipe(recipe)
end

for k, recipe in pairs(ageddrinks) do
	AddBoilBookRecipe(recipe)
end

for k, recipe in pairs(spiritsdrink) do
	AddBoilBookRecipe(recipe)
end

local function GetRecipe(boillier, product)
	local recipes = boilbook_recipes[boillier] or {}
	return recipes[product]
end

return { boilbook_recipes = boilbook_recipes, GetRecipe = GetRecipe }