local modlist = require("utils/water_modlist").active_mod_compatibility

-- 기본 물모드 재료
local additives = {
	"additive_seed",
    "additive_nut",
    "additive_dairy",
	"additive_petals",
}

local fruit = {
	"applepine",
	"limon",
	"citroyuzu",
}

local ferment = {
	"refined_dust",
}

AddIngredientValues(ferment, {ferment=1})
AddIngredientValues(additives, {additives=1})

AddIngredientValues({"tea_seed"}, {seed=1})
AddIngredientValues({"tea_seed_cooked"}, {seed=1})
AddIngredientValues({"tealeaves"}, {decoration = 1}, false, true)
<<<<<<< HEAD
=======
AddIngredientValues({"mentha_spicata"}, {decoration = 1})
>>>>>>> Beta_1.2.8
AddIngredientValues({"caffeinberry_bean"}, {fruit=.5}, true)
AddIngredientValues({"caffeinberry_bean_cooked"}, {fruit=1})
AddIngredientValues({"ruincacao_bean_cooked"}, {decoration = 1})

-- 바닐라 재료(모드 호완 관련 패치)

local foliage_ingredient = {veggie = .5, decoration = 1}
local petals_ingredient = {veggie = .5, decoration = 1}
local mushrooms_ingredient = {veggie = .5, mushroom = 1}
local succulent_ingredient = {veggie = .5, decoration = 1}
local cactus_flower_ingredient = {veggie = .5, decoration = 1}
local foliage_cookable = false

local mushrooms =
{
	"red_cap",
	"green_cap",
	"blue_cap",
	"moon_cap",
}

local petals = {
	"petals",
	"petals_evil",
	"moon_tree_blossom",
}

local teaingredients =
{
	"firenettles",
	"tillweed",
}

if modlist.hof then
	foliage_ingredient["veggie"] = .25
	succulent_ingredient["veggie"] = .25
	cactus_flower_ingredient["veggie"] = 1
	cactus_flower_ingredient["cactus_flower"] = 1
	foliage_ingredient["foliage"] = 1
	foliage_cookable = true
elseif modlist.mfp or modlist.te or modlist.ta then
	foliage_ingredient["veggie"] = 1
end


AddIngredientValues(fruit,{fruit = 1},true)
AddIngredientValues(teaingredients, {veggie = .5, decoration = 1})
AddIngredientValues({"foliage"}, foliage_ingredient, foliage_cookable)
AddIngredientValues(mushrooms, mushrooms_ingredient, true)
AddIngredientValues(petals, petals_ingredient)
AddIngredientValues({"cactus_flower"},cactus_flower_ingredient)
AddIngredientValues({"succulent_picked"},succulent_ingredient)
AddIngredientValues({"goatmilk"}, {milk=1, dairy=1})

if modlist.te or modlist.ta then
	AddIngredientValues({"rainbowjellyfish", "rainbowjellyfish_dead", "rainbowjellyfish_cooked"},{fish=1,jellyfish=1,monster=1})
end

if modlist.te or modlist.ia or modlist.ta then
	AddIngredientValues({"coral_brain"}, {meat=1})
end

if modlist.te or modlist.ta or modlist.ac then
<<<<<<< HEAD
	AddIngredientValues({"lotus_flower"}, {veggie=1,lotus=1})
	AddIngredientValues({"lotus_flower_cooked"}, {veggie=1,lotus=1})
=======
	AddIngredientValues({"bramble_bulb"}, {fruit=1})
	AddIngredientValues({"tuber_bloom_crop"}, {veggie=1})
	AddIngredientValues({"tuber_bloom_crop_cooked"}, {veggie=1})
	AddIngredientValues({"lotus_flower"}, {veggie=1,lotus=1})
	AddIngredientValues({"lotus_flower_cooked"}, {veggie=1})
>>>>>>> Beta_1.2.8
end

if modlist.bm then
	AddIngredientValues({"beefalo_milk"}, {milk=1, dairy=.5})
end

if modlist.legion then
	AddIngredientValues({"squamousfruit"}, {veggie=1, monster=1})
end