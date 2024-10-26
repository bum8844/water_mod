return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "If you were going to do that, you should have added another pulley from the design stage.", 
            WELL_BUSY = "Let's stop, it's just going to block the well.", 
        }
    },

        ANNOUNCE_DRUNK = "Hic, I can't do work anymore...", 

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

        ANNOUNCE_DRUNK_END = "That's better. Let's give it my best shot.", 
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, for Wigfrid only
        ANNOUNCE_NOTCHARGE = "Hmm... when can I milk this goat?",  
        ANNOUNCE_NOTHIRSTSLEEP = "I should drink water before I sleep.", 
        ANNOUNCE_NOTHIRSTSIESTA = "I should drink water before I rest.", 
        ANNOUNCE_SLEEP_END = "Phew, I shouldn't drink so much next time.", 
        ANNOUNCE_THIRST = "I need to drink some water.", 

        ANNOUNCE_CAFFINE_BUFF_START = "On-site repair service activated!", 
        ANNOUNCE_CAFFINE_BUFF_STOP = "I'll have to go back to my workshop now.", 

        ANNOUNCE_CURE_WATERBORNE = "I feel much better now.",

        ANNOUNCE_DCAPACITY_CRITICAL = "It's hard to focus...",
        ANNOUNCE_DCAPACITY_HALF = "Hmm, I should start moderating myself now.",

        DESCRIBE =
        {
            BOILBOOK = "It's full of recipes for making drinks and alcohol.",

            WATER_CLEAN_ICE = "Should I chew on this?", 
            WATER_DIRTY_ICE = "Ice mixed with dust.", 

            SPICE_CAFFEINPEPPER = "It would be perfect if I had some meat to go with it...",

            WELL_KIT = "Let's give it a try.", 
            WELL_SPRINKLER_KIT = "Well-made and quite intricate.", 
            WELL_WATERPUMP_KIT = "Batteries couldn't handle the energy consumption.",
            WELL_BURYING_KIT = "It wouldn't be safe to leave the hole in the ground unattended.", 
            WELL_DRILLING = "I should be careful not to get hit by flying rocks.",
            WELL_DRILLING_ITEM = "Make sure to secure it firmly to the ground before operating, and follow safety rules!",
            HOLE = "Hole linked to underground water.", 
            WELL = "Hmm, I wonder if there's a way to automate this...",

            WX78MODULE_NONEDRUNK = "They've really gotta start takin' better care of themselves.", 

            -- Water mode plants

            TEA_TREE = "This tree is small and pretty.", 
            DUG_TEA_TREE = "I don't mind getting my hands dirty.", 
            TEA_SEED = "Everything you need to build a tree.", 
            TEA_SEED_COOKED = "Looks edible. One way to find out!", 
            TEA_SEED_SAPLING = "This tree is still building.", 
            TEALEAVES = "Nice smell for a leaf.", 
            TEALEAVES_DRIED = "Let's prepare some hot water.", 

            CAFFEINBERRY = "On my, There are coffee beans here!", 
            DUG_CAFFEINBERRY = "I should replant this, if I had my own land. Ha!",
            CAFFEINBERRY_BEAN = "Need to throw it in fire first.", 
            CAFFEINBERRY_BEAN_COOKED = "I love the smell of coffee in the morning", 

            RUINCACAO_TREE = "Uh-oh, Looks like the blueprints for its branches were a bit off.", 
            DUG_RUINCACAO_TREE = "The more I look, the stranger this tree looks.", 
            RUINCACAO_SEED = "Did it have flowers even inside the fruit?", 
            RUINCACAO_SEED_SAPLING = "It's a bit eerie now that I think about it.", 
            RUINCACAO = "So, is this charcoal or a fruit?", 
            RUINCACAO_BEAN = "It doesn't look like something edible oil.", 
            RUINCACAO_BEAN_COOKED = "It's chewable enough.", 

            -- Distillery additives

            ADDITIVE_SEED = "Gathered some strange seeds.",
            ADDITIVE_PETALS = "Bunches of leaves and petals.", 
            ADDITIVE_NUT = "Weren't you collecting these for snacking?", 
            ADDITIVE_DAIRY = "It's milk cream.",

            -- Drinks

            WATER_CLEAN = "So clean.", 
            WATER_DIRTY = "Even in a rush, don't drink stagnant water.", 
            WATER_SALTY = "Drinking seawater is suicidal.",

            GOOPYDRINK = "Yuck.", 

            -- Teapot drinks

            FRUITJUICE = "Everything it in.", 
            BERRIES_JUICE = "At least I won't get juice on my hands.", 
            POMEGRANATE_JUICE = "Finally I can clean to eat that fruit.",  
            BANANA_JUICE = "Um... I didn't want hot banana tea.", 
            FIG_JUICE = "The texture is unique.", 
            DRAGONJUICE = "What a premi-um juice.", 
            GLOWBERRYJUICE = "Looks like the chemicals inside a glow stick.", 
            WATERMELON_JUICE = "Refreshing.",

            VEGGIE_TEA = "This should help me regain some energy.",
            CARROT_TEA = "Perfect, my eyes were strained anyway.", 
            CACTUS_TEA = "Even with thorns, it's turned mushy.", 
            TOMATO_JUICE = "I wouldn't have sought it out, but it's not bad.", 
            LUMPY_TEA = "Not bad as I thought.", 
            SEAWEED_SHAKE = "Um.. Seems like it's good for constipation.",  

            GREENTEA = "It has a subtle aroma.",
            BLACKTEA = "I prefer coffee, but I'll drink this if there's nothing else.", 
            BLACKTEA_ICED = "I should drink it after breaking a sweat.",
            FUER = "Surprisingly, the aroma is not bad.",
            MIXFLOWER = "It seems to match the refined taste of a lady.",
            HIBISCUSTEA = "No fruits in sight, yet it's tangy and sweet.", 
            CACTUSFLOWER_TEA = "It seems like a trend to make tea from flowers.",
            LOTUSTEA = "It's quite exotic.", 
            SUSHIBISCUS = "What the heck is this tea?", 
            MOON_BLOSSOM_TEA = "Phew! This really wakes me up.", 

            CAFFEINBERRY_JUICE = "I used to rely on this a lot during late-night work.", 
            TOFFEE_LATTE = "I prefer my coffee without sugar.", 
            RUINCHA_LATTE = "Coffee and chocolate, and both.", 

            HOTRUINCOLATE = "It's warm.",
            RUINCOLATE_SMOOTHIE = "I've seen these in stores, but I've never bought one.",
            RUINXOCOLATL = "That flavor is as intense as exhaust fumes.",  
            TEA_RUINCOLATE_LATTE = "This is confusing. Is it milk tea or a chocolate smoothie?", 

            MULLED = "Perfect timing, my throat was feeling scratchy.",  
            BUTTERBEER = "Any sufficiently advanced technology is indistinguishable from magic.", 

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "Sweet and refreshing.", 
            RAINBOW_SHAKE = "Let's try drinking a rainbow.", 
            QUARTZ_SHAKE = "This should be good enough.", 
            CHERRY_ROSEBERRIES_TEA = "The tartness makes it even better.",
            CHERRY_HONEY_TEA = "I need to drink this to clear the dust from my throat.", 
            SWEET_RICE_DRINK = "Hmm, it's quite sweet.",
            ANANAS_JUICE = "Definitely better than the juice in canned goods.",  
            ORANGE_JUICE = "I've never seen a day when this isn't in the break room fridge.", 
            STRAWBERRY_SMOOTHIE = "Seems to be to the taste of the female workers. Oh, I'm a female worker too. Hm!", 
            STRAWBERRY_MILK_SMOOTHIE = "Tastes like a teahouse dessert drink, but it's delicious.", 

            -- Distillery Teapot Drinks

            SPOILED_DRINK = "Not even suitable for industrial use.",

            -- Distillery Sodas

            SODA = "Plain sparkling water.",
            FRUITSODA = "I never drank this because I never went to parties.", 
            LEMONLIMESODA = "Feels like it will rot my teeth.", 
            COLA = "Every time I go to drink it, someone has already finished it.",  
            COLAQUANTUM = "Whoa, is it safe to drink this?", 
            LUMPY_BEER = "It tastes better than cola, but no one's on my side.", 

            -- Distillery Spirits

            CORN_BEER = "Just right after work!", 
            MADHU = "I think Wig would like this.",
            WINE = "No time to savor the aroma, I have a mountain of work to do.", 
            NOBLEWINE = "Such fine things are far from me.",
            SPARKLINGWINE = "I have to shake it in front of Max.", 
            GLOWBERRYWINE = "The romance of homemade brewing.",
            KUMIS = "I've never seen alcohol made with milk before.", 
            LUMPY_WINE = "It has quite a refreshing taste.", 
            PULQUE = "I didn't know alcohol could be made from cactus.", 
            RUINCACAO_WINE = "If wine can be made from cacao, then it's possible.", 

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "This is not coke.", 
            ANANASSODA = "It tastes like store-bought pineapple soda.",
            ORANGESODA = "It tastes like store-bought orange soda.",
            STRAWBERRYSODA = "I'm not surprised that there's strawberry-flavored soda.",

            -- Collaboration Spirits

            AUROBOW = "Though the ingredients are somewhat questionable, but it's rainbow.", 
            COCONUT_WINE = "It's a palm fruit Wine.", 
            CHERRY_BLOOM_MADHU = "Now I can't call it glue anymore.", 
            GIANT_BLUEBERRY_WINE = "There's no reason you can't make wine from blueberries.", 
            RICE_WINE = "This alcohol is a bit cloudy.", 
            WHEAT_BEER = "I should have a drink after work.", 
            PALE_BEER = "Drinking a little won't kill me, right?", 

            -- Distilled Spirits

            DISINFECTANT = "For emergency treatment.", 
            CORN_WHISKEY = "I prefer drinking in abundance rather than sipping.",
            LUMPY_VODKA = "I should keep this until the weather gets colder.",
            TEQUILA = "The aroma is quite bold!",
            MADHU_RUM = "The era of sailors mixing rum with water is gone.",  
            BERRY_BRANDY = "I don't often get the chance to drink expensive spirits like this.", 
            AREUHI = "I've never seen this liquor before.", 

            -- Walani Exclusive Distilled Spirits

            BERRY_GIN = "I know a few friends who ruined their lives because of this.", 
            GLOWBERRY_GIN = "How long will it shine, since energy isn't infinite?",
            ABSINTHE = "At least we're not mixing it with copper sulfate!", 
            TEA_LUMPY_VODKA = "Is it different from absinthe?",
            PETALS_BERRY_BRANDY = "Seems quite luxurious.", 
            KAHLUA = "I should drink alcohol and coffee separately.", 
            NUT_CORN_WHISKEY = "The scent is as robust as lead.", 
            RUINCACAO_CREAM_LIQUEUR = "There's a sweet liqueur like this too, huh!", 
            RUMCHATA = "Milk for fully grown adults, huh!", 

            -- Collaboration Distilled Spirits

            MOONWAY = "Looks high in calories, could it be used as fuel?", 
            ARRACK = "Smells like palm sap.", 
            CHERRY_BLOOM_RUM = "Looks like an airport souvenir." , 
            RICE_SPIRITS = "It's pretty clear now!", 
            WHEAT_WHISKEY = "No drinking alcohol while working.",
            PALE_WHISKEY = "I've never seen a distilled spirit of this color before.", 

            -- Walani Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "It has a quite sweet scent.", 
            GIANT_BLUEBERRY_GIN = "Isn't this more suited for industrial use rather than edible?", 

            -- Cooked Dishes

            DARK_RUINCOLATE = "My friend prepared snacks for me while I'm working.", 
            WHITE_RUINCOLATE = "Oh, Warly, you know I don't like sweet things.", 
            RUINCOLATE = "Easy to melt, so I don't eat it often.", 
            RUIN_SCHOKAKOLA = "Perfect, doesn't melt, has a case, and gives me energy while working!", 

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Well made and sturdy.",  
                FULL = "Rainwater has collected.", 
                FULL_ICE = "Looks like it’ll be hard to take out.", 
                DIRTY = "Seems like it was used to wash a mop.", 
                DIRTY_ICE = "Seems it was neglected after winter cleaning.",  
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "I'm doubtful about its durability.", 
                FULL = "Rainwater has collected.", 
                FULL_ICE = "Looks like it’ll be hard to take out.", 
                DIRTY = "Seems like it was used to wash a mop.", 
                DIRTY_ICE = "Seems it was neglected after winter cleaning.",  
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Whoa, This thing definitely wouldn't pass the hygiene safety standards.", 
                FULL = "Rainwater has collected.", 
                FULL_ICE = "Looks like it’ll be hard to take out.", 
                DIRTY = "Seems like it was used to wash a mop.", 
                DIRTY_ICE = "Seems it was neglected after winter cleaning.",  
            },

            BUCKET_EMPTY =
            {
                EMPTY = "What should I put in it?", 
                FULL = "Rainwater has collected.", 
                FULL_ICE = "Looks like it’ll be hard to take out.", 
                DIRTY = "Seems like it was used to wash a mop.", 
                DIRTY_ICE = "Seems it was neglected after winter cleaning.",  
            },

            DESALINATOR =
            {
                EMPTY = "I had a hard time coming up with this.", 
                PURIFY_LONG = "Let's see... the salinity is still quite high.", 
                PURIFY_SHORT = "Let's see... the salinity isn't too high.", 
                HASWATER = "I can guarantee inside is not seawater.", 
                BURNT = "This is getting on my nerves", 
                HASSALT = "I need to remove salt from the filter box.", 
            },

            BARREL =
            {
                GENERIC = "Woody and I put our heads together to ensure the water doesn't go bad.",
                BURNT = "It's ok, let's make another one.", 
            },

            BREWERY =
            {
                EMPTY = "That used some pretty expensive wood, I must say!", 
                BURNT = "No matter what, I have to get angry about this.", 
                FERMENTING_LONG = "I heard that fermentation takes a long time.", 
                FERMENTING_SHORT = "Is it almost done?", 
                DONE = "Let's have a taste.", 
            },

            CAMPKETTLE_ITEM = "It's a bit heavier than the factory-made ones.", 
            CAMPKETTLE =
            {
                GENERIC = "I need to get some water for it.", 
                BOILING_LONG = "It's still around 68°F.", 
                BOILING_SHORT = "It's boiling at 192.2°F.",
                DONE = "It looks enough, but I need to check.", 
                STOP = "Whoa, it's probably not ready to drink yet.", 
            },

            CAMPDESALINATOR_ITEM = "It's quite heavy to be called 'portable.'",  
            CAMPDESALINATOR =
            {
                GENERIC = "An empty canister.", 
                BOILING_LONG = "The seawater level is still high.", 
                BOILING_SHORT = "The freshwater level is higher now.",
                DONE = "Freshwater has collected!",
                STOP = "It needs fuel.", 
            },

            KETTLE =
            {
                EMPTY = "I'm about to make a cup of coffee in style.",
                BURNT = "Did I overdo it?",
                BOILING_LONG = "It still needs more time.", 
                BOILING_SHORT = "It's almost done.", 
                DONE = "Break time!", 
                PURIFY_LONG = "It's still around 68°F.", 
                PURIFY_SHORT = "It's boiling at 192.2°F.",
                HASWATER = "Let's see, it'd be nice if there's coffee.",
                MELT_LONG = "It's still frozen solid.", 
                MELT_SHORT = "The ice is almost gone.", 
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "In terms of quality, it doesn't lag behind the factory-made teapots.", 
                EMPTY = "Not a drop of water in it.",
                BOILING_LONG = "Good things take time, after all.",
                BOILING_SHORT = "It'll be done in the blink of an eye!", 
                DONE = "Break time!", 
                PURIFY_LONG = "It's still lukewarm.", 
                PURIFY_SHORT = "I can hear the bubbles.",
                HASWATER = "Now I need to add ingredients.", 
                MELT_LONG = "It's all frozen solid.", 
                MELT_SHORT = "The ice is almost melted away.", --
            },

            DISTILLERS =
            {
                EMPTY = "Designed to withstand heat and pressure.", 
                DISTILLTING_LONG = "The timer has barely moved.", 
                DISTILLING_SHORT = "It won't be long now.", 
                DONE = "Let's have a taste.", 
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Drawing water with an approximate pressure of 123 psi.",
                MIDDLE_PRESSURE = "Drawing water with an approximate pressure of 81 psi.", 
                LOW_PRESSURE = "Drawing water with an approximate pressure of 47 psi.", 
                RECHARG_PRESSURE = "At this pressure, it'll take an incredibly long time to draw water.", 
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "It needs refueling.", 
                ON = "Don't get too close with my equipment.", 
                OFF = "Some parts work 'magically'.", 
            },
        },
    }