WATERTYPE =
{
	GENERIC = "generic",
	CLEAN = "water_clean",
	DIRTY = "water_dirty",
	CLEAN_ICE = "water_clean_ice",
	DIRTY_ICE = "water_dirty_ice",
	SALTY = "water_salty",
	DRINK = "drink",
	EMPTY = "empty",
}

WATERGROUP =
{
	OMNI =
	{
		name = "OMNI",
		types =
		{
			WATERTYPE.GENERIC,
			WATERTYPE.CLEAN,
			WATERTYPE.DIRTY,
			WATERTYPE.SALTY,
			WATERTYPE.DRINK,
			WATERTYPE.EMPTY,
		}
	},

	RAW =
	{
		name = "RAW",
		types =
		{
			WATERTYPE.DIRTY,
			WATERTYPE.SALTY,
			WATERTYPE.EMPTY,
		},
	},

	DRINKABLE =
	{
		name = "DRINKABLE",
		types =
		{
			WATERTYPE.GENERIC,
			WATERTYPE.CLEAN,
			WATERTYPE.DRINK,
			WATERTYPE.EMPTY,
		},
	},

	BOILABLE = 
	{
		name = "BOILABLE",
		types =
		{
			WATERTYPE.CLEAN,
			WATERTYPE.DIRTY,
			WATERTYPE.EMPTY,
			WATERTYPE.CLEAN_ICE,
			WATERTYPE.DIRTY_ICE,
		},
	},

	CAMP_BOILABLE = 
	{
		name = "CAMP_BOILABLE",
		types =
		{
			WATERTYPE.DIRTY,
			WATERTYPE.EMPTY,
			WATERTYPE.CLEAN_ICE,
			WATERTYPE.DIRTY_ICE,
		},
	},
}

env.WATERTYPE = WATERTYPE
env.WATERGROUP = WATERGROUP
_G.WATERTYPE = WATERTYPE
_G.WATERGROUP = WATERGROUP

UPGRADETYPES["CAMPFIRE"] = "campfire"
UPGRADETYPES["HOLE"] = "hole"

local FERTILIZERS = require("prefabs/fertilizer_nutrient_defs")
FERTILIZERS.FERTILIZER_DEFS.spoiled_drink = {nutrients = TUNING.SPOILED_DRINK_NUTRIENTS}
