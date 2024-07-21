local cooking = require("cooking")
--local gorge_recipes = require("gorge_foods")
local recipe = cooking.recipes

require("util")

require("tuning")

local foods_volcano = {}
local foods_hamlet = {}
local foods_te = {}
local foods_citd = {}
local warlyfoods = {}

local foods_volcano_list = {
    "coffee",
    "sharkfinsoup",
    "lobsterdinner",
    "lobsterbisque",
    "jellyopop",
    "californiaroll",
    "bisque",
    "caviar",
    "tropicalbouillabaisse",
}

local foods_hamlet_list = {
    "feijoada",
    "steamedhamsandwich",
    "hardshell_tacos",
    "gummy_cake",
    "tea",
    "icedtea",
    "snakebonesoup",
    "nettlelosange",
    "spicyvegstinger",
    "meated_nettle",
}

local foods_te_list = {
    "butterflymuffin",
    "meated_nettle",
    "peach_smoothie",
    "peach_kabobs",
    "peachy_meatloaf",
    "caramel_peach",
    "peach_juice_bottle_green",
    "potion_bottle_green",
    "peach_custard",
}

local foods_citd_list = {
    "sponge_cake",
    "fish_n_chips",
    "tuna_muffin",
    "tentacle_sushi",
    "flower_sushi",
    "fish_sushi",
    "seajelly",
}

local warlyfoodlist = {
    "musselbouillabaise",
    "sweetpotatosouffle",
}

for _, spicefoods in pairs(foods_volcano_list) do
    for cooker, tablev in pairs(recipe) do
        for food, value in pairs(tablev) do
            if spicefoods == food then
                foods_volcano[food] = value
            end
        end
    end
end

for _, spicefoods in pairs(foods_hamlet_list) do
    for cooker, tablev in pairs(recipe) do
        for food, value in pairs(tablev) do
            if spicefoods == food then
                foods_hamlet[food] = value
            end
        end
    end
end

for _, spicefoods in pairs(foods_te_list) do
    for cooker, tablev in pairs(recipe) do
        for food, value in pairs(tablev) do
            if spicefoods == food then
                foods_te[food] = value
            end
        end
    end
end

for _, spicefoods in pairs(foods_citd_list) do
    for cooker, tablev in pairs(recipe) do
        for food, value in pairs(tablev) do
            if spicefoods == food then
                foods_citd[food] = value
            end
        end
    end
end

for _, spicefoods in pairs(warlyfoodlist) do
    for cooker, tablev in pairs(recipe) do
        for food, value in pairs(tablev) do
            if spicefoods == food then
                warlyfoods[food] = value
            end
        end
    end
end

for name, recipe in pairs(foods_volcano) do
    recipe.tetype = "volcano"
end

for name, recipe in pairs(warlyfoods) do
    recipe.tetype = "volcano"
end

for name, recipe in pairs(foods_hamlet) do
    recipe.tetype = "hamlet"
end

for name, recipe in pairs(foods_te) do
    if recipe.name == "butterflymuffin" then
        recipe.tetype = "normal"
    end
end

for name, recipe in pairs(foods_citd) do
    recipe.tetype = "citd"
end

--[[for name, recipe in pairs(gorge_recipes) do
    recipe.tetype = "gorge"
    recipe.overridebuild = "preparedfood_gorge"
end]]

--[[why not support Vanilla spied? ... damm it TE....]]
GLOBAL.GenerateSpicedFoods(foods_volcano)
GLOBAL.GenerateSpicedFoods(foods_hamlet)
GLOBAL.GenerateSpicedFoods(foods_te)
GLOBAL.GenerateSpicedFoods(warlyfoods)
--GLOBAL.GenerateSpicedFoods(require("gorge_foods"))
local te_spiced = {}
local new_spicedfoods = require("spicedfoods")

for k,v in pairs(new_spicedfoods) do
    te_spiced[k] = v
end
for k,v in pairs(te_spiced) do
    --new_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end

local spiced_waterfoods = GLOBAL.shallowcopy(require("water_spicedfoods_mod"))
GLOBAL.GenerateSpicedFoods_Water_mod(foods_volcano)
GLOBAL.GenerateSpicedFoods_Water_mod(foods_hamlet)
GLOBAL.GenerateSpicedFoods_Water_mod(foods_te)
GLOBAL.GenerateSpicedFoods_Water_mod(foods_citd)
GLOBAL.GenerateSpicedFoods_Water_mod(warlyfoods)
--GLOBAL.GenerateSpicedFoods_Water_mod(gorge_recipes)
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