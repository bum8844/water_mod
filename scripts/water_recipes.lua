local _G = GLOBAL
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local ModAtlas = "images/tea_inventoryitem.xml"

--local craft_bag=GetModConfigData("craft_bag")

for k, v in pairs(GLOBAL.AllRecipes) do
	if v.name == "fertilizer" then
		v.ingredients = {GLOBAL.Ingredient("poop", 3), GLOBAL.Ingredient("boneshard", 2), GLOBAL.Ingredient("bucket", 1, ModAtlas,"bucket_empty.tex")}
	end
end

AddRecipe2("cup_water",{Ingredient("cup_dirty",1, ModAtlas),Ingredient("purification_tablets",1)},TECH.NONE,{atlas = ModAtlas, image = "cup_water.tex"},{"COOKING"}) --Ingredient("purification_tablets",1, ModAtlas)

AddRecipe2("bottle_water",{Ingredient("bottle_dirty",1, ModAtlas),Ingredient("purification_tablets",1)},TECH.NONE,{atlas = ModAtlas, image = "bottle_water.tex"},{"COOKING"})

AddRecipe2("purification_tablets",{Ingredient("ash",2),Ingredient("nitre",1),Ingredient("charcoal",1),Ingredient("saltrock",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas, numtogive = 10 , image = "tea_seed.tex"},{"COOKING"})

AddRecipe2("cup",{Ingredient("flint",3)},TECH.NONE,{atlas = ModAtlas, image = "cup_empty.tex"},{"REFINE"})

AddRecipe2("bucket",{Ingredient("log",4)},TECH.NONE,{atlas = ModAtlas, image = "bucket_empty.tex"},{"REFINE","RAIN"})

AddRecipe2("barrel",{Ingredient("boards",2),Ingredient("rope",3)},TECH.SCIENCE_ONE,{placer = "barrel_placer", atlas = ModAtlas, image = "barrel.tex"},{"CONTAINERS"})

AddRecipe2("brewery",{Ingredient("boards",3),Ingredient("rope",3),Ingredient("cutstone",12),Ingredient("goldnugget",4)},TECH.SCIENCE_TWO,{placer = "brewery_placer", atlas = ModAtlas, image = "brewery.tex"},{"COOKING"})

AddRecipe2("campkettle",{Ingredient("twigs",2),Ingredient("log",2),Ingredient("cutgrass",2)},TECH.NONE,{placer = "campkettle_placer", atlas = ModAtlas, image = "campkettle.tex"},{"COOKING","LIGHT"})

AddRecipe2("kettle",{Ingredient("twigs",6),Ingredient("rope",2),Ingredient("charcoal",2)},TECH.SCIENCE_ONE,{placer = "kettle_placer", atlas = ModAtlas, image = "kettle.tex"},{"COOKING"})

AddRecipe2("portablekettle_item",{Ingredient("transistor",2),Ingredient("cutstone",4),Ingredient("charcoal",3)},TECH.SCIENCE_TWO,{atlas = ModAtlas, image = "portablekettle_item.tex"},{"COOKING"})

AddRecipe2("desalinator",{Ingredient("boards",12),Ingredient("rope",6),Ingredient("rocks",6),Ingredient("nitre",6),Ingredient("charcoal",6)},TECH.SCIENCE_TWO,{placer = "desalinator_placer", atlas = ModAtlas, image = "desalinator.tex"},{"CONTAINERS","GARDENING"})

AddRecipe2("well_drilling_item",{Ingredient("boards",2),Ingredient("cutstone",3),Ingredient("flint",4)},TECH.SCIENCE_TWO,{atlas = ModAtlas, image = "well_drilling_item.tex"},{"GARDENING"})

GLOBAL.CONSTRUCTION_PLANS["hole"] = {Ingredient("boards",2),Ingredient("cutstone",6),Ingredient("hammer",1)}