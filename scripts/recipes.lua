local CUSTOM_RECIPETABS _G = GLOBAL
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local MyRecipesTab = RECIPETABS.DRINKS_TAB

local craft_bag=GetModConfigData("craft_bag")

for k, v in pairs(GLOBAL.AllRecipes) do
	if v.name == "fertilizer" then
		v.ingredients = {GLOBAL.Ingredient("poop", 3), GLOBAL.Ingredient("boneshard", 2), GLOBAL.Ingredient("bucket", 1, "images/tea_inventoryitem.xml","bucket_empty.tex")}
	end
end

AddRecipe("cup",{Ingredient("flint",3)},RECIPETABS.DRINKS_TAB,TECH.NONE,nil,nil,nil,nil,nil,"images/tea_inventoryitem.xml","cup_empty.tex")

AddRecipe("bucket",{Ingredient("log",4)},RECIPETABS.DRINKS_TAB,TECH.NONE,nil,nil,nil,nil,nil,"images/tea_inventoryitem.xml","bucket_empty.tex")

--AddRecipe("barrle",{Ingredient("boards",2),Ingredient("rope",3)},RECIPETABS.DRINKS_TAB,TECH.SCIENCE_ONE,"barrle_placer",nil,nil,nil,nil,"images/tea_minimap.xml","barrle.tex")

--AddRecipe("brewery",{Ingredient("boards",3),Ingredient("rope",3),Ingredient("cutstone",12),Ingredient("goldnugget",4)},RECIPETABS.DRINKS_TAB,TECH.SCIENCE_TWO,"brewery_placer",nil,nil,nil,nil,"images/tea_minimap.xml","brewery.tex")

--AddRecipe("campkettle",{Ingredient("twigs",2),Ingredient("log",2),Ingredient("cutgrass",2)},RECIPETABS.DRINKS_TAB,TECH.NONE,"campkettle_placer",nil,nil,nil,nil,"images/tea_minimap.xml","campkettle.tex")

--AddRecipe("kettle",{Ingredient("twigs",6),Ingredient("rope",2),Ingredient("charcoal",2)},RECIPETABS.DRINKS_TAB,TECH.SCIENCE_ONE,"kettle_placer",nil,nil,nil,nil,"images/tea_minimap.xml","kettle.tex")

--AddRecipe("portable_kettle_item",{Ingredient("transistor",2),Ingredient("cutstone",4),Ingredient("charcoal",3)},RECIPETABS.DRINKS_TAB,TECH.SCIENCE_TWO,nil,nil,nil,nil,nil,"images/tea_inventoryitem.xml","portable_kettle_item.tex")

--AddRecipe("desalinator",{Ingredient("boards",12),Ingredient("rope",6),Ingredient("rocks",6),Ingredient("nitre",6),Ingredient("charcoal",6)},RECIPETABS.DRINKS_TAB,TECH.SCIENCE_TWO,"desalinator_placer",nil,nil,nil,nil,"images/tea_minimap.xml","desalinator.tex")

--AddRecipe("well_item",{Ingredient("boards",2),Ingredient("cutstone",6),Ingredient("hammer",1)},RECIPETABS.DRINKS_TAB,TECH.SCIENCE_TWO,nil,nil,nil,nil,nil,"images/tea_inventoryitem.xml","water_well.tex")

--AddRecipe("well_drilling_item",{Ingredient("boards",2),Ingredient("cutstone",3),Ingredient("flint",4)},RECIPETABS.DRINKS_TAB,TECH.SCIENCE_TWO,nil,nil,nil,nil,nil,"images/tea_inventoryitem.xml","well_drilling_item.tex")