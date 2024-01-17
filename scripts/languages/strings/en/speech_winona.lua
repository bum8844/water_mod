return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "If you were going to do that, you should have added another bucket when designing it.", -- Well has a dry bucket hanging, but trying to hang another bucket
            WELL_BUSY = "Stop it, the well is clogged.", -- Well has a bucket of water hanging, but trying to hang another bucket
        }
    },

        ANNOUNCE_DRUNK = "Hic, I can't do this anymore...", -- Drunk
        ANNOUNCE_DRUNK_END = "Feeling a bit better now, should I try to regain my strength?", -- Sobering up from drinking (groggy)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, for Wigfrid only
        ANNOUNCE_NOTCHARGE = "Hmm... When will this goat make milk?", -- Trying to milk a Volt Goat that isn't charged, so can't use the bucket
        ANNOUNCE_NOTHIRSTSLEEP = "I should drink water before I sleep.", -- Thirsty but attempting to sleep at night
        ANNOUNCE_NOTHIRSTSIESTA = "I should drink water before I rest.", -- Thirsty but attempting to rest during the day
        ANNOUNCE_SLEEP_END = "Phew, next time I shouldn't drink so much.", -- Waking up after sleeping while drunk
        ANNOUNCE_THIRST = "I need to drink some water.", -- Very thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "On-site repair service activated!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "I need to get back to crafting.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "I feel much better now.", -- When curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "It's hard to focus...", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Hmm, I should start moderating myself now.", -- Starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "It's full of recipes for making drinks and alcohol.",

            WATER_CLEAN_ICE = "Should I chew on this?", -- Clean ice
            WATER_DIRTY_ICE = "Looks like ice mixed with dust.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "It would be perfect if I had some meat to go with it...", -- Caffeine pepper spice

            WELL_KIT = "Should I give it a try?", -- Well kit
            WELL_SPRINKLER_KIT = "Well-made and quite intricate.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Batteries couldn't handle the energy consumption.", -- Steam water pump kit
            WELL_BURYING_KIT = "You shouldn't leave holes in the ground unattended, mate.", -- Hole burying kit
            WELL_DRILLING = "I should be careful not to get hit by flying rocks.", -- Drilling a hole with a drill
            WELL_DRILLING_ITEM = "Make sure to secure it firmly to the ground before operating, and follow safety rules!", -- Drill item
            HOLE = "It's a hole connected to an underground water source.", -- Well hole
            WELL = "Hmm, I wonder if there's a way to automate this...", -- Well

            WX78MODULE_NONEDRUNK = "They've really gotta start takin' better care of themselves.", -- 78전용 묘듈

            -- Water mode plants

            TEA_TREE = "It's a small and pretty tree.", -- Tea tree
            DUG_TEA_TREE = "I don't mind getting my hands dirty.", -- Dug-up tea tree
            TEA_SEED = "This is what you need to grow the tree.", -- Tea tree seed
            TEA_SEED_COOKED = "I guess I can eat it. It's not that complicated!", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "This tree is still growing.", -- Tea tree sapling
            TEALEAVES = "Is there anything special about these leaves?", -- Tea leaves
            TEALEAVES_DRIED = "Let's prepare some hot water.", -- Dried tea leaves

            CAFFEINBERRY = "The coffee beans are popping! Amazing.", -- Caffeine berry bush
            DUG_CAFFEINBERRY = "I should replant this, if I had my own land. Ha!", -- Dug-up caffeine berry bush
            CAFFEINBERRY_BEAN = "I should throw it into the fire first, right?", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Ah, the aroma of freshly roasted coffee beans!", -- Roasted coffee bean

            RUINCACAO_TREE = "Hmm, it looks like the blueprints for its branches were a bit off.", -- Ruin cacao tree
            DUG_RUINCACAO_TREE = "The more I look at it, the stranger it seems.", -- Dug-up ruin cacao tree
            RUINCACAO_SEED = "Did it have flowers even inside the fruit?", -- Ruin cacao sapling item
            RUINCACAO_SEED_SAPLING = "It's a bit eerie now that I think about it.", -- Planted ruin cacao sapling
            RUINCACAO = "So, is this charcoal or a fruit?", -- Ruin cacao
            RUINCACAO_BEAN = "I don't see this turning into edible oil anytime soon.", -- Ruin cacao bean
            RUINCACAO_BEAN_COOKED = "It's chewable, I suppose.", -- Roasted ruin cacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Gathered some strange seeds.", -- Additives for liqueurs (anise, juniper berry, octagon motif)
            ADDITIVE_PETALS = "Bunches of leaves and petals.", -- Additives for liqueurs (herbs, tea leaves, flower petals)
            ADDITIVE_NUT = "Wasn't collecting these for snacking.", -- Additives for liqueurs (burchinut, coconut, coffee bean, cacao bean)
            ADDITIVE_DAIRY = "It's milk cream.", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "I should be grateful for clean water, even for just a sip.", -- Clean water
            WATER_DIRTY = "No matter how desperate, I shouldn't drink stagnant water.", -- Dirty water
            WATER_SALTY = "Drinking seawater is suicidal.", -- Salty water

            GOOPYDRINK = "Bleh.", -- Failed drink (wet goop concept)

            -- Teapot drinks

            FRUITJUICE = "It has a bit of everything in it.", -- Mixed fruit juice
            BERRIES_JUICE = "I won't get juice all over my hands.", -- Berry juice
            POMEGRANATE_JUICE = "It's finally clean to eat this fruit.", -- Pomegranate juice
            BANANA_JUICE = "I didn't really ask for warm banana tea.", -- Banana juice
            FIG_JUICE = "The texture is unique.", -- Fig juice
            DRAGONJUICE = "It's a premium juice.", -- Dragon fruit juice
            GLOWBERRYJUICE = "It's like the compounds inside a glow stick.", -- Glowberry juice
            WATERMELON_JUICE = "Refreshing.", -- Watermelon juice

            VEGGIE_TEA = "This should help me regain some energy.", -- Vegetable juice
            CARROT_TEA = "It's just what I needed on a chilly day.", -- Carrot tea
            CACTUS_TEA = "Even with thorns, it's turned mushy.", -- Cactus tea
            TOMATO_JUICE = "I never really sought it out, but it's good.", -- Tomato juice
            LUMPY_TEA = "It's not as bad as I thought. It's alright.", -- Lumpy tea
            SEAWEED_SHAKE = "Hmm... it might be good for constipation.", -- Seaweed shake

            GREENTEA = "It has a subtle aroma.", -- Green tea
            BLACKTEA = "I prefer coffee, but if there's nothing else, I'll drink this.", -- Black tea
            BLACKTEA_ICED = "I should drink it after breaking a sweat.", -- Iced black tea
            FUER = "Surprisingly, the aroma is not bad.", -- Herbal tea, leaf tea, fern tea
            MIXFLOWER = "It seems to match the refined taste of a lady.", -- Mixed flower petal tea
            HIBISCUSTEA = "Even though there are no fruits, it tastes tangy and sweet.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "It seems like a trend to make tea from flowers.", -- Cactus flower tea
            LOTUSTEA = "It's quite exotic.", -- Lotus tea
            SUSHIBISCUS = "There are so many different types of tea.", -- Suicide tea
            MOON_BLOSSOM_TEA = "Phew! My mind is clear now.", -- Moon blossom tea

            CAFFEINBERRY_JUICE = "I used to rely on this a lot during late-night work.", -- Black coffee
            TOFFEE_LATTE = "I prefer my coffee without sugar.", -- Toffee nut latte
            RUINCHA_LATTE = "Coffee and chocolate, which one to choose?", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "It's warm.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "I've seen these in stores, but I've never bought one.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "The flavor is as intense as exhaust fumes.", -- Xocolatl (bitterness)
            TEA_RUINCOLATE_LATTE = "Confusing, is this milk tea or a chocolate smoothie?", -- Matcha chocolate latte

            MULLED = "I'm not a woman with a fireplace, but I enjoy a glass!", -- Mulled wine
            BUTTERBEER = "Overly advanced technology can be just as magical as magic itself.", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "Sweet and refreshing.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Should I give this rainbow a try?", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "This should be good enough.", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "The tartness makes it even better.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "I should have a cup to filter out the dust in my throat.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Hmm, it's quite sweet.", -- Vita Hyup Sikhye
            PINEANANAS_JUICE = "Definitely better than the liquid in canned goods.", -- Region of Lekia Pineapples Juice
            ORANGE_JUICE = "I've never seen a day without this in the Tangbisil fridge.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "It's a taste that lady-like people would love, well, I am one too. Hm!", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "It tastes like a dessert drink from a tea shop.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Teapot Drinks

            SPOILED_DRINK = "Not even suitable for industrial use.", -- Spoiled Drink

            -- Distillery Sodas

            SODA = "Plain sparkling water.", -- Soda Water
            FRUITSODA = "I don't need to drink this unless I'm going to a party.", -- Fruit Soda
            LEMONLIMESODA = "My teeth are going to rot from this.", -- Lemon Lime Soda (higher-tier fruit soda)
            COLA = "If I try to drink it, someone else has already finished it.", -- Cola
            COLAQUANTUM = "Whoa, is it safe to drink this?", -- Cola Quantum
            LUMPY_BEER = "It tastes better than cola, but no one's on my side.", -- Root Beer (non-alcoholic)

            -- Distillery Spirits

            CORN_BEER = "It's just right for a drink after work!", -- Corn Beer
            MADHU = "I think Wigfrid would like this.", -- Mead
            WINE = "I don't have time to savor the aroma, I have a mountain of work to do.", -- Wine (regular berry brew)
            NOBLEWINE = "Such fine things are far from me.", -- Noble Wine (cooked berry brew)
            SPARKLINGWINE = "You have to shake it in front of Max.", -- Sparkling Wine
            GLOWBERRYWINE = "The romance of homemade brewing.", -- Glow Berry Wine
            KUMIS = "It's the first time I've seen milk used to make alcohol.", -- Kumis, Fermented Yak Milk
            LUMPY_WINE = "It has quite a refreshing taste, doesn't it?", -- Sake (root brew)
            PULQUE = "It's amazing that you can make alcohol from cacti.", -- Pulque (Cactus Wine)
            RUINCACAO_WINE = "If wine can be made from cocoa, anything is possible.", -- Cacao Wine

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "This isn't cola.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "It tastes like store-bought pineapple soda.", -- Pineapple Soda (Oranch Soda)
            ORANGESODA = "It tastes like store-bought orange soda.", -- Orange Soda (Frontera)
            STRAWBERRYSODA = "I'm not surprised that there's strawberry-flavored soda.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "Rainbow liquor, the ingredients are a bit unusual though.", -- Shipwrecked Aurobow, Rainbow Jelly Liquor
            COCONUT_WINE = "It's a palm fruit liquor.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Now the grass is not the same.", -- Cherry Forest Cherry Blossom Honey Wine (Foaming Rainbow: When examining Cherry Blossom Honey with Winona's speech 'I'm not sure if this is honey or glue.', there is a dialogue that says 'Is this honey or 'Foaming Rainbow'?')
            GIANT_BLUEBERRY_WINE = "There's no reason you can't make wine from blueberries.", -- Vita Hyup Boom Berry Wine (Explodes when ignited)
            RICE_WINE = "The alcohol is quite clear now!", -- Cheongju
            WHEAT_BEER = "I should have a drink after work!", -- Heap of Food Wheat Beer
            PALE_BEER = "What's wrong with this beer color?", -- Region of Lekia Pale Ale (Blue beer made with Monstera fruit)

            -- Distilled Spirits

            DISINFECTANT = "For emergency treatment.", -- Disinfectant
            CORN_WHISKEY = "I prefer drinking in abundance rather than sipping.", -- Corn Whiskey
            LUMPY_VODKA = "I should keep this until the weather gets colder.", -- Vodka
            TEQUILA = "The aroma is quite bold!", -- Tequila
            MADHU_RUM = "The era of sailors mixing rum with water for preservation is long gone.", -- Rum
            BERRY_BRANDY = "I don't often get the chance to drink expensive spirits like this.", -- Berry Brandy
            AREUHI = "This is an unfamiliar distilled spirit.", -- Krampus Distilled Spirit Areuhi

            -- Walani Exclusive Distilled Spirits

            BERRY_GIN = "Thanks to this, I've made quite a few friends down under.", -- Gin
            GLOWBERRY_GIN = "I wonder how long it will keep shining? Infinite energy, perhaps?", -- Glow Berry Gin
            ABSINTHE = "At least we're not mixing it with copper sulfate!", -- Absinthe
            TEA_LUMPY_VODKA = "Is it different from absinthe?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Seems quite luxurious.", -- Rose Petal Brandy
            KAHLUA = "I think I'll have to drink alcohol and coffee separately.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "The scent is as robust as lead.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "There's a sweet liqueur like this too, huh?", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Milk for grown-ups!", -- Rumchata

            -- Collaboration Distilled Spirits

            MOONWAY = "It seems high in calories. Can it be used as fuel?", -- Rainbow Jellyfish Distilled Spirit
            ARRACK = "Smells like palm sap.", -- Arrack Indonesian version of coconut wine
            CHERRY_BLOOM_RUM = "Looks like an airport souvenir, but they're all the same in the end.", -- Cherry Blossom Honey Wine Distilled Spirit Floating Petals
            RICE_SPIRITS = "It's pretty clear now!", -- Rice Wine
            WHEAT_WHISKEY = "No drinking alcohol while working.", -- Wheat Whiskey
            PALE_WHISKEY = "I've never seen a distilled spirit of this color before.", -- Pale Malt Whiskey

            -- Walani Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "It has a quite sweet scent.", -- Coconut Brandy (Replaced Caribbean Rum because she can't make it)
            GIANT_BLUEBERRY_GIN = "Seems more suitable for industrial use than consumption.", -- Boom Berry Sapphire (Explodes if consumed)

            -- Distillery Cooked Dishes

            DARK_RUINCOLATE = "Did a friend prepare this treat for me to have a snack while working slowly?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Oh, Wally, you know I don't like sweet things.", -- White Chocolate
            RUINCOLATE = "It's easy to melt, so I don't eat it often.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "This doesn't melt easily, and it has a case. I can also gain strength while working.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Well made and sturdy, it seems.", -- Empty steel bucket
                FULL = "Rainwater has collected.", -- Clean rainwater has collected
                FULL_ICE = "It'll take some effort to remove it.", -- Rainwater has frozen
                DIRTY = "Seems like it needs a good cleaning.", -- Rainwater has become dirty
                DIRTY_ICE = "Did they forget to clean and empty it in the dead of winter?", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "I have my doubts about its durability.", -- Empty wooden bucket of Woody
                FULL = "Rainwater has collected.", -- Clean rainwater has collected
                FULL_ICE = "It'll take some effort to remove it.", -- Rainwater has frozen
                DIRTY = "Seems like it needs a good cleaning.", -- Rainwater has become dirty
                DIRTY_ICE = "Did they forget to clean and empty it in the dead of winter?", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "What should I put in it?", -- Empty wooden bucket
                FULL = "Rainwater has collected.", -- Clean rainwater has collected
                FULL_ICE = "It'll take some effort to remove it.", -- Rainwater has frozen
                DIRTY = "Seems like it needs a good cleaning.", -- Rainwater has become dirty
                DIRTY_ICE = "Did they forget to clean and empty it in the dead of winter?", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "They put a lot of thought into designing this.", -- No water in the desalinator
                PURIFY_LONG = "Let's see... the salinity is still quite high.", -- Still a long way to go for purification
                PURIFY_SHORT = "It's not too salty now, is it?", -- Purification is almost complete
                HASWATER = "No guarantees that it's not seawater inside.", -- Clean water is in the desalinator
                BURNT = "This is rather infuriating.", -- The desalinator is burnt
                HASSALT = "The salt needs to be removed from the filter box.", -- There is salt left in the desalinator
            },

            BARREL =
            {
                GENERIC = "Woody and I put our heads together to ensure the water doesn't go bad.", -- Inspecting the barrel
                BURNT = "It's alright, we can make another one.", -- The barrel has burned
            },

            BREWERY =
            {
                EMPTY = "It's got some expensive wood in it, I tell you!", -- Inspecting the brewery
                BURNT = "No matter how you look at it, this is infuriating.", -- The brewery has burned
                FERMENTING_LONG = "Fermentation does take a while, after all.", -- A long way to go until fermentation is done
                FERMENTING_SHORT = "It's almost done, isn't it?", -- Fermentation is almost complete
                DONE = "Shall we taste it now?", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "It's a bit heavier than the factory-made ones.", -- Inspecting the portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "I need to get some water for it.", -- There's no water in the camp kettle in the hearth
                BOILING_LONG = "It's still around 68°F.", -- Starting to boil water
                BOILING_SHORT = "It's boiling at 192.2°F.", -- Water is nearly boiling
                DONE = "Time for a break!", -- Clean water has been obtained
                STOP = "Well, it won't boil without fuel.", -- The hearth doesn't have fire, so dirty water won't boil
            },

            CAMPDESALINATOR_ITEM = "'Portable,' they say, but it's quite heavy.", -- Inspecting the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "An empty canister.", -- No water in the camp desalinator
                BOILING_LONG = "The seawater level is still high.", -- Starting to boil seawater
                BOILING_SHORT = "The freshwater level is higher now.", -- Water is nearly done boiling
                DONE = "Freshwater has collected!", -- Clean water has been obtained
                STOP = "It needs fuel.", -- There's no fire in the hearth, so the saltwater won't purify
            },

            KETTLE =
            {
                EMPTY = "I'm about to make a cup of coffee in style.", -- Empty kettle inspection
                BURNT = "Did I overdo it?", -- The kettle has burned
                BOILING_LONG = "It still needs more time.", -- Just started cooking the drink
                BOILING_SHORT = "It's almost done.", -- Drink is nearly done cooking
                DONE = "Coffee break!", -- The drink is ready
                PURIFY_LONG = "It's still around 68°F.", -- Just started boiling dirty water
                PURIFY_SHORT = "It's boiling at 192.2°F.", -- Dirty water is nearly done boiling
                HASWATER = "Let's see, it'd be nice if there's coffee.", -- There's clean water inside
                MELT_LONG = "It's still frozen solid.", -- Just started melting ice
                MELT_SHORT = "The ice is almost gone.", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "In terms of quality, it doesn't lag behind the factory-made teapots.", -- Inspecting the portable kettle item
                EMPTY = "Not a drop of water in it.", -- Inspecting the placed empty portable kettle
                BOILING_LONG = "Good things take time, after all.", -- Just started boiling the drink
                BOILING_SHORT = "It'll be done in the blink of an eye!", -- Drink is almost done cooking
                DONE = "Was it worth all that effort?", -- The drink is ready
                PURIFY_LONG = "It's still lukewarm.", -- Just started boiling dirty water
                PURIFY_SHORT = "I can hear the bubbles.", -- Dirty water is nearly done boiling
                HASWATER = "Now I need to add ingredients.", -- There's clean water inside
                MELT_LONG = "It's all frozen solid.", -- Just started melting ice
                MELT_SHORT = "The ice is almost melted away.", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Designed to withstand heat and pressure.", -- Inspecting the distiller
                DISTILLTING_LONG = "The timer has barely moved.", -- Still a long way to go for distillation
                DISTILLING_SHORT = "It won't be long now.", -- Distillation is almost done
                DONE = "Shall we taste it now?", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Drawing water with an approximate pressure of 123 psi.", -- Maximum pressure
                MIDDLE_PRESSURE = "Drawing water with an approximate pressure of 81 psi.", -- Pressure is in the middle
                LOW_PRESSURE = "Drawing water with an approximate pressure of 47 psi.", -- Almost no pressure
                RECHARG_PRESSURE = "At this pressure, it'll take an incredibly long time to draw water.", -- No pressure (can't be used until pressure is maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "It needs refueling.", -- Inspecting the well sprinkler with low fuel
                ON = "Don't get too close with my equipment.", -- It's working
                OFF = "Some parts work 'magically' when it's turned off.", -- Inspecting the well sprinkler when it's turned off
            },
        },
    }