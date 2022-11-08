modrequire("constants")
modrequire("tuning")

--Set mod speeches & strings
modrequire("strings/strings")
modrequire("strings/speech")

--Add actions and componentactions
modrequire("water_actions")
modrequire("water_componentactions")

modrequire("water_containers")
modrequire("recipes")
modrequire("postinits/postinit")

local drinks = require("prepareddrinks")
local drinks_fermented = require("preparedageddrinks")

--AddFertilizerValue
local FERTILIZERS = require("prefabs/fertilizer_nutrient_defs")
FERTILIZERS.FERTILIZER_DEFS.spoiled_drink = {nutrients = TUNING.SPOILED_FOOD_NUTRIENTS}

for k, recipe in pairs(drinks) do
	AddCookerRecipe("kettle", recipe)
	AddCookerRecipe("portablekettle", recipe)
end

for k, recipe in pairs(drinks_fermented) do
	AddCookerRecipe("brewery", recipe)
end
