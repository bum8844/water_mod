local cooking = require("cooking")
local recipe = cooking.recipes

require("util")

require("tuning")

local foods = {}
local warlyfoods = {}

local foodlist = {
    "bisque",
    "jellyopop",
    "wobsterbisque",
    "wobsterdinner",
    "sharkfinsoup",
    "coffee",
    "tropicalbouillabaisse",
    "caviar",
    "sweetpotatosouffle",
    "musselbouillabaise",
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
GLOBAL.GenerateSpicedFoods_Water_mod(foods)
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