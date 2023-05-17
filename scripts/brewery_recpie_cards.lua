local recipe_cards = {}
function AddRecipeCard_Brewery(cooker, recipe)
	table.insert(recipe_cards, {recipe_name = recipe.name, cooker_name = cooker})
end

return {recipe_cards = recipe_cards}