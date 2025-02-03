require "utils/water_brew_utils"

local drinks = {

}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC

    v.is_boilbook_recipes = true
    v.boilbook_category = "cocktail_maker"
    if modlist.legion and _G.CONFIGS_LEGION.BETTERCOOKBOOK then
    	v.cook_need = nil
    	v.cook_cant = nil
    	v.recipe_count = 4
		local cookbookui_legion = require "modcompats/1392778117/cookbookui_legion"
		v.custom_cookbook_details_fn = function(data, self, top, left)
			local root = cookbookui_legion(data, self, top, left)
			return root
		end
    end
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC
    v.no_cookbook = true
end

return drinks