modrequire("constants")
modrequire("tuning")
modrequire("stategraphs/SGwell_sprinkler")
modrequire("stategraphs/SGwell_sprinkler_pipes")

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

for k, recipe in pairs(drinks) do
	AddCookerRecipe("kettle", recipe)
	AddCookerRecipe("portablekettle", recipe)
end

for k, recipe in pairs(drinks_fermented) do
	AddCookerRecipe("brewery", recipe)
end
