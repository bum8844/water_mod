return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "I should remove the bucket from the well first.", -- Trying to use a bucket when there's already a bucket with water in the well
            WELL_BUSY = "I'll drink from the well with a bucket.", -- Trying to use a bucket when there's already a bucket attached to it
        }
    },

        ANNOUNCE_DRUNK = "Ugh, I feel a bit drunk.", -- Feeling drunk
        ANNOUNCE_DRUNK_END = "I'm starting to sober up now.", -- Sobering up from alcohol
        ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wathgrithr", -- Temporary. Exclusive to Wigfrid.
        ANNOUNCE_NOTCHARGE = "This one's useless.", -- Trying to milk a Volt Goat that isn't charged with electricity
        ANNOUNCE_NOTHIRSTSLEEP = "I'm too thirsty to sleep right now.", -- Trying to sleep at night while being very thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "I'm too thirsty to rest during the day.", -- Trying to rest during the day while being very thirsty
        ANNOUNCE_SLEEP_END = "I must have had a nightmare.", -- Waking up after sleeping and sobering up from alcohol
        ANNOUNCE_THIRST = "I'm thirsty.", -- Feeling very thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "I'm getting hyped up!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "The show is over.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "I'm feeling a bit better now.", -- Curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "I'm getting really tipsy.", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "I'm feeling warm and fuzzy.", -- Getting tipsy

        DESCRIBE =
        {
            BOILBOOK = "Making alcohol can't be that hard, can it?",

            WATER_CLEAN_ICE = "This is all solid water.", -- Clean ice
            WATER_DIRTY_ICE = "Frozen trash.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "It doesn't add much value to anything.", -- Caffein pepper spice

            WELL_KIT = "Do I have to carry this around and fly?", -- Well kit
            WELL_SPRINKLER_KIT = "A fusion of machinery and magic, it seems.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Did I really have to think about such a thing?", -- Steam water pump kit
            WELL_BURYING_KIT = "Why did I perform unnecessary work?", -- Burying kit
            WELL_DRILLING = "It works automatically, which is convenient.", -- Drilling hole with a drill
            WELL_DRILLING_ITEM = "Looks quite rugged.", -- Drill item
            HOLE = "I might not be able to catch bones if I fall in.", -- Well hole
            WELL = "I'm dying of thirst next to this well.", -- Well

            -- Water Mode Plants

            TEA_TREE = "The leaves are flourishing on this tiny thing.", -- Tea tree
            DUG_TEA_TREE = "I know how to be a gardener, don't I?", -- Tea tree dug from the ground
            TEA_SEED = "Someone who knows how to grow trees might find this useful.", -- Tea tree seed
            TEA_SEED_COOKED = "I can't believe I have to eat something like this.", -- Roasted tea tree seed
            TEA_SEED_SAPLING = "I guess I have to plant it in the ground myself.", -- Tea tree sapling
            TEALEAVES = "I should dry them before using.", -- Tea leaves
            TEALEAVES_DRIED = "I'm longing for a cup of tea.", -- Dried tea leaves

            CAFFEINBERRY = "A coffee bush influenced by the moon.", -- Caffeine bush
            DUG_CAFFEINBERRY = "It's worth replanting.", -- Dug coffee bush
            CAFFEINBERRY_BEAN = "Looks different from the coffee beans I know.", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Better than raw, but there must be other ways.", -- Roasted coffee bean

            RUINCACAO_TREE = "Definitely influenced by dark magic.", -- Cacao tree
            DUG_RUINCACAO_TREE = "Someone who knows how to grow trees might find this useful.", -- Dug cacao tree
            RUINCACAO_SEED = "It seems to have bloomed.", -- Cacao seed item
            RUINCACAO_SEED_SAPLING = "I guess it won't plant itself.", -- Planted cacao sapling
            RUINCACAO = "I'll eat it, but I won't enjoy it.", -- Cacao fruit before breaking
            RUINCACAO_BEAN = "Covered in cheap oil.", -- Crushed cacao bean
            RUINCACAO_BEAN_COOKED = "Better than raw, but there must be other ways.", -- Roasted cacao bean

            -- Distilled Spirit Additives

            ADDITIVE_SEED = "Are you trying to make real alcohol?", -- Seed herbs (anise, juniper berry, octagon motif) for adding to liqueurs
            ADDITIVE_PETALS = "Does alcohol really need this?", -- Herb, green tea, and flower petal additives for adding to liqueurs
            ADDITIVE_NUT = "Do young people really put this in their drinks?", -- Nut, coconut, coffee bean, and cacao bean additives for adding to liqueurs
            ADDITIVE_DAIRY = "I respect your taste, but...", -- Dairy additives for adding to liqueurs

            -- Beverages

            WATER_CLEAN = "A sip of clean water is precious.", -- Clean water
            WATER_DIRTY = "Hey, my water isn't looking so good.", -- Dirty water
            WATER_SALTY = "I shouldn't drink this.", -- Saltwater

            GOOPYDRINK = "Lacking refinement.", -- Failed drink (wet roast concept)

            -- Teapot Beverages

            FRUITJUICE = "It's mixed up, but it tastes good.", -- Mixed fruit juice
            BERRIES_JUICE = "Well, it's not bad.", -- Berry juice
            POMEGRANATE_JUICE = "At least it looks the part.", -- Pomegranate juice
            BANANA_JUICE = "Was there no better way to do this?", -- Banana juice
            FIG_JUICE = "Quite sweet.", -- Fig juice
            DRAGONJUICE = "It has an intense sweetness.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Well used the juices of fruits.", -- Glowberry juice
            WATERMELON_JUICE = "The watermelon flavor is somewhat diluted.", -- Watermelon juice

            VEGGIE_TEA = "It's time to take care of my health.", -- Vegetable juice
            CARROT_TEA = "I have no choice but to sip it.", -- Carrot tea
            CACTUS_TEA = "I have a small oasis in my hand.", -- Cactus tea
            TOMATO_JUICE = "Smooth and easy to drink.", -- Tomato juice
            LUMPY_TEA = "This way, it looks somewhat dignified.", -- Root tea
            SEAWEED_SHAKE = "Please, no...", -- Seaweed shake

            GREENTEA = "It has a leafy scent.", -- Fresh green tea
            BLACKTEA = "A cup of tea is surprisingly welcome.", -- Black tea
            BLACKTEA_ICED = "Refreshing.", -- Iced black tea
            FUER = "Quite exotic.", -- Bohe tea, leaf tea, fern tea
            MIXFLOWER = "It has a slightly odd aftertaste.", -- Mixed flower petal tea
            HIBISCUSTEA = "Beautiful without compare.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "It doesn't disappoint.", -- Cactus flower tea
            LOTUSTEA = "Could this be what I'm thinking of?", -- Lotus tea
            SUSHIBISCUS = "The essence of darkness.", -- Suicide tea
            MOON_BLOSSOM_TEA = "It won't transform me, will it?", -- Moon flower tea

            CAFFEINBERRY_JUICE = "I'm looking forward to the taste.", -- Black coffee
            TOFFEE_LATTE = "Did they melt scotch candies for this?", -- Toffee nut latte
            RUINCHA_LATTE = "I don't even know what real mocha is.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Even if my soul is torn apart, it will mend.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "I'm worried about my teeth if I drink this.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "I can feel a spiritual sense.", -- Chocolatl (spiciness)
            TEA_RUINCOLATE_LATTE = "Do young people really drink this?", -- Matcha latte

            MULLED = "I can enjoy some leisure even if the weather is bitterly cold.", -- Bangcho
            BUTTERBEER = "My soul will stick back together, even if it's torn apart.", -- Butterbeer from the Harry Potter series

            -- Collaborative Teapot Drinks

            COCONUT_JUICE = "Drink some water and fill your stomach a bit!", -- Shipwrecked coconut juice
            RAINBOW_SHAKE = "Seems like junk food for kids.", -- Shipwrecked rainbow jelly shake
            QUARTZ_SHAKE = "If only there were lemons or limes...", -- Shipwrecked glass jelly shake
            CHERRY_ROSEBERRIES_TEA = "So, where are the biscuits?", -- Cherry Forest rosehip tea
            CHERRY_HONEY_TEA = "It would be better with ginger and lemon...", -- Cherry Forest cherry blossom honey tea
            SWEET_RICE_DRINK = "Mmm, soothing.", -- Vitacomp sweet rice drink
            PINEANANAS_JUICE = "I can't drink this tangy fruit juice in one go.", -- Regione pineapple juice
            ORANGE_JUICE = "I never noticed this in the break room before coming here.", -- Moore Food Pack orange juice
            STRAWBERRY_SMOOTHIE = "Seems like a street vendor drink.", -- Moore Food Pack strawberry smoothie
            STRAWBERRY_MILK_SMOOTHIE = "It's not to my taste.", -- Moore Food Pack strawberry milk smoothie

            -- Distilled Spirit Drinks

            SPOILED_DRINK = "It was a drink before I spoiled it.", -- Spoiled drink

            -- Distillery Soda

            SODA = "I never even thought about trying this.", -- Carbonated water (roughly made carbonation using dust)
            FRUITSODA = "Should I perform in front of the punch bowl?", -- Fruit soda
            LEMONLIMESODA = "This is going to wreck my teeth.", -- Lemon lime soda (superior version of fruit soda)
            COLA = "I wish it had a straw.", -- Cola
            COLAQUANTUM = "Suspicious but spectacular.", -- Cola Quantum
            LUMPY_BEER = "How did they recreate the taste?", -- Root beer (not alcoholic)

            -- Brewery Drinks

            CORN_BEER = "Hmm... Isn't this just moonshine made from corn?", -- Corn whiskey (wash - the distillation prior to making whiskey)
            MADHU = "I hope they didn't make this in the Viking tradition.", -- Mead
            WINE = "Even if it's made with wild berries, it needs some refinement.", -- Wine (simple berry brewing)
            NOBLEWINE = "Life has become quite prosperous, huh.", -- Noble wine (baked berry brewing)
            SPARKLINGWINE = "I miss champagne.", -- Sparkling wine
            GLOWBERRYWINE = "I could make big money selling this outside.", -- Glowberry wine
            KUMIS = "Quite wild.", -- Kumis, fermented mare's milk
            LUMPY_WINE = "Surprisingly clean.", -- Rice wine (potato, sweet potato, etc. root liquor)
            PULQUE = "It doesn't suit my taste.", -- Pulque (traditional Mexican alcoholic beverage)
            RUINCACAO_WINE = "It's a rare wine you won't find outside.", -- Cacao wine

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "It's a shame there's no real doctor here.", -- Cherry Forest Dr. Pepper (Doctor Cherry)
            PINEANANASSODA = "I feel closer to civilization now.", -- Carbonated pineapple (Oransi)
            ORANGESODA = "This soda is overly carbonated.", -- Carbonated orange (Fanta)
            STRAWBERRYSODA = "This soda is overly carbonated.", -- Carbonated strawberry (Welch's strawberry)

            -- Collaboration Brewery Drinks

            AUROBOW = "Quite a unique idea.", -- Shipwrecked Oroboros, Rainbow Jelly Brew
            COCONUT_WINE = "I should have some crab with this.", -- Shipwrecked coconut wine
            CHERRY_BLOOM_MADHU = "I hope it won't be difficult to wash this out of my clothes.", -- Cherry Forest cherry blossom honey mead
            GIANT_BLUEBERRY_WINE = "Let's behave like cultured individuals.", -- Vitacomp Boom! Berry Wine (explodes when ignited)
            RICE_WINE = "It has a tangy taste.", -- Vitacomp Makgeolli
            WHEAT_BEER = "I wonder where they got the hops.", -- Hip of Food wheat beer
            PALE_BEER = "I doubt this is made with hops.", -- Regione pale ale (green beer made with monster fruit)

            -- Distilled Drinks

            DISINFECTANT = "Have you tried cutting magic? You might need this.", -- Disinfectant
            CORN_WHISKEY = "Finally.", -- Corn whiskey
            LUMPY_VODKA = "Unfortunately, now I'm just a laborer.", -- Vodka
            TEQUILA = "Feels like a rustic performance.", -- Tequila
            MADHU_RUM = "It's quite rough.", -- Rum
            BERRY_BRANDY = "Fits my sophistication.", -- Berry brandy
            AREUHI = "It has a strange smell.", -- Kumis distilled liquor Areuhi

            -- Warly Exclusive Distilled Drinks

            BERRY_GIN = "It's not such a low-class drink after all.", -- Gin
            GLOWBERRY_GIN = "I should apologize to her.", -- Glowberry gin
            ABSINTHE = "Ah, it's like the depths of my life!", -- Absinthe
            TEA_LUMPY_VODKA = "Hmm, it's subtle.", -- Green tea liqueur
            PETALS_BERRY_BRANDY = "A bit excessive.", -- Rose-scented brandy
            KAHLUA = "It's not that bad.", -- Coffee liqueur Kahlua
            NUT_CORN_WHISKEY = "I have a craving for smoked meat.", -- Nut whiskey
            RUINCACAO_CREAM_LIQUEUR = "These young folks...", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "What kind of drink is this?", -- Rumchata (a mix of rum and horchata, a dairy-based beverage)

            -- Collaboration Distilled Drinks

            MOONWAY = "How did they make this?", -- Rainbow Jelly Brew Distilled Liquor
            ARRACK = "It's made from a versatile fruit, alright.", -- Arrack, Indonesian version of coconut wine, distilled
            CHERRY_BLOOM_RUM = "Extravagant, isn't it?", -- Cherry Blossom Honey Rum, cherry blossom petals float
            RICE_SPIRITS = "Quite clean.", -- Rice spirits
            WHEAT_WHISKEY = "Perfect.", -- Wheat whiskey
            PALE_WHISKEY = "To be honest, it's not bad.", -- Pale malt whiskey

            -- Warly Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "So tell me... What's become of my ship?", -- Spoken by Barbosa, a Caribbean pirate
            GIANT_BLUEBERRY_GIN = "It's captured the essence of destruction.", -- Boom Berry Sapphire (Carrot explosion)

            -- Pot Cooking

            DARK_RUINCOLATE = "Did the chef friend dabble in dark magic too?", -- Dark chocolate
            WHITE_RUINCOLATE = "I'll pass.", -- White chocolate
            RUINCOLATE = "A bait to lure in little guests.", -- Plain chocolate
            RUIN_SCHOKAKOLA = "A concentrated form of efficiency.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "It seems to be an empty steel bucket.", -- Empty metal bucket
                FULL = "I guess I can collect rainwater or drink from it.", -- Clean rainwater, indeed
                FULL_ICE = "Do I need to get that out?", -- Rainwater has frozen
                DIRTY = "It's disgusting.", -- Rainwater has become dirty
                DIRTY_ICE = "I don't even want to look at it.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "It's Woody's empty wooden bucket.", -- Woody's empty wooden bucket
                FULL = "I guess I can collect rainwater or drink from it.", -- Clean rainwater, indeed
                FULL_ICE = "Do I need to get that out?", -- Rainwater has frozen
                DIRTY = "It's disgusting.", -- Rainwater has become dirty
                DIRTY_ICE = "I don't even want to look at it.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "I'd rather not dirty my hands.", -- Empty wooden bucket
                FULL = "I guess I can collect rainwater or drink from it.", -- Clean rainwater, indeed
                FULL_ICE = "Do I need to get that out?", -- Rainwater has frozen
                DIRTY = "It's disgusting.", -- Rainwater has become dirty
                DIRTY_ICE = "I don't even want to look at it.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "That's quite an idea.", -- No water in the desalinator
                PURIFY_LONG = "It's going to take a while.", -- Still a lot of time left for purification
                PURIFY_SHORT = "It's almost done!", -- Purification is almost complete
                HASWATER = "It looks like it's all done.", -- Clean water in the desalinator
                BURNT = "It's useless now.", -- The desalinator has burnt
                HASSALT = "It might be useless now.", -- There's still salt in the desalinator
            },

            BARREL =
            {
                GENERIC = "It's a barrel.", -- Examining the barrel
                BURNT = "It's using fire like water.", -- The barrel has burnt
            },

            BREWERY =
            {
                EMPTY = "It has a strong scent of oak.", -- Examining the brewery
                BURNT = "Ah, how smoky the aroma is.", -- The brewery has burnt
                FERMENTING_LONG = "It's going to take a while.", -- Still a lot of time left for brewing
                FERMENTING_SHORT = "It's almost done!", -- Brewing is almost finished
                DONE = "I wonder if it's drinkable.", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "Sigh, it's my lot in life.", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "So, do I have to go find water to put in this?", -- Empty camp kettle on the hearth
                BOILING_LONG = "It's still cold.", -- Starting to boil the water
                BOILING_SHORT = "It's perfect for warming my hands.", -- The water is almost boiling
                DONE = "I'm in the situation where I have to boil pond water to drink.", -- Clean water has been obtained
                STOP = "It's not quite boiled.", -- The fire is out, and dirty water won't boil
            },

            CAMPDESALINATOR_ITEM = "It looks quite heavy.", -- Examining the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "So, am I supposed to walk over and fetch seawater with my feet?", -- No water in the desalinator
                BOILING_LONG = "How long do I have to wait?", -- Starting to boil the water
                BOILING_SHORT = "It seems almost done.", -- It's almost done boiling
                DONE = "It looks like it's all done.", -- Clean water in the desalinator
                STOP = "It's not quite boiled.", -- There's no fire in the hearth, so the saltwater won't purify
            },

            KETTLE =
            {
                EMPTY = "It looks lonely.", -- Empty kettle examination
                BURNT = "It's over-extracted.", -- The kettle is burnt
                BOILING_LONG = "Let's be patient...", -- Just started making a drink
                BOILING_SHORT = "It's almost done!", -- The drink is almost ready
                DONE = "Now I can finally drink something decent.", -- The drink is finished
                PURIFY_LONG = "It's not going to taste good.", -- Just started boiling dirty water
                PURIFY_SHORT = "It's perfect for warming my hands.", -- Almost done boiling dirty water
                HASWATER = "I wish I could have a cup of tea.", -- There's clean water in it
                MELT_LONG = "It's still cold.", -- Just started melting ice water
                MELT_SHORT = "It's lukewarm.", -- Almost done melting ice water
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "I don't even have the leisure to sit down and have tea.", -- Examining the portable kettle item
                EMPTY = "It's empty.", -- Examining an empty placed portable kettle
                BOILING_LONG = "I need to be patient.", -- Just started making a drink
                BOILING_SHORT = "It'll be done soon.", -- The drink is almost ready
                DONE = "I can have a brief moment to drink tea.", -- The drink is finished
                PURIFY_LONG = "It's not going to taste good.", -- Just started boiling dirty water
                PURIFY_SHORT = "It's perfect for warming my hands.", -- Almost done boiling dirty water
                HASWATER = "I wish I could have a cup of tea.", -- There's clean water in it
                MELT_LONG = "It's still cold.", -- Just started melting ice water
                MELT_SHORT = "It's lukewarm.", -- Almost done melting ice water
            },

            DISTILLERS =
            {
                EMPTY = "It's a sturdy and fancy cauldron.", -- Examining the distiller
                DISTILLTING_LONG = "Let's leave the distiller working.", -- Still a lot of time left for distillation
                DISTILLING_SHORT = "It seems almost done.", -- Distillation is almost complete
                DONE = "Now I'll try some real liquor.", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Hey, isn't this a bit too loud?", -- Maximum pressure
                MIDDLE_PRESSURE = "It's nice not to have to work with my hands.", -- Medium pressure
                LOW_PRESSURE = "Is this thing working properly?", -- Almost no pressure
                RECHARG_PRESSURE = "I guess I have to draw water by hand, sigh.", -- No pressure, can't be used until the pressure is maximum
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "I guess my friend who knows how to tinker with machines will figure it out.", -- Examining when fuel is almost gone
                ON = "It'll be soaked if I get closer.", -- It's on
                OFF = "It's turned off.", -- Examining when it's turned off
            },
        },
    }