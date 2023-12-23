return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "There's already a bucket attached, baaah!", -- Trying to give a bucket to a well with water
            WELL_BUSY = "It's inside the bucket hole, baaah!", -- Trying to give a bucket to a well with a filled bucket
        }
    },

        ANNOUNCE_DRUNK = "My head hurts... I'm feeling dizzy, baaah...", -- Getting drunk
        ANNOUNCE_DRUNK_END = "Baaah! I'm feeling a bit better now.", -- Getting sober (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Exclusive to Wigfrid.
        ANNOUNCE_NOTCHARGE = "No milk is coming out!", -- Trying to milk a charged Volt Goat with a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "I need water, then I'll sleep.", -- Trying to sleep at night with thirst
        ANNOUNCE_NOTHIRSTSIESTA = "I need water, then I'll take a nap.", -- Trying to take a siesta during the day with thirst
        ANNOUNCE_SLEEP_END = "Baaah, I'm all better after a nap!", -- Waking up and completely sober from sleep
        ANNOUNCE_THIRST = "I need a drink!", -- Feeling thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "I'm ready to run!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "I don't feel like running anymore.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "I'm feeling a bit better now, baaah.", -- Curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Baaah, I feel dizzy!", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "My face is flushed, baaah!", -- Starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "A book full of recipes for drinks!", -- Recipe book for drinks

            WATER_CLEAN_ICE = "Brrr, it's really cold!", -- Clean ice water
            WATER_DIRTY_ICE = "Brrr, the water froze!", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "It smells spicy!", -- Spice: Caffeinpepper

            WELL_KIT = "I've never seen beefalos make something like this.", -- Well kit
            WELL_SPRINKLER_KIT = "Just press it once, baaah!", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Looks hard to make, baaah.", -- Steam water pump kit
            WELL_BURYING_KIT = "Seal the hole in the ground!", -- Hole burying kit
            WELL_DRILLING = "Drilling holes in the ground, baaah!", -- Drilling holes in the ground
            WELL_DRILLING_ITEM = "Why drill holes in the ground?", -- Drilling item
            HOLE = "I can hear the water.", -- Well hole
            WELL = "Beefalos drink from these smooth holes, why?", -- Well

            -- Water mode plants

            TEA_TREE = "The leaves smell nice!", -- Tea tree
            DUG_TEA_TREE = "Let's go somewhere, baaah.", -- Dug tea tree
            TEA_SEED = "Lots of leaves on this tree seed!", -- Tea tree seed
            TEA_SEED_COOKED = "Not tasty anymore...", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Grow big!", -- Tea tree sapling
            TEALEAVES = "Fragrant tea leaves, baaah.", -- Tea leaves
            TEALEAVES_DRIED = "The aroma is amazing!", -- Dried tea leaves

            CAFFEINBERRY = "A snack is revealed!", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "You'll find a good place.", -- Dug caffeinberry bush
            CAFFEINBERRY_BEAN = "A delicious snack!", -- Caffeinberry bean
            CAFFEINBERRY_BEAN_COOKED = "It's not delicious anymore.", -- Cooked caffeinberry bean

            RUINCACAO_TREE = "The black fruit isn't tasty by itself.", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "You'll find a good place.", -- Dug ruincacao tree
            RUINCACAO_SEED = "Ewww, baaah.", -- Ruincacao seed item
            RUINCACAO_SEED_SAPLING = "It's too small to make fruit.", -- Ruincacao sapling from a seed
            RUINCACAO = "Ouch! It's too hard!", -- Ruincacao fruit before smashing
            RUINCACAO_BEAN = "It has a lot of oil, baaah.", -- Ruincacao bean after smashing
            RUINCACAO_BEAN_COOKED = "It's not chocolate yet!", -- Cooked ruincacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Aren't you going to plant it in the ground?", -- Seed herbs (Anise, Juniper Berry, Star Motif) for distillery
            ADDITIVE_PETALS = "I've collected a lot of petals.", -- Herb, Tea, Flower Petal additives for distillery
            ADDITIVE_NUT = "Won't you eat this snack?", -- Nut additives (Birchnut, Coconut, Coffee Bean, Cacao Bean) for distillery
            ADDITIVE_DAIRY = "It's as white as our home's ground!", -- Dairy additives for distillery

            -- Drinks

            WATER_CLEAN = "It doesn't smell like anything from the water!", -- Clean water
            WATER_DIRTY = "It's like our home's pond water!", -- Dirty water
            WATER_SALTY = "It's like the water in the big pond!", -- Saltwater

            GOOPYDRINK = "Is this our home's pond water?", -- Failed drink (Water boiling concept)

            -- Kettle drinks

            FRUITJUICE = "It has the taste of various fruits!", -- Mixed fruit juice
            BERRIES_JUICE = "Juice from the berry bushes!", -- Berry juice
            POMEGRANATE_JUICE = "Red fruit pulp is chewy, baaah!", -- Pomegranate juice
            BANANA_JUICE = "Even when it's warm, fruit juice is delicious!", -- Banana juice
            FIG_JUICE = "Hmm, it's chewy and goes down well!", -- Fig juice
            DRAGONJUICE = "It's a bit bland, baaah.", -- Dragon fruit juice
            GLOWBERRYJUICE = "It's shining juice!!", -- Glowberry juice
            WATERMELON_JUICE = "Juicy watermelon!", -- Watermelon juice

            VEGGIE_TEA = "Hmm, I like it!", -- Vegetable juice
            CARROT_TEA = "It tastes even better now!", -- Carrot tea
            CACTUS_TEA = "No thorns? Good!", -- Cactus tea
            TOMATO_JUICE = "Tomato juice!", -- Tomato juice
            LUMPY_TEA = "I like vegetable water!", -- Root tea
            SEAWEED_SHAKE = "I like slimy things too!", -- Seaweed shake

            GREENTEA = "It smells like water!", -- Fresh tea leaves
            BLACKTEA = "The hot water smells good!", -- Black tea
            BLACKTEA_ICED = "The cold water smells good!", -- Black tea iced tea
            FUER = "Cave plants turned red, baaah!", -- Boik cha, Yip cha, Guk cha
            MIXFLOWER = "Ugly flowers went into it!", -- Mixed flower petals
            HIBISCUSTEA = "Hehe, I boiled red flowers!", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Ugly flowers went into it and it's sweet, baaah!", -- Cactus flower tea
            LOTUSTEA = "The smooth skins like this flower water, I don't know, baaah!", -- Lotus tea
            SUSHIBISCUS = "There are very ugly flowers in the water.", -- Sushi cha
            MOON_BLOSSOM_TEA = "This smells really strange.", -- Moon flower tea

            CAFFEINBERRY_JUICE = "Bleh... it's not tasty.", -- Black coffee
            TOFFEE_LATTE = "Mmm! It's nutty and sweet!", -- Toffee Nut Latte
            RUINCHA_LATTE = "Absolutely. Perfect. Tasty!", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "It's very. Tasty. And warm!", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "Brrr, it's making my head hurt!", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "Kachunk! It's too bitter!", -- Chocolatl (Bitterness)
            TEA_RUINCOLATE_LATTE = "Smells like grass and I'm drinking it!", -- Matcha Latte

            MULLED = "Mmm, it's warm and makes me sleepy!", -- Banoosh
            BUTTERBEER = "It doesn't taste like bugs, and it's very sweet!", -- Butterbeer (Harry Potter series)

            -- Collaborative Kettle Drinks

            COCONUT_JUICE = "It's full of fruitiness, slurp!", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Glooorp!!", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "It's terribly terrible!!", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "Ugly fruit, no hair?", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Drinking honey-tanned water makes your body warm!", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Merms don't make booze from this water snack.", -- Vitacorp Sweet Rice Drink
            PINEANANAS_JUICE = "Sour fruit in sweet water, slurp.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Juicy and refreshing, slurp!", -- Moore Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Hooray, I crushed frozen red juice!", -- Moore Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Hooray, it's smooth!", -- Moore Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Is it okay to drink this even though it's spoiled?", -- Spoiled drink

            -- Soda Machine

            SODA = "The water is weird, it's bubbling.", -- Carbonated water
            FRUITSODA = "It tastes fruity, but the bubbles are annoying.", -- Fruit Soda
            LEMONLIMESODA = "It's sweet and delicious, but strange!", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "Wow, it tastes amazing, slurp!", -- Cola
            COLAQUANTUM = "It sparkles and makes a sound, slurp!", -- Cola Quantum
            LUMPY_BEER = "It has a medicinal taste, but it's sweet and bubbly.", -- Root Beer (not alcoholic)

            -- Brewery Drinks

            CORN_BEER = "It has a foamy head, slurp.", -- Corn Beer
            MADHU = "The Viking women were looking for this intensely.", -- Mead
            WINE = "Slurp... it's red, but not sweet.", -- Wine (Berry brewing)
            NOBLEWINE = "It's light brown and not very sweet, but is it delicious?", -- Noble Wine (Roasted Berry brewing)
            SPARKLINGWINE = "Wicker warned not to shake it.", -- Sparkling Wine
            GLOWBERRYWINE = "Give me juice instead of shining fruit wine.", -- Glow Berry Wine
            KUMIS = "Is this sour milk spoiled?", -- Kumis (Milk of the Mountain Goat)
            LUMPY_WINE = "This earthy vegetable water smells painful.", -- Sake (Root vegetable brewing)
            PULQUE = "I squeezed prickly plants and made 'baro'!", -- Pulque (Agave Nectar)
            RUINCACAO_WINE = "The black fruit has become even stranger in taste.", -- Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "Black water bubbles and tastes like red juice!", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "Bubbly sour fruit water!", -- Carbonated Pineapple (Oran-C)
            ORANGESODA = "Slurp, it's refreshing and cool!", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "It's a bubbly red fruit water, slurp.", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Brewery Drinks

            AUROBOW = "Beautiful fish... why?", -- Shipwrecked Rainbow Jelly Mead
            COCONUT_WINE = "It smells like fruit water mixed with alcohol.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Did you make alcohol with pretty cherry blossom honey?", -- Cherry Forest Cherry Blossom Honey Mead
            GIANT_BLUEBERRY_WINE = "It explodes when you set it on fire.", -- Vitacorp Boom! Berry Sapphire (Explodes when set on fire)
            RICE_WINE = "Snack water turned into alcohol...", -- Vitacorp Makgeolli (Rice Wine)
            WHEAT_BEER = "It has a foamy head, slurp.", -- Hip of Food Wheat Beer
            PALE_BEER = "I've never seen swamp fruit used to make alcohol before.", -- Legion Pale Ale (Uses Monstrata fruit to make light green beer)

            -- Distilled Spirits

            DISINFECTANT = "This water is cold and quickly disappears.", -- Disinfectant
            CORN_WHISKEY = "It smells poisonous, slurp.", -- Corn Whiskey
            LUMPY_VODKA = "This isn't water, slurp!", -- Vodka
            TEQUILA = "It smells like prickly plants, is it spoiled?", -- Tequila
            MADHU_RUM = "Did merms mix smoothies with water when they had an upset stomach?", -- Rum
            BERRY_BRANDY = "Where are my snack fruit, slurp?", -- Berry Brandy
            AREUHI = "Where did the milk go?", -- Kumis Distilled Spirits (Arhi)

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "It has a stronger scent, slurp.", -- Gin
            GLOWBERRY_GIN = "It's sparkling!", -- Glow Berry Gin
            ABSINTHE = "It's green like poison, and it smells strange!", -- Absinthe
            TEA_LUMPY_VODKA = "Can't I just eat the leaves instead of putting them in alcohol?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "The smell of ugly flowers is too strong, slurp.", -- Rose Scented Brandy
            KAHLUA = "Can't I just eat the bean snack without mixing it with alcohol, slurp..", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "I wish they gave me the nuts instead of using them to make alcohol, slurp.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Wow... it smells like delicious snacks..", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Why mix milk with alcohol when it's not water?", -- Rumchata (Rum with Horchata, a dairy beverage)

            -- Collaborative Distilled Spirits

            MOONWAY = "......", -- Rainbow Jelly Mead Distilled Spirits
            ARRACK = "Merm, give me the fruit water as is, slurp.", -- Arrack (Caribbean Rum with Coconut)
            CHERRY_BLOOM_RUM = "Ugly flowers are dancing, slurp!", -- Cherry Honey Rum Distilled Spirits
            RICE_SPIRITS = "It looks like water but smells poisonous!", -- Soju
            WHEAT_WHISKEY = "Instead of snack alcohol, I'd like bread, slurp!", -- Wheat Whiskey
            PALE_WHISKEY = "I'd rather go to the swamp and pick fruit to eat.", -- Pale Malt Whiskey

            -- Warly Exclusive Collaborative Distilled Spirits

            NUT_COCONUT_BRANDY = "The smell of fruit water is strong but toxic!", -- Coconut Brandy (Caribbean Brandy)
            GIANT_BLUEBERRY_GIN = "Kwagwang!", -- Boom Berry Sapphire (Explodes when set on fire)

            -- Pot Cookery

            DARK_RUINCOLATE = "The man who cooked gave me strange snacks.", -- Dark Chocolate
            WHITE_RUINCOLATE = "Yum! Yum!", -- White Chocolate
            RUINCOLATE = "When you chew it, it's sticky and sweet!", -- Just Chocolate
            RUIN_SCHOKAKOLA = "It's delicious, but if you eat too much, you can't sleep!", -- Chokola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Sturdy bucket!", -- Empty steel bucket
                FULL = "Full of rainwater!", -- Clean rainwater inside
                FULL_ICE = "Brrr, don't want to touch it.", -- Rainwater has frozen
                DIRTY = "It turned into a tiny pond, ribbit!", -- Rainwater has become dirty
                DIRTY_ICE = "Brrr, the tiny pond has frozen.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Woodcutter said not to sit on it.", -- Empty Woodie's wooden bucket
                FULL = "Full of rainwater!", -- Clean rainwater inside
                FULL_ICE = "Brrr, don't want to touch it.", -- Rainwater has frozen
                DIRTY = "It turned into a tiny pond, ribbit!", -- Rainwater has become dirty
                DIRTY_ICE = "Brrr, the tiny pond has frozen.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "It's a bucket, ribbit.", -- Empty wooden bucket
                FULL = "Full of rainwater!", -- Clean rainwater inside
                FULL_ICE = "Brrr, don't want to touch it.", -- Rainwater has frozen
                DIRTY = "It turned into a tiny pond, ribbit!", -- Rainwater has become dirty
                DIRTY_ICE = "Brrr, the tiny pond has frozen.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "They made it to drink from a huge pond!", -- Desalinator has no water
                PURIFY_LONG = "Gurgle, gurgle, it'll take a while!", -- Still a long time until purification is complete
                PURIFY_SHORT = "Almost ready to drink, ribbit!", -- Purification is almost complete
                HASWATER = "Water's not salty anymore, ribbit!", -- Desalinator has clean water
                BURNT = "It's not me, ribbit!", -- Desalinator has burnt
                HASSALT = "Too much salt, no use, ribbit.", -- Desalinator has excess salt
            },

            BARREL =
            {
                GENERIC = "Wicker lady got mad at them for raising fish in this, ribbit.", -- Examining the barrel
                BURNT = "Why is it burning when there's water inside?", -- The barrel is burnt
            },

            BREWERY =
            {
                EMPTY = "Can make soda, not just alcohol, ribbit!", -- Examining the brewery
                BURNT = "Oh no, ribbit.", -- The brewery is burnt
                FERMENTING_LONG = "It's taking so long, ribbit!", -- Still a long time until fermentation is complete
                FERMENTING_SHORT = "Is it soda yet? Almost done?", -- Fermentation is almost complete
                DONE = "Is it soda, ribbit?", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "Needed for smooth-skins to drink pond water!", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "Aww, it's empty.", -- Examining the empty camp kettle on the fire pit
                BOILING_LONG = "Water's still cold, ribbit.", -- Starting to boil water
                BOILING_SHORT = "It's hot!!", -- Water is almost boiling
                DONE = "Water doesn't smell, ribbit?", -- Clean water is obtained
                STOP = "There's pond water inside.", -- The fire pit is off, so dirty water isn't boiling
            },

            CAMPDESALINATOR_ITEM = "This is too heavy.", -- Examining the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "Aww, it's empty.", -- No water in the camp desalinator
                BOILING_LONG = "Slooosh, slooosh, ribbit~", -- Starting to boil water
                BOILING_SHORT = "Water's almost moving, fascinating!", -- Water is almost boiling
                DONE = "Water isn't salty anymore, ribbit!", -- Clean water is obtained
                STOP = "There's a big pond inside, ribbit.", -- The fire pit is off, so saltwater isn't purifying
            },

            KETTLE =
            {
                EMPTY = "It'd be nice if there's something to drink inside, ribbit.", -- Examining the empty kettle
                BURNT = "Oh no, ribbit.", -- The kettle is burnt
                BOILING_LONG = "It's taking too long, ribbit.", -- Just started making a drink
                BOILING_SHORT = "It'll be ready soon, ribbit!", -- Drink is almost done
                DONE = "It's time to drink something, ribbit!", -- The drink is ready
                PURIFY_LONG = "If you don't boil pond water, the drink tastes bad, ribbit.", -- Just started boiling dirty water
                PURIFY_SHORT = "Almost no smell now, ribbit!", -- Dirty water is almost done boiling
                HASWATER = "You need food too, ribbit.", -- Kettle has clean water
                MELT_LONG = "Brrr, it's still cold.", -- Just started melting ice water
                MELT_SHORT = "It's lukewarm!", -- Ice water is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Makes water taste better, ribbit!", -- Examining the portable kettle item
                EMPTY = "Need water and food!", -- Examining the placed empty portable kettle
                BOILING_LONG = "It's taking too long, ribbit!", -- Just started making a drink
                BOILING_SHORT = "Drink! Drink! Drink!", -- Drink is almost done
                DONE = "Wow!", -- The drink is ready
                PURIFY_LONG = "If you don't boil pond water, the drink tastes bad, ribbit.", -- Just started boiling dirty water
                PURIFY_SHORT = "Almost no smell now, ribbit!", -- Dirty water is almost done boiling
                HASWATER = "You need food too, ribbit.", -- Portable kettle has clean water
                MELT_LONG = "Brrr, it's still cold.", -- Just started melting ice water
                MELT_SHORT = "It's lukewarm!", -- Ice water is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "A pretty cauldron made of stone!", -- Examining the distiller
                DISTILLTING_LONG = "If you watch it, it goes ping ping!", -- Still a long time until distillation is complete
                DISTILLING_SHORT = "I don't drink alcohol, ribbit.", -- Distillation is almost complete
                DONE = "Let's give it to someone who can drink, ribbit!", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "It's overflowing with power!", -- Maximum pressure
                MIDDLE_PRESSURE = "It's pumping water from underground, ribbit.", -- Medium pressure
                LOW_PRESSURE = "Seems tired, ribbit.", -- Almost no pressure
                RECHARG_PRESSURE = "It's not working, ribbit.", -- No pressure at all (can't be used until pressure is maximum).
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Add fuel to spray more water, ribbit.", -- Examining the sprinkler with low fuel
                ON = "Keep spraying water, might become a swamp, ribbit!", -- Sprinkler is active
                OFF = "A round stone that sprays water!", -- Examining the turned-off sprinkler
            },
        },
    }   