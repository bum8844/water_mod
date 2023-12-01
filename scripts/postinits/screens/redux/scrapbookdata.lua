local STRUCTURE = {
	barrel                   = {subcat="structure", workable="HAMMER", burnable=true, build="barrel_dehy", bank="barrel_dehy", anim="idle", overridesymbol={"swap","barrel_dehy_meter_water","5"}, deps={"boards","rope","charcoal","water_clean"}},
	caffeinberry             = {workable="DIG", burnable=true, picakble=true, specialinfo="NEEDFERTILIZER", build="caffeinberry", bank="caffeinberry", anim="idle", deps={"twigs"}},
	campdesalinator          = {subcat="structure", speechname = "campdesalinator_item", build="campdesalinator", bank="campdesalinator_A", anim="idle_empty", overridesymbol={"swap_meter","campdesalinator_meter_water","0"}, deps={}},
	campkettle               = {subcat="structure", speechname = "campkettle_item", build="campkettle", bank="campkettle_A", anim="idle_empty", overridesymbol={"swap_meter","campkettle_meter_water","0"}, deps={}},
	desalinator              = {subcat="structure", workable="HAMMER", burnable=true, build="desalinator", bank="desalinator", anim="idle", overridesymbol={"swap", "desalinator_meter_salt", "5"}, deps={"boards","rope","rocks","nitre","charcoal","water_clean"}},
	hole                     = {build="holes", bank="well", anim="idle", deps={}},
	kettle                   = {subcat="structure", workable="HAMMER", burnable=true, stewer = true, build="kettle", bank="kettle", anim="idle_empty", overridesymbol={"swap","kettle_meter_water","0"}, deps={"twigs","rope","charcoal","water_clean"}},
	portablekettle           = {subcat="structure", workable="HAMMER", burnable=true, stewer = true, },
	ruincacao_seed_sapling   = {workable="DIG", burnable=true, },
	--ruincacao_tree = {type="thing", burnable=true, picakble=true, },
	--tea_seed_sapling = {type="thing", workable="DIG", burnable=true, },
	--tea_tree = {type="thing", workable="DIG", burnable=true, picakble=true, },
	--well = {type="thing", subcat="structure", workable="HAMMER", },
	--well_drilling = {type="thing", subcat="structure", workable="HAMMER", },
	--well_sprinkler = {type="thing", subcat="structure", workable="HAMMER", },
	--well_waterpump = {type="thing", subcat="structure", workable="HAMMER", },
}

local ITEM = {
	--additive_dairy = {},
	--additive_nut = {},
	--additive_petals = {},
	--additive_seed = {},
	--boilbook = {type="item", burnable=true, },
	bucket_empty = {type="item", burnable=true, finiteuses=100, fueltype="BURNABLE", fuelvalue=180, build = "buckets", bank = "buckets", anim = "empty", overridesymbol={"buckets_empty", "buckets_swap", "buckets_empty"}, deps={"log","ash","water_clean","water_clean_ice","water_dirty","water_dirty_ice","water_salty"}},
	bucket_steel_empty = {type = "item", finiteuses = 800, build = "buckets", bank = "buckets", anim = "empty", overridesymbol={"buckets_empty", "buckets_swap", "buckets_steel_empty"}, deps={"steelwool","hammer","water_clean","water_clean_ice","water_dirty","water_dirty_ice","water_salty"}},
	bucket_woodie_empty = {type = "item", burnable = true, finiteuses = 50, fueltype="BURNABLE", fuelvalue=180, build = "buckets", bank = "buckets", anim = "empty", overridesymbol={"buckets_empty", "buckets_swap", "buckets_woodie_empty"}, deps={"log","lucy","ash","water_clean","water_clean_ice","water_dirty","water_dirty_ice","water_salty"}},
	--[[campdesalinator_item = {},
	campkettle_item = {},
	disinfectant
	dug_caffeinberry
	dug_ruincacao_tree
	dug_tea_tree
	portablekettle_item
	ruincacao
	ruincacao_bean = {deps={}},
	ruincacao_seed
	spice_caffeinpepper -- craftingprefab="warly"
	tealeaves
	tealeaves_dried]]
	water_clean_ice = {perishable=7200, stacksize=60, build="kettle_drink", bank="kettle_drink", anim="idle", overridesymbol={"swap", "kettle_drink", "water_clean_ice"}, deps={"water_clean", "water_dirty_ice"}},
	water_dirty_ice = {stacksize=60, build="kettle_drink", bank="kettle_drink", anim="idle", anim="idle", overridesymbol={"swap", "kettle_drink", "water_dirty_ice"}, deps={"bucket_empty","bucket_steel_empty","bucket_woodie_empty","water_dirty"}},
	--[[well_burying_kit
	well_kit
	well_drilling_item
	well_sprinkler_kit
	well_waterpump_kit]]
}

local FOOD = {
	--[[absinthe = {},
	areuhi = {},
	banana_juice = {},
	berries_juice = {},
	berry_brandy = {},
	berry_gin = {},
	blacktea = {},
	blacktea_iced = {},
	butterbeer = {},
	cactus_tea = {},
	cactusflower_tea = {},
	caffeinberry_bean = {},
	caffeinberry_bean_cooked = {},
	caffeinberry_juice = {},
	cola
	colaquantum
	corn_beer
	corn_whiskey
	carrot_tea
	dark_ruincolate
	dragonjuice
	fig_juice
	fruitjuice
	fruitsoda
	fuer
	glowberry_gin
	glowberryjuice
	glowberrywine
	goopydrink
	greentea
	hibiscustea
	hotruincolate
	kahlua
	kumis
	lemonlimesoda
	lotustea
	lumpy_beer
	lumpy_tea
	lumpy_vodka
	lumpy_wine
	noblewine
	madhu
	madhu_rum
	mixflower
	moon_blossom_tea
	mulled
	petals_berry_brandy
	pomegranate_juice
	pulque
	ruincacao_bean_cooked
	ruincacao_cream_liqueur
	ruincha_latte
	ruincolate
	ruincolate_smoothie
	ruin_schokakola
	rumchata
	seaweed_shake
	soda
	sparklingwine
	spoiled_drink
	sushibiscus
	toffee_latte
	tomato_juice
	veggie_tea]]
	water_clean = {type="food", hungervalue=0, healthvalue=0, sanityvalue=0, thirstvalue=TUNING.HYDRATION_SMALLTINY, perishable=2880, foodtype="GENERIC", burnable=false, stacksize=60, build="kettle_drink", bank="kettle_drink", anim="idle", overridesymbol={"swap", "kettle_drink", "water_clean"}, deps={"bucket_empty","bucket_steel_empty","bucket_woodie_empty","water_dirty", "water_clean_ice"}},
	water_dirty = {type = "food", hungervalue = 0, healthvalue = -1, sanityvalue = 15, thirstvalue = TUNING.HYDRATION_SUPERTINY, foodtype = "GENERIC", burnable = false, stacksize = 60, build = "kettle_drink", bank = "kettle_drink", anim = "idle", overridesymbol={"swap", "kettle_drink", "water_dirty"}, deps = {"bucket_empty","bucket_steel_empty","bucket_woodie_empty","water_dirty_ice"}},
	--watermelon_juice
	water_salty = {type = "food", hungervalue = 0, healthvalue = -1, sanityvalue = -20, thirstvalue = -TUNING.DRINK_CALORIES, burnable = false, stacksize = 60, build = "kettle_drink", bank = "kettle_drink", anim = "idle", overridesymbol={"swap", "kettle_drink", "water_salty"}, deps = {"bucket_empty","bucket_steel_empty","bucket_woodie_empty"}},
	--[[tea_lumpy_vodka
	tea_ruincolate_latte
	tea_seed
	tea_seed_cooked
	white_ruincolate
	wine]]
}

--[[local FOOD_COCONUTS = {
	arrack = {},
	coconut_juice
	coconut_wine
	nut_coconut_brandy
}

local FOOD_JELLYFISHS = {
	aurobow = {},
	moonway
	rainbow_shake
}

local FOOD_FISH = {
	quartz_shake
}

local FOOD_MFP = {
	strawberry_milk_smoothie
	strawberry_smoothie
	strawberrysoda
}

local FOOD_WHEAT = {
	wheat_beer
	wheat_whiskey
}

local FOOD_LEGION = {
	pale_beer
	pale_whiskey
	pineananas_juice
	pineanassoda
}

local FOOD_CF = {
	cherry_bloom_wine = {},
	cherry_bloom_rum = {},
	cherry_doctor_cola = {},
	cherry_honey_tea = {},
	cherry_roseberries_tea = {},
}

local FOOD_UNC = {
	giant_blueberry_gin
	giant_blueberry_wine
	rice_spirits
	rice_wine
	sweet_rice_drink
}

local FOOD_ORANGE = {
	orangesoda
	orange_juice
}]]

local scrapbook_prefabs = require("scrapbook_prefabs")
local scrapbookdata = require("screens/redux/scrapbookdata")

for k, v in pairs(STRUCTURE) do
	if v.subcat and STRINGS.SCRAPBOOK.SUBCATS[string.upper(v.subcat)] == nil then
		STRINGS.SCRAPBOOK.SUBCATS[string.upper(v.subcat)] = v.subcat
	end
	v.name = v.name or k
	v.prefab = k
	v.tex = v.tex or k..".tex"
	v.type = "thing"
	v.deps = v.deps or {}
	v.notes = v.notes or {}

	scrapbook_prefabs[k] = true
	scrapbookdata[k] = v
end

for k, v in pairs(ITEM) do
	if v.subcat and STRINGS.SCRAPBOOK.SUBCATS[string.upper(v.subcat)] == nil then
		STRINGS.SCRAPBOOK.SUBCATS[string.upper(v.subcat)] = v.subcat
	end
	v.name = v.name or k
	v.prefab = k
	v.tex = v.tex or k..".tex"
	v.type = "item"
	v.deps = v.deps or {}
	v.notes = v.notes or {}

	scrapbook_prefabs[k] = true
	scrapbookdata[k] = v
end

for k, v in pairs(FOOD) do
	if v.subcat and STRINGS.SCRAPBOOK.SUBCATS[string.upper(v.subcat)] == nil then
		STRINGS.SCRAPBOOK.SUBCATS[string.upper(v.subcat)] = v.subcat
	end
	v.name = v.name or k
	v.prefab = k
	v.tex = v.tex or k..".tex"
	v.type = "food"
	v.deps = v.deps or {}
	v.notes = v.notes or {}

	scrapbook_prefabs[k] = true
	scrapbookdata[k] = v
end

--table.insert(scrapbookdata["portableblender"].deps,"spice_caffeinpepper")

