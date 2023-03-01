WATERTYPE =
{
	GENERIC = "generic",
	CLEAN = "water_clean",
	DIRTY = "water_dirty",
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
		},
	},
}

env.WATERTYPE = WATERTYPE
env.WATERGROUP = WATERGROUP
_G.WATERTYPE = WATERTYPE
_G.WATERGROUP = WATERGROUP

UPGRADETYPES["CAMPFIRE"] = "campfire"

local FERTILIZERS = require("prefabs/fertilizer_nutrient_defs")
FERTILIZERS.FERTILIZER_DEFS.spoiled_drink = {nutrients = TUNING.SPOILED_DRINK_NUTRIENTS}
