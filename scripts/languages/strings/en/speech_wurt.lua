return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "There's already a bucket attached, florp!", -- Trying to give a bucket to a well with water
            WELL_BUSY = "It's inside the bucket hole, florp!", -- Trying to give a bucket to a well with a filled bucket
        }
    },

        ANNOUNCE_DRUNK = "My head hurts... Feeling dizzy, fluuurph...", -- Getting drunk
        ANNOUNCE_DRUNK_END = "Flurp! Feeling a bit better now.", -- Getting sober (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Exclusive to Wigfrid.
        ANNOUNCE_NOTCHARGE = "No milk is coming out!", -- Trying to milk a charged Volt Goat with a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "I need water, then I'll sleep.", -- Trying to sleep at night with thirst
        ANNOUNCE_NOTHIRSTSIESTA = "I need water, then I'll take a nap.", -- Trying to take a siesta during the day with thirst
        ANNOUNCE_SLEEP_END = "Flurp, All better after a nap!", -- Waking up and completely sober from sleep
        ANNOUNCE_THIRST = "I need a drink!", -- Feeling thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Ready to run!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Don't feel like running anymore.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Feeling a bit better now, florp.", -- Curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Flurph, I feel dizzy!", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "My face is flushed, glargh!", -- Starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "A book full of recipes for drinks!", -- Recipe book for drinks

            WATER_CLEAN_ICE = "Flrrrr, it's really cold!", -- Clean ice water
            WATER_DIRTY_ICE = "Flrrrr, the water froze!", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "Smells spicy!", -- Spice: Caffeinpepper

            WELL_KIT = "Never seen mermfolk make something like this.", -- Well kit
            WELL_SPRINKLER_KIT = "Just press round one once, florp!", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Looks hard to make..", -- Steam water pump kit
            WELL_BURYING_KIT = "Seal the hole on the ground!", -- Hole burying kit
            WELL_DRILLING = "Drilling holes in the ground, florp!", -- Drilling holes in the ground
            WELL_DRILLING_ITEM = "Why drill holes in the ground?", -- Drilling item
            HOLE = "Can hear the sound of stream.", -- Well hole
            WELL = "Scale-less drink from that holes, why?", -- Well

            WX78MODULE_NONEDRUNK = "Crunchy.", -- 78전용 묘듈

            -- Water mode plants

            TEA_TREE = "Have many fragrant leaves!", -- Tea tree
            DUG_TEA_TREE = "Let's go somewhere with me, florp.", -- Dug tea tree
            TEA_SEED = "Seeds of a leafy tree", -- Tea tree seed
            TEA_SEED_COOKED = "Tastes yucky..", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Grow big!", -- Tea tree sapling
            TEALEAVES = "Fragrant tea leaves, florp.", -- Tea leaves
            TEALEAVES_DRIED = "Amazing aroma!", -- Dried tea leaves

            CAFFEINBERRY = "A lot of snacks are opening up!", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "You'll find a good place.", -- Dug caffeinberry bush
            CAFFEINBERRY_BEAN = "A delicious snack!", -- Caffeinberry bean
            CAFFEINBERRY_BEAN_COOKED = "Is not delicious anymore..", -- Cooked caffeinberry bean

            RUINCACAO_TREE = "Black fruit is yucky by itself.", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "You'll find a good place.", -- Dug ruincacao tree
            RUINCACAO_SEED = "Spooooky, glurp.", -- Ruincacao seed item
            RUINCACAO_SEED_SAPLING = "Is too small to make fruit.", -- Ruincacao sapling from a seed
            RUINCACAO = "Ouch! Is too hard!", -- Ruincacao fruit before smashing
            RUINCACAO_BEAN = "Has a lot of oil, glurph.", -- Ruincacao bean after smashing
            RUINCACAO_BEAN_COOKED = "Is not chocolate yet!", -- Cooked ruincacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Aren't going to plant it in the ground?", -- Seed herbs (Anise, Juniper Berry, Star Motif) for distillery
            ADDITIVE_PETALS = "Collected a lot of petals.", -- Herb, Tea, Flower Petal additives for distillery
            ADDITIVE_NUT = "Won't eat this snack?", -- Nut additives (Birchnut, Coconut, Coffee Bean, Cacao Bean) for distillery
            ADDITIVE_DAIRY = "Looks like soil in front of our house but white!", -- Dairy additives for distillery

            -- Drinks

            WATER_CLEAN = "Doesn't smell anything from the water!", -- Clean water
            WATER_DIRTY = "Is this our home's pond water!", -- Dirty water
            WATER_SALTY = "Is like the water in the big pond!", -- Saltwater

            GOOPYDRINK = "Is this our home's pond water?", -- Failed drink (Water boiling concept)

            -- Kettle drinks

            FRUITJUICE = "Has the taste of various fruits!", -- Mixed fruit juice
            BERRIES_JUICE = "Bushefruite juice!", -- Berry juice
            POMEGRANATE_JUICE = "Seeds of the red fruit were crunched all over, florp!", -- Pomegranate juice
            BANANA_JUICE = "Is warm, but fruit juice is delicious!", -- Banana juice
            FIG_JUICE = "Ummm, chewy-chewy-gulp-gulp-.", -- Fig juice
            DRAGONJUICE = "Is bit bland, florp.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Is shining juice!!", -- Glowberry juice
            WATERMELON_JUICE = "Pureed watermelon!", -- Watermelon juice

            VEGGIE_TEA = "Umm, like it!", -- Vegetable juice
            CARROT_TEA = "It tastes even better now!", -- Carrot tea
            CACTUS_TEA = "No thorns? Good!", -- Cactus tea
            TOMATO_JUICE = "Tomato juice!", -- Tomato juice
            LUMPY_TEA = "Earthy vegetable water i like it!", -- Root tea
            SEAWEED_SHAKE = "I like slimy things too!", -- Seaweed shake

            GREENTEA = "Is fragrant water!", -- Fresh tea leaves
            BLACKTEA = "Hot water has smells good!", -- Black tea
            BLACKTEA_ICED = "Cold water has smells good!", -- Black tea iced tea
            FUER = "Cave plants turned red, flurpt!", -- Boik cha, Yip cha, Guk cha
            MIXFLOWER = "Ugly flowers went into it!", -- Mixed flower petals
            HIBISCUSTEA = "Heh-heh, I boiled red flowers!", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Ugly flowers went into it and it's sweet, florp!", -- Cactus flower tea
            LOTUSTEA = "Scale-less like this flower water, I don't know, florp!", -- Lotus tea
            SUSHIBISCUS = "There are very ugly flowers in the water.", -- Sushi cha
            MOON_BLOSSOM_TEA = "This smells really strange.", -- Moon flower tea

            CAFFEINBERRY_JUICE = "Gleh... yucky.", -- Black coffee
            TOFFEE_LATTE = "Mmm! Is nutty and sweet!", -- Toffee Nut Latte
            RUINCHA_LATTE = "Absolutely. Perfect. Tasty!", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "It's very. Tasty. And warm!", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "Flrrr, is making my head hurt!", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "faaachoo! It's too bitter!", -- Chocolatl (Bitterness)
            TEA_RUINCOLATE_LATTE = "Smells like grass and very tasty!", -- Matcha Latte

            MULLED = "Mmm, Is warm and makes me sleepy!", -- Banoosh
            BUTTERBEER = "Doesn't taste bugs and very sweet!", -- Butterbeer (Harry Potter series)

            -- Collaborative Kettle Drinks

            COCONUT_JUICE = "Fruit has become soft, florp!", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Glargh!!", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Is terribly terrible!!", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "No more ugly fruit hair?", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Drinking pretty honey-tanned water makes body warm!", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Merms don't make snacks this way.", -- Vitacorp Sweet Rice Drink
            PINEANANAS_JUICE = "Sour fruit was put into the water, making it less sour and sweeter, florp.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Juicy and refreshing, florp!", -- Moore Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Flrrr, I crushed frozen red juice!", -- Moore Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Flrrr, is smooth!", -- Moore Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Is it okay to drink?", -- Spoiled drink

            -- Soda Machine

            SODA = "This water is weird, it's bubbling.", -- Carbonated water
            FRUITSODA = "Tastes fruity, but the bubbles are annoying.", -- Fruit Soda
            LEMONLIMESODA = "Is sweet and delicious, but strange!", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "Wow, Tastes amazing, florp!", -- Cola
            COLAQUANTUM = "Sparkles and makes a some sounds, florp!", -- Cola Quantum
            LUMPY_BEER = "Has a medicinal taste, but is sweet and bubbly.", -- Root Beer (not alcoholic)

            -- Brewery Drinks

            CORN_BEER = "Has a foamy head, florp.", -- Corn Beer
            MADHU = "Viking women were looking for this intensely.", -- Mead
            WINE = "Glurp... is red, but not sweet.", -- Wine (Berry brewing)
            NOBLEWINE = "Make white alcohol by spoiling the bush's snack treats?", -- Noble Wine (Roasted Berry brewing)
            SPARKLINGWINE = "Wicker lady warned not to shake it.", -- Sparkling Wine
            GLOWBERRYWINE = "Give me juice instead of shining fruit wine.", -- Glow Berry Wine
            KUMIS = "Is surging milk spoiled?", -- Kumis (Milk of the Mountain Goat)
            LUMPY_WINE = "Earthy vegetable water smells painful.", -- Sake (Root vegetable brewing)
            PULQUE = "Thorny plants were squeezed and fermented!", -- Pulque (Agave Nectar)
            RUINCACAO_WINE = "Blackfruit has become even stranger in taste.", -- Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "Black water bubbles and tastes like red juice!", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "Bubbly sour fruit water!", -- Carbonated Pineapple (Oran-C)
            ORANGESODA = "Glurp, it's refreshing and cool!", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "It's a bubbly red fruit water, florp.", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Brewery Drinks

            AUROBOW = "Pretty fishs... why?", -- Shipwrecked Rainbow Jelly Mead
            COCONUT_WINE = "Smells like watery fruit to alcohol.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Make alcohol with pretty honey?", -- Cherry Forest Cherry Blossom Honey Mead
            GIANT_BLUEBERRY_WINE = "Explodes when set it on fire.", -- UM Boom! Berry Sapphire (Explodes when set on fire)
            RICE_WINE = "Swamp snack turned into alcohol...", -- Vitacorp Makgeolli (Rice Wine)
            WHEAT_BEER = "Has a foamy head, florp.", -- Hip of Food Wheat Beer
            PALE_BEER = "I've never seen swamp fruit used to make alcohol before.", -- Legion Pale Ale (Uses Monstrata fruit to make light green beer)

            -- Distilled Spirits

            DISINFECTANT = "This water is cold and quickly disappears.", -- Disinfectant
            CORN_WHISKEY = "Smells poisonous, glorpt.", -- Corn Whiskey
            LUMPY_VODKA = "That isn't water, glorp!", -- Vodka
            TEQUILA = "Alcohol resembles character of a thorny plant!", -- Tequila
            MADHU_RUM = "Scale-less says put in the water it when they got on board, Why?", -- Rum
            BERRY_BRANDY = "Where are my snack fruit, glurph?", -- Berry Brandy
            AREUHI = "Where did the milk go?", -- Kumis Distilled Spirits (Arhi)

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "Has a stronger scent, glorp.", -- Gin
            GLOWBERRY_GIN = "Give me glowing fruit juice, not alcohol.", -- Glow Berry Gin
            ABSINTHE = "Is green like poison, and smells strange!", -- Absinthe
            TEA_LUMPY_VODKA = "Can't I just eat the leaves instead of putting them in alcohol?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Ugly flowers also smells strong, glorp.", -- Rose Scented Brandy
            KAHLUA = "Can't eat the bean snack without mixing it with alcohol, glorph..", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Wish they gave me the snack instead of using them to make alcohol, glorp.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Wow... Smells like delicious snacks..", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Why mix milk with alcohol?", -- Rumchata (Rum with Horchata, a dairy beverage)

            -- Collaborative Distilled Spirits

            MOONWAY = "......", -- Rainbow Jelly Mead Distilled Spirits
            ARRACK = "I'll eat waterly fruit as it is, not this.", -- Arrack (Caribbean Rum with Coconut)
            CHERRY_BLOOM_RUM = "Ugly flowers are dancing, florp!", -- Cherry Honey Rum Distilled Spirits
            RICE_SPIRITS = "Looks like water but smells poisonous!", -- Soju
            WHEAT_WHISKEY = "Make the grass snack into bread, not this, glorp!", -- Wheat Whiskey
            PALE_WHISKEY = "I'd rather go to the swamp and pick fruit to eat.", -- Pale Malt Whiskey

            -- Warly Exclusive Collaborative Distilled Spirits

            NUT_COCONUT_BRANDY = "Smell of waterly fruit is strong but toxic!", -- Coconut Brandy (Caribbean Brandy)
            GIANT_BLUEBERRY_GIN = "Faboom!", -- Boom Berry Sapphire (Explodes when set on fire)

            -- Pot Cookery

            DARK_RUINCOLATE = "Cooked man gave me strange snacks.", -- Dark Chocolate
            WHITE_RUINCOLATE = "Yum! Yum!", -- White Chocolate
            RUINCOLATE = "When i chew it, is sticky and sweet!", -- Just Chocolate
            RUIN_SCHOKAKOLA = "Is delicious, but if eat too much, can't sleep!", -- Chokola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Sturdy bucket!", -- Empty steel bucket
                FULL = "Full of rainwater!", -- Clean rainwater inside
                FULL_ICE = "Brrr, don't want to touch it.", -- Rainwater has frozen
                DIRTY = "It turned into a tiny pond, florp!", -- Rainwater has become dirty
                DIRTY_ICE = "Flrrr, the tiny pond has frozen.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Wood choppy man said not to sit on it.", -- Empty Woodie's wooden bucket
                FULL = "Full of rainwater!", -- Clean rainwater inside
                FULL_ICE = "Flrrr, don't want to touch it.", -- Rainwater has frozen
                DIRTY = "It turned into a tiny pond, florp!", -- Rainwater has become dirty
                DIRTY_ICE = "Flrrr, the tiny pond has frozen.", -- Dirty rainwater has frozen
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Is a floaty bucket. florp", -- Empty wooden bucket
                FULL = "Full of rainwater!", -- Clean rainwater inside
                FULL_ICE = "Flrrr, don't want to touch it.", -- Rainwater has frozen
                DIRTY = "It turned into a tiny pond, florp!", -- Rainwater has become dirty
                DIRTY_ICE = "Flrrr, the tiny pond has frozen.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Is a bucket.florp", -- Empty wooden bucket
                FULL = "Full of rainwater!", -- Clean rainwater inside
                FULL_ICE = "Flrrr, don't want to touch it.", -- Rainwater has frozen
                DIRTY = "It turned into a tiny pond, florp!", -- Rainwater has become dirty
                DIRTY_ICE = "Flrrr, the tiny pond has frozen.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "This makes it possible to drink water from a huge pond!", -- Desalinator has no water
                PURIFY_LONG = "Gurgle, gurgle, Is spinning.!", -- Still a long time until purification is complete
                PURIFY_SHORT = "Almost ready to drink, florp!", -- Purification is almost complete
                HASWATER = "Water's not salty anymore.", -- Desalinator has clean water
                BURNT = "It's not me, glorph!", -- Desalinator has burnt
                HASSALT = "Too much salty rocks, no use, glorp.", -- Desalinator has excess salt
            },

            BARREL =
            {
                GENERIC = "Wicker lady got mad at them for raising fish in this...", -- Examining the barrel
                BURNT = "Why is burning when there's water inside?", -- The barrel is burnt
            },

            BREWERY =
            {
                EMPTY = "Can make so-da, not just alcohol, florp!", -- Examining the brewery
                BURNT = "Sob sob...", -- The brewery is burnt
                FERMENTING_LONG = "It's taking sooooo loooong, glorp!", -- Still a long time until fermentation is complete
                FERMENTING_SHORT = "Is it so-da yet? Almost done?", -- Fermentation is almost complete
                DONE = "Is it so-da, florp?", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "Needed for Scale-less to drink pond water!", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "Fww, is empty.", -- Examining the empty camp kettle on the fire pit
                BOILING_LONG = "Water's still cold, glorp.", -- Starting to boil water
                BOILING_SHORT = "Is hot!!", -- Water is almost boiling
                DONE = "Water doesn't smell?", -- Clean water is obtained
                STOP = "There's pond water inside.", -- The fire pit is off, so dirty water isn't boiling
            },

            CAMPDESALINATOR_ITEM = "Is toooo heavy.", -- Examining the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "Fww, is empty.", -- No water in the camp desalinator
                BOILING_LONG = "Slooosh, slooosh~", -- Starting to boil water
                BOILING_SHORT = "Water's almost moving, fascinating!", -- Water is almost boiling
                DONE = "Water isn't salty anymore!", -- Clean water is obtained
                STOP = "There is huge pond water in it., florp.", -- The fire pit is off, so saltwater isn't purifying
            },

            KETTLE =
            {
                EMPTY = "It'd be nice if there's something to drink inside, glrub.", -- Examining the empty kettle
                BURNT = "Sob sob....", -- The kettle is burnt
                BOILING_LONG = "Is taking toooo looong..", -- Just started making a drink
                BOILING_SHORT = "Will be ready soon!", -- Drink is almost done
                DONE = "Is time to drink something!", -- The drink is ready
                PURIFY_LONG = "If don't boil pond water, the drink tastes bad.", -- Just started boiling dirty water
                PURIFY_SHORT = "Almost no smell now, florp!", -- Dirty water is almost done boiling
                HASWATER = "Have to put food in it also, florp.", -- Kettle has clean water
                MELT_LONG = "Flrrr, is still cold.", -- Just started melting ice water
                MELT_SHORT = "Is lukewarm!", -- Ice water is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Makes water taste better!", -- Examining the portable kettle item
                EMPTY = "Need water and food!", -- Examining the placed empty portable kettle
                BOILING_LONG = "Is taking too long..", -- Just started making a drink
                BOILING_SHORT = "Drink! Drink! Drink!", -- Drink is almost done
                DONE = "Wow!", -- The drink is ready
                PURIFY_LONG = "If don't boil pond water, the drink tastes bad.", -- Just started boiling dirty water
                PURIFY_SHORT = "Almost no smell now, florp!", -- Dirty water is almost done boiling
                HASWATER = "Have to put food in it also, florp.", -- Portable kettle has clean water
                MELT_LONG = "Brrr, is still cold.", -- Just started melting ice water
                MELT_SHORT = "Is lukewarm!", -- Ice water is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Cauldron made of pretty stone!", -- Examining the distiller
                DISTILLTING_LONG = "If i watch it up, my head is spinning!", -- Still a long time until distillation is complete
                DISTILLING_SHORT = "I don't drink alcohol,  glorp.", -- Distillation is almost complete
                DONE = "Let's give it to someone who can drink, florp!", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Is overflowing with power!", -- Maximum pressure
                MIDDLE_PRESSURE = "Is pumping water from underground, florp.", -- Medium pressure
                LOW_PRESSURE = "Seems tired.", -- Almost no pressure
                RECHARG_PRESSURE = "Is not working,  glorp.", -- No pressure at all (can't be used until pressure is maximum).
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Add fuel to spray more water,  florp.", -- Examining the sprinkler with low fuel
                ON = "Keep spraying water, might become a swamp,  florp!", -- Sprinkler is active
                OFF = "A round stone that sprays water!", -- Examining the turned-off sprinkler
            },
        },
    }   