local cooking = require("cooking")

require("util")

require("tuning")

local foods = {
    bisque =
    {
        test = function(cooker, names, tags) return names.limpets and names.limpets == 3 and tags.frozen end,
        priority = 30,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_HUGE,
        hunger = TUNING.CALORIES_MEDSMALL,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_TINY,
        cooktime = 1,
        card_def = {ingredients = {{"limpets", 3}, {"ice", 1}} },
    },

    jellyopop =
    {
        test = function(cooker, names, tags) return tags.jellyfish and tags.frozen and names.twigs end,
        priority = 20,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_SMALL,
        perishtime = TUNING.PERISH_SUPERFAST,
        sanity = 0,
        temperature = TUNING.COLD_FOOD_BONUS_TEMP,
        temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
        cooktime = 0.5,
        potlevel = "low",
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
        card_def = {ingredients = {{"jellyfish", 1}, {"ice", 2}, {"twigs", 1}} },
    },

    wobsterbisque =
    {
        test = function(cooker, names, tags) return names.lobster and tags.frozen end,
        priority = 30,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_HUGE,
        hunger = TUNING.CALORIES_MED,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_SMALL,
        cooktime = 0.5,
        potlevel = "low",
    },

    wobsterdinner =
    {
        test = function(cooker, names, tags) return names.lobster and names.butter and not tags.meat and not tags.frozen end,
        priority = 25,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_HUGE,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_SLOW,
        sanity = TUNING.SANITY_HUGE,
        cooktime = 1,
        potlevel = "high",
    },

    sharkfinsoup =
    {
        test = function(cooker, names, tags) return names.shark_fin end,
        priority = 20,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_LARGE,
        hunger = TUNING.CALORIES_SMALL,
        perishtime = TUNING.PERISH_MED,
        sanity = -TUNING.SANITY_SMALL,
        naughtiness = 10,
        cooktime = 1,
        potlevel = "low",
        oneat_desc = "Considered naughty",
        card_def = {ingredients = {{"shark_fin", 1}, {"ice", 3}} },
    },

    coffee =
    {
        test = function(cooker, names, tags) return names.coffeebeans_cooked and (names.coffeebeans_cooked == 4 or (names.coffeebeans_cooked == 3 and (tags.dairy or tags.sweetener)))  end,
        priority = 30,
        -- foodtype = FOODTYPE.VEGGIE,
        foodtype = FOODTYPE.GOODIES, --Taffy and Ice Cream was changed to goodie in DST
        health = TUNING.HEALING_SMALL,
        hunger = TUNING.CALORIES_TINY,
        perishtime = TUNING.PERISH_MED,
        sanity = -TUNING.SANITY_TINY,
        caffeinedelta = TUNING.CAFFEINE_FOOD_BONUS_SPEED,
        caffeineduration = TUNING.FOOD_SPEED_LONG,
        cooktime = 0.5,
        potlevel = "low",
        oneat_desc = "Accelerates movement",
        card_def = {ingredients = {{"coffeebeans_cooked", 3}, {"honey", 1}} },
    },

    tropicalbouillabaisse =
    {
        test = function(cooker, names, tags) return (names.pondpurple_grouper or names.purple_grouper or names.purple_grouper_cooked) and (names.pondpierrot_fish or names.pierrot_fish or names.pierrot_fish_cooked) and (names.pondneon_quattro or names.neon_quattro or names.neon_quattro_cooked) and tags.veggie end,
        priority = 35,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_MED,
        cooktime = 2,
        potlevel = "low",
        boost_dry = true,
        boost_cool = true,
        boost_surf = true,
        oneat_desc = "Cools, accelerates, dries",
        card_def = {ingredients = {{"purple_grouper", 1}, {"neon_quattro", 1}, {"pierrot_fish", 1}, {"seaweed", 1} } },
    },

    caviar =
    {
        test = function(cooker, names, tags) return (names.roe or names.roe_cooked == 3) and tags.veggie end,
        priority = 20,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_SMALL,
        hunger = TUNING.CALORIES_SMALL,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_LARGE,
        cooktime = 2,
        card_def = {ingredients = {{"roe", 1}, {"seaweed", 3}} },
    },
}


for name, recipe in pairs(foods) do
    recipe.name = name
    recipe.weight = recipe.weight or 1
    recipe.priority = recipe.priority or 0
    recipe.cookbook_atlas = "images/ia_cookbook.xml"
    recipe.cookbook_category = "cookpot"

    env.AddCookerRecipe("cookpot", recipe)
    env.AddCookerRecipe("portablecookpot", recipe)
    env.AddCookerRecipe("archive_cookpot", recipe)

    if recipe.card_def then
        GLOBAL.AddRecipeCard("cookpot", recipe)
    end
end

local warlyfoods = {
    sweetpotatosouffle =
    {
        test = function(cooker, names, tags) return (names.sweet_potato and names.sweet_potato == 2) and tags.egg and tags.egg >= 2 end,
        priority = 30,
        foodtype = FOODTYPE.VEGGIE,
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_MED,
        cooktime = 2,
        potlevel = "low",
        tags = { "masterfood" },
    },

    musselbouillabaise =
    {
        test = function(cooker, names, tags) return (names.mussel and names.mussel == 2) and tags.veggie and tags.veggie >= 2 end,
        priority = 30,
        foodtype = FOODTYPE.MEAT,
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_MED,
        cooktime = 2,
        potlevel = "low",
        tags = { "masterfood" },
    },
}
----------------------------------------------------------------------------------------

for name, recipe in pairs(warlyfoods) do
    recipe.name = name
    recipe.weight = recipe.weight or 1
    recipe.priority = recipe.priority or 0
    recipe.cookbook_atlas = "images/ia_cookbook.xml"
    recipe.cookbook_category = "portablecookpot"
    env.AddCookerRecipe("portablecookpot", recipe)
end

-- spice it!
local spicedfoods = GLOBAL.shallowcopy(require("spicedfoods"))
GLOBAL.GenerateSpicedFoods(foods)
GLOBAL.GenerateSpicedFoods(warlyfoods)
local ia_spiced = {}
local new_spicedfoods = require("spicedfoods")

for k,v in pairs(new_spicedfoods) do
    if not spicedfoods[k] then
        ia_spiced[k] = v
    end
end
for k,v in pairs(ia_spiced) do
    new_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end

local spiced_waterfoods = GLOBAL.shallowcopy(require("water_spicedfoods"))
GLOBAL.GenerateSpicedFoods_Water(foods)
GLOBAL.GenerateSpicedFoods_Water(warlyfoods)
local ia_water_spiced = {}
local new_water_spicedfoods = require("water_spicedfoods")

for k,v in pairs(new_water_spicedfoods) do
    if not new_water_spicedfoods[k] then
        ia_water_spiced[k] = v
    end
end
for k,v in pairs(ia_water_spiced) do
    new_water_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end

return water_spicedfoods_mod