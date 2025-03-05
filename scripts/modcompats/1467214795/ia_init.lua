GLOBAL.setfenv(1, GLOBAL)
local TreasureLootList = GetTreasureLootDefinitionTable()

SLOTMACHINE_LOOT.goodspawns.slot_dust = 1
SLOTMACHINE_LOOT.actions.slot_dust = {
    treasure = "slot_dust",
}
TreasureLootList["slot_dust"] = {
    loot = {
        nitre = 1,
        rocks = 2,
        saltrock = 1,
        refined_dust_blueprint = 1,
    },
}

SLOTMACHINE_LOOT.goodspawns.slot_soda_collection = 1
SLOTMACHINE_LOOT.actions.slot_soda_collection = {
    treasure = "slot_soda_collection",
}
TreasureLootList["slot_soda_collection"] = {
    loot = {
    	fruitsoda = 5,
    	lemonlimesoda = 5,
        cola = 5,
        colaquantum = 5,
    },
}

SLOTMACHINE_LOOT.goodspawns.slot_advanced_farm = 1
SLOTMACHINE_LOOT.actions.slot_advanced_farm = {
    treasure = "slot_advanced_farm",
}
TreasureLootList["slot_advanced_farm"] = {
    loot = {
		farm_plow_item = 4,
    	golden_farm_hoe = 2,
    	well_drilling_item = 1,
        well_sprinkler_kit = 1,
    },
}

SLOTMACHINE_LOOT.okspawns.slot_well = 5
SLOTMACHINE_LOOT.actions.slot_well = {
    treasure = "slot_well",
}

TreasureLootList["slot_well"] = {
    loot = {
    	boards = 2,
    	cutstone = 6,
        hammer = 1,
        well_drilling_item = 1,
    },
}

SLOTMACHINE_LOOT.okspawns.slot_drink = 5
SLOTMACHINE_LOOT.actions.slot_drink = {
    treasure = "slot_drink",
}

TreasureLootList["slot_drink"] = {
    loot = {
    	water_clean = 2,
    	berries_juice = 2,
    	carrot_tea = 2,
    	greentea = 2,
    },
}

SLOTMACHINE_LOOT.okspawns.slot_caffinberry = 5
SLOTMACHINE_LOOT.actions.slot_caffinberry = {
    treasure = "slot_caffinberry",
}

TreasureLootList["slot_caffinberry"] = {
    loot = {
    	caffeinberry_bean = 3,
    	dug_caffeinberry = 1,
    },
}

SLOTMACHINE_LOOT.okspawns.slot_teatree = 5
SLOTMACHINE_LOOT.actions.slot_teatree = {
    treasure = "slot_teatree",
}

TreasureLootList["slot_teatree"] = {
    loot = {
    	tealeaves = 3,
    	dug_tea_tree = 1,
    },
}

local RECIPE_GAMETYPE_DEFS = require("prefabs/recipe_gametype_defs")
local SetRecipeIngredientsForGameTypes = RECIPE_GAMETYPE_DEFS.SetRecipeIngredientsForGameTypes

SetRecipeIngredientsForGameTypes("bucket_steel_empty",RECIPE_GAME_TYPE.SW,{Ingredient("needlespear",2),Ingredient("hammer",0)})
SetRecipeIngredientsForGameTypes("well_sprinkler_kit",RECIPE_GAME_TYPE.SW,{Ingredient("limestonenugget",4),Ingredient("ia_messagebottleempty",1),Ingredient("dragoonheart",2),Ingredient("gears",1)})
SetRecipeIngredientsForGameTypes("well_sprinkler",RECIPE_GAME_TYPE.SW,{Ingredient("limestonenugget",4),Ingredient("ia_messagebottleempty",1),Ingredient("dragoonheart",2),Ingredient("gears",1)})
SetRecipeIngredientsForGameTypes("well_drilling_item",RECIPE_GAME_TYPE.SW,{Ingredient("tar",4),Ingredient("transistor",2),Ingredient("goldnugget",4),Ingredient("flint",4),Ingredient("needlespear",2)})

--[[AddRecipePostInit("additives_nut", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("acorn_cooked")
	if ingredient then
	    ingredient:AddDictionaryPrefab("tea_seed_cooked")
	end
end)

AddRecipePostInit("additives_dairy", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("goatmilk")
	if ingredient then
	    ingredient:AddDictionaryPrefab("coconut_halved")
	end
end)

AddRecipePostInit("additives_petals", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("foliage")
	if ingredient then
	    ingredient:AddDictionaryPrefab("moon_tree_blossom")
	end
end)

AddRecipePostInit("distillers", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("dreadstone")
	if ingredient then
	    ingredient:AddDictionaryPrefab("obsidian")
	end
end)

AddRecipePostInit("well_waterpump_kit", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("security_pulse_cage_full")
	if ingredient then
	    ingredient:AddDictionaryPrefab("turbine_blades")
	end
	local ingredient = recipe:FindAndConvertIngredient("wagpunk_bits")
	if ingredient then
	    ingredient:AddDictionaryPrefab("gears")
	end
end)]]