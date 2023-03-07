local cooking = require("cooking")

require("util")

require("tuning")

local foods_volcano = {
    fruityjuice =
    {
        name = "fruityjuice",
        test = function(cooker, names, tags) return names.blueberries_cooked and names.blueberries_cooked == 2 and names.foliage and tags.frozen or names.blueberries and names.blueberries == 2 and names.foliage and tags.frozen end,
        priority = 1,
        weight = 1,
        foodtype = "VEGGIE",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        sanity = TUNING.SANITY_TINY,
        cooktime = 2,
        floater = {"small", 0.05, 0.7},
        tags = {},
    },

    coffee =
    {
        name = "coffee",
        test = function(cooker, names, tags) return names.coffeebeans_cooked and (names.coffeebeans_cooked == 4 or (names.coffeebeans_cooked == 3 and (tags.dairy or tags.sweetener)))  end,
        priority = 30,
        weight = 1,
        foodtype = "VEGGIE",
        health = 3,
        hunger = 75/8,
        sanity = -5,
        cooktime = .5,
        tags = {},
        cookbook_atlas = "images/inventoryimages/volcanoinventory.xml",
        oneat_desc = "Speeds the body",
    },

    sharkfinsoup =
    {
        name = "sharkfinsoup",
        test = function(cooker, names, tags) return names.shark_fin end,
        priority = 20,
        weight = 1,
        foodtype = "MEAT",
        health = 40,
        hunger = 75/6,
        perishtime = 10*480,
        sanity = -10,
        naughtiness = 10,
        cooktime = 1,
    },

    lobsterdinner =
    {
    name = "lobsterdinner",
        test = function(cooker, names, tags) return (names.lobster_dead or names.wobster_sheller_land or names.lobster_dead_cooked or names.lobster_land) and names.butter and (tags.meat == 1.0) and (tags.fish == 1.0) and not tags.frozen end,
        priority = 25,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_HUGE,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_SLOW,
        sanity = TUNING.SANITY_HUGE,
        cooktime = 1,
        overridebuild = "cook_pot_food3",
        potlevel = "high",
        floater = {"med", 0.05, {0.65, 0.6, 0.65}},
    },

    lobsterbisque =
    {
        name = "lobsterbisque",
        test = function(cooker, names, tags) return (names.lobster_dead or names.lobster_dead_cooked or names.lobster_land or names.wobster_sheller_land) and tags.frozen end,
        priority = 30,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_HUGE,
        hunger = TUNING.CALORIES_MED,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_SMALL,
        cooktime = 0.5,
        overridebuild = "cook_pot_food3",
        potlevel = "high",
        floater = {"med", 0.05, {0.65, 0.6, 0.65}},
    },

    jellyopop =
    {
        name = "jellyopop",
        test = function(cooker, names, tags) return tags.jellyfish and tags.frozen and tags.inedible end,
        priority = 20,
        weight = 1,
        foodtype = "MEAT",
        health = 20,
        hunger = 75/6,
        perishtime = 3*480,
        sanity = 0,
        temperature = -40,
        temperatureduration = 10,
        cooktime = 0.5,
    },

    californiaroll =
    {
        name = "californiaroll",
        test = function(cooker, names, tags) return ((names.kelp or 0) + (names.kelp_cooked or 0) + (names.kelp_dried or 0) + (names.seaweed or 0) + (names.kelp_dried or 0)) == 2 and (tags.fish and tags.fish >= 1) end,
        priority = 20,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_SMALL,
        cooktime = .5,
        overridebuild = "cook_pot_food2",
        potlevel = "high",
        floater = {"med", 0.05, {0.65, 0.6, 0.65}},
    },

    bisque = 
    {
        name = "bisque",
        test = function(cooker, names, tags) return names.limpets and names.limpets == 3 and tags.frozen end,
        priority = 30,
        weight = 1,
        foodtype = "MEAT",
        health = 60,
        hunger = 75/4,
        perishtime = 10*480,
        sanity = 5,
        cooktime = 1,
    },

    caviar =
    {
        name = "caviar",
        test = function(cooker, names, tags) return (names.roe or names.roe_cooked == 3) and tags.veggie end,
        priority = 20,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_SMAL,
        hunger = TUNING.CALORIES_SMALL,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_LARGE,
        cooktime = 2,
    },

    tropicalbouillabaisse =
    {
        name = "tropicalbouillabaisse",
        test = function(cooker, names, tags) return (names.fish3 or names.fish3_cooked) and (names.fish4 or names.fish4_cooked) and (names.fish5 or names.fish5_cooked) and tags.veggie end,
        priority = 35,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_MED,
        cooktime = 2,
        cookbook_atlas = ""  
    },
}

local foods_hamlet = {
    feijoada =
    {
        name = "feijoada",
        test = function(cooker, names, tags) return tags.meat and (names.jellybug == 3) or (names.jellybug_cooked == 3) or
                        (names.jellybug and names.jellybug_cooked and names.jellybug + names.jellybug_cooked == 3) end,
        priority = 30,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_HUGE,
        perishtime = TUNING.PERISH_FASTISH,
        sanity = TUNING.SANITY_MED,
        cooktime = 3.5,
    },

    steamedhamsandwich =
    {
        name = "steamedhamsandwich",
        test = function(cooker, names, tags) return (names.meat or names.meat_cooked) and (tags.veggie and tags.veggie >= 2) and names.foliage end,
        priority = 5,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_LARGE,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_FAST,
        sanity = TUNING.SANITY_MED,
        cooktime = 2,
    },

    hardshell_tacos =
    {
        name = "hardshell_tacos",
        test = function(cooker, names, tags) return (names.weevole_carapace == 2) and  tags.veggie end,
        priority = 1,
        weight = 1,
        foodtype = "VEGGIE",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_SLOW,
        sanity = TUNING.SANITY_TINY,
        cooktime = 1,
    },

    gummy_cake =
    {
        name = "gummy_cake",
        test = function(cooker, names, tags) return (names.slugbug or names.slugbug_cooked) and tags.sweetener end,
        priority = 1,
        weight = 1,
        foodtype = "MEAT",
        health = -TUNING.HEALING_SMALL,
        hunger = TUNING.CALORIES_SUPERHUGE,
        perishtime = TUNING.PERISH_PRESERVED,
        sanity = -TUNING.SANITY_TINY,
        cooktime = 2,   
    },

    tea =
    {
        name = "tea",
        test = function(cooker, names, tags) return tags.filter and tags.filter >= 2 and tags.sweetener and not tags.meat and not tags.veggie and not tags.inedible end,
        priority = 25,
        weight = 1,
        foodtype = "VEGGIE",
        health = TUNING.HEALING_SMALL,
        hunger = TUNING.CALORIES_SMALL,
        perishtime = TUNING.PERISH_ONE_DAY,
        sanity = TUNING.SANITY_LARGE,
        cooktime = 0.5,
    },

    icedtea =
    {
        name = "icedtea",
        test = function(cooker, names, tags) return tags.filter and tags.filter >= 2 and tags.sweetener and tags.frozen end,
        priority = 30,
        weight = 1,
        foodtype = "VEGGIE",
        health = TUNING.HEALING_SMALL,
        hunger = TUNING.CALORIES_SMALL,
        perishtime = TUNING.PERISH_FAST,
        sanity = TUNING.SANITY_LARGE,
        cooktime = 0.5,
    },

    snakebonesoup =
    {
        name = "snakebonesoup",
        test = function(cooker, names, tags) return tags.bone and tags.bone >= 2 and tags.meat and tags.meat >= 2 end,
        priority = 20,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_LARGE,
        hunger = TUNING.CALORIES_MED,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_SMALL,
        cooktime = 1,
    },

    nettlelosange =
    {
        name = "nettlelosange",
        test = function(cooker, names, tags) return tags.antihistamine and tags.antihistamine >= 3  end,
        priority = 0,
        weight = 1,
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_MED,
        perishtime = TUNING.PERISH_FAST,
        sanity = TUNING.SANITY_TINY,
        antihistamine = 720,
        cooktime = .5,
    },
}

local foods_none = {
    spicyvegstinger =
    {
        name = "spicyvegstinger",
        test = function(cooker, names, tags) return (names.asparagus or names.asparagus_cooked or names.radish or names.radish_cooked) and tags.veggie and tags.veggie > 2 and tags.frozen and not tags.meat end,
        priority = 15,
        weight = 1,
        foodtype = "VEGGIE",
        health = TUNING.HEALING_SMALL,
        hunger = TUNING.CALORIES_MED,
        perishtime = TUNING.PERISH_SLOW,
        sanity = TUNING.SANITY_LARGE,   
        cooktime = 0.5,
    },
    butterflymuffin =
    {
        name = "butterflymuffin",
        test = function(cooker, names, tags) return (names.butterflywings or names.butterfly_tropical_wings or names.moonbutterflywings) and not tags.meat and tags.veggie end,
        priority = 1,
        weight = 1,
        foodtype = "VEGGIE",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        sanity = TUNING.SANITY_TINY,
        cooktime = 2,
        floater = {"small", 0.05, 0.7},
        tags = {},
    },
}

for name, recipe in pairs(foods_volcano) do
    recipe.name = name
    recipe.weight = recipe.weight or 1
    recipe.priority = recipe.priority or 0
    recipe.tags = {"volcanoinventory"}
    recipe.cookbook_atlas = "images/inventoryimages/volcanoinventory.xml"
    --recipe.cookbook_category = "cookpot"

    env.AddCookerRecipe("cookpot", recipe, true)
    env.AddCookerRecipe("portablecookpot", recipe, true)
    --env.AddCookerRecipe("archive_cookpot", recipe)
    env.AddCookerRecipe("xiuyuan_cookpot", recipe, true)

    --[[if recipe.card_def then
        GLOBAL.AddRecipeCard("cookpot", recipe)
    end]]
end

for name, recipe in pairs(foods_hamlet) do
    recipe.name = name
    recipe.weight = recipe.weight or 1
    recipe.priority = recipe.priority or 0
    recipe.tags = {"hamletinventory"}
    recipe.cookbook_atlas = "images/inventoryimages/hamletinventory.xml"
    --recipe.cookbook_category = "cookpot"

    env.AddCookerRecipe("cookpot", recipe)
    env.AddCookerRecipe("portablecookpot", recipe)
    --env.AddCookerRecipe("archive_cookpot", recipe)
    env.AddCookerRecipe("xiuyuan_cookpot", recipe)

    --[[if recipe.card_def then
        GLOBAL.AddRecipeCard("cookpot", recipe)
    end]]
end

for name, recipe in pairs(foods_none) do
    recipe.name = name
    recipe.weight = recipe.weight or 1
    recipe.priority = recipe.priority or 0
    --recipe.cookbook_atlas = "images/ia_cookbook.xml"
    recipe.cookbook_category = "cookpot"

    env.AddCookerRecipe("cookpot", recipe)
    env.AddCookerRecipe("portablecookpot", recipe)
    --env.AddCookerRecipe("archive_cookpot", recipe)
    env.AddCookerRecipe("xiuyuan_cookpot", recipe)

    --[[if recipe.card_def then
        GLOBAL.AddRecipeCard("cookpot", recipe)
    end]]
end

local warlyfoods = {
    musselbouillabaise =
    {
        name = "musselbouillabaise",
        test = function(cooker, names, tags) return names.mussel and names.mussel == 2 and tags.veggie and tags.veggie >= 2 end,
        priority = 30,
        weight = 1,
        foodtype = "MEAT",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_MED,
        cooktime = 2,
    },

    sweetpotatosouffle =
    {
        name = "sweetpotatosouffle",
        test = function(cooker, names, tags) return names.sweet_potato and names.sweet_potato == 2 and tags.egg and tags.egg >= 2 end,
        priority = 30,
        weight = 1,
        foodtype = "VEGGIE",
        health = TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_MED,
        sanity = TUNING.SANITY_MED,
        cooktime = 2,
    },
}
----------------------------------------------------------------------------------------

for name, recipe in pairs(warlyfoods) do
    recipe.name = name
    recipe.weight = recipe.weight or 1
    recipe.priority = recipe.priority or 0
    recipe.tags = {"masterfood","volcanoinventory"}
    recipe.cookbook_atlas = "images/inventoryimages/volcanoinventory.xml"
    --recipe.cookbook_category = "portablecookpot"
    env.AddCookerRecipe("portablecookpot", recipe, true)
end

--[[why not support Vanilla spied? ... damm it TE....
GLOBAL.GenerateSpicedFoods(foods_volcano)
GLOBAL.GenerateSpicedFoods(foods_hamlet)
GLOBAL.GenerateSpicedFoods(foods_none)
GLOBAL.GenerateSpicedFoods(warlyfoods)
GLOBAL.GenerateSpicedFoods(require("gorge_foods"))
local te_spiced = {}
local new_spicedfoods = require("spicedfoods")

for k,v in pairs(new_spicedfoods) do
    te_spiced[k] = v
end
for k,v in pairs(te_spiced) do
    --new_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end]]

local spiced_waterfoods = GLOBAL.shallowcopy(require("water_spicedfoods_mod"))
GLOBAL.GenerateSpicedFoods_Water_mod(foods_volcano)
GLOBAL.GenerateSpicedFoods_Water_mod(foods_hamlet)
GLOBAL.GenerateSpicedFoods_Water_mod(foods_none)
GLOBAL.GenerateSpicedFoods_Water_mod(warlyfoods)
GLOBAL.GenerateSpicedFoods_Water_mod(require("gorge_foods"))
local te_water_spiced = {}
local new_water_spicedfoods = require("water_spicedfoods_mod")

for k,v in pairs(new_water_spicedfoods) do
    if not new_water_spicedfoods[k] then
        te_water_spiced[k] = v
    end
end
for k,v in pairs(te_water_spiced) do
    new_water_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end

return water_spicedfoods_mod