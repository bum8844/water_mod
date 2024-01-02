return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "The order got mixed up.", -- Attempting to give a bucket when the well already has a bucket
            WELL_BUSY = "Let's do what's already there first.", -- Attempting to give a bucket when there's already a bucket inside the well
        }
    },

        ANNOUNCE_DRUNK = "Hic, I feel like a log...", -- Getting drunk
        ANNOUNCE_DRUNK_END = "I almost rang my own bell.", -- Getting sober after being drunk
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, specific to Wigfrid
        ANNOUNCE_NOTCHARGE = "Huh? No zap?", -- Attempting to milk a charged Volt Goat with a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "I'm too thirsty to sleep.", -- Trying to sleep at night while very thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "I'm too thirsty to rest.", -- Trying to rest during the day while very thirsty
        ANNOUNCE_SLEEP_END = "Lucy? You won't bite me, will you? It was a terrible nightmare.", -- Waking up after sleeping and being sober
        ANNOUNCE_THIRST = "I'm a bit thirsty.", -- Feeling thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Zooming like a coyote!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "I guess it's time to stand still and gnaw on a log.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "My stomach feels a bit settled.", -- Curing a waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "I feel a bit heavy...", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Oh, this is good!", -- Starting to feel tipsy

        DESCRIBE =
        {
            BOILBOOK = "Quite convenient. Lucy, can you help me keep track of time while we brew?",

            WATER_CLEAN_ICE = "We need to melt it, right?", -- Clean ice
            WATER_DIRTY_ICE = "It's frozen and dirty.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "I only think of salt for meat, you know.", -- Caffeinpepper spice

            WELL_KIT = "I'll lend a hand with this.", -- Well kit
            WELL_SPRINKLER_KIT = "Completely automatic, isn't it?", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "This seems quite convenient, doesn't it?", -- Water pump kit
            WELL_BURYING_KIT = "We should seal off unnecessary holes.", -- Hole-burying kit
            WELL_DRILLING = "It seems to be working properly.", -- Drilling holes with a drill
            WELL_DRILLING_ITEM = "A machine for drilling holes in the ground.", -- Drilling item
            HOLE = "Yikes, we should be careful here.", -- Well hole
            WELL = "Every town should have one of these.", -- Well

            WX78MODULE_NONEDRUNK = "Some fancy robot bits.", -- 78전용 묘듈
            
            -- Water mode plants

            TEA_TREE = "It looks like a fence made of trees.", -- Tea Tree
            DUG_TEA_TREE = "Time to do a little landscaping.", -- Dug Tea Tree
            TEA_SEED = "Looks like it has more wood than fruit.", -- Tea Tree Seed
            TEA_SEED_COOKED = "It's a shame to waste the wood like this.", -- Cooked Tea Tree Seed
            TEA_SEED_SAPLING = "It's got a long way to go before it becomes a tree.", -- Tea Tree Sapling
            TEALEAVES = "Looks like fresh tea leaves.", -- Tea Leaves
            TEALEAVES_DRIED = "These look like dried tea leaves.", -- Dried Tea Leaves

            CAFFEINBERRY = "Coffee beans!", -- Caffeinberry Bush
            DUG_CAFFEINBERRY = "I should take it with me wherever I go.", -- Dug Caffeinberry Bush
            CAFFEINBERRY_BEAN = "I need to prepare these somehow.", -- Raw Caffeinberry
            CAFFEINBERRY_BEAN_COOKED = "Canadians really love coffee, don't they?", -- Cooked Caffeinberry

            RUINCACAO_TREE = "It grows in the southern regions, but it looks different from what I know.", -- Ruincacao Tree
            DUG_RUINCACAO_TREE = "Crackling branches everywhere.", -- Dug Ruincacao Tree
            RUINCACAO_SEED = "A somewhat sinister-looking flower bloomed here.", -- Ruincacao Seed
            RUINCACAO_SEED_SAPLING = "A somewhat sinister-looking flower bloomed here.", -- Ruincacao Sapling
            RUINCACAO = "It has a charcoal smell.", -- Ruincacao (pre-smashed)
            RUINCACAO_BEAN = "It doesn't taste like edible butter at all.", -- Ruincacao Bean
            RUINCACAO_BEAN_COOKED = "I don't usually eat butter this way.", -- Cooked Ruincacao Bean

            -- Distillery additives

            ADDITIVE_SEED = "Are we making moonshine with this?", -- Seed Herbs (Anise, Juniper Berry, Allspice) additive for liquor
            ADDITIVE_PETALS = "Do these go into alcohol?", -- Petal Herbs (Green Tea, Flower Petals) additive for liquor
            ADDITIVE_NUT = "A mix of snacks.", -- Nut Herbs (Birch Nut, Coconut, Coffee Bean, Ruincacao Bean) additive for liquor
            ADDITIVE_DAIRY = "It's like cream, right?", -- Dairy additive for liquor

            -- Drinks

            WATER_CLEAN = "It's clean water.", -- Clean water
            WATER_DIRTY = "It's dirty.", -- Dirty water
            WATER_SALTY = "It's seawater.", -- Salty water

            GOOPYDRINK = "I've made worse drinks before.", -- Failed drink (boiling concept)

            -- Teapot drinks

            FRUITJUICE = "Freshly squeezed fruit juice.", -- Generic fruit juice
            BERRIES_JUICE = "They've watered it down a bit.", -- Berry juice
            POMEGRANATE_JUICE = "They've saved us the trouble of picking out the seeds.", -- Pomegranate juice
            BANANA_JUICE = "A tropical drink.", -- Banana juice
            FIG_JUICE = "Not a bad juice at all.", -- Fig juice
            DRAGONJUICE = "Could use a bit of syrup.", -- Dragonfruit juice
            GLOWBERRYJUICE = "I could keep drinking this.", -- Glowberry juice
            WATERMELON_JUICE = "It's really watery.", -- Watermelon juice

            VEGGIE_TEA = "I don't think this suits my taste.", -- Vegetable tea
            CARROT_TEA = "Is it meant to be served with rabbit food?", -- Carrot tea
            CACTUS_TEA = "I'm doubtful about the spines.", -- Cactus tea
            TOMATO_JUICE = "It needs some syrup added.", -- Tomato juice
            LUMPY_TEA = "I'd prefer to make hash out of it.", -- Root tea
            SEAWEED_SHAKE = "Wasn't there a better way to use it?", -- Seaweed shake

            GREENTEA = "I could go for a cup of tea.", -- Fresh Green Tea
            BLACKTEA = "Already time for tea?", -- Black Tea
            BLACKTEA_ICED = "Perfect for a hot day.", -- Iced Black Tea
            FUER = "I'll drink it however it comes.", -- Boi Tea (Boi Cha, Leafy Tea, Warrior Tea)
            MIXFLOWER = "Quite a sentimental tea.", -- Mixed Flower Tea
            HIBISCUSTEA = "It's as red as Lucy.", -- Hibiscus Tea
            CACTUSFLOWER_TEA = "I'm skeptical about the spines.", -- Cactus Flower Tea
            LOTUSTEA = "I've never seen this tea before.", -- Lotus Flower Tea
            SUSHIBISCUS = "What do you think, Lucy? Shall we give it a try?", -- Hibiscus Sushi
            MOON_BLOSSOM_TEA = "The scent is quite impressive.", -- Moon Blossom Tea

            CAFFEINBERRY_JUICE = "Is it time for coffee already?", -- Black Coffee
            TOFFEE_LATTE = "It's really sweet for coffee.", -- Toffeenut Latte
            RUINCHA_LATTE = "This isn't mocha.", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "Perfect for sipping by a cozy fire.", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "Sweet and refreshing.", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "The bitterness really comes through.", -- Chocolatl (Bitter)
            TEA_RUINCOLATE_LATTE = "Surprisingly, the flavors blend well.", -- Matcha Latte

            MULLED = "This is perfect when you're feeling unwell.", -- Bánh Xèo (Savory Vietnamese Crepes)
            BUTTERBEER = "Do I look like a magical creature or a tiny giant? Hah.", -- Butterbeer (Harry Potter reference)

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "There aren't many coconut parts left, are there?", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Its strength is that it doesn't taste like anything.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "We could've made sushi with it.", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "I'm suspicious if any hair-like parts are left.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Honey and tree scent, interesting.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "This is an unusual grain juice.", -- Vitacomp Sweet Rice Drink
            PINEANANAS_JUICE = "It's refreshing, but I can't drink too much of it like this.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Add some syrup to it, and it'll be perfect.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "I don't actively seek it out, but it's nice.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "It's smooth and refreshing.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Additives

            SPOILED_DRINK = "Oh dear, it's gone bad.", -- Spoiled Drink

            -- Distillery Sodas

            SODA = "It's carbonated water.", -- Soda
            FRUITSODA = "It's a fruit punch, right?", -- Fruit Soda
            LEMONLIMESODA = "It's sweet and refreshing.", -- Lemon Lime Soda (Fruit Soda variant)
            COLA = "I should have it when I'm tired from working.", -- Cola
            COLAQUANTUM = "This is quite addictive.", -- Cola Quantum
            LUMPY_BEER = "Is it sarsaparilla drink?", -- Lumpy Beer (non-alcoholic)

            -- Distillery Spirits

            CORN_BEER = "It's not real beer, but it's fine by me.", -- Corn Beer
            MADHU = "It's made from bee honey.", -- Madhu (Honey Wine)
            WINE = "It's not made from grapes, but it'll do.", -- Wine (Basic Berry Brew)
            NOBLEWINE = "This is a fancy wine.", -- Noble Wine (Roasted Berry Brew)
            SPARKLINGWINE = "Someone's going to shake it up, and I won't stand for it.", -- Sparkling Wine
            GLOWBERRYWINE = "The taste isn't bad.", -- Glowberry Wine
            KUMIS = "Is this a fermented milk beverage or something?", -- Kumis (Fermented Milk Wine)
            LUMPY_WINE = "It's not moonshine, but it'll do.", -- Lumpy Wine (Root Brew)
            PULQUE = "It's a drink that the indigenous people of my homeland used to drink.", -- Pulque (Agave Wine)
            RUINCACAO_WINE = "I've never heard of cocoa wine before.", -- Ruincacao Wine (Cocoa Wine)

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "If it's sweet and refreshing, that's enough.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "It's pineapple soda.", -- Pineapple Soda (Orancee)
            ORANGESODA = "It's orange soda.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "It's strawberry soda.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "I see that they made liquor out of jellyfish, of all things.", -- Shipwrecked Aurobow (Rainbow Jellyfish Wine)
            COCONUT_WINE = "It has a strong woody scent.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "If no one else is going to drink it, I guess I'll have to.", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Now it's filled with blueberries.", -- Vitacomp Boom! Berry Sapphire (Explosive when ignited)
            RICE_WINE = "Isn't this rice wine not properly fermented?", -- Vitacomp Makgeolli (Rice Wine)
            WHEAT_BEER = "It's real beer.", -- Hip of Food Wheat Beer
            PALE_BEER = "The beer color is strange.", -- Legion Pale Ale (Green beer made with Monsteras)

            -- Distillery Spirits

            DISINFECTANT = "Sanitization is important, isn't it?", -- Disinfectant
            CORN_WHISKEY = "It's American-style whiskey.", -- Corn Whiskey
            LUMPY_VODKA = "Drinking this when it's cold warms you up, doesn't it?", -- Vodka
            TEQUILA = "It's a kind of hard liquor from the south, right?", -- Tequila
            MADHU_RUM = "It's sailor's rum.", -- Rum
            BERRY_BRANDY = "This brandy seems quite fancy.", -- Berry Brandy
            AREUHI = "Is this vodka made from milk?", -- Kumis Distilled Spirit Areuhi

            -- Warly Exclusive Distillery Spirits

            BERRY_GIN = "It seems like gin.", -- Gin
            GLOWBERRY_GIN = "It's bright and nice, isn't it?", -- Glowberry Gin
            ABSINTHE = "It's full of wormwood aroma.", -- Absinthe
            TEA_LUMPY_VODKA = "I've never seen this type of liquor before, but it's not bad.", -- Matcha Liqueur
            PETALS_BERRY_BRANDY = "It's fragrant and nice.", -- Rose Scented Brandy
            KAHLUA = "I prefer to drink coffee and alcohol separately.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "It has a somewhat robust aroma.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "I'm conflicted whether to consider this as a liquor.", -- Baileys Cocoa Cream Liqueur
            RUMCHATA = "Did the people from the south mix alcohol with milk?", -- Rumchata (Mixed with Horchata)

            -- Collaboration Distillery Spirits

            MOONWAY = "The color is pretty, but I'm suspicious.", -- Rainbow Jellyfish Wine Distilled Spirit
            ARRACK = "It's coconut wine from Indonesia, right?", -- Arrack (Coconut Wine) Indonesian Version
            CHERRY_BLOOM_RUM = "If no one else is going to watch, I guess I'll take it and drink it?", -- Cherry Blossom Honey Rum Distilled Spirit Cherry Blossom Petals Floating
            RICE_SPIRITS = "Isn't it too young for liquor?", -- Cheongju (Korean Rice Wine)
            WHEAT_WHISKEY = "When the customer comes, I'll ask if they want coffee or whiskey.", -- Wheat Whiskey
            PALE_WHISKEY = "The color is strange, but if they ask for whiskey, I'll serve it.", -- Pale Malt Whiskey

            -- Warly Exclusive Collaboration Distillery Spirits

            NUT_COCONUT_BRANDY = "Is everything ready, folks?", -- Coconut Brandy (SpongeBob Opening Pirate Parody)
            GIANT_BLUEBERRY_GIN = "So, did you win the ice hockey game?", -- Boom Berry Sapphire (Carrot explodes)

            -- Pot Cooking

            DARK_RUINCOLATE = "Is Warly trying to cook, or is this an attempt at a healthy meal?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Is it sweet and not heavy?", -- White Chocolate
            RUINCOLATE = "I didn't have much occasion to eat chocolate, but thanks.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "It should give me a boost of energy.", -- Schokakola

            BUCKET_STEEL_EMPTY = 
            {
                EMPTY = "A very sturdy bucket.", -- Empty Steel Bucket
                FULL = "It's filled with clean rainwater.", -- Clean rainwater in the bucket
                FULL_ICE = "Who left the bucket out to freeze?", -- Rainwater frozen in the bucket
                DIRTY = "I should use this to water the garden.", -- Rainwater has become dirty
                DIRTY_ICE = "It froze before I could clean it.", -- Dirty rainwater frozen in the bucket
            },

            BUCKET_WOODIE_EMPTY = 
            {
                EMPTY = "Good job, Lucy!", -- Empty Woodie's Wooden Bucket
                FULL = "Let's empty the bucket before it rots.", -- Clean rainwater in the bucket
                FULL_ICE = "Who left the bucket out to freeze?", -- Rainwater frozen in the bucket
                DIRTY = "I should use this to water the garden.", -- Rainwater has become dirty
                DIRTY_ICE = "It froze before I could clean it.", -- Dirty rainwater frozen in the bucket
            },

            BUCKET_EMPTY = 
            {
                EMPTY = "A bucket made of wooden planks.", -- Empty Wooden Bucket
                FULL = "Let's empty the bucket before it rots.", -- Clean rainwater in the bucket
                FULL_ICE = "Who left the bucket out to freeze?", -- Rainwater frozen in the bucket
                DIRTY = "I should use this to water the garden.", -- Rainwater has become dirty
                DIRTY_ICE = "It froze before I could clean it.", -- Dirty rainwater frozen in the bucket
            },

            DESALINATOR = 
            {
                EMPTY = "Great technology. Let's try using seawater.", -- No water in the desalinator
                PURIFY_LONG = "It won't remove the salt that quickly.", -- Still a long way to go for purification
                PURIFY_SHORT = "Good, it's becoming clean water.", -- Purification is almost complete
                HASWATER = "It's filled with water.", -- Clean water in the desalinator
                BURNT = "What a waste.", -- Desalinator has burnt
                HASSALT = "There's so much salt left that it won't purify properly.", -- Salt is still present in the desalinator
            },

            BARREL = 
            {
                GENERIC = "It's well-sealed.", -- Examining the barrel
                BURNT = "It burned down completely.", -- Barrel has burnt down
            },

            BREWERY = 
            {
                EMPTY = "Quite a sophisticated brewer.", -- Examining the brewery
                BURNT = "It's a shame it burned down.", -- Brewery has burnt down
                FERMENTING_LONG = "It's still just juice.", -- Brewing process has a long way to go
                FERMENTING_SHORT = "The aroma of alcohol is rising.", -- Brewing process is almost complete
                DONE = "Let's try drinking it.", -- Beverage is ready in the brewery
            },

            CAMPKETTLE_ITEM = "Reminds me of boiling water in the forest.", -- Examining the portable camp kettle (item)
            CAMPKETTLE = 
            {
                GENERIC = "Shall we clean up if we're not going to use it?", -- Examining the empty camp kettle in the hearth
                BOILING_LONG = "Do I really want to drink hot tea?", -- Starting to boil water
                BOILING_SHORT = "It's almost ready!", -- Water in the kettle is almost boiling
                DONE = "It's tea time!", -- Clean water is ready in the kettle
                STOP = "Lucy, let's gather some firewood.", -- Kettle won't boil without a fire
            },

            CAMPDESALINATOR_ITEM = "Is this for use on a boat?", -- Examining the portable camp desalinator (item)
            CAMPDESALINATOR = 
            {
                GENERIC = "It's empty inside.", -- Examining the empty camp desalinator
                BOILING_LONG = "It's still seawater.", -- Starting to boil seawater
                BOILING_SHORT = "It's almost ready!", -- Seawater is almost purified
                DONE = "It's ready to drink.", -- Clean water is ready in the desalinator
                STOP = "Lucy, let's gather some firewood.", -- Desalinator won't work without a fire
            },

            KETTLE = 
            {
                EMPTY = "Should I take it if I'm not going to use it?", -- Examining the empty kettle
                BURNT = "It burned down completely.", -- Kettle has burnt down
                BOILING_LONG = "Will it take much longer?", -- Starting to boil beverage
                BOILING_SHORT = "Great! It's almost done!", -- Beverage in the kettle is almost done
                DONE = "Shall we try drinking it?", -- Beverage is ready in the kettle
                PURIFY_LONG = "I don't want to get sick from drinking dirty water.", -- Starting to purify dirty water
                PURIFY_SHORT = "It's almost boiled clean.", -- Dirty water is almost purified
                HASWATER = "Water is ready; I just need the ingredients now.", -- Clean water is in the kettle
                MELT_LONG = "Do you think I can make tea with melted ice?", -- Starting to melt ice for tea
                MELT_SHORT = "It's almost melted.", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM = 
            {
                GENERIC = "Should I bring some tea leaves?", -- Examining the portable kettle (item)
                EMPTY = "I should bring it if I'm not going to use it here.", -- Examining the placed empty portable kettle
                BOILING_LONG = "Will it take much longer?", -- Starting to boil beverage
                BOILING_SHORT = "Great! It's almost done!", -- Beverage in the portable kettle is almost done
                DONE = "Shall we try drinking it?", -- Beverage is ready in the portable kettle
                PURIFY_LONG = "I don't want to get sick from drinking dirty water.", -- Starting to purify dirty water
                PURIFY_SHORT = "It's almost boiled clean.", -- Dirty water is almost purified
                HASWATER = "Water is ready; I just need the ingredients now.", -- Clean water is in the portable kettle
                MELT_LONG = "Do you think I can make tea with melted ice?", -- Starting to melt ice for tea
                MELT_SHORT = "It's almost melted.", -- Ice is almost melted
            },

            DISTILLERS = 
            {
                EMPTY = "I don't really understand how this works.", -- Examining the empty distiller
                DISTILLTING_LONG = "It's going to take a while longer.", -- Distillation process has a long way to go
                DISTILLING_SHORT = "It's almost done.", -- Distillation process is almost complete
                DONE = "Let's try drinking it.", -- Beverage is ready in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "You're doing a great job.", -- Pressure is at maximum
                MIDDLE_PRESSURE = "You're working hard to pump water.", -- Pressure is in the middle
                LOW_PRESSURE = "The water pressure has dropped.", -- Pressure is almost gone
                RECHARG_PRESSURE = "Water isn't coming out.", -- Pressure is completely gone (can't use until pressure is recharged)
            },

            WELL_SPRINKLER = 
            {
                LOWFUEL = "It seems to be running out of fuel.", -- Examining the sprinkler with low fuel
                ON = "It's working hard.", -- Sprinkler is currently on
                OFF = "Thanks to this, I have less work to do in the garden.", -- Sprinkler is off
            },
        },
    }