return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "You need to fetch water from a well that has enough water.", -- There's a dry bucket on the well, and you tried to put a bucket on it.
            WELL_BUSY = "Let's wait.", -- There's a bucket filled with water on the well, and you tried to put a bucket on it.
        }
    },

        ANNOUNCE_DRUNK = "Fe...Feeling a bit d...dizzy...", -- Drunk
        ANNOUNCE_DRUNK_END = "Anyway, excessive drinking is absolutely prohibited.", -- Sobering up from alcohol (Hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Wickerbottom only.
        ANNOUNCE_NOTCHARGE = "You can't milk when it's not charged.", -- Unable to milk with a bucket because the Volt Goat is not charged.
        ANNOUNCE_NOTHIRSTSLEEP = "", -- Thirsty but trying to sleep at night -- Not used for Wickerbottom
        ANNOUNCE_NOTHIRSTSIESTA = "", -- Thirsty but trying to sleep during the day -- Not used for Wickerbottom
        ANNOUNCE_SLEEP_END = "", -- Fully sober after sleeping -- Not used for Wickerbottom
        ANNOUNCE_THIRST = "I need a drink from a canteen.", -- Too thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "The effects of caffeine are starting to kick in.", -- Caffeine buff starts
        ANNOUNCE_CAFFINE_BUFF_STOP = "The caffeine metabolism in my body has ended.", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "The pain of waterborne illness is starting to ease.", -- Dialogue when curing a waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "You shouldn't drink too much. Excessive drinking has a bad effect on the liver and digestive system...", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Moderate drinking has some benefits for the body.", -- When starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "A compilation of beverage information.",

            WATER_CLEAN_ICE = "Solidified water.", -- Clean ice
            WATER_DIRTY_ICE = "Solidified water containing bacteria.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "Once a very valuable spice.", -- Caffeinpepper spice

            WELL_KIT = "Construction materials used to draw water from deep aquifers.", -- Well kit
            WELL_SPRINKLER_KIT = "A machine used to draw water from deep aquifers for farming.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "A machine used to pump water from deep aquifers.", -- Steam water pump kit
            WELL_BURYING_KIT = "Tools for burying a well when it's no longer needed or functioning.", -- Burying kit
            WELL_DRILLING = "I'm trying to find out if there's an aquifer here.", -- Drilling a hole
            WELL_DRILLING_ITEM = "I need to find a suitable spot where there might be an aquifer.", -- Drilling item
            HOLE = "I can hear water, so it looks like I dug it properly.", -- Well hole
            WELL = "A construction used to draw water from deep aquifers.", -- Well

            -- Water mode plants

            TEA_TREE = "A type of small camellia tree.", -- Tea tree
            DUG_TEA_TREE = "It needs soil to grow.", -- Tea tree (dug)
            TEA_SEED = "Seeds from a tea tree.", -- Tea seed
            TEA_SEED_COOKED = "Planting it would have been better.", -- Cooked tea seed
            TEA_SEED_SAPLING = "The tea tree seedling will grow.", -- Tea tree sapling
            TEALEAVES = "These are small tea leaves.", -- Tea leaves
            TEALEAVES_DRIED = "They will be used for making black tea.", -- Dried tea leaves

            CAFFEINBERRY = "A low shrub that grows in sandy soil.", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "A combination of coffee and pepper.", -- Dug Caffeinberry bush
            CAFFEINBERRY_BEAN = "It has a unique aroma.", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Roasting brings out strong coffee and a hint of pepper.", -- Cooked coffee bean

            RUINCACAO_TREE = "The fruit must have fallen into a sinkhole.", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "It needs soil to grow.", -- Ruincacao tree (dug)
            RUINCACAO_SEED = "Seeds from a Ruincacao tree.", -- Ruincacao seed
            RUINCACAO_SEED_SAPLING = "The Ruincacao tree seedling will grow.", -- Ruincacao sapling
            RUINCACAO = "It was used as currency in ancient Aztec civilizations.", -- Unsmashed Ruincacao
            RUINCACAO_BEAN = "It's made up of a little butter and Ruincacao beans.", -- Smashed Ruincacao bean
            RUINCACAO_BEAN_COOKED = "Used for making chocolate or drinks.", -- Cooked Ruincacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Adds a seed flavor to liquors.", -- Seed additives for liquors (Anise, Juniperberry, Palgak motif)
            ADDITIVE_PETALS = "Adds leaf and flower flavors to liquors.", -- Herb and petal additives for liquors (Green tea, Flower petals)
            ADDITIVE_NUT = "Adds nut flavors to liquors.", -- Nut additives for liquors (Birchnut, Coconut, Coffee bean, Ruincacao bean)
            ADDITIVE_DAIRY = "Adds a creamy flavor to liquors.", -- Dairy additives for liquors

            -- Beverages

            WATER_CLEAN = "Essential for life. Chemically, it's H₂O.", -- Clean water
            WATER_DIRTY = "Boiling this water can help prevent waterborne diseases.", -- Dirty water
            WATER_SALTY = "Drinking this can lead to dehydration.", -- Saltwater

            GOOPYDRINK = "Oh no, this isn't right at all.", -- Failed beverage (Wet goop concept)

            -- Teapot drinks

            FRUITJUICE = "Even with random fruits, it's not bad.", -- Mixed fruit juice
            BERRIES_JUICE = "Has fever-reducing and anti-inflammatory properties.", -- Berries juice
            POMEGRANATE_JUICE = "Rich in natural estrogens.", -- Pomegranate juice
            BANANA_JUICE = "It's not bad to have a warm drink.", -- Banana juice
            FIG_JUICE = "A refreshing juice traditionally consumed in the Middle East.", -- Fig juice
            DRAGONJUICE = "The white variety is the most fragrant.", -- Dragon fruit juice
            GLOWBERRYJUICE = "I've never seen a drink like this before, amazing!", -- Glowberry juice
            WATERMELON_JUICE = "High in moisture, perfect for quenching thirst.", -- Watermelon juice

            VEGGIE_TEA = "A bitter drink that's good for the body.", -- Green juice
            CARROT_TEA = "Rich in vitamins and iron.", -- Carrot tea
            CACTUS_TEA = "Traditional tea made in some Mexican regions.", -- Cactus tea (Nopales Tea actually exists)
            TOMATO_JUICE = "Contains ingredients that help detoxify the body.", -- Tomato juice
            LUMPY_TEA = "Contains ingredients that alleviate waterborne diseases.", -- Root tea
            SEAWEED_SHAKE = "Rich in alginic acid, making it thick.", -- Seaweed shake

            GREENTEA = "Originated in Asia.", -- Fresh green tea leaves
            BLACKTEA = "A cup of tea and a good book is needed.", -- Black tea
            BLACKTEA_ICED = "It invigorates the spirit.", -- Iced black tea
            FUER = "Contains ingredients that alleviate waterborne diseases.", -- Boichaa, Leaf Tea, Gwessari Tea
            MIXFLOWER = "A mixture of various types of flowers.", -- Mixed flower petal tea
            HIBISCUSTEA = "Made from the flowers of the Hibiscus genus.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "In some regions, it's believed to be good for health.", -- Nopales tea
            LOTUSTEA = "Traditionally consumed during special occasions in Asian regions.", -- Lotus tea
            SUSHIBISCUS = "Wait... This isn't Hibiscus tea.", -- Suicide tea
            MOON_BLOSSOM_TEA = "Just being near it makes me feel calm.", -- Moonflower tea

            CAFFEINBERRY_JUICE = "I like a cup of coffee and a good book.", -- Black coffee
            TOFFEE_LATTE = "The rich aroma is enhanced.", -- Toffeenut latte
            RUINCHA_LATTE = "It takes its name from the Mayans. A combination of coffee and chocolate.", -- Mocha latte (Coffee + Cocoa)

            HOTRUINCOLATE = "A drink that evolved as chocolate traveled to Europe.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "A modified version of hot chocolate as a cold smoothie!", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "An ancient Aztec-originated beverage.", -- Chocolatl (rich and spicy)
            TEA_RUINCOLATE_LATTE = "This method adds variety to beverage options.", -- Matcha latte

            MULLED = "Tastes like the joy of the year-end.", -- Bancha
            BUTTERBEER = "A popular fictional drink; it's not real beer.", -- Butterbeer (Harry Potter series)

            -- Collaborative Pitcher Drinks

            COCONUT_JUICE = "Coconut water has been jellified by microbial fermentation.", --Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Fascinating, it maintains bioluminescence.", --Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "I should study the properties of this fish soup separately.", --Shipwrecked Quacken Soup Shake
            CHERRY_ROSEBERRIES_TEA = "It's sweet and fragrant.", --Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "It feels warming.", --Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Fermented for sweetness and easy digestion.", --Vitacorp Sweet Hyphae
            PINEANANAS_JUICE = "Rich in bromelain, so drink it in moderation.", --More Food Pack Pineapple Juice
            ORANGE_JUICE = "Orange juice, it's like the stereo type of juice.", --More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Ice and strawberries blended together, it would be even better with milk.", --More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "A popular strawberry beverage, sometimes made with yogurt instead of milk.", --More Food Pack Strawberry Milk Smoothie

            -- Brewing Drinks

            SPOILED_DRINK = "What you can drink is becoming a breeding ground for bacteria.", --Spoiled Drink

            -- Brewing Sodas

            SODA = "Carbon dioxide is dissolved and ionized in water.", --Carbonated Water
            FRUITSODA = "Fruit juice added to carbonated water.", --Fruit Soda
            LEMONLIMESODA = "It has a strong sweetness.", --Lemon Lime Soda (Fruit Soda Superior)
            COLA = "It's a popular drink recently in the United States.", --Cola (Background in 1907, Coca-Cola exists)
            COLAQUANTUM = "Hmm... I should investigate if there are any side effects of overconsumption.", --Cola Quantum (No signs of Cherenkov radiation yet (estimated around 1911))
            LUMPY_BEER = "Various root vegetables are mixed in.", --Root Beer (Not an alcoholic beverage)

            -- Brewing Spirits

            CORN_BEER = "It has its origins from ancient Incas.", --Corn Beer
            MADHU = "Mead is known as the first alcoholic drink made by humans.", --Mead
            WINE = "Originally made from grapes, but it has a long history.", --Wine (Berry Brewing)
            NOBLEWINE = "The deep sweetness is due to a fungus called Botrytis cinerea.", --Noble Wine (Roasted Berry Brewing)
            SPARKLINGWINE = "Originally, carbon dioxide is released through fermentation, but this one has artificially injected carbonation.", --Sparkling Wine
            GLOWBERRYWINE = "A new kind of wine, I should find out why it doesn't lose its light during fermentation.", --Glow Berry Wine
            KUMIS = "Traditional Central Asian drink.", --Kumis (Fermented Horse Milk)
            LUMPY_WINE = "Mostly brewed in Iceland.", --Lumpy Wine (Root Vegetable Wine)
            PULQUE = "A traditional drink made by Mesoamerican indigenous people.", --Pulque (Agave Wine)
            RUINCACAO_WINE = "A brewing spirit I've never seen before. Quite intriguing.", --Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "Wetsville Cure Drink with 23 spices.", --Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Pineapple juice added to carbonated water.", --Carbonated Pineapple (Orancee)
            ORANGESODA = "It contains orange juice.", --Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Carbonated water with strawberry juice.", --Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Spirits

            AUROBOW = "I should research why this drink is glowing.", --Shipwrecked Auroboros (Bioluminescent Jellyfish Spirits)
            COCONUT_WINE = "Palm wine is made in various tropical regions.", --Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Made from flower honey, and the color is really impressive.", --Cherry Forest Cherry Blossom Honey Spirits
            GIANT_BLUEBERRY_WINE = "It retains instability even after fermentation.", --Vitacorp Boom Berry Wine (Explodes when ignited)
            RICE_WINE = "One of the methods for long-term storage of grains.", --Vitacorp Makgeolli (Korean rice wine)
            WHEAT_BEER = "It started in ancient Egypt.", --Heap of Food Wheat Beer
            PALE_BEER = "A type of surface fermentation beer.", --Leigion Pale Ale (Green beer made from Monstra fruits)

            -- Distilled Spirits

            DISINFECTANT = "Ethanol used for disinfecting wounds. Its chemical formula is C₂H₅OH.", --Disinfectant
            CORN_WHISKEY = "Bourbon whiskey from Kentucky, USA is famous.", --Corn Whiskey
            LUMPY_VODKA = "Derived from 'вода', which means 'water' in Russian.", --Vodka
            TEQUILA = "Conquistadors made mescal from agave when they ran out of grapes.", --Tequila
            MADHU_RUM = "Diluted with water while sailing to prevent deterioration of drinking water.", --Rum
            BERRY_BRANDY = "Known as the 'king of spirits' due to its high price and complicated production.", --Berry Brandy
            AREUHI = "Makgeolli is distilled and purified repeatedly to remove impurities.", --Kumis Distilled Spirits Areuhi

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "Originally intended as a medicinal drink for diuresis, antipyretic, and diaphoresis.", --Gin
            GLOWBERRY_GIN = "Even after fermentation and distillation, it still emits light.", --Glow Berry Gin
            ABSINTHE = "Distilled spirits made by extracting various herbs in alcohol.", --Absinthe
            TEA_LUMPY_VODKA = "Interesting, the balance of flavors seems to be well-preserved.", --Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Flower scent is added to brandy to make it more spectacular.", --Rose Petal Brandy
            KAHLUA = "More commonly used for making cocktails due to its coffee aroma and sweetness.", --Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "Emphasizes the body of whiskey, making it robust.", --Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Originally created to cheaply handle leftover whiskey and cream.", --Baileys Cacao Cream Liqueur
            RUMCHATA = "Rum is mixed with cream to make it easier to drink.", --Rumchata (Rum with Horchata)

            -- Collaborative Distilled Spirits

            MOONWAY = "Even after distillation, it doesn't lose its light. Interesting.", --Shipwrecked Moonway (Distilled Bioluminescent Jellyfish Spirits)
            ARRACK = "Distilled spirits made by South Asian indigenous people using coconut flower sap.", --Arrack Indonesian Version Coconut Wine Distilled Spirits
            CHERRY_BLOOM_RUM = "Beautiful and intriguing in its action mechanism.", --Cherry Blossom Honey Spirits Distilled Spirits Cherry Blossom Petals Floating in Liquor
            RICE_SPIRITS = "Similar to sake.", --Cheongju (Korean Rice Wine)
            WHEAT_WHISKEY = "It started being made in Ireland or Scotland.", --Heap of Food Malt Whiskey
            PALE_WHISKEY = "I've never seen this whiskey before. It has a quite unique aroma.", --Pale Malt Whiskey

            -- Warly Exclusive Collaborative Distilled Spirits

            NUT_COCONUT_BRANDY = "Efforts have been made to create a pirate atmosphere.", --Coconut Brandy (Replaced with Caribbean Brandy as Caribbean Rum cannot be made)
            GIANT_BLUEBERRY_GIN = "It has the opposite properties of fermentation and distillation, considering the inherent properties of the ingredients.", --Boom Berry Sapphire (Explodes when ignited)

            -- Pot Cooking

            DARK_RUINCOLATE = "Dark chocolate! It has a very high cocoa mass content.", --Dark Chocolate
            WHITE_RUINCOLATE = "White chocolate! It has a high cocoa butter content.", --White Chocolate
            RUINCOLATE = "Chocolate! A solid form of chocolate.", --Chocolate
            RUIN_SCHOKAKOLA = "A new type of chocolate! Awakening substances have been enhanced.", --Shocka-Cola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "A bucket made of steel.", --Empty steel bucket
                FULL = "Clean water that you can drink.", -- Clean rainwater
                FULL_ICE = "Small ice chunks.", -- Rainwater frozen
                DIRTY = "Water with bacteria boiling in it.", -- Rainwater got dirty
                DIRTY_ICE = "Small ice chunks with bacteria.", -- Dirty rainwater frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "A bucket made of logs.", --Empty wooden bucket of Woody
                FULL = "Clean water that you can drink.", -- Clean rainwater
                FULL_ICE = "Small ice chunks.", -- Rainwater frozen
                DIRTY = "Water with bacteria boiling in it.", -- Rainwater got dirty
                DIRTY_ICE = "Small ice chunks with bacteria.", -- Dirty rainwater frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "A bucket made of wood.", -- Empty wooden bucket
                FULL = "Clean water that you can drink.", -- Clean rainwater
                FULL_ICE = "Small ice chunks.", -- Rainwater frozen
                DIRTY = "Water with bacteria boiling in it.", -- Rainwater got dirty
                DIRTY_ICE = "Small ice chunks with bacteria.", -- Dirty rainwater frozen
            },

            DESALINATOR =
            {
                EMPTY = "Water and salt are separated using this desalinator with seawater.", -- Desalinator has no water
                PURIFY_LONG = "It's still a long way to go for desalination.", -- A long way to go until purification is complete
                PURIFY_SHORT = "Desalination is almost done!", -- Desalination is almost complete
                HASWATER = "Only pure water remains.", -- Desalinator has clean water
                BURNT = "Wow, it's completely useless in that state.", -- Desalinator has burnt
                HASSALT = "Enough salt has been collected.", -- Desalinator has salt
            },

            BARREL =
            {
                GENERIC = "Charcoal is added for safe water storage.", -- Inspect empty barrel
                BURNT = "Oh no, all the water is gone!", -- Barrel burnt
            },

            BREWERY =
            {
                EMPTY = "We've started making alcohol for long-term food preservation.", -- Inspect empty brewery
                BURNT = "We'll have to postpone our fermentation research for a while.", -- Brewery burnt
                FERMENTING_LONG = "Now we need to be patient as the ingredients ferment.", -- A long way to go until fermentation is complete
                FERMENTING_SHORT = "Fermentation is almost done!", -- Fermentation is almost complete
                DONE = "You can smell it from afar.", -- Brewery has beverage
            },

            CAMPKETTLE_ITEM = "Boil dirty water to eliminate bacteria.", -- Inspect portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "It's empty.", -- Empty camp kettle inspect
                BOILING_LONG = "It's still a long way to sterilization.", -- Boiling has just started
                BOILING_SHORT = "It's almost sterilized!", -- Boiling is almost complete
                DONE = "It's sterilized and ready to drink.", -- Clean water is ready
                STOP = "You need to put some firewood to complete the sterilization.", -- Campfire has no fire so water is not boiling
            },

            CAMPDESALINATOR_ITEM = "Evaporate seawater to obtain fresh water.", -- Inspect portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "There's no collected fresh water.", -- No water
                BOILING_LONG = "It's still a long way to collecting fresh water.", -- Boiling has just started
                BOILING_SHORT = "It's almost full!", -- Boiling is almost complete
                DONE = "It's filled with fresh water.", -- Clean water is collected
                STOP = "The fire has gone out, so it hasn't collected enough saltwater yet.", -- Campfire has no fire so saltwater is not distilled
            },

            KETTLE =
            {
                EMPTY = "We need water.", -- Empty kettle inspect
                BURNT = "It's desolate now.", -- Kettle burnt
                BOILING_LONG = "It's still a long way to extraction.", -- Boiling has just started
                BOILING_SHORT = "It's almost done!", -- Boiling is almost complete
                DONE = "Let's enjoy the taste.", -- Beverage is ready
                PURIFY_LONG = "We need to wait for sterilization to complete.", -- Boiling dirty water has just started
                PURIFY_SHORT = "It's almost sterilized!", -- Boiling dirty water is almost complete
                HASWATER = "Ingredients are needed.", -- Clean water is in the kettle
                MELT_LONG = "We need to wait for the ice to melt.", -- Melting ice water has just started
                MELT_SHORT = "It's almost melted!", -- Melting ice water is almost complete
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "We can prepare tea anywhere.", -- Portable kettle item inspect
                EMPTY = "We need to add water before using it.", -- Empty portable kettle inspect
                BOILING_LONG = "Patience is a virtue!", -- Boiling has just started
                BOILING_SHORT = "It's going to finish soon!", -- Boiling is almost complete
                DONE = "The aroma is invigorating.", -- Beverage is ready
                PURIFY_LONG = "We need to wait for sterilization to complete.", -- Boiling dirty water has just started
                PURIFY_SHORT = "It's almost sterilized!", -- Boiling dirty water is almost complete
                HASWATER = "Hmm, maybe I'll make some tea.", -- Clean water is in the portable kettle
                MELT_LONG = "We need to wait for the ice to melt.", -- Melting ice water has just started
                MELT_SHORT = "It's almost melted!", -- Melting ice water is almost complete
            },

            DISTILLERS =
            {
                EMPTY = "It's used to distill spirits or make liqueurs.", -- Distiller inspect
                DISTILLTING_LONG = "Separating, still distilling.", -- A long way to go until distillation is complete
                DISTILLING_SHORT = "Distillation is almost done!", -- Distillation is almost complete
                DONE = "Let's make sure it's distilled properly.", -- Distiller has a beverage
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "The pressure is more than sufficient.", -- Maximum pressure
                MIDDLE_PRESSURE = "The pressure is just right.", -- Medium pressure
                LOW_PRESSURE = "The pressure is very low.", -- Almost no pressure
                RECHARGE_PRESSURE = "Can't be used until the pressure is recharged.", -- Pressure is zero
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Fuel is running low.", -- Low fuel inspect
                ON = "Make sure to wear a raincoat before getting close.", -- Sprinkler is running
                OFF = "It moistens the surroundings.", -- Sprinkler is not running
            },
        },
    }