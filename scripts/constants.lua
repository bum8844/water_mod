WATERTYPE =
{
	CLEAN = "water_clean",
	DIRTY = "water_dirty",
	MINERAL = "water_mineral",
	CLEAN_ICE = "water_clean_ice",
	DIRTY_ICE = "water_dirty_ice",
	SALTY = "water_salty",
	NONE = "none",
}

WATERGROUP =
{
	OMNI =
	{
		name = "OMNI",
		types =
		{
			WATERTYPE.CLEAN,
			WATERTYPE.MINERAL,
			WATERTYPE.DIRTY,
			WATERTYPE.SALTY,
		}
	},

	RAW =
	{
		name = "RAW",
		types =
		{
			WATERTYPE.DIRTY,
			WATERTYPE.SALTY,
		},
	},

	DRINKABLE =
	{
		name = "DRINKABLE",
		types =
		{
			WATERTYPE.CLEAN,
			WATERTYPE.MINERAL,
			WATERTYPE.DRINK,
		},
	},

	BOILABLE = 
	{
		name = "BOILABLE",
		types =
		{
			WATERTYPE.CLEAN,
			WATERTYPE.MINERAL,
			WATERTYPE.DIRTY,
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
			WATERTYPE.DIRTY_ICE,
		},
	},

	NONE_BOIL = 
	{
		name = "NONE_BOIL",
		types = {
			WATERTYPE.NONE,
		}
	}
}

DRINKTYPY = 
{
	GENERIC = "GENERIC",
	FRUIT = "FRUIT",
	VEGGIE = "VEGGIE",
	LEAFS = "LEAFS",
	BREWER = "BREWER",
	SPIRITS = "SPIRITS",
	MEDICINE = "MEDICINE",
}

FOODTYPEGROUP = 
{
	TYPEVEGGIE = 
	{
		"carrot",
		"corn",
		"pumpkin",
		"eggplant",
		"cactus_meat",
		"pumpkin",
		"kelp",
		"tomato",
		"potato",
		"asparagus",
		"onion",
		"garlic",
		"pepper",
		"rock_avocado_fruit_ripe",
		"mandrake",
		"red_cap",
		"green_cap",
		"blue_cap",
		"moon_cap",
		--mod_ingredients
		"seaweed",
		"seaweeds",
		"aloe",
		"wheat",
		"turnip",
		"fennel",
		"radish",
		"lotus_flower",
		"parznip",
		"parsnip",
		"cucumber",
		"sweetpotato",
		"white_cap",
		--hop
		"kyno_aloe",
		"kyno_wheat",
		"kyno_turnip",
		"kyno_fennel",
		"kyno_radish",
		"kyno_lotus_flower",
		"kyno_parznip",
		"kyno_cucumber",
		"kyno_sweetpotato",
		"kyno_white_cap",
		"kyno_waterycress",
		"kyno_taroroot",
		"kyno_seaweeds",
		--mfp
		"mfp_parsnip",
		"mfp_aloe",
		"mfp_wheat",
		"mfp_turnip",
		"mfp_fennel",
		"mfp_radish",
		"mfp_sweetpotato",
		"mfp_white_cap",
		--ac
		"tuber_bloom_crop",
		"tuber_crop"
	},

	TYPEVEGGIE_NONE_COOKED = 
	{
		"cactus_flower",
		"cutlichen",
		--hop
		"kyno_parznip_eaten",
		--mfp
		"mfp_parsnip_eaten",
		--fwd
		"fwd_in_pdt_food_soybeans",
		--ac
		"bramble_bulb",
		"clippings",
	},

	TYPEFRUIT = 
	{
		"cave_banana",
		"durian",
		"pomegranate",
		"dragonfruit",
		"berries",
		"berries_juicy",
		"fig",
		"watermelon",
		"wormlight",
		"wormlight_lesser",
		"ancientfruit_nightvision",
		--mod_ingredients
		"banana",
		"strawberry",
		"orange",
		--hop
		"kyno_banana",
		--mfp
		"mfp_coffeecherry",
		"mfp_strawberry",
		"mfp_orange",
		--fwd
		"fwd_in_pdt_food_orange",
		"fwd_in_pdt_food_mango",
		"fwd_in_pdt_food_mango_green",
		--cf
		"cherry",
		"cherry_roseberries",
		"cherry_gooseberries",
		"cherryruins_swanapple",
		--umc
		"giant_blueberry",
		"zaspberry",
		"viperfruit",
		--legion
		"pineananas",
		"squamousfruit"
	},

	TYPEFRUIT_HAS_HALVED = 
	{
		--mod_ingredients
		"coconut",
		"kokonut",
		--hop
		"kyno_kokonut",
		"kyno_coconut",
		"kyno_pineapple",
	},

	SOUP_AND_STEW = 
	{
		"bunnystew",
		"bonestew",
		"seafoodgumbo",
		"mandrakesoup",
		"asparagussoup",
		"bonesoup",
		"lobsterbisque",
		"moqueca",
		--event_halloweenpotion
		"halloweenpotion_bravery_small",
		"halloweenpotion_bravery_large",
		"halloweenpotion_health_small",
		"halloweenpotion_health_large",
		"halloweenpotion_sanity_small",
		"halloweenpotion_sanity_large",
		--mod_foods
		"musselbouillabaise",
		"sharkfinsoup",
		"snakebonesoup",
		"bisque",
		"fishyogurt",
		"gyulmungsoup",
		"gyul_shortribsoup",
		"dish_fishjoyramen",
		"dish_shyerryjam",
		"spiced_fish",
		"soup_watercress",
		"soup_squash",
		"soup_chowder",
		"soup_broth",
		"porridge",
		"mushroom_stew",
		"gumbo",
		"gruel",
		"cold_gazpacho",
		"carrot_soup",
		"creammushroom",
		"curry",
		"fish_stew",
		"meatbonestew",
		"onion_soup",
		"potato_soup",
		"tomato_soup",
		"vegetable_soup",
		"stone_soup",
		--hop
		"algae_soup",
		"banana_puffing",
		"sea_pudding",
		"eyeballsoup",
		"festive_goodgravy",
		"frenchonionsoup",
		"gorge_carrot_soup",
		"gorge_creammushroom",
		"gorge_curry",
		"gorge_fish_stew",
		"gorge_meatbonestew",
		"gorge_onion_soup",
		"gorge_potato_soup",
		"gorge_tomato_soup",
		"gorge_vegetable_soup",
		"gorge_stone_soup",
		"honeyjar",
		"jelly_banana",
		"jelly_berries",
		"jelly_berries_juicy",
		"jelly_cave_bananna",
		"jelly_dragonfruit",
		"jelly_durian",
		"jelly_fig",
		"jelly_glowberry",
		"jelly_kokonut",
		"jelly_pomegranat",
		"jelly_watermelon",
		"longpigmeal",
		"mayonnaise",
		"mayonnaise_chicken",
		"mayonnaise_nightmare",
		"mayonnaise_tallbird",
		"parznip_soup",
		"pumpkin_soup",
		"poi",
		"soulstew",
		"tartarsauce",
		"tom_kha_soup",
		"waterycressbowl",
		--mfp
		"mfp_carrot_soup",
		"mfp_creammushroom",
		"mfp_curry",
		"mfp_fish_stew",
		"mfp_meatbonestew",
		"mfp_onion_soup",
		"mfp_potato_soup",
		"mfp_tomato_soup",
		"mfp_vegetable_soup",
		"mfp_stone_soup",
		--fwd
		"fwd_in_pdt_food_mixed_potato_soup",
		"fwd_in_pdt_food_red_mushroom_soup",
		"fwd_in_pdt_food_green_mushroom_soup",
		"fwd_in_pdt_food_yogurt",
		"fwd_in_pdt_food_congee_with_meat_and_thousand_year_old_eggs",
		--cf
		"cherry_gooseberries_preserve",
		"cherry_shrimp_chowder",
		--cgc
		"bigcrop_cornporridge",
		"bigcrop_pumpkinsoup",
		"bigcrop_spidersoup",
		"bigcrop_tomatosoup",
	},

	NONE_HUNGER_INGREDIENT = 
	{
		SUPERTINYMICROSCOPIC = {
			"petals",
			"foliage",
			"lightbulb",
			--mod_ingredients
			"petals_rose",
			"petals_lily",
			"petals_orchid",
			--hop
			"kyno_foliage",
			"kyno_sugartree_petals",
		},
		TINYMICROSCOPIC = 
		{
			"petals_evil",
			"butterflywings",
			"firenettles",
			"tillweed",
			"forgetmelots",
			"succulent_picked",	
			--hop	
			"kyno_sugarflywings",	
		},
	},

	INGREDIENT_DRINKABLE = 
	{
		TINY = 
		{
			--mod_ingredients
			"molasses",
			"fruit_syrup",
			"syrup",
			--hop
			"kyno_syrup",
			"kyno_oil",
			--mfp
			"mfp_syrup",
		},

		SMALLTINY = {
			--mod_ingredients
			"coconut",
			"kokonut",
			--hop
			"kyno_kokonut",
			"kyno_coconut",
		},

		SMALL = 
		{
			"goatmilk",
			--mod_ingredients
			"rawmilk",
			"beefalo_milk",
			"coconut_milk",
			--hop
			"kyno_milk_beefalo",
			"kyno_milk_koalefant",
			--fwd
			"fwd_in_pdt_food_raw_milk",
		},

		MED = 
		{
			--hop
			"milk_box",
		},
	},

	ICED = 
	{
		TINYMICROSCOPIC = 
		{
			"ice"
		},

		MED = 
		{
			"watermelonicle",
			"ceviche",
			"bananapop",
			--mod_foods
			"jellyopop",
			"tentacicle",
			"coldcuts",
			"snowcone",
			--fwd
			"fwd_in_pdt_food_yogurt_ice_cream"
		},

		LARGE = 
		{
			"icecream",
			"berrysundae",
			"frozenbananadaiquiri",
			"cherry_sorbet",
			--cgc
			"bigcrop_duriancream",
		},
	},

	DRINKABLE = 
	{
		SMALLTINY = 
		{
			--mod_foods
			"coffee",
			--hop
			"watercup",
			--mfp
			"mfp_coffee",
			"mfp_icedcoffee",
			--fwd
			"fwd_in_pdt_food_coffee",
		},

		MEDSMALL = 
		{
			"bananajuice",
			"sweettea",
			"vegstinger",
			--mod_foods
			"peach_juice_bottle_green",
			"peach_smoothie",
			"spicyvegstinger",
			"dish_chilledrosejuice",
			"pina_colada",
			"limonade",
			"berryshake",
			"juice_waterberry",
			"fruit_truffle",
			"tea_floral",
			"fruityjuice",
			"icedtea",
			"tea",
			"zaspberryparfait",
			"californiaking",
			--hop
			"bubletea",
			"coconutwater",
			"festive_mulledpunch",
			"figjuice",
			"teagreen",
			"teared",
			"pinacolada",
			"chimas",
			--mfp
			"mfp_cafelatte",
			"mfp_cafemocha",
			"mfp_orangejuice",
			"mfp_strawberrylatte",
			--fwd
			"fwd_in_pdt_food_steamed_orange_with_honey",
		},

		MED = {
			"gazpacho",
			--mod_foods
			"potion_bottle_green",
			--fwd
			"fwd_in_pdt_food_cooked_milk",
		},

		LARGE = 
		{	
			--hop
			"juice_carrot",
			"juice_corn",
			"juice_eggplant",
			"juice_pumpkin",
			"juice_lichen",
			"juice_cactus",
			"juice_garlic",
			"juice_asparagus",
			"juice_onion",
			"juice_tomato",
			"juice_potato",
			"juice_pepper",
			"juice_redcap",
			"juice_greencap",
			"juice_bluecap",
			"juice_mooncap",
			"juice_kelp",
			"juice_avocado",
			"juice_whitecap",
			"juice_aloe",
			"juice_radish",
			"juice_sweetpotato",
			"juice_lotus",
			"juice_seaweeds",
			"juice_taroroot",
			"juice_waterycress",
			"juice_cucumber",
			"juice_parznip",
			"juice_turnip",
			"juice_fennel",
			"milkshake",
			"milkshake_prismatic",
			--mfp
			"mfp_aloejuice",
			--fwd
			"fwd_in_pdt_food_saline_medicine",
			"fwd_in_pdt_food_mango_ice_drink",
			--cf
			"cherry_cola",
			--cgc
			"bigcrop_fruitdrink",
			"bigcrop_garlicsauce",
			"bigcrop_hotsauce",
		},
		
		HUGE = 
		{
			--hop
			"nukacola",
			"kyno_cokecan",
			"kyno_energycan",
			"kyno_sodacan",
		},

		MOREHUGE = 
		{
			"nukacola_quantum",
		},

		SUPERHUGE =
		{
			"waterdrop",
		}
	},

	DRINKABLE_ALCOHO = 
	{
		TINY = 
		{
			"dish_medicinalliquor",
			"vino",
			"spiced_rum",
			"pinot_noir",
			"margarita",
			"liquor",
			"daiquiri",
			--hop
			"wine_berries",
			"wine_berries_juicy",
			"wine_pomegranate",
			"wine_dragonfruit",
			"wine_cave_banana",
			"wine_durian",
			"wine_watermelon",
			"wine_fig",
			"wine_glowberry",
			"wine_banana",
			"wine_kokonut",
			"wine_pineapple",
			"wine_nightberry",
			"beer",
			"paleale",
			"mead",
			"twistedtequila",
			"ricesake"
		},

		HUGE = {
			"nukashine",
		},

		SUPERHUGE = 
		{
			"piraterum",
		},
	},

	DRINKABLE_HOLIDAY = {
		MEDSMALL = 
		{
			"winter_food8",
		},
	},

	DRINKABLE_HOLIDAY_ALCOHO = {
		TINY = 
		{
			"winter_food7",
			"winter_food9",
		},
	},
}

BUCKETSTATE = 
{
    EMPTY = "empty",
    CLEAN = "full",
    DIRTY = "dirty",
}

env.WATERTYPE = WATERTYPE
env.WATERGROUP = WATERGROUP
env.DRINKTYPY = DRINKTYPY
env.FOODTYPEGROUP = FOODTYPEGROUP

_G.DRINKTYPY = DRINKTYPY
_G.FOODTYPEGROUP = FOODTYPEGROUP
_G.WATERTYPE = WATERTYPE
_G.WATERGROUP = WATERGROUP

UPGRADETYPES["CAMPFIRE"] = "campfire"
UPGRADETYPES["HOLE"] = "hole"

local FERTILIZERS = require("prefabs/fertilizer_nutrient_defs")
FERTILIZERS.FERTILIZER_DEFS.spoiled_drink = {nutrients = TUNING.SPOILED_DRINK_NUTRIENTS}
