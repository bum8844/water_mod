return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "There's no room for another.", -- Trying to give a full bucket to a well
            WELL_BUSY = "I'm out of rope!", -- Trying to give a bucket with water to a well
        }
    },

        ANNOUNCE_DRUNK = "Ugh, weaker than Wolfgang's booze...", -- Becoming drunk
        ANNOUNCE_DRUNK_END = "Wolfgang feeling better now.", -- Sobering up from alcohol (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "Ha! Alcohol is nothing to mighty Wolfgang!", -- Mighty state alcohol immunity
        ANNOUNCE_NOTCHARGE = "Wolfgang must give power to charge Goat!", -- Trying to milk Goat without charged rods
        ANNOUNCE_NOTHIRSTSLEEP = "Wolfgang is too thirsty to sleep...", -- Trying to sleep at night with low thirst
        ANNOUNCE_NOTHIRSTSIESTA = "Wolfgang needs a drink before a siesta...", -- Trying to sleep during the day with low thirst
        ANNOUNCE_SLEEP_END = "Wolfgang stronger than puny booze!", -- Waking up after sleeping and sobering up from alcohol
        ANNOUNCE_THIRST = "Mighty muscles drying up...", -- Becoming too thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Wolfgang running like a wolf!", -- Starting caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Time for Wolfgang's anaerobic exercise.", -- Ending caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Wolfgang feels relieved.", -- Announce when curing waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Wolfgang should stop drinking...", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "Wolfgang feels a bit warmer...", -- Starting to get drunk

        DESCRIBE =
        {
            BOILBOOK = "It's a guide on making drinks!",

            WATER_CLEAN_ICE = "Wolfgang's drinking water froze...", -- Clean ice
            WATER_DIRTY_ICE = "This ice is not fit for consumption.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "Hmm... It smells good...", -- Caffeine pepper spice

            WELL_KIT = "Wolfgang will build wells for his friends!", -- Well kit
            WELL_SPRINKLER_KIT = "A powerful automatic sprinkler!", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Materials for a strong well.", -- Steam water pump kit
            WELL_BURYING_KIT = "Can Wolfgang seal the holes he dug?", -- Hole burying kit
            WELL_DRILLING = "The machine is fighting with the ground!", -- Drilling the hole
            WELL_DRILLING_ITEM = "Digging into the ground. Very powerful!", -- Drilling item
            HOLE = "Wolfgang gets water from this hole.", -- Well hole
            WELL = "Now Wolfgang can get water from the well!", -- Well

            -- Water mode plants

            TEA_TREE = "It's a small tree; be careful not to step on it!", -- Tea tree
            DUG_TEA_TREE = "This small tree came out of the ground.", -- Dug tea tree
            TEA_SEED = "Wolfgang can crush it with his hands!", -- Tea tree seed
            TEA_SEED_COOKED = "These tiny seeds are too small to eat.", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "It's a very small tree!", -- Tea tree sapling
            TEALEAVES = "These leaves smell nice.", -- Tea leaves
            TEALEAVES_DRIED = "The green leaves turned brown after drying.", -- Dried tea leaves

            CAFFEINBERRY = "This is different from what Wolfgang knows.", -- Coffee bush
            DUG_CAFFEINBERRY = "Cold and lonely.", -- Dug coffee bush
            CAFFEINBERRY_BEAN = "Hmm... It smells good.", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "These small beans make Wolfgang stronger!", -- Cooked coffee bean

            RUINCACAO_TREE = "Ugh... Wolfgang has a bad feeling about this.", -- Cacao tree
            DUG_RUINCACAO_TREE = "This is an unpleasant tree.", -- Dug cacao tree
            RUINCACAO_SEED = "This scary tree is still small and weak.", -- Cacao seed item
            RUINCACAO_SEED_SAPLING = "A small and scary tree will grow soon.", -- Cacao sapling planted
            RUINCACAO = "Wolfgang can't break this with his mighty strength.", -- Cacao fruit before breaking
            RUINCACAO_BEAN = "The tough fruit has been defeated.", -- Cacao bean after breaking
            RUINCACAO_BEAN_COOKED = "It smells delicious, but it's also scary...", -- Cooked cacao bean

            -- Distilled spirit additives

            ADDITIVE_SEED = "It has a refreshing smell.", -- Herb (anise, juniper berry, and star-shaped motifs) additive for liqueur production
            ADDITIVE_PETALS = "Where should Wolfgang use these small flowers?", -- Herb, tea leaves, and flower petal additives for liqueur production
            ADDITIVE_NUT = "Wolfgang can easily crush this.", -- Nut, coconut, coffee bean, and cacao bean additives for liqueur production
            ADDITIVE_DAIRY = "Should Wolfgang not drink milk?", -- Dairy product additives for liqueur production

            -- Drinks

            WATER_CLEAN = "Water is important for strong muscles!", -- Clean water
            WATER_DIRTY = "Drinking this would make Wolfgang sick.", -- Dirty water
            WATER_SALTY = "Wolfgang doesn't like salty water!", -- Saltwater

            GOOPYDRINK = "Did Wolfgang put something strange in it?", -- Failed drink (Wet Goop concept)

            -- Teapot drinks

            FRUITJUICE = "It's water with fruit in it.", -- Mixed fruit juice
            BERRIES_JUICE = "Sweet and red.", -- Berry juice
            POMEGRANATE_JUICE = "Any seeds in there?", -- Pomegranate juice
            BANANA_JUICE = "Cool and tasty!", -- Banana juice
            FIG_JUICE = "Made from big, sweet fruits.", -- Fig juice
            DRAGONJUICE = "Why is the fruit red but the juice white?", -- Dragon fruit juice
            GLOWBERRYJUICE = "Can Wolfgang drink glowing water?", -- Glowberry juice
            WATERMELON_JUICE = "Made from a big watermelon.", -- Watermelon juice

            VEGGIE_TEA = "It tastes like grass and is very bitter!", -- Green juice
            CARROT_TEA = "Wolfgang enjoys drinking carrots too!", -- Carrot tea
            CACTUS_TEA = "No sharp spines, right?", -- Cactus tea
            TOMATO_JUICE = "A healthy drink!", -- Tomato juice
            LUMPY_TEA = "Wolfgang boiled the muscles of plants.", -- Root tea
            SEAWEED_SHAKE = "Drinking this won't make Wolfgang stronger.", -- Seaweed shake

            GREENTEA = "It has a strong grassy smell.", -- Fresh green tea
            BLACKTEA = "Wolfgang thinks black tea might be dangerous...", -- Black tea
            BLACKTEA_ICED = "It's a refreshing tea! Wolfgang likes it.", -- Black tea iced
            FUER = "Made from tree leaves.", -- Fuer, leaf tea, fern tea
            MIXFLOWER = "It smells nice.", -- Mixed flower petal tea
            HIBISCUSTEA = "It makes Wolfgang emotional.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Tea made from red flowers.", -- Cactus flower tea
            LOTUSTEA = "Has Wolfgang ever seen pink tea?", -- Lotus tea
            SUSHIBISCUS = "Even Wolfgang's muscles are shivering...", -- Suicide tea

            CAFFEINBERRY_JUICE = "It's bitter, but it makes Wolfgang stronger!", -- Black coffee
            TOFFEE_LATTE = "It has a nutty flavor.", -- Toffeenut latte
            RUINCHA_LATTE = "It's sweet and makes Wolfgang stronger!", -- Mocha latte (coffee + cocoa)

            HOTRUINCOLATE = "It's sweet and warm chocolate.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "It's a cold chocolate drink.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "It's very bitter chocolate drink!", -- Chocotlatl (spicy)
            TEA_RUINCOLATE_LATTE = "A grassy drink with chocolate flavor.", -- Matcha latte

            MULLED = "Wolfgang can't smell alcohol.", -- Bancha
            BUTTERBEER = "It's beer, but sweet!", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "The tough fruit is now a drink!", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "A pretty jelly drink!", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Wolfgang is confused. Is this what fish drink?", -- Shipwrecked Crystalline Fish Shake
            CHERRY_ROSEBERRIES_TEA = "It smells like lovely roses.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Extremely sweet!", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "It's sweet even though it only has rice!", -- Vita Hybrids Sikhye
            PINEANANAS_JUICE = "Incredibly refreshing juice.", -- Regal's Pineapple Juice
            ORANGE_JUICE = "Sour, sweet, and orange.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "It's full of seeds.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Smooth and tasty.", -- More Food Pack Strawberry Milk Smoothie

            -- Brewery Drinks

            SPOILED_DRINK = "Ugh, it smells terrible!", -- Spoiled drink

            -- Brewery Soda

            SODA = "It's fizzy!", -- Carbonated Water
            FRUITSODA = "Fizzy and sweet.", -- Fruit Soda
            LEMONLIMESODA = "Extremely sweet!", -- Lemon Lime Soda (Superior version of Fruit Soda)
            COLA = "Sweet and black beverage.", -- Cola
            COLAQUANTUM = "A powerful drink! Wolfgang likes it a lot!", -- Cola Quantum
            LUMPY_BEER = "It has a unique and refreshing taste.", -- Root Beer (Not alcoholic)

            -- Brewery Spirits

            CORN_BEER = "Made from corn.", -- Corn Beer
            MADHU = "Made from angry bee honey.", -- Madhu
            WINE = "A drink for special occasions.", -- Wine (Made from just berries)
            NOBLEWINE = "Made from roasted fruit!", -- Noble Wine (Made from roasted berries)
            SPARKLINGWINE = "Fizzing and yellow!", -- Sparkling Wine
            GLOWBERRYWINE = "It sparkles.", -- Glow Berry Wine
            KUMIS = "Made milk into alcohol.", -- Kumis (Fermented mare's milk)
            LUMPY_WINE = "Made from root vegetables.", -- Sake (Made from potatoes, sweet potatoes, etc.)
            PULQUE = "Became a prickly pear drink.", -- Pulque (Agave)
            RUINCACAO_WINE = "Can you make alcohol from chocolate?", -- Cacao Wine

            -- Collaboration Soda

            CHERRY_DOCTOR_COLA = "Tastes like candy!", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Sour and refreshing.", -- Carbonated Pineapple (Orangina)
            ORANGESODA = "Sweet and fizzy.", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "As many seeds as bubbles!", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "A pretty jelly drink.", -- Shipwrecked Aurobouros (Rainbow Jellyfish Wine)
            COCONUT_WINE = "It became a coconut drink.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Incredibly sweet!", -- Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Will Wolfgang's belly explode?", -- Vita Hybrids Boom! Berry Sapphire (Explodes when ignited)
            RICE_WINE = "It's white like milk.", -- Vita Koalefant Soju
            WHEAT_BEER = "It's like Bavaria!", -- Hip of Food Wheat Beer
            PALE_BEER = "Pale like a little ghost's skin.", -- Regiom Pale Ale (Beer made with Monster Meat)

            -- Distilled Spirits Descriptions

            DISINFECTANT = "It's used for cleaning.", -- Disinfectant
            CORN_WHISKEY = "It's made in the Scottish way.", -- Corn Whiskey
            LUMPY_VODKA = "Vodka! It's famous in the homeland!", -- Lumpy Vodka
            TEQUILA = "It's best enjoyed under the sun!", -- Tequila
            MADHU_RUM = "Sea monkeys might like this.", -- Madhu Rum
            BERRY_BRANDY = "It's a fine-tasting spirit.", -- Berry Brandy
            AREUHI = "It's made by boiling milk.", -- Creamy Kremez Distilled Spirit Areuhi

            -- Warly-Specific Distilled Spirits

            BERRY_GIN = "Best when mixed with tonic!", -- Gin
            GLOWBERRY_GIN = "Never seen glowing spirits before!", -- Glow Berry Gin
            ABSINTHE = "Wow... it's like green fairy spirits.", -- Absinthe
            TEA_LUMPY_VODKA = "It's a strange vodka with a grassy taste!", -- Green Tea Lumpy Vodka
            PETALS_BERRY_BRANDY = "It smells fragrant.", -- Rose Petal Berry Brandy
            KAHLUA = "Made with beans, it's a spirit.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "It smells nutty.", -- Nutty Corn Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Did they make chocolate into spirits?", -- Bailey's Cacao Cream Liqueur
            RUMCHATA = "It's a strange spirit with milk.", -- Rumchata (Rum and Horchata, a dairy-based beverage)

            -- Collaborative Distilled Spirits

            MOONWAY = "Made by boiling pretty jellies.", -- Rainbow Jellyfish Spirits
            ARRACK = "Coconut spirits made by boiling.", -- Arrack, Indonesian version of coconut wine spirits
            CHERRY_BLOOM_RUM = "Was there such a sweet spirit?", -- Cherry Honey Spirits with cherry blossom petals floating
            RICE_SPIRITS = "Made with white spirits.", -- Rice Spirits
            WHEAT_WHISKEY = "Wolfgang prefers strong whiskey!", -- Wheat Whiskey
            PALE_WHISKEY = "Wolfgang knows it's American style.", -- Pale Malt Whiskey

            -- Warly Exclusive Spirits

            NUT_COCONUT_BRANDY = "The world is wide! There's plenty to steal!", -- Take what you can! Give nothin' back! - Captain Jack Sparrow, Pirates of the Caribbean
            GIANT_BLUEBERRY_GIN = "Wolfgang feels like he might explode like a giant blueberry!", -- Boom Berry Sapphire (Carrot explodes)

            -- Pot Cooking Descriptions

            DARK_RUINCOLATE = "Hmm, it's bitter!", -- Dark Chocolate
            WHITE_RUINCOLATE = "It's filled with fat.", -- White Chocolate
            RUINCOLATE = "Wolfgang likes sweet food too!", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Wolfgang has tried this before!", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "As sturdy as Wolfgang's muscles!", -- Steel bucket is empty
                FULL = "Water for Wolfgang is ready!", -- Clean rainwater in the steel bucket
                FULL_ICE = "The water has frozen in the cold.", -- Rainwater has frozen in the steel bucket
                DIRTY = "Precious water has become dirty...", -- Rainwater has become dirty
                DIRTY_ICE = "Oh no! What a waste!", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Delicate and strong.", -- Wooden bucket is empty
                FULL = "Water for Wolfgang is ready!", -- Clean rainwater in the wooden bucket
                FULL_ICE = "The water has frozen in the cold.", -- Rainwater has frozen in the wooden bucket
                DIRTY = "Precious water has become dirty...", -- Rainwater has become dirty
                DIRTY_ICE = "Oh no! What a waste!", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Ha! A cup fit for mighty Wolfgang!", -- Empty wooden bucket
                FULL = "Water for Wolfgang is ready!", -- Clean rainwater in the wooden bucket
                FULL_ICE = "The water has frozen in the cold.", -- Rainwater has frozen in the wooden bucket
                DIRTY = "Precious water has become dirty...", -- Rainwater has become dirty
                DIRTY_ICE = "Oh no! What a waste!", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "No salty water.", -- No water in the desalinator
                PURIFY_LONG = "Salty water still remains.", -- Purification is in progress, still a lot to go
                PURIFY_SHORT = "It's almost done!", -- Purification is almost complete
                HASWATER = "Now Wolfgang can drink!", -- Clean water is ready in the desalinator
                BURNT = "The machine burned, and white salt remains.", -- The desalinator has burnt
                HASSALT = "There's a salty smell from inside.", -- Salt is still inside the desalinator
            },

            BARREL =
            {
                GENERIC = "Wolfgang prepares for tough times.", -- Examining a barrel
                BURNT = "Did all the water burn?", -- The barrel has burnt
            },

            BREWERY =
            {
                EMPTY = "Turning water into drinks.", -- Examining an empty brewery
                BURNT = "Can Wolfgang no longer drink?", -- The brewery has burnt
                FERMENTING_LONG = "It will take a long time.", -- Fermentation will take a while
                FERMENTING_SHORT = "It's almost done!", -- Fermentation is nearly complete
                DONE = "Finally finished!", -- Brewery contains a drink
            },

            CAMPKETTLE_ITEM = "Make clean water with this!", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "We need boiling water.", -- Examining an empty camp kettle on a fire pit
                BOILING_LONG = "The water is still dirty.", -- Starting to boil the water
                BOILING_SHORT = "It's almost done!", -- Water is almost done boiling
                DONE = "Now we can drink!", -- Clean water is ready in the camp kettle
                STOP = "The fire needs more work.", -- There's no fire to continue boiling
            },

            CAMPDESALINATOR_ITEM = "Now we can drink salty water!", -- Examining the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "We need to boil salty water.", -- Examining an empty camp desalinator on a fire pit
                BOILING_LONG = "Salty water still remains.", -- Starting to boil the salty water
                BOILING_SHORT = "It's almost done!", -- Salty water is almost done boiling
                DONE = "Now we can drink!", -- Clean water is ready in the camp desalinator
                STOP = "The fire needs more work.", -- There's no fire to continue boiling
            },

            KETTLE =
            {
                EMPTY = "Kettle needs water.", -- Empty kettle
                BURNT = "Did everything burn, even the water?", -- The kettle has burnt
                BOILING_LONG = "It needs more time to boil.", -- Starting to cook a drink
                BOILING_SHORT = "It's almost done!", -- Drink is nearly ready
                DONE = "It's time to drink!", -- Drink is ready
                PURIFY_LONG = "Water is still dirty.", -- Starting to purify dirty water
                PURIFY_SHORT = "It's almost done!", -- Water is almost purified
                HASWATER = "The kettle is filled with water.", -- Clean water is ready in the kettle
                MELT_LONG = "It needs more time to melt.", -- Starting to melt ice
                MELT_SHORT = "It's almost done!", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Wolfgang can carry it around!", -- Examining the portable kettle item
                EMPTY = "Kettle needs water.", -- Examining an empty portable kettle
                BOILING_LONG = "It needs more time to boil.", -- Starting to cook a drink
                BOILING_SHORT = "It's almost done!", -- Drink is nearly ready
                DONE = "It's time to drink!", -- Drink is ready
                PURIFY_LONG = "Water is still dirty.", -- Starting to purify dirty water
                PURIFY_SHORT = "It's almost done!", -- Water is almost purified
                HASWATER = "The kettle is filled with water.", -- Clean water is ready in the portable kettle
                MELT_LONG = "It needs more time to melt.", -- Starting to melt ice
                MELT_SHORT = "It's almost done!", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "A scary machine...", -- Examining an empty distiller
                DISTILLTING_LONG = "It will take a while.", -- Distillation will take a while
                DISTILLING_SHORT = "It's almost done!", -- Distillation is nearly complete
                DONE = "The scary machine has finished its work!", -- Distiller contains a drink
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Mighty well, like Wolfgang!", -- High water pressure in the well
                MIDDLE_PRESSURE = "Well still has enough pressure.", -- Medium water pressure in the well
                LOW_PRESSURE = "Well seems weak...", -- Low water pressure in the well
                RECHARG_PRESSURE = "Is the well taking a break?", -- No water pressure, needs recharging (maximum pressure can't be reached).
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Sprinkler seems weak.", -- Low fuel condition for the well sprinkler
                ON = "Sprinkler is working hard!", -- Sprinkler is turned on
                OFF = "Sprinkler is taking a break.", -- Sprinkler is turned off
            },
        },
    }           