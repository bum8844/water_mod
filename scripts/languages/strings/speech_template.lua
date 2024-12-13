--Merge this template to your speech table
--to add speech support for your own character mods.
return {
	ACTIONFAIL =
	{
		GIVE =
		{
			WELL_NOTEMPTY = "",
			WELL_BUSY = "",
		}
	},

	ANNOUNCE_DRUNK = "",       -- Your characater is drunken.

	ANNOUNCE_DRUNK_MUMBLE =    -- random quotes when drunken. avg. 8 ~ 9 lines per vanilla survivors.
	{
		"",                   
	},

	ANNOUNCE_DRUNK_END = "",
	ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wolfgang_and_wathgrithr", --Wigfrid and Mighty Wolfgang only
	ANNOUNCE_NOTCHARGE = "",
	ANNOUNCE_NOTHIRSTSLEEP = "",
	ANNOUNCE_NOTHIRSTSIESTA = "",
	ANNOUNCE_SLEEP_END = "",    -- Your character is awaken from a drunken sleep.
	ANNOUNCE_THIRST = "",

    ANNOUNCE_CAFFINE_BUFF_START = "" , -- Caffeine buff enabled
    ANNOUNCE_CAFFINE_BUFF_STOP = "" , -- Caffeine buff disabled

    ANNOUNCE_SATIETY_BUFF_START = "" , -- 포만감 버프 시작
    ANNOUNCE_SATIETY_BUFF_STOP = "" ,  -- 포만감 버프 끝
    
    ANNOUNCE_CURE_WATERBORNE = "" ,  -- Waterborne disease cured by consuming items

	ANNOUNCE_DCAPACITY_CRITICAL = "", -- You drink a lot that you are almost drunk
	ANNOUNCE_DCAPACITY_HALF = "", -- You drink a fair amount that you are getting drunk

	DESCRIBE =
	{
		BOILBOOK_BASIC = "",
		BOILBOOK_ADVANCED = "",

		WATER_CLEAN_ICE = "",
		WATER_DIRTY_ICE = "",

		SPICE_CAFFEINPEPPER = "",
		SPICE_RUINCOLATE_SPREAD = "",

		WELL_KIT = "",
		WELL_SPRINKLER_KIT = "",
		WELL_WATERPUMP_KIT = "",
		WELL_BURYING_KIT = "",
		WELL_DRILLING = "",
		WELL_DRILLING_ITEM = "",
		HOLE = "",
		WELL = "",
		BOTTLE_POUCH = "",

		WX78MODULE_NONEDRUNK = "", -- WX-78 module

		-- DSD flora

		TEA_TREE = "",
		DUG_TEA_TREE = "",
		TEA_SEED = "",
		TEA_SEED_COOKED = "",
		TEA_SEED_SAPLING = "",
		TEALEAVES = "",
		TEALEAVES_DRIED = "",

		CAFFEINBERRY = "",
		DUG_CAFFEINBERRY = "",
		CAFFEINBERRY_BEAN = "",
		CAFFEINBERRY_BEAN_COOKED = "",
 
		RUINCACAO_TREE = "",
		DUG_RUINCACAO_TREE = "",
		RUINCACAO_SEED = "",
		RUINCACAO_SEED_SAPLING = "",
		RUINCACAO = "",
		RUINCACAO_BEAN = "",
		RUINCACAO_BEAN_COOKED = "",

		--APPLEPINE
		APPLEPINE = "",
		APPLEPINE_COOKED = "",
		APPLEPINE_SEEDS = "",
		APPLEPINE_OVERSIZED = "",

		--limon
		LIMON = "",
		LIMON_COOKED = "",
		LIMON_SEEDS = "",
		LIMON_OVERSIZED = "",

		--citroyuzu
		CITROYUZU = "",
		CITROYUZU_COOKED = "",
		CITROYUZU_SEEDS = "",
		CITROYUZU_OVERSIZED = "",

		--mentha_spicata

		WEED_MENTHA_SPICATA = "",
		MENTHA_SPICATA = "",

		-- Distiller Additives

		ADDITIVE_SEED = "",
		ADDITIVE_NUT = "",
		ADDITIVE_DAIRY = "",
		ADDITIVE_PETALS = "",

		-- Drinks

		WATER_CLEAN = "",
		WATER_DIRTY = "",
		WATER_SALTY = "",

		GOOPYDRINK = "",
		
		-- Kettle Drinks

		FRUITJUICE = "",
		BERRIES_JUICE = "",
		POMEGRANATE_JUICE = "",
		BANANA_JUICE = "",
		FIG_JUICE = "",
		DRAGONJUICE = "",
		GLOWBERRYJUICE = "",
		WATERMELON_JUICE = "",

		VEGGIE_TEA = "",
		CARROT_TEA = "",
		CACTUS_TEA = "",
		TOMATO_JUICE = "",
		LUMPY_TEA = "",
		SEAWEED_SHAKE = "",
		
		GREENTEA = "",
		BLACKTEA = "",
		BLACKTEA_ICED = "",
		FUER = "",
		MIXFLOWER = "",
		HIBISCUSTEA = "",
		CACTUSFLOWER_TEA = "",
		LOTUSTEA = "",
		SUSHIBISCUS = "",
		MOON_BLOSSOM_TEA = "",

		CAFFEINBERRY_JUICE = "",
		TOFFEE_LATTE = "",
		RUINCHA_LATTE = "",
		
		HOTRUINCOLATE = "",
		RUINCOLATE_SMOOTHIE = "",
		RUINXOCOLATL = "",
		TEA_RUINCOLATE_LATTE = "",

		MULLED = "",
		BUTTERBEER = "",

		APPLEPINE_JUICE = "",
		APPLEPINE_SMOOTHIE = "",
		APPLEPINE_CAPPUCCINO = "",

		CITROYUZU_JUICE = "",
		CITROYUZU_TEA = "",
		EARLGREY_TEA = "",

		-- Mod-compatibility Drinks

		COCONUT_JUICE = "", --난파선 코코넛 쥬스
		RAINBOW_SHAKE = "", --난파선 무지개 해파리 쉐이크
		QUARTZ_SHAKE = "", --난파선 광대 물고기 쉐이크
		CHERRY_ROSEBERRIES_TEA = "", --체리숲 로즈힙 차
		CHERRY_HONEY_TEA = "", --체리숲 벚꽃꿀 차
		SWEET_RICE_DRINK = "", -- 비타협 식혜
		STRAWBERRY_SMOOTHIE = "", -- 모어 푸드 팩 딸기 스무디
		STRAWBERRY_MILK_SMOOTHIE = "", -- 모어 푸드 팩 딸기 스무디 라떼

		-- Brewery Drinks

		SPOILED_DRINK = "", --Spoiled Drink

		-- Sodas
		
		SODA = "",
		FRUITSODA = "",
		LIMONSODA = "",
		COLA = "",
		COLAQUANTUM = "",
		LUMPY_BEER = "",
		APPLEPINESODA = "", -- Pineapple Soda
		CITROYUZUSODA = "", -- Orange Soda (Similar to Fanta CITROYUZU)
		DAWN_FOG = "",
		MOON_CAP_DRINK = "",

		-- Brewages

		CORN_BEER = "",
		MADHU = "",
		WINE = "",
		NOBLEWINE = "",
		SPARKLINGWINE = "",
		GLOWBERRYWINE = "",
		KUMIS = "",
		LUMPY_WINE = "",
		PULQUE = "",
		RUINCACAO_WINE = "",
		MIDNIGHT_STROM = "",
		APPLEPINE_CIDER = "",
		MENTHA_SPICATA_WINE = "",

		-- Mod-compatibility Sodas

		CHERRY_DOCTOR_COLA = "",
		STRAWBERRYSODA = "", -- Strawberry Soda (like Welch's Strawberry Soda)

		-- Mod-compatibility Brewages

		AUROBOW = "",
		COCONUT_WINE = "",
		CHERRY_BLOOM_MADHU = "",
		GIANT_BLUEBERRY_WINE = "",
		RICE_WINE = "",
		WHEAT_BEER = "",
		PALE_BEER = ""

		-- Distilled Drinks

		DISINFECTANT = "",
		CORN_WHISKEY = "",
		LUMPY_VODKA = "",
		TEQUILA = ""
		MADHU_RUM = "",
		BERRY_BRANDY = "",
		AREUHI = "",
		APPLEPINE_BRANDY = "",
		VOID = "",
		CITROYUZU_CURACAO = "",
		MENTHA_SPICATA_CURACAO = "",

		-- Warly-only Spirits

		BERRY_GIN = ""
		GLOWBERRY_GIN = ""
		ABSINTHE = "",
		TEA_LUMPY_VODKA = "",
		PETALS_BERRY_BRANDY = "",
		KAHLUA = "",
		NUT_CORN_WHISKEY = "",
        RUINCACAO_CREAM_LIQUEUR = "",
        RUMCHATA = "",

		-- Mod-compatiblity Spirits

		MOONWAY = "",
		ARRACK = "",
		CHERRY_BLOOM_RUM = "",
		RICE_SPIRITS = "",
		WHEAT_WHISKEY = "",
		PALE_WHISKEY = "",

		-- Warly-only Spirits

		NUT_COCONUT_BRANDY = "",
	    GIANT_BLUEBERRY_GIN = "",

		-- Cookpot Dishes

        DARK_RUINCOLATE = "",
        WHITE_RUINCOLATE = "",
        RUINCOLATE = "",
        RUIN_SCHOKAKOLA = "",
        APPLEPINE_PIE = "",
        APPLEPINE_FRIED_RICE = "",

		BUCKET_STEEL_EMPTY = 
		{
			EMPTY = "",
			FULL = "",
			FULL_ICE = "",
			DIRTY = "",
			DIRTY_ICE = "",
		},

		BUCKET_WOODIE_EMPTY = 
		{
			EMPTY = "",
			FULL = "",
			FULL_ICE = "",
			DIRTY = "",
			DIRTY_ICE = "",
		},

		BUCKET_DRIFTWOOD_EMPTY = 
		{
			EMPTY = "",
			FULL = "",
			FULL_ICE = "",
			DIRTY = "",
			DIRTY_ICE = "",
		},

		BUCKET_EMPTY = 
		{
			EMPTY = "",
			FULL = "",
			FULL_ICE = "",
			DIRTY = "",
			DIRTY_ICE = "",
		},

		DESALINATOR =
		{
			EMPTY = "",
			PURIFY_LONG = "",
			PURIFY_SHORT = "",
			HASWATER = "",
			BURNT = "",
			HASSALT = "",
		},

		BARREL =
		{
			GENERIC = "",
			BURNT = "",
		},

		BREWERY =
		{
			EMPTY = "",
			BURNT = "",
			FERMENTING_LONG = "",
			FERMENTING_SHORT = "",
			DONE = "",
		},

		CAMPKETTLE_ITEM = "",
		CAMPKETTLE =
		{
			GENERIC = "",
			BOILING_LONG = "",
			BOILING_SHORT = "",
			DONE = "",
			STOP = "",
		},

		CAMPDESALINATOR_ITEM = "",
		CAMPDESALINATOR =
		{
			GENERIC = "",
			BOILING_LONG = "",
			BOILING_SHORT = "",
			DONE = "",
			STOP = "",
		},

		KETTLE =
		{
			EMPTY = "",
			BURNT = "",
			BOILING_LONG = "",
			BOILING_SHORT = "",
			DONE = "",
			PURIFY_LONG = "",
			PURIFY_SHORT = "",
			HASWATER = "",
			MELT_LONG = "",
			MELT_SHORT = "",
		},

		PORTABLEKETTLE_ITEM =
		{
			GENERIC = "",
			EMPTY = "", 
			BOILING_LONG = "",
			BOILING_SHORT = "",
			DONE = "",
			PURIFY_LONG = "",
			PURIFY_SHORT = "",
			HASWATER = "",
			MELT_LONG = "",
			MELT_SHORT = "",
		},
		
		DISTILLERS =
		{   
		    EMPTY = "",
			DISTILLING_LONG = "",
			DISTILLING_SHORT = "",
			DONE = "",
		},

		WELL_WATERPUMP =
		{
			HIGH_PRESSURE = "", -- Max Pressure
			MIDDLE_PRESSURE = "", -- Mid Pressure
			LOW_PRESSURE = "", -- Low pressure
			RECHARG_PRESSURE = "", -- No pressure
		},
		
		WELL_SPRINKLER =
		{ 
			LOWFUEL = "",
			ON = "",
			OFF = "",
		},
	},
}