local drinks = modrequire("prepareddrinks")
local ageddrinks = modrequire("preparedageddrinks")

for k, recipe in pairs(drinks) do
	AddCookerRecipe("kettle", recipe)
	AddCookerRecipe("portablekettle", recipe)
end

for k, recipe in pairs(ageddrinks) do
	AddCookerRecipe("brewery", recipe)
end

for k, v in pairs(require("water_spicedfoods")) do
    AddCookerRecipe("portablespicer", v)
end

for k, v in pairs(require("water_spicedfoods_mod")) do
    AddCookerRecipe("portablespicer", v)
end

--스크립트 분리를 위해 별도 기입
local spoiled_drink =
{
	name = "spoiled_drink",
	weight = 1,
	test = function(boilier, names, tags) return true end,
	priority = -2,
	health = -TUNING.HEALING_SMALL,
	hunger = TUNING.SPOILED_HUNGER,
	sanity = TUNING.SANITY_POISON,
	thirst = TUNING.HYDRATION_POISON,
	cooktime = TUNING.INCORRECT_BOIL,
	potlevel = "high",
	potlevel_bottle = "mid",
	cookbook_category = "cookpot",
}

AddCookerRecipe("brewery", spoiled_drink)
