local _G = GLOBAL
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local MyRecipesTab = RECIPETABS.DRINKS_TAB
--[[
if GLOBAL.KnownModIndex:IsModEnabled("workshop-908071894") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-908071894") then
    MyRecipesTab = RECIPETABS.WATER_TAB
end
--]]
--Config
local craft_bag=GetModConfigData("craft_bag")

for k, v in pairs(GLOBAL.AllRecipes) do
	if v.name == "fertilizer" then
		v.ingredients = {GLOBAL.Ingredient("poop", 3), GLOBAL.Ingredient("boneshard", 2), GLOBAL.Ingredient("bucket", 1, "images/inventoryimages/bucket.xml")}
	end
end

AddRecipe( "cup",
{Ingredient("flint", 3)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/cup_empety.xml",
"cup_empety.tex")

AddRecipe( "bucket",
{Ingredient("log", 4)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/bucket.xml",
"bucket.tex")

AddRecipe("waterbarrle",{Ingredient("boards", 2),Ingredient("rope", 3)},--А вот и рецептик. Ingridient можно перечислять по запятой
RECIPETABS.DRINKS_TAB,-- Место хранения(сейчас у нас в структурах, можно куда угодно
TECH.SCIENCE_ONE,--здесь у нас уровень науки(TECH.NONE, TECH.SCIENCE_TWO)
"waterbarrle_placer", -- нууу, это placer
nil, -- min_spacing
nil, -- nounlock	Сорян что
nil, -- numtogive	на английском,
nil, -- builder_tag	здесь в основном тэги
"images/inventoryimages/waterbarrle.xml", -- помнишь atlas? Так это путь к нему
"waterbarrle.tex") -- Таже история, только картинка .тех

AddRecipe("beer_barrle",{Ingredient("boards", 3),Ingredient("rope", 3)},--А вот и рецептик. Ingridient можно перечислять по запятой
RECIPETABS.DRINKS_TAB,-- Место хранения(сейчас у нас в структурах, можно куда угодно
TECH.SCIENCE_TWO,--здесь у нас уровень науки(TECH.NONE, TECH.SCIENCE_TWO)
"beer_barrle_placer", -- нууу, это placer
nil, -- min_spacing
nil, -- nounlock	Сорян что
nil, -- numtogive	на английском,
nil, -- builder_tag	здесь в основном тэги
"images/inventoryimages/beer_barrle.xml", -- помнишь atlas? Так это путь к нему
"beer_barrle.tex") -- Таже история, только картинка .тех

AddRecipe("campkettle",{Ingredient("twigs", 2),Ingredient("log", 2),Ingredient("cutgrass", 2)},
RECIPETABS.DRINKS_TAB,
TECH.NONE,
"campkettle_placer",
nil,
nil,
nil,
nil,
"images/inventoryimages/campkettle.xml",
"campkettle.tex")

AddRecipe("kettle",{Ingredient("twigs", 6),Ingredient("rope", 2),Ingredient("charcoal", 2)},--А вот и рецептик. Ingridient можно перечислять по запятой
RECIPETABS.DRINKS_TAB,-- Место хранения(сейчас у нас в структурах, можно куда угодно
TECH.SCIENCE_ONE,--здесь у нас уровень науки(TECH.NONE, TECH.SCIENCE_TWO)
"kettle_placer", -- нууу, это placer
nil, -- min_spacing
nil, -- nounlock	Сорян что
nil, -- numtogive	на английском,
nil, -- builder_tag	здесь в основном тэги
"images/water_images.xml", -- помнишь atlas? Так это путь к нему
"kettle.tex") -- Таже история, только картинка .тех

if not GLOBAL.KnownModIndex:IsModEnabled("workshop-1113732066") and not GLOBAL.KnownModIndex:IsModForceEnabled("workshop-367546858") then
AddRecipe( "kettle_port",
{Ingredient("transistor", 2),
Ingredient("cutstone", 4),
Ingredient("charcoal", 3)} ,
RECIPETABS.DRINKS_TAB, 
TECH.SCIENCE_TWO,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/kettle_port.xml",
"kettle_port.tex")

AddRecipe("water_mahine",{Ingredient("transistor", 2),Ingredient("cutstone", 5),Ingredient("pickaxe", 1)},
RECIPETABS.DRINKS_TAB,
TECH.SCIENCE_ONE,
"water_mahine_placer",
nil,
nil,
nil,
nil,
"images/inventoryimages/water_mahine.xml",
"water_mahine.tex")

AddRecipe("ice_mahine",{Ingredient("transistor", 1),Ingredient("cutstone", 2),Ingredient("heatrock", 1)},
RECIPETABS.DRINKS_TAB,
TECH.SCIENCE_ONE,
"ice_mahine_placer",
nil,
nil,
nil,
nil,
"images/inventoryimages/ice_mahine.xml",
"ice_mahine.tex")

AddRecipe( "waterwell_item",
{Ingredient("boards", 2),
Ingredient("cutstone", 5),
Ingredient("pickaxe", 1)} ,
RECIPETABS.DRINKS_TAB, 
TECH.SCIENCE_TWO,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/waterwell.xml",
"waterwell.tex")
end
--[[
AddRecipe( "cupsjournal",
{Ingredient("papyrus", 2)} ,
RECIPETABS.DRINKS_TAB, 
TECH.SCIENCE_ONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/cupsjournal.xml",
"cupsjournal.tex")
]]

AddRecipe( "tee_s",
{Ingredient("tee", 2,"images/inventoryimages/tee.xml")} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/water_images.xml",
"tee__s.tex")

AddRecipe( "tea_honey",
{Ingredient("tee", 2,"images/inventoryimages/tee.xml"),
Ingredient("honey", 1)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/tea_honey.xml",
"tea_honey.tex")

AddRecipe( "tee_m",
{Ingredient("petals_evil", 5)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/water_images.xml",
"tee_m.tex")

AddRecipe( "tea_berry",
{Ingredient("berries", 2)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/tea_berry.xml",
"tea_berry.tex")

AddRecipe( "tee_r",
{Ingredient("dragonfruit", 1)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/tee_r.xml",
"tee_r.tex")

AddRecipe( "tee_r2",
{Ingredient("petals", 7)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/tee_r.xml",
"tee_r.tex")

AddRecipe( "tea_carrot",
{Ingredient("carrot", 2)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/tea_carrot.xml",
"tea_carrot.tex")

AddRecipe( "tea_banana",
{Ingredient("cave_banana_cooked", 2)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/tea_banana.xml",
"tea_banana.tex")

AddRecipe( "tea_cactus",
{Ingredient("cactus_flower", 2)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/tea_cactus.xml",
"tea_cactus.tex")

AddRecipe( "tee_g",
{Ingredient("abigail_flower", 1) ,
Ingredient(GLOBAL.CHARACTER_INGREDIENT.HEALTH, 40)} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/water_images.xml",
"tee_g.tex")


AddRecipe( "cup_strang",
{Ingredient("green_cap", 2) ,
Ingredient("red_cap", 2) ,
Ingredient("cup_water", 1,"images/inventoryimages/cup_water.xml")} ,
RECIPETABS.DRINKS_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
nil,
"images/inventoryimages/cup_strang.xml",
"cup_strang.tex")


if craft_bag == 1 then
AddRecipe( "grass_bag",
{Ingredient("papyrus", 3),
Ingredient("rope", 2) ,
Ingredient("seeds", 5) ,
Ingredient("turf_forest", 3)} ,
RECIPETABS.DRINKS_TAB, 
TECH.SCIENCE_TWO,
nil,
nil,
nil,
nil,
nil,
"images/water_images.xml",
"grass_bag.tex")
end
