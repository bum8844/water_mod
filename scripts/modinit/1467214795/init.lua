GLOBAL.setfenv(1, GLOBAL)
local TreasureLootList = GetTreasureLootDefinitionTable()
local RECIPE_GAMETYPE_DEFS = require("prefabs/recipe_gametype_defs")
local SetRecipeIngredientsForGameTypes = RECIPE_GAMETYPE_DEFS.SetRecipeIngredientsForGameTypes

OCTOPUSKING_LOOT.chestloot["wine_cellar_part"] = "wine_cellar_blueprint"
OCTOPUSKING_LOOT.chestloot["messagebottleempty"] = "gelblob_bottle"

TreasureLootList["wine_cellar_parts"] = {
	loot = {
		wine_cellar_part = 4,
		cutstone = 6,
		gelblob_bottle = 40,
		dubloon = 10,
	}
}

SLOTMACHINE_LOOT.goodspawns.slot_wine_cellar = 1
SLOTMACHINE_LOOT.actions.slot_wine_cellar = {
	treasure = "slot_wine_cellar"
}
TreasureLootList["slot_wine_cellar"] = {
	loot = {
		wine_cellar_part = 13,
		cutstone = 18,
		gelblob_bottle = 40,
	},
}

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

local function ModAtlas()
    return "images/tea_inventoryitem.xml"
end

local function Drink_ModAtlas()
    return "images/inventoryitems/tea_inventoryitem_drinks.xml"
end

local function AIModAtlas()
    return "images/ia_inventoryimages.xml"
end

SetRecipeIngredientsForGameTypes("bucket_steel_empty",RECIPE_GAME_TYPE.SW,{Ingredient("needlespear",2),Ingredient("hammer",0)})
SetRecipeIngredientsForGameTypes("well_sprinkler_kit",RECIPE_GAME_TYPE.SW,{Ingredient("limestonenugget",4),Ingredient("ia_messagebottleempty",1),Ingredient("dragoonheart",2),Ingredient("gears",1)})
SetRecipeIngredientsForGameTypes("well_sprinkler",RECIPE_GAME_TYPE.SW,{Ingredient("limestonenugget",4),Ingredient("ia_messagebottleempty",1),Ingredient("dragoonheart",2),Ingredient("gears",1)})
SetRecipeIngredientsForGameTypes("well_drilling_item",RECIPE_GAME_TYPE.SW,{Ingredient("tar",4),Ingredient("transistor",2),Ingredient("goldnugget",4),Ingredient("flint",4),Ingredient("needlespear",2)})
SetRecipeIngredientsForGameTypes("additive_seed",RECIPE_GAME_TYPE.SW,{Ingredient("jungletreeseed",1,AIModAtlas(),nil,"jungletreeseed.tex"),Ingredient("pepper_seeds",1),Ingredient("garlic_seeds",1)})
SetRecipeIngredientsForGameTypes("additive_nut",RECIPE_GAME_TYPE.SW,{Ingredient("tea_seed_cooked",1),Ingredient("ruincacao_bean_cooked",1,ModAtlas(),nil,"ruincacao_bean_cooked.tex"),Ingredient("caffeinberry_bean_cooked", 1, ModAtlas(), nil, "caffeinberry_bean_cooked.tex")})
SetRecipeIngredientsForGameTypes("additive_dairy",RECIPE_GAME_TYPE.SW,{Ingredient("coconut_halved",1),Ingredient("milkywhites",1),Ingredient("butter", 1)})
SetRecipeIngredientsForGameTypes("additive_petals",RECIPE_GAME_TYPE.SW,{Ingredient("petals",3),Ingredient("tealeaves",3,ModAtlas(),nil,"tealeaves.tex")})
SetRecipeIngredientsForGameTypes("distillers",RECIPE_GAME_TYPE.SW,{Ingredient("obsidian",8),Ingredient("nightmarefuel",4),Ingredient("transistor",4),Ingredient("redgem",1),Ingredient("bluegem",1)})
SetRecipeIngredientsForGameTypes("well_waterpump_kit",RECIPE_GAME_TYPE.SW,{Ingredient("turbine_blades",1),Ingredient("gears",4),Ingredient("transistor",1),Ingredient("cutstone",2)})
SetRecipeIngredientsForGameTypes("well_waterpump",RECIPE_GAME_TYPE.SW,{Ingredient("turbine_blades",1),Ingredient("gears",4),Ingredient("transistor",1),Ingredient("cutstone",2)})
SetRecipeIngredientsForGameTypes("bottle_pouch_small",RECIPE_GAME_TYPE.SW,{Ingredient("papyrus",2),Ingredient("snakeskin",2)})
SetRecipeIngredientsForGameTypes("bottle_pouch_big",RECIPE_GAME_TYPE.SW,{Ingredient("bottle_pouch_small",2,ModAtlas(),nil,"bottle_pouch_small.tex"),Ingredient("magic_seal",1),Ingredient("rope",2),Ingredient("doydoyfeather",1)})
SetRecipeIngredientsForGameTypes("thermos_bottle_small",RECIPE_GAME_TYPE.SW,{Ingredient("magic_seal",1),Ingredient("sand",5),Ingredient("rope",3),Ingredient("goldnugget",10),Ingredient("ia_messagebottleempty",2)})
SetRecipeIngredientsForGameTypes("thermos_bottle_big",RECIPE_GAME_TYPE.SW,{Ingredient("thermos_bottle_small",1,ModAtlas(),nil,"thermos_bottle_small.tex"),Ingredient("magic_seal",1),Ingredient("dragoonheart",2)})
SetRecipeIngredientsForGameTypes("wx78module_acid_drying",RECIPE_GAME_TYPE.SW,{Ingredient("scandata",3),Ingredient("obsidian",1),Ingredient("water_acid",3,Drink_ModAtlas(),nil,"water_acid.tex")})