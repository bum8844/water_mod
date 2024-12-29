local cooking = require("cooking")
local recipe = cooking.recipes

require("util")

require("tuning")

local foods = {}
local warlyfoods = {}

local foodlist = {
    "fwd_in_pdt_food_scrambled_eggs_with_tomatoes",
    "fwd_in_pdt_food_eggplant_casserole",
    "fwd_in_pdt_food_gifts_of_nature",
    "fwd_in_pdt_food_snake_skin_jelly",
    "fwd_in_pdt_food_atractylodes_macrocephala_pills",
    "fwd_in_pdt_food_pinellia_ternata_pills",
    "fwd_in_pdt_food_aster_tataricus_l_f_pills",
    "fwd_in_pdt_food_red_mushroom_soup",
    "fwd_in_pdt_food_green_mushroom_soup",
    "fwd_in_pdt_food_cooked_milk",
    "fwd_in_pdt_food_coffee",
    "fwd_in_pdt_food_saline_medicine",
    "fwd_in_pdt_food_yogurt_ice_cream",
    "fwd_in_pdt_food_cooked_rice",
    "fwd_in_pdt_food_bread",
    "fwd_in_pdt_food_congee_with_meat_and_thousand_year_old_eggs",
    "fwd_in_pdt_food_protein_powder",
    "fwd_in_pdt_food_mixed_potato_soup",
    "fwd_in_pdt_food_steamed_orange_with_honey",
    "fwd_in_pdt_food_tofu",
    "fwd_in_pdt_food_mango_ice_drink",
}

for _, spicefoods in pairs(foodlist) do
    for cooker, tablev in pairs(recipe) do
        for food, value in pairs(tablev) do
            if spicefoods == food then
                foods[food] = value
            end
        end
    end
end

for name, recipe in pairs(foods) do
    recipe.basename = "png"
end


--[[local spicedfoods = GLOBAL.shallowcopy(require("spicedfoods"))
GLOBAL.GenerateSpicedFoods(foods)
GLOBAL.GenerateSpicedFoods(warlyfoods)
local fwd_spiced = {}
local new_spicedfoods = require("spicedfoods")

for k,v in pairs(new_spicedfoods) do
    if not spicedfoods[k] then
        fwd_spiced[k] = v
    end
end
for k,v in pairs(fwd_spiced) do
    new_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end]]

local spiced_waterfoods = GLOBAL.shallowcopy(require("water_spicedfoods"))
GLOBAL.GenerateSpicedFoods_Water_mod(foods)
GLOBAL.GenerateSpicedFoods_Water_mod(warlyfoods)
local fwd_water_spiced = {}
local new_water_spicedfoods = require("water_spicedfoods")

for k,v in pairs(new_water_spicedfoods) do
    if not new_water_spicedfoods[k] then
        fwd_water_spiced[k] = v
    end
end
for k,v in pairs(fwd_water_spiced) do
    new_water_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end