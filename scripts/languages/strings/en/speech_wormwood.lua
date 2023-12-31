return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "It's already filled.", -- Attempting to give a non-empty bucket to a well
            WELL_BUSY = "It's busy.", -- Attempting to give a bucket with water to a well
        }
    },

        ANNOUNCE_DRUNK = "Woozy...", -- Character is drunk
        ANNOUNCE_DRUNK_END = "Phew...", -- Character sobers up (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Reserved for Wigfrid.
        ANNOUNCE_NOTCHARGE = "My squiggly friend isn't ready yet.", -- Attempting to milk a volt goat with no charge
        ANNOUNCE_NOTHIRSTSLEEP = "Too thirsty to sleep.", -- Character is too thirsty to sleep at night
        ANNOUNCE_NOTHIRSTSIESTA = "Too thirsty to nap.", -- Character is too thirsty to nap during the day
        ANNOUNCE_SLEEP_END = "", -- Character wakes up after sleeping and fully sobers up from being drunk
        ANNOUNCE_THIRST = "I need a drink.", -- Character is very thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "I feel all bouncy.", -- Character gains the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Not so bouncy now.", -- Character loses the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "", -- Announcement when curing a waterborne disease with an item (Wormwood's quote, specific to him)

        ANNOUNCE_DCAPACITY_CRITICAL = "Something feels off...", -- Character is about to become drunk
        ANNOUNCE_DCAPACITY_HALF = "Ugh...", -- Character starts feeling the effects of alcohol

        DESCRIBE =
        {
            BOILBOOK = "Things to drink",

            WATER_CLEAN_ICE = "Cold. Really cold", -- Clean ice water
            WATER_DIRTY_ICE = "Cold. Really cold", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "(Sniff) Ee-exhilarating! Ee-exhilarating!", -- Pepper spice

            WELL_KIT = "Plant it in a hole", -- Well kit
            WELL_SPRINKLER_KIT = "Plant it near a hole or water puddle", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Plant it in a hole", -- Steam water pump kit
            WELL_BURYING_KIT = "Block the hole", -- Hole burying kit
            WELL_DRILLING = "Making a hole in the ground", -- Drilling a hole
            WELL_DRILLING_ITEM = "Tool for making holes", -- Drilling item
            HOLE = "There's water inside", -- Well hole
            WELL = "You can get water", -- Well

            -- Water mode plants

            TEA_TREE = "Stylish friend", -- Tea tree
            DUG_TEA_TREE = "Needs soil", -- Dug up tea tree
            TEA_SEED = "Stylish little one!", -- Tea tree fruit
            TEA_SEED_COOKED = "It's edible now", -- Cooked tea tree fruit
            TEA_SEED_SAPLING = "Grow up as a stylish one!", -- Tea tree sapling
            TEALEAVES = "Thanks, stylish friend!", -- Tea leaves
            TEALEAVES_DRIED = "Hmm... I like the smell", -- Dried tea leaves

            CAFFEINBERRY = "Edible rocky friend", -- Coffee bush
            DUG_CAFFEINBERRY = "Needs soil", -- Dug up coffee bush
            CAFFEINBERRY_BEAN = "Nice smell", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Very good!", -- Cooked coffee bean

            RUINCACAO_TREE = "A friend like cactus", -- Cacao tree
            DUG_RUINCACAO_TREE = "Needs soil", -- Dug up cacao tree
            RUINCACAO_SEED = "Baby friend needs soil", -- Cacao sapling item
            RUINCACAO_SEED_SAPLING = "Very well done!", -- Planted cacao sapling
            RUINCACAO = "Baby friend's home", -- Cacao fruit before breaking
            RUINCACAO_BEAN = "Oily food", -- Cacao bean after breaking
            RUINCACAO_BEAN_COOKED = "Ready to eat", -- Cooked cacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Little ones are inside", -- Liqueur additive for seeds (anise, juniper berry, etc.)
            ADDITIVE_PETALS = "Pretty things are inside", -- Liqueur additive for herbs, tea leaves, flower petals
            ADDITIVE_NUT = "Edible things are inside", -- Liqueur additive for birchnut, coconut, coffee bean, cacao bean
            ADDITIVE_DAIRY = "Hmm?", -- Liqueur additive for dairy products

            -- Drinks

            WATER_CLEAN = "Clean to drink", -- Clean water
            WATER_DIRTY = "Dirty to drink", -- Dirty water
            WATER_SALTY = "Can't drink it", -- Saltwater

            GOOPYDRINK = "Gulp", -- Failed drink (wet goo concept)

            -- Kettle drinks

            FRUITJUICE = "Fruit mix to drink", -- Mixed fruit juice
            BERRIES_JUICE = "Sweet to drink", -- Berry juice
            POMEGRANATE_JUICE = "Seed fruit to drink", -- Pomegranate juice
            BANANA_JUICE = "Sweet with some hair", -- Banana juice
            FIG_JUICE = "Sweet pocket water", -- Fig juice
            DRAGONJUICE = "Beautiful fruit to drink", -- Dragonfruit juice
            GLOWBERRYJUICE = "Glowing gulp", -- Glowberry juice
            WATERMELON_JUICE = "Moist and sweet to drink", -- Watermelon juice

            VEGGIE_TEA = "Orange to drink?", -- Green juice
            CARROT_TEA = "Orange to drink", -- Carrot tea
            CACTUS_TEA = "Something prickly inside", -- Cactus tea
            TOMATO_JUICE = "Sloppy ball water", -- Tomato juice
            LUMPY_TEA = "Made from dirt-grown stuff to drink", -- Root tea
            SEAWEED_SHAKE = "Full of slippery stuff", -- Seaweed shake

            GREENTEA = "Cried like a stylish one", -- Fresh green tea
            BLACKTEA = "Smells very nice", -- Black tea
            BLACKTEA_ICED = "Refreshing", -- Iced black tea
            FUER = "Good for sore throat", -- Leaf tea (ivy leaf, bay leaf, fern)
            MIXFLOWER = "Nice smells mixed in", -- Mixed flower petal tea
            HIBISCUSTEA = "I like the smell", -- Hibiscus tea
            CACTUSFLOWER_TEA = "I want to drink it", -- Cactus flower tea
            LOTUSTEA = "Sweet smell", -- Lotus tea
            SUSHIBISCUS = "Hmm... don't like the smell", -- Suicide tea (stinging nettle, carrot leaf, mustard)
            MOON_BLOSSOM_TEA = "Hmm... nice smell", -- Moonflower tea

            CAFFEINBERRY_JUICE = "Yeehaw!", -- Black coffee
            TOFFEE_LATTE = "Nice nutty smell", -- Toffeenut latte
            RUINCHA_LATTE = "Sweet and bold!", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Make it warm", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Make it cold", -- Chocolate smoothie (chilled)
            RUINXOCOLATL = "Bitter to drink", -- Chocolatl (spicy)
            TEA_RUINCOLATE_LATTE = "Has a stylish aroma", -- Matcha latte

            MULLED = "Warming up the insides, zzz", -- Bángshòu
            BUTTERBEER = "Gulp!", -- Butterbeer from the Harry Potter series

            -- Collaborative Kettle Drinks

            COCONUT_JUICE = "Bubbly with a tang", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Made with pretty bubbly things", -- Shipwrecked Rainbow Jellyshake
            QUARTZ_SHAKE = "Made with hardy bubbles", -- Shipwrecked Crusted Ellegance
            CHERRY_ROSEBERRIES_TEA = "Has a tangy scent", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "The bees love it", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Sweet!", -- VitaHive Sake
            PINEANANAS_JUICE = "Fit for a crown", -- Legion Pineananas Juice
            ORANGE_JUICE = "A citrusy orb to drink", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Cool and tangy", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Creamy and tangy", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Drinkable, surprisingly", -- Spoiled Drink

            -- Distillery Soda

            SODA = "Fizzing water", -- Carbonated Water
            FRUITSODA = "Bubbly fruit drink", -- Fruit Soda
            LEMONLIMESODA = "Bubbly and sweet", -- Lemon Lime Soda (a higher tier of Fruit Soda)
            COLA = "Bubbly dark water", -- Cola
            COLAQUANTUM = "Fizzing and radiant", -- Cola Quantum
            LUMPY_BEER = "Fizzing rooty water", -- Root Beer (not an alcoholic beverage)

            -- Distillery Liquor

            CORN_BEER = "Tiny seeds fermented", -- Corn Beer
            MADHU = "Buzzy juice fermented", -- Madhu
            WINE = "Tiny and fermented", -- Wine (simply made from berries)
            NOBLEWINE = "Tiny and baked, fermented", -- Noble Wine (made from baked berries)
            SPARKLINGWINE = "Fizzing and fermented", -- Sparkling Wine
            GLOWBERRYWINE = "Glowing and fermented", -- Glowberry Wine
            KUMIS = "Sah-ha-ye", -- Kumis, fermented mare's milk
            LUMPY_WINE = "Rooty and fermented", -- Sake (made from roots like potatoes or sweet potatoes)
            PULQUE = "Completely sah-ha-ye", -- Pulque (fermented agave juice)
            RUINCACAO_WINE = "Not very bitter", -- Cacao Wine

            -- Collaborative Soda

            CHERRY_DOCTOR_COLA = "Bubbly fruity dark water", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Bubbly fit-for-a-crown water", -- Carbonated Pineananas (Olimar's)
            ORANGESODA = "Bubbly orange orb water", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Bubbly and sweet fruity water", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Liquor

            AUROBOW = "Colorful as is!", -- Shipwrecked Aurobouros, Rainbow Jellywine
            COCONUT_WINE = "", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "", -- Cherry Forest Cherry Blossom Honey Madhu
            GIANT_BLUEBERRY_WINE = "", -- VitaHive Boom!Berry Sapphire (explodes when ignited)
            RICE_WINE = "", -- VitaHive Makgeolli
            WHEAT_BEER = "", -- Hip of Food Wheat Beer
            PALE_BEER = "", -- Legion Pale Ale (beer made with various roots like yams)

            -- Distilled Spirits

            DISINFECTANT = "Good for wounds", -- Disinfectant
            CORN_WHISKEY = "Drinking small seeds", -- Corn Whiskey
            LUMPY_VODKA = "It's clear", -- Vodka
            TEQUILA = "No white ones", -- Tequila
            MADHU_RUM = "Bubble juice, clean", -- Rum
            BERRY_BRANDY = "Eating small things, drinking quickly", -- Berry Brandy
            AREUHI = "Not Ha-ye", -- Kruse Distilled Spirits Areuhi

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "", -- Gin
            GLOWBERRY_GIN = "", -- Glowberry Gin
            ABSINTHE = "", -- Absinthe
            TEA_LUMPY_VODKA = "", -- Vodka
            PETALS_BERRY_BRANDY = "", -- Rose Brandy
            KAHLUA = "", -- Coffee liqueur Kahlua
            NUT_CORN_WHISKEY = "", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "", -- Baileys Cocoa Cream Liqueur
            RUMCHATA = "", -- Rumchata (a dairy product mixed with rum)

            -- Collaboration Distilled Spirits

            MOONWAY = "Colorful as it is", -- Rainbow Jellyfish Distilled Spirits
            ARRACK = "", -- Arrack Indonesian version of coconut wine distilled spirits
            CHERRY_BLOOM_RUM = "", -- Cherry Honey Distilled Spirits Cherry Blossom Leaves Floating
            RICE_SPIRITS = "", -- Rice wine
            WHEAT_WHISKEY = "", -- Wheat Whiskey
            PALE_WHISKEY = "", -- Pale Malt Whiskey

            -- Warly Exclusive Distillery Collaborative Liquor

            NUT_COCONUT_BRANDY = "", -- Coconut Brandy (Caribbean Brandy, renamed due to inability to make Caribbean Brandy)
            GIANT_BLUEBERRY_GIN = "", -- Boom Berry Sapphire (carrot explodes when ignited)

            -- Pot Recipes

            DARK_RUINCOLATE = "Eating something dark", -- Dark Chocolate
            WHITE_RUINCOLATE = "Eating something white", -- White Chocolate
            RUINCOLATE = "Eating something brown", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Eating something that makes your eyes sparkle", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "An empty steel bucket", -- Empty steel bucket
                FULL = "Clean drinkable water", -- Clean collected rainwater
                FULL_ICE = "Clean and cold", -- Rainwater has frozen
                DIRTY = "Dirty to drink", -- Rainwater has become dirty
                DIRTY_ICE = "Dirty and frozen", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "I dug into friends, heh...", -- Woodie's empty wooden bucket
                FULL = "Clean drinkable water", -- Clean collected rainwater
                FULL_ICE = "Clean and cold", -- Rainwater has frozen
                DIRTY = "Dirty to drink", -- Rainwater has become dirty
                DIRTY_ICE = "Dirty and frozen", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Made from friends", -- Empty wooden bucket
                FULL = "Clean drinkable water", -- Clean collected rainwater
                FULL_ICE = "Clean and cold", -- Rainwater has frozen
                DIRTY = "Dirty to drink", -- Rainwater has become dirty
                DIRTY_ICE = "Dirty and frozen", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Separates salty water", -- No water in the desalinator
                PURIFY_LONG = "Wait...", -- Still a long time left for purification
                PURIFY_SHORT = "Almost done", -- Purification is almost complete
                HASWATER = "Done!", -- Clean water is in the desalinator
                BURNT = "Not good", -- The desalinator has burned down
                HASSALT = "Lots of salt", -- There is still salt in the desalinator
            },

            BARREL =
            {
                GENERIC = "Store drinkable water", -- Examining the barrel
                BURNT = "Oh no", -- The barrel has burnt down
            },

            BREWERY =
            {
                EMPTY = "Bubbling to make", -- Examining the brewery
                BURNT = "Not good", -- The brewery has burned down
                FERMENTING_LONG = "Wait...", -- A long time left for fermentation
                FERMENTING_SHORT = "Almost done", -- Fermentation is almost complete
                DONE = "All done!", -- The drink is ready in the brewery
            },

            CAMPKETTLE_ITEM = "Clean dirty water", -- Examining the portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "No water", -- No water in the camp kettle
                BOILING_LONG = "Wait...", -- Just started boiling water
                BOILING_SHORT = "Almost done", -- Water is almost boiled
                DONE = "Done!", -- Clean water is ready
                STOP = "Not clean", -- The campfire is out, and dirty water can't be boiled
            },

            CAMPDESALINATOR_ITEM = "Clean salty water", -- Examining the portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "No water", -- No water in the camp desalinator
                BOILING_LONG = "Wait...", -- Just started desalting water
                BOILING_SHORT = "Almost done", -- Water desalting is almost complete
                DONE = "Done!", -- Clean water is ready
                STOP = "Can't drink", -- The campfire is out, and saltwater can't be purified
            },

            KETTLE =
            {
                EMPTY = "No water yet", -- Empty kettle
                BURNT = "Oh no", -- The kettle has burnt down
                BOILING_LONG = "Wait...", -- Just started cooking a drink
                BOILING_SHORT = "Almost done", -- The drink is nearly done
                DONE = "Done!", -- The drink is ready
                PURIFY_LONG = "It's dirty", -- Just started purifying dirty water
                PURIFY_SHORT = "Almost done", -- Dirty water is nearly purified
                HASWATER = "What do we want?", -- Clean water is in the kettle
                MELT_LONG = "It's cold", -- Just started melting ice water
                MELT_SHORT = "Almost done", -- Ice water is nearly melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Make drinks", -- Examining the portable kettle item
                EMPTY = "No water...", -- Examining an empty placed portable kettle
                BOILING_LONG = "Wait...", -- Just started boiling water
                BOILING_SHORT = "Almost done", -- Water is almost boiled
                DONE = "All done!", -- The drink is ready
                PURIFY_LONG = "Dirty", -- Just started purifying dirty water
                PURIFY_SHORT = "Almost done", -- Dirty water is almost purified
                HASWATER = "What do you want to make?", -- Clean water is in the kettle
                MELT_LONG = "It's cold", -- Just started melting ice water
                MELT_SHORT = "Almost done", -- Ice water is nearly melted
            },

            DISTILLERS =
            {
                EMPTY = "Distilling bubbles", -- Examining the distiller
                DISTILLTING_LONG = "Wait...", -- Still a long time left for distillation
                DISTILLING_SHORT = "Almost done", -- Distillation is almost complete
                DONE = "All done!", -- The drink is ready in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Gushing", -- Maximum pressure
                MIDDLE_PRESSURE = "Sufficient", -- Medium pressure
                LOW_PRESSURE = "Need steam", -- Almost no pressure
                RECHARG_PRESSURE = "Out of steam", -- No pressure at all (this can't be used until the pressure is back to maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Need fuel", -- Almost out of fuel
                ON = "Giving water to friends", -- Currently operating
                OFF = "Good friend to friends", -- Turned off and not operating
            },
        },
    }