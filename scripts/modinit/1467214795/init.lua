GLOBAL.setfenv(1, GLOBAL)

OCTOPUSKING_LOOT.chestloot["wine_cellar_part"] = "wine_cellar_blueprint"
OCTOPUSKING_LOOT.chestloot["messagebottleempty"] = "gelblob_bottle"

AddTreasure("wine_cellar_parts", {
	treasure_set_piece = "BuriedTreasureLayout",
	treasure_prefab = "buriedtreasure",
	map_prefab = "ia_messagebottle",
	loot = "wine_cellar_parts",
})

AddTreasureLoot("wine_cellar_parts",{
	loot = {
		wine_cellar_part = 4,
		cutstone = 6,
		gelblob_bottle = 40,
		dubloon = 10,
	}
})

SLOTMACHINE_LOOT.goodspawns.slot_wine_cellar = 1
SLOTMACHINE_LOOT.actions.slot_wine_cellar = {
	treasure = "slot_wine_cellar"
}
AddTreasureLoot("slot_wine_cellar", {
	loot = {
		wine_cellar_part = 13,
		cutstone = 18,
		gelblob_bottle = 40,
	},
})

SLOTMACHINE_LOOT.goodspawns.slot_dust = 1
SLOTMACHINE_LOOT.actions.slot_dust = {
    treasure = "slot_dust",
}
AddTreasureLoot("slot_dust", {
    loot = {
        nitre = 1,
        rocks = 2,
        saltrock = 1,
        refined_dust_blueprint = 1,
    },
})

SLOTMACHINE_LOOT.okspawns.slot_soda_collection = 2
SLOTMACHINE_LOOT.actions.slot_soda_collection = {
    treasure = "slot_soda_collection",
}
AddTreasureLoot("slot_soda_collection", {
    loot = {
    	fruitsoda = 5,
    	lemonlimesoda = 5,
        cola = 5,
        colaquantum = 5,
    },
})

SLOTMACHINE_LOOT.goodspawns.slot_advanced_farm = 1
SLOTMACHINE_LOOT.actions.slot_advanced_farm = {
    treasure = "slot_advanced_farm",
}
AddTreasureLoot("slot_advanced_farm", {
    loot = {
		farm_plow_item = 4,
    	golden_farm_hoe = 2,
    	well_drilling_item = 1,
        well_sprinkler_kit = 1,
    },
})

SLOTMACHINE_LOOT.okspawns.slot_well = 5
SLOTMACHINE_LOOT.actions.slot_well = {
    treasure = "slot_well",
}
AddTreasureLoot("slot_well", {
    loot = {
    	boards = 2,
    	cutstone = 6,
        hammer = 1,
        well_drilling_item = 1,
    },
})

SLOTMACHINE_LOOT.okspawns.slot_drink = 5
SLOTMACHINE_LOOT.actions.slot_drink = {
    treasure = "slot_drink",
}

AddTreasureLoot("slot_drink", {
    loot = {
    	water_clean = 2,
    	berries_juice = 2,
    	carrot_tea = 2,
    	greentea = 2,
    },
})

SLOTMACHINE_LOOT.okspawns.slot_caffinberry = 5
SLOTMACHINE_LOOT.actions.slot_caffinberry = {
    treasure = "slot_caffinberry",
}
AddTreasureLoot("slot_caffinberry", {
    loot = {
    	caffinberry_bean = 3,
    	dug_caffinberry = 1,
    },
})

SLOTMACHINE_LOOT.okspawns.slot_teatree = 5
SLOTMACHINE_LOOT.actions.slot_teatree = {
    treasure = "slot_teatree",
}

AddTreasureLoot("slot_teatree", {
    loot = {
    	tealeaves = 3,
    	dug_tea_tree = 1,
    },
})

AddRecipePostInit("bucket_steel_empty", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("steelwool")
	if ingredient then
	    ingredient:AddDictionaryPrefab("needlespear")
	end
end)

AddRecipePostInit("well_sprinkler_kit", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("marble")
	if ingredient then
	    ingredient:AddDictionaryPrefab("limestonenugget")
	end
	local ingredient = recipe:FindAndConvertIngredient("moonglass")
	if ingredient then
	    ingredient:AddDictionaryPrefab("ia_messagebottleempty")
	end
	local ingredient = recipe:FindAndConvertIngredient("townportaltalisman")
	if ingredient then
	    ingredient:AddDictionaryPrefab("dragoonheart")
	end
end)

AddRecipePostInit("well_sprinkler", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("marble")
	if ingredient then
	    ingredient:AddDictionaryPrefab("limestonenugget")
	end
	local ingredient = recipe:FindAndConvertIngredient("moonglass")
	if ingredient then
	    ingredient:AddDictionaryPrefab("ia_messagebottleempty")
	end
	local ingredient = recipe:FindAndConvertIngredient("townportaltalisman")
	if ingredient then
	    ingredient:AddDictionaryPrefab("dragoonheart")
	end
end)

AddRecipePostInit("well_drilling_item", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("trinket_6")
	if ingredient then
	    ingredient:AddDictionaryPrefab("tar")
	end
	local ingredient = recipe:FindAndConvertIngredient("steelwool")
	if ingredient then
    	ingredient:AddDictionaryPrefab("needlespear")
	end
end)

AddRecipePostInit("additives_nut", function(recipe)
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
end)

AddRecipePostInit("bottle_pouch", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("tentaclespots")
	if ingredient then
	    ingredient:AddDictionaryPrefab("snakeskin")
	end
end)

AddRecipePostInit("bottle_pouch_small", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("tentaclespots")
	if ingredient then
	    ingredient:AddDictionaryPrefab("snakeskin")
	end
end)

AddRecipePostInit("bottle_pouch_big", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("alterguardianhatshard")
	if ingredient then
	    ingredient:AddDictionaryPrefab("magic_seal")
	end
	ingredient = recipe:FindAndConvertIngredient("bearger_fur")
	if ingredient then
	    ingredient:AddDictionaryPrefab("shark_gills")
	end
end)

AddRecipePostInit("thermos_bottle_small", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("opalpreciousgem")
	if ingredient then
	    ingredient:AddDictionaryPrefab("magic_seal")
	end
	ingredient = recipe:FindAndConvertIngredient("moonglass")
	if ingredient then
	    ingredient:AddDictionaryPrefab("sand")
	end
	ingredient = recipe:FindAndConvertIngredient("messagebottleempty")
	if ingredient then
	    ingredient:AddDictionaryPrefab("ia_messagebottleempty")
	end
end)

AddRecipePostInit("thermos_bottle_big", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("alterguardianhatshard")
	if ingredient then
	    ingredient:AddDictionaryPrefab("magic_seal")
	end
	ingredient = recipe:FindAndConvertIngredient("purebrilliance")
	if ingredient then
	    ingredient:AddDictionaryPrefab("dragoonheart")
	end
end)

AddRecipePostInit("wx78module_acid_drying", function(recipe)
	local ingredient = recipe:FindAndConvertIngredient("shroom_skin")
	if ingredient then
	    ingredient:AddDictionaryPrefab("obsidian")
	end
end)