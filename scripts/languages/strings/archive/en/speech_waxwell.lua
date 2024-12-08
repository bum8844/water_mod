return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "I should remove the bucket from the well first.", -- 
            WELL_BUSY = "You're trying to drink directly from the well.", -- 
        }
    },

        ANNOUNCE_DRUNK = "Ugh, I feel a bit drunk.", -- 

        ANNOUNCE_DRUNKING =
        {
            "Huff... Pant...",
            "I should have built... a lifting machine...",
            "Lift... with your back...",
            "This isn't... gentleman's work...",
            "For... science... oof!",
            "Is this... messing up my hair?",
            "Hngh...!",
            "Pant... Pant...",
            "This is the worst... experiment...",
        },

        ANNOUNCE_DRUNK_END = "Things are looking up.", -- 
        ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wathgrithr", -- 
        ANNOUNCE_NOTCHARGE = "This one's useless.", -- 
        ANNOUNCE_NOTHIRSTSLEEP = "I'm too thirsty to sleep right now.", -- 
        ANNOUNCE_NOTHIRSTSIESTA = "I'm too thirsty to rest during the day.", -- 
        ANNOUNCE_SLEEP_END = "I feel like I just woke up from a nightmare." , -- 
        ANNOUNCE_THIRST = "I'm thirsty.", -- 

        ANNOUNCE_CAFFINE_BUFF_START = "It's getting me hyped up!", -- 
        ANNOUNCE_CAFFINE_BUFF_STOP = "The show is over.", -- 

        ANNOUNCE_CURE_WATERBORNE = "I'm feeling a bit better now.", --

        ANNOUNCE_DCAPACITY_CRITICAL = "I'm getting really tipsy.", 
        ANNOUNCE_DCAPACITY_HALF = "It's feeling warm and fuzzy.", 

        DESCRIBE =
        {
            BOILBOOK = "Making alcohol can't be that hard, can it?",

            WATER_CLEAN_ICE = "My teeth feel chilled.", -- 
            WATER_DIRTY_ICE = "It's frozen trash.", -- 

            SPICE_CAFFEINPEPPER = "It adds value wherever you sprinkle it.", --- 

            WELL_KIT = "Do I have to carry this with my own hands?", --- 
            WELL_SPRINKLER_KIT = "It's a hybrid of machine and magic.", --- 
            WELL_WATERPUMP_KIT = "Should I have thought about something like that too?", --- 
            WELL_BURYING_KIT = "Why did you perform unnecessary work?", --- 
            WELL_DRILLING = "It's convenient that it operates on its own.", --- 
            WELL_DRILLING_ITEM = "Looks quite rugged.", -- 
            HOLE = "I might not be able to catch bones if I fall in.", 
            WELL = "I'm dying of thirst next to this well.", 

            WX78MODULE_NONEDRUNK = "That robot really needs to control itself.", --- 

            -- Water Mode Plants

            TEA_TREE = "Though small, it boasts one lush leaf.", --- 
            DUG_TEA_TREE = "Do you think I'm supposed to be a gardener?", ---- 
            TEA_SEED = "Someone who knows how to grow trees might find this useful.", 
            TEA_SEED_COOKED = "I can't believe I have to eat something like this.", 
            TEA_SEED_SAPLING = "Huh, it seems I had to go to the ground.", ---- 
            TEALEAVES = "I should dry them before using.", 
            TEALEAVES_DRIED = "I'm longing for a cup of tea.", 

            CAFFEINBERRY = "A coffee bush influenced by the moon.", 
            DUG_CAFFEINBERRY = "It's worth replanting.", -- 
            CAFFEINBERRY_BEAN = "Looks different from the coffee beans I know.", --
            CAFFEINBERRY_BEAN_COOKED = "Now all I need to do is find a French press somewhere.", ---- 

            RUINCACAO_TREE = "Definitely influenced by dark magic.", 
            DUG_RUINCACAO_TREE = "Someone who knows how to grow trees might find this useful.", 
            RUINCACAO_SEED = "It seems to have bloomed.", 
            RUINCACAO_SEED_SAPLING = "I guess it won't plant itself.", 
            RUINCACAO = "I wouldn't punch that just to eat this.", ---- 
            RUINCACAO_BEAN = "What a vulgar greaseball.", ---- 
            RUINCACAO_BEAN_COOKED = "Better than raw, but there must be other ways.", -- 

            -- Distilled Spirit Additives

            ADDITIVE_SEED = "It looks like he's trying to make gin or something.",  ---- 
            ADDITIVE_PETALS = "Does alcohol really need this?", --
            ADDITIVE_NUT = "Do young people really put this in their drinks?", --
            ADDITIVE_DAIRY = "I respect your taste, but...", -- 

            -- Beverages

            WATER_CLEAN = "It's a world where even a sip of clean water is precious.", ---- 
            WATER_DIRTY = "Hey, my water isn't looking so good.", -- 
            WATER_SALTY = "I shouldn't drink this.", --

            GOOPYDRINK = "How uncultured.", ---- 

            -- Teapot Beverages

            FRUITJUICE = "It's mixed up, but it tastes good.", -- 
            BERRIES_JUICE = "Well, it's not bad.", -- 
            POMEGRANATE_JUICE = "At least it looks the part.", -- 
            BANANA_JUICE = "Was there no better way to do this?", --
            FIG_JUICE = "Quite sweet.", 
            DRAGONJUICE = "It has an intense sweetness.", -- 
            GLOWBERRYJUICE = "Well used the juices of fruits.", -- 
            WATERMELON_JUICE = "The water is so abundant that only a hint of the watermelon scent is noticeable.", ---- 

            VEGGIE_TEA = "It's time to take care of my health.", -- 
            CARROT_TEA = "I have no choice but to sip it.", -- 
            CACTUS_TEA = "I have a small oasis in my hand.", -- 
            TOMATO_JUICE = "Smooth and easy to drink.", -- 
            LUMPY_TEA = "This way, it looks somewhat dignified.", --
            SEAWEED_SHAKE = "Please, no...", -- 

            GREENTEA = "It too has a petrichor.", -- 
            BLACKTEA = "Who knew a cup of tea could be so welcome?", --- 
            BLACKTEA_ICED = "So refreshing.", --- 
            FUER = "Quite exotic.", -- 
            MIXFLOWER = "It has a slightly odd aftertaste.", -- 
            HIBISCUSTEA = "Beautiful without compare.", -- 
            CACTUSFLOWER_TEA = "It doesn't disappoint.", -- 
            LOTUSTEA = "Could this be what I'm thinking of?", -- 
            SUSHIBISCUS = "The essence of darkness.", -- 
            MOON_BLOSSOM_TEA = "It won't transform me, will it?", -- 

            CAFFEINBERRY_JUICE = "I'm looking forward to the taste.", --
            TOFFEE_LATTE = "Did they melt scotch candies for this?", -- 
            RUINCHA_LATTE = "They don't even know what real mocha is.", --- 

            HOTRUINCOLATE = "This is something I couldn't even dream of when I first came to this world.", --- 
            RUINCOLATE_SMOOTHIE = "I'm worried about my teeth if I drink this.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "I can feel a spiritual sense.", -- Chocolatl (spiciness)
            TEA_RUINCOLATE_LATTE = "Do young people really drink this?", -- Matcha latte

            MULLED = "I can enjoy some leisure even if the weather is bitterly cold.", -- Bangcho
            BUTTERBEER = "My soul will stick back together, even if it's torn apart.", -- Butterbeer from the Harry Potter series

            -- Collaborative Teapot Drinks

            COCONUT_JUICE = "Drink some water and fill my stomach a bit!", 
            RAINBOW_SHAKE = "Seems like junk food for kids.", --
            QUARTZ_SHAKE = "If only there were lemons or limes...", -- 
            CHERRY_ROSEBERRIES_TEA = "So, where are the biscuits?", -- 
            CHERRY_HONEY_TEA = "It would be better with ginger and lemon...", -- 
            SWEET_RICE_DRINK = "The texture is mushy.", --- 
            APPLEPINE_JUICE = "I can't drink this tangy fruit juice in one go.", 
            CITROYUZU_JUICE = "I never noticed this in the break room before coming here.", 
            STRAWBERRY_SMOOTHIE = "Seems like a street vendor drink.", 
            STRAWBERRY_MILK_SMOOTHIE = "It's not to my taste.", 

            -- Distilled Spirit Drinks

            SPOILED_DRINK = "It was a drink before I spoiled it.", 

            -- Distillery Soda

            SODA = "I never even thought about trying this.", 
            FRUITSODA = "Should I perform in front of the punch bowl?", 
            LIMONSODA = "This is going to wreck my teeth.",
            COLA = "I wish it had a straw.", 
            COLAQUANTUM = "Suspicious but spectacular.",
            LUMPY_BEER = "How did it recreate the taste?", --- 

            -- Brewery Drinks

            CORN_BEER = "Well..Isn't this just base alcohol made from corn?",  --- 
            MADHU = "I hope they didn't make this in the Viking tradition.", 
            WINE = "Even if this were made from wild berries, I would have to drink it gratefully.", --- 
            NOBLEWINE = "Life has become quite prosperous, huh.", -- 
            SPARKLINGWINE = "I miss champagne.", 
            GLOWBERRYWINE = "It could make big money selling this outside.", --- 
            KUMIS = "Quite wild.", 
            LUMPY_WINE = "It's cleaner tasting than I expected.", ---- 
            PULQUE = "It doesn't suit my taste.", 
            RUINCACAO_WINE = "It's a rare wine you won't find outside.", 

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "It's a shame there's no real doctor here.", 
            APPLEPINESODA = "I feel closer to civilization now.", 
            CITROYUZUSODA = "This soda is overly carbonated.", --
            STRAWBERRYSODA = "This soda is overly carbonated.", --

            -- Collaboration Brewery Drinks

            AUROBOW = "Quite bizarre and absurd idea.", -- 
            COCONUT_WINE = "I should have some crab with this.", -- 
            CHERRY_BLOOM_MADHU = "I hope it won't be difficult to wash this out of my clothes.", -- 
            GIANT_BLUEBERRY_WINE = "Let's behave like cultured individuals.", -- 
            RICE_WINE = "It has a tangy taste.", -- 
            WHEAT_BEER = "Well..I wonder where you got the hops?", ---- 
            PALE_BEER = "Well... I think that's not hops.", ---- 

            -- Distilled Drinks

            DISINFECTANT = "Have you tried cutting magic? You might need this.",
            CORN_WHISKEY = "Ah, Finally.",  ---- 
            LUMPY_VODKA = "Unfortunately, now I'm just a laborer.",
            TEQUILA = "Feels like a rustic performance.",
            MADHU_RUM = "It's quite rough.", -- 
            BERRY_BRANDY = "Fits my sophistication.", 
            AREUHI = "It has a strange smell.", --

            -- Warly Exclusive Distilled Drinks

            BERRY_GIN = "It's not such a low-class drink after all.", 
            GLOWBERRY_GIN = "I should apologize to her.", 
            ABSINTHE = "Ah, it's like the depths of my life!", 
            TEA_LUMPY_VODKA = "Hmm, it's subtle.", 
            PETALS_BERRY_BRANDY = "A bit excessive.", 
            KAHLUA = "It's not that bad.", 
            NUT_CORN_WHISKEY = "I have a craving for smoked meat.", 
            RUINCACAO_CREAM_LIQUEUR = "These young folks...", 
            RUMCHATA = "What kind of drink is this??", 

            -- Collaboration Distilled Drinks

            MOONWAY = "How did they make this?", 
            ARRACK = "That was versatile fruit, alright.", ---- 
            CHERRY_BLOOM_RUM = "Extravagant, isn't it?", 
            RICE_SPIRITS = "Quite clean.", 
            WHEAT_WHISKEY = "Perfect.", 
            PALE_WHISKEY = "To be honest, it's not bad.", 

            -- Warly Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "So tell me... What's become of my ship?", 
            GIANT_BLUEBERRY_GIN = "It's captured the essence of destruction.", 

            -- Pot Cooking

            DARK_RUINCOLATE = "It seems my chef friend was also interested in dark magic, right?", ---- 
            WHITE_RUINCOLATE = "I'll pass.", 
            RUINCOLATE = "A bait to lure in little guests.", 
            RUIN_SCHOKAKOLA = "A concentrated form of efficiency.", 

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "It's just an empty can.", ---- 
                FULL = "To think that I've come to the point where I have to collect rainwater to drink.",---- 
                FULL_ICE = "Do I need to get that out?", -- 
                DIRTY = "It's disgusting.", -- 
                DIRTY_ICE = "I don't even want to look at it.", --
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "It looks like wild and natural.", ---- 
                FULL = "To think that I've come to the point where I have to collect rainwater to drink.",---- 
                FULL_ICE = "Do I need to get that out?", -- 
                DIRTY = "It's disgusting.", -- 
                DIRTY_ICE = "I don't even want to look at it.", --
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Hey, Didn't you make the bucket too carelessly?", -- 
                FULL = "To think that I've come to the point where I have to collect rainwater to drink.",---- 
                FULL_ICE = "Do I need to get that out?", --
                DIRTY = "It's disgusting.", --
                DIRTY_ICE = "I don't even want to look at it.", -- 
            },

            BUCKET_EMPTY =
            {
                EMPTY = "I'd rather not dirty my hands.", -- 
                FULL = "To think that I've come to the point where I have to collect rainwater to drink.",---- 
                FULL_ICE = "Do I need to get that out?", --
                DIRTY = "It's disgusting.", --
                DIRTY_ICE = "I don't even want to look at it.", -- 
            },

            DESALINATOR =
            {
                EMPTY = "That's quite an idea.", -- 
                PURIFY_LONG = "It's going to take a while.", 
                PURIFY_SHORT = "It's almost done!", 
                HASWATER = "It looks like it's all done.", 
                BURNT = "It's useless now.", 
                HASSALT = "There's no point in doing it now.", ---- 
            },

            BARREL =
            {
                GENERIC = "It's a barrel.", --
                BURNT =  "You're using fire as if it were water", ---- 
            },

            BREWERY =
            {
                EMPTY = "It has a strong scent of oak.", -- 
                BURNT = "Ah, how smoky the aroma is.", -- 
                FERMENTING_LONG = "It's going to take a while.", -- 
                FERMENTING_SHORT = "It's almost done!", -- 
                DONE = "I wonder if it's drinkable.", -- 
            },

            CAMPKETTLE_ITEM = "Sigh, woe is me..", ---- 
            CAMPKETTLE =
            {
                GENERIC = "So, do I have to go find water to put in this?",
                BOILING_LONG = "It's still cold.",
                BOILING_SHORT = "This temperature is just perfect for burning your hand right now.", ---- 
                DONE = "To think that I've come to the point where I have to boil pond water to drink.", ---- 
                STOP = "It's not quite boiled.", --
            },

            CAMPDESALINATOR_ITEM = "It looks quite heavy.", --
            CAMPDESALINATOR =
            {
                GENERIC = "So, am I supposed to walk over and fetch seawater with my feet?", -- 
                BOILING_LONG = "How long do I have to wait?", --
                BOILING_SHORT = "It seems almost done.", -- 
                DONE = "It looks like it's all done.", -- 
                STOP = "It's not quite boiled.", -- T
            },

            KETTLE =
            {
                EMPTY = "It looks lonely.", -- 
                BURNT = "I'm not really into over-extraction.", ---- 
                BOILING_LONG = "Let's be patient...", 
                BOILING_SHORT = "It's almost done!", 
                DONE = "Now I can finally drink something decent.", 
                PURIFY_LONG = "It's not going to taste good.", 
                PURIFY_SHORT = "This temperature is just perfect for burning your hand right now.",  ---- 
                HASWATER = "I wish I could have a cup of tea.", 
                MELT_LONG = "It's still cold.", 
                MELT_SHORT = "It's lukewarm.", 
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "I don't even have the leisure to sit down and have tea.",
                EMPTY = "It's empty.",
                BOILING_LONG = "I need to be patient.", 
                BOILING_SHORT = "It'll be done soon.",
                DONE = "I can have a brief moment to drink tea.",
                PURIFY_LONG = "It's not going to taste good.", 
                PURIFY_SHORT = "This temperature is just perfect for burning your hand right now.",  ---- 
                HASWATER = "I wish I could have a cup of tea.", 
                MELT_LONG = "It's still cold.", 
                MELT_SHORT = "It's lukewarm.", 
            },

            DISTILLERS =
            {
                EMPTY = "It looks like a sturdy and sophisticated cauldron.", ---- 
                DISTILLTING_LONG = "Let's leave the distiller working.", -- 
                DISTILLING_SHORT = "It seems almost done.",
                DONE = "Now I'll try some real liquor.", 
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Hey, isn't this a bit too loud?", 
                MIDDLE_PRESSURE = "It's nice not to have to work with my hands.", 
                LOW_PRESSURE = "Is this thing working properly?", 
                RECHARG_PRESSURE = "I suppose I'll have to draw water by hand. sigh", ---- 
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "A friend who knows how to handle machines will take care of it, I guess.", ---- 
                ON = "If I get closer, my suit will be soaked.", -- It's on
                OFF = "It's turned off.", -- Examining when it's turned off
            },
        },
    }