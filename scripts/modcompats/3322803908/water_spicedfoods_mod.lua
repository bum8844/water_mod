local cooking = require("cooking")
local recipe = cooking.recipes

require("util")

require("tuning")

local foods = {}

local foodlist = {
    "coffee",
    "snakebonesoup",
    "tea",
    "icedtea",
    "gummy_cake",
    "feijoada",
    "steamedhamsandwich",
    "hardshell_tacos",
    "nettlelosange",
    "meated_nettle",
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

-- spice it!
local spicedfoods = GLOBAL.shallowcopy(require("spicedfoods"))
GLOBAL.GenerateSpicedFoods(foods)
local spiced = {}
local new_spicedfoods = require("spicedfoods")

for k,v in pairs(new_spicedfoods) do
    if not new_spicedfoods[k] then
        spiced[k] = v
    end
end
for k,v in pairs(spiced) do
    new_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end

local spiced_waterfoods = GLOBAL.shallowcopy(require("water_spicedfoods"))
GLOBAL.GenerateSpicedFoods_Water(foods)
local water_spiced = {}
local new_water_spicedfoods = require("water_spicedfoods")

for k,v in pairs(new_water_spicedfoods) do
    if not new_water_spicedfoods[k] then
        water_spiced[k] = v
    end
end
for k,v in pairs(water_spiced) do
    new_water_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end