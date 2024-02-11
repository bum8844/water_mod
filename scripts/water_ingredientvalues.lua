local hof, te, ia, legion, mfp, beefalo_milk = false, false, false, false, false, false

for k,mod_id in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do 
	if mod_id == "workshop-2334209327" then
		hof = true
	end
	if mod_id == "workshop-1505270912" then
		te = true
	end
	if mod_id == "workshop-1467214795" then
		ia = true
	end
	if mod_id == "workshop-1392778117" then
		legion = true
	end
	if mod_id == "workshop-436654027" or mod_id == "workshop-1277605967" or mod_id == "workshop-2431867642" or mod_id == "workshop-1935156140" then
		beefalo_milk = true
	end
end

-- 기본 물모드 재료
local additives = {
	"additive_seed",
    "additive_nut",
    "additive_dairy",
	"additive_petals",
}

local ferment = {
	"refined_dust",
}

AddIngredientValues(ferment, {ferment=1})
AddIngredientValues(additives, {additives=1})

AddIngredientValues({"tealeaves"}, {decoration = 1}, false, true)
AddIngredientValues({"caffeinberry_bean"}, {fruit=.5}, true)
AddIngredientValues({"caffeinberry_bean_cooked"}, {fruit=1})
AddIngredientValues({"ruincacao_bean_cooked"}, {decoration = 1})

-- 바닐라 재료(모드 호완 관련 패치)

local foliage_ingredient = {decoration = 1}
local petals_ingredient = {decoration = 1}
local mushrooms_ingredient = {veggie = .5, mushroom = 1}
local succulent_ingredient = {veggie = .5, decoration = 1}
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

if hof then
	foliage_ingredient["veggie"] = .25
	mushrooms_ingredient["veggie"] = .25
	succulent_ingredient["veggie"] = .25
	foliage_ingredient["foliage"] = 1
	foliage_cookable = true
elseif mfp then
	foliage_ingredient["veggie"] = 1
else
	petals_ingredient["veggie"] = .5
	foliage_ingredient["veggie"] = .5
end

AddIngredientValues(teaingredients, {veggie = .5, decoration = 1})
AddIngredientValues({"foliage"}, foliage_ingredient, foliage_cookable)
AddIngredientValues(mushrooms, mushrooms_ingredient, true)
AddIngredientValues(petals, petals_ingredient)
AddIngredientValues({"goatmilk"}, {milk=1, dairy=1})

if te then
	AddIngredientValues({"rainbowjellyfish", "rainbowjellyfish_dead", "rainbowjellyfish_cooked"},{fish=1,jellyfish=1,monster=1})
end

if te or ia then
	AddIngredientValues({"coral_brain"}, {meat=1})
end

if beefalo_milk then
	AddIngredientValues({"beefalo_milk"}, {milk=1, dairy=.5})
end

if legion then
	AddIngredientValues({"squamousfruit"}, {veggie=1, monster=1})
end