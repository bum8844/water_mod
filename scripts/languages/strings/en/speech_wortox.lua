return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "One bucket is enough.", -- Trying to give a bucket when the well already has one.
            WELL_BUSY = "You won't receive a gift if you're greedy.", -- Trying to give a bucket when there's a bucket inside the well.
        }
    },

    ANNOUNCE_DRUNK = "Both the material world and the shadow world are visible!", -- Getting drunk
    ANNOUNCE_DRUNK_END = "The material world is starting to become clear again.", -- Sobering up from alcohol (hangover)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Specific to Wickerbottom.
    ANNOUNCE_NOTCHARGE = "I need to charge up, buddy!", -- Wolfgang can't milk a bucket without enough charge.
    ANNOUNCE_NOTHIRSTSLEEP = "If I sleep like this, I'll turn into an imp snack in the morning.", -- Attempting to sleep when thirsty at night
    ANNOUNCE_NOTHIRSTSIESTA = "I don't want to turn into jerky from thirst during the day.", -- Attempting to siesta when thirsty during the day
    ANNOUNCE_SLEEP_END = "I'm fully back to the material world!", -- Waking up after sleeping and completely sobering up from alcohol
    ANNOUNCE_THIRST = "I might look mortal, but I need a drink!", -- When extremely thirsty
    ANNOUNCE_CAFFINE_BUFF_START = "Whoa, I'm getting all jittery!", -- Starting the caffeine buff
    ANNOUNCE_CAFFINE_BUFF_STOP = "I wonder how much spirit I have left in me?", -- Ending the caffeine buff
    ANNOUNCE_CURE_WATERBORNE = "Whoa, that wasn't too bad at all.", -- Dialogue when curing a waterborne disease with an item
    ANNOUNCE_DCAPACITY_CRITICAL = "The drinks are trying to drag me into the shadow world!", -- About to become drunk
    ANNOUNCE_DCAPACITY_HALF = "Whoa, I'm feeling pretty good!", -- When starting to feel tipsy

    DESCRIBE =
    {
        BOILBOOK = "Is there a manual for boiling water too?",
        WATER_CLEAN_ICE = "It must be tough to drink.", -- Clean ice water
        WATER_DIRTY_ICE = "Eww, it's filthy!", -- Dirty ice water

        SPICE_CAFFEINPEPPER = "Spicy robbery spice.", -- Caffeine pepper spice

        WELL_KIT = "A guide for mortals on how to dig a well.", -- Well kit
        WELL_SPRINKLER_KIT = "I don't like getting sprayed.", -- Sprinkler kit
        WELL_WATERPUMP_KIT = "A well relying on magic, how amusing!", -- Steam water pump kit
        WELL_BURYING_KIT = "A tool for burying past mistakes.", -- Hole burial kit
        WELL_DRILLING = "Creating holes in the world.", -- Drilling holes
        WELL_DRILLING_ITEM = "Let's dig a little!", -- Drill item
        HOLE = "It's quite deep inside!", -- Well hole
        WELL = "I need to find a bucket to lower.", -- Well

        -- Water-mode Plants

        TEA_TREE = "A fragrant and feeble tree.", -- Tea tree
        DUG_TEA_TREE = "I should plant it somewhere quickly.", -- Dug tea tree
        TEA_SEED = "There's something small inside the big one.", -- Tea tree seed
        TEA_SEED_COOKED = "It couldn't handle the heat.", -- Roasted tea tree seed
        TEA_SEED_SAPLING = "It's growing so diligently!", -- Tea tree sapling
        TEALEAVES = "Fragrant-smelling leaves.", -- Tea leaves
        TEALEAVES_DRIED = "They've dried up. Cruelty has its own charm!", -- Dried tea leaves

        CAFFEINBERRY = "It's blue, unlike me.", -- Caffeine berry bush
        DUG_CAFFEINBERRY = "Is there a place to plant this?", -- Dug caffeine berry bush
        CAFFEINBERRY_BEAN = "A lively-smelling bean.", -- Fresh caffeine bean
        CAFFEINBERRY_BEAN_COOKED = "It has an invigorating scent.", -- Roasted caffeine bean

        RUINCACAO_TREE = "A cheerful and eerie tree. How amusing!", -- Cacao tree
        DUG_RUINCACAO_TREE = "Is it okay to plant this near home?", -- Dug cacao tree
        RUINCACAO_SEED = "Is it sprouting?", -- Cacao seed item
        RUINCACAO_SEED_SAPLING = "It's strangely growing!", -- Cacao seedling
        RUINCACAO = "I'm not Krampus, but...", -- Cacao before breaking
        RUINCACAO_BEAN = "It doesn't smell like burning.", -- Crushed cacao bean
        RUINCACAO_BEAN_COOKED = "Strangely, it smells okay.", -- Roasted cacao bean

        -- Distilled Spirits Additives

        ADDITIVE_SEED = "It has a spicy scent.", -- Herbal additives (Anise, Juniper Berry, Palgak Motive) for liqueurs
        ADDITIVE_PETALS = "These are herbs used to make drinks.", -- Herbal, Tea, and Petal additives for liqueurs
        ADDITIVE_NUT = "Mortals can break their teeth on this!", -- Nut additives (Burchi Nut, Coconut, Coffee Bean, Cacao Bean) for liqueurs
        ADDITIVE_DAIRY = "I wonder what mortals made with milk this time?", -- Dairy additives for liqueurs

        -- Drinks

        WATER_CLEAN = "Mortals can't live without this.", -- Clean water
        WATER_DIRTY = "Eww, it's really impure!", -- Dirty water
        WATER_SALTY = "Eww, the more I drink, the thirstier I get!", -- Saltwater

        GOOPYDRINK = "An unpleasant failed experiment.", -- Failed drink (Wet Goop concept)

        -- Teapot Drinks

        FRUITJUICE = "It has everything in it.", -- Mixed fruit juice
        BERRIES_JUICE = "It has the sweet taste mortals like.", -- Berry juice
        POMEGRANATE_JUICE = "Should I drink it even though I have to stay underground?", -- Pomegranate juice
        BANANA_JUICE = "Mortals would like this drink.", -- Banana juice
        FIG_JUICE = "Drinking this will get me kicked out of the farm.", -- Fig juice
        DRAGONJUICE = "Is it dragon-flavored or fly-flavored?", -- Dragonfruit juice
        GLOWBERRYJUICE = "It's nice to shine, but not to drink.", -- Glowberry juice
        WATERMELON_JUICE = "Hmm, I'll pass.", -- Watermelon juice

        VEGGIE_TEA = "I'm fine. It's just the soul that matters.", -- Vegetable juice
        CARROT_TEA = "Drinking carrots won't hurt much.", -- Carrot tea
        CACTUS_TEA = "A beverage with no thorns and a good view.", -- Cactus tea
        TOMATO_JUICE = "Sad tomato. Hehe!", -- Tomato juice
        LUMPY_TEA = "What does root flavor taste like?", -- Root tea
        SEAWEED_SHAKE = "Seaweed again after drying.", -- Seaweed shake

        GREENTEA = "It feels like something's missing.", -- Fresh leaf green tea
        BLACKTEA = "The leaves weren't red.", -- Black tea
        BLACKTEA_ICED = "Oops. It's cold. Hehe!", -- Iced black tea
        FUER = "Just boiled leaves.", -- Fu Cha, Leaf Tea, Goshari Tea
        MIXFLOWER = "A master's flower tea.", -- Mixed flower petal tea
        HIBISCUSTEA = "It feels like a soul. Hehe!", -- Hibiscus tea
        CACTUSFLOWER_TEA = "It was a beautiful flower. Now it's liquid!", -- Cactus flower tea
        LOTUSTEA = "No pink souls, though.", -- Lotus tea
        SUSHIBISCUS = "Sushi, my friend. Want to see what I brought?", -- Seosalt tea
        MOON_BLOSSOM_TEA = "Even the drink glows with moonlight!", -- Moon Blossom tea

        CAFFEINBERRY_JUICE = "It'll give you energy. It doesn't taste great to me.", -- Black coffee
        TOFFEE_LATTE = "I don't really like drinks.", -- Toffee Nut Latte
        RUINCHA_LATTE = "I guess I should try this.", -- Mocha Latte (Coffee + Chocolate)

        HOTRUINCOLATE = "A solution for mortals without fur during winter.", -- Hot Chocolate
        RUINCOLATE_SMOOTHIE = "I prefer cold drinks. Not my taste.", -- Chocolate Smoothie (Chilled)
        RUINXOCOLATL = "Even if you only taste half, it's bitter!", -- Chocolatl (Spicy)
        TEA_RUINCOLATE_LATTE = "I'm not really fond of drinking.", -- Matcha Latte

        MULLED = "Warming imp intestines.", -- Banchou
        BUTTERBEER = "I strangely feel magic.", -- Butterbeer from the Harry Potter series

            -- Collaborative Teapot Drinks

        COCONUT_JUICE = "Drinking something with no taste at all.", -- Shipwrecked Coconut Juice
        RAINBOW_SHAKE = "Just looking at the colors is enough.", -- Shipwrecked Rainbow Jelly Shake
        QUARTZ_SHAKE = "Fish drinking this? I couldn't have imagined it.", -- Shipwrecked Brainy Matter Shake
        CHERRY_ROSEBERRIES_TEA = "It has a shadowy rose scent.", -- Cherry Forest Rosehip Tea
        CHERRY_HONEY_TEA = "It's sweet enough to drink.", -- Cherry Forest Sakura Honey Tea
        SWEET_RICE_DRINK = "They say you should drink and eat it at the same time!", -- Vita Co-op Sikhye
        PINEANANAS_JUICE = "I could be an essence.", -- Legion Pineapple Juice
        ORANGE_JUICE = "I'm satisfied with just looking at the orange color.", -- More Food Pack Orange Juice
        STRAWBERRY_SMOOTHIE = "It's a split red fruit.", -- More Food Pack Strawberry Smoothie
        STRAWBERRY_MILK_SMOOTHIE = "At least it should be smooth.", -- More Food Pack Strawberry Smoothie Latte

        -- Brewery Drinks

        SPOILED_DRINK = "It's really spoiled water!", -- Spoiled Drink

        -- Brewery Soda

        SODA = "Hmm, it's like water attacking me!", -- Soda Water
        FRUITSODA = "It feels like the fruits are screaming!", -- Fruit Soda
        LEMONLIMESODA = "It's a sweet drink with a fruity taste.", -- Lemon Lime Soda (Superior to Fruit Soda)
        COLA = "It's okay for something black!", -- Cola
        COLAQUANTUM = "Hmm, radioactivity is good!", -- Cola Quantum
        LUMPY_BEER = "It looks like it's designed for the police.", -- Root Beer (Not alcohol)

        -- Brewery Spirits

        CORN_BEER = "Where did all the corns go?", -- Corn Beer
        MADHU = "If you drink it, you'll buzz like a bee!", -- Madhu
        WINE = "It tastes like a luxurious mortal.", -- Wine (Berry Brewing)
        NOBLEWINE = "How can red turn into white?", -- Noble Wine (Baked Berry Brewing)
        SPARKLINGWINE = "Hmm, it's full of things that are bad for the body!", -- Sparkling Wine
        GLOWBERRYWINE = "I'm going to drink something strange.", -- Glow Berry Wine
        KUMIS = "Well, it won't be a gift if you drink it, kids.", -- Kumis
        LUMPY_WINE = "I can't trust someone from the underground.", -- Sake (Roots such as potatoes and sweet potatoes)
        PULQUE = "Who would have thought that plants with thorns would be used for drinking?", -- Pulque
        RUINCACAO_WINE = "Oh, now you can make alcohol with beans?", -- Cacao Wine

        -- Collaborative Soda

        CHERRY_DOCTOR_COLA = "It can be a good torture tool. Hohoho!", -- Cherry Forest Doctor Pepper (Doctor Cherry)
        PINEANANASSODA = "I prefer to enjoy being an essence rather than drinking it.", -- Pineapple Soda (Orangina)
        ORANGESODA = "Oranges that can't be turned into juice.", -- Orange Soda (Fanta)
        STRAWBERRYSODA = "Will the seeds explode like a bomb?", -- Strawberry Soda (Welch's Strawberry)

        -- Collaborative Spirits

        AUROBOW = "Will it be a drink that appears after it rains? Hohoho!", -- Shipwrecked Rainbow Jelly Wine
        COCONUT_WINE = "It doesn't taste like anything special.", -- Shipwrecked Coconut Wine
        CHERRY_BLOOM_MADHU = "It's sweet enough to drink.", -- Cherry Blossom Honey Wine
        GIANT_BLUEBERRY_WINE = "It's good enough to drink. It's better as a weapon!", -- Boom Berry Wine (Explodes when ignited)
        RICE_WINE = "Did the rice dissolve in the water?", -- Vita Co-op Makgeolli
        WHEAT_BEER = "I'll drink wheat beer when it's high tide.", -- Heap of Food Wheat Beer
        PALE_BEER = "Will my complexion turn pale?", -- Legion Pale Ale (Beer made with Monster's Fruit)

        -- Distilled Spirits

        DISINFECTANT = "As long as you have a soul, you don't need to disinfect.", -- Disinfectant
        CORN_WHISKEY = "It's just corn liquor.", -- Corn Whiskey
        LUMPY_VODKA = "Imps will have a hard time with this.", -- Vodka
        TEQUILA = "Praise the sun! Hohoho!", -- Tequila
        MADHU_RUM = "They say mortals try to drink poison, you know.", -- Rum
        BERRY_BRANDY = "It has a taste that mortal sophisticates would like. Not me.", -- Berry Brandy
        AREUHI = "I wonder if mortal children drink it and act like adults.", -- Kumis Distilled Areuhi

        -- Warly Exclusive Distilled Spirits

        BERRY_GIN = "They say mortals mix it with other things.", -- Gin
        GLOWBERRY_GIN = "Will your stomach glow?", -- Glow Berry Gin
        ABSINTHE = "It's like me when you remove the color.", -- Absinthe
        TEA_LUMPY_VODKA = "No, no, no.", -- Green Tea Liqueur
        PETALS_BERRY_BRANDY = "I don't fit in with upscale things.", -- Rose Scented Brandy
        KAHLUA = "Balance between sleeping and waking up.", -- Coffee Liqueur Kahlua
        NUT_CORN_WHISKY = "Is there a bolt in it?", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "Hmm, I'm fine.", -- Baileys Cacao Cream Liqueur
        RUMCHATA = "Is this common in mortal society?", -- Rumchata (Rum mixed with Ouatza)

        -- Collaborative Distilled Spirits

        MOONWAY = "I know their thoughts about immortality, but I don't understand.", -- Shipwrecked Rainbow Jelly Distilled Wine
        ARRACK = "It's still a bit plain.", -- Arrack (Indonesian version of Coconut Wine Distilled Spirit)
        CHERRY_BLOOM_RUM = "It's good enough to drink.", -- Cherry Blossom Honey Wine Distilled Spirit with Cherry Blossoms Floating
        RICE_SPIRITS = "It would be fun to hide it in the water.", -- Cheongju
        WHEAT_WHISKEY = "Mortals should mix it with their beverages. Hohoho.", -- Wheat Whiskey
        PALE_WHISKEY = "It's really pale.", -- Pale Malt Whiskey

        -- Warly Exclusive Collaborative Distilled Spirits

        NUT_COCONUT_BRANDY = "Hey, octopus head! Are you looking for something? Could it be this? It looks good!", -- Oi, fishface! Lose something? Eh? Got it!. -- Calypso, Pirates of the Caribbean
        GIANT_BLUEBERRY_GIN = "Hohoho, this should be fun!", -- Boom Berry Sapphire (Explodes when carrots are added)

            -- Pot Recipes

        DARK_RUINCOLATE = "It's the taste of the darkness realm!", -- Dark Chocolate
        WHITE_RUINCOLATE = "It's still smoother than a soul.", -- White Chocolate
        RUINCOLATE = "It's mostly a favorite block.", -- Plain Chocolate
        RUIN_SCHOKAKOLA = "Do mortals try to eat plants they've never seen before?", -- Chocacola

        BUCKET_STEEL_EMPTY =
        {
            EMPTY = "Does it taste like iron from the water?", -- Empty steel bucket
            FULL = "Water for mortals.", -- Clean rainwater is filled
            FULL_ICE = "A world too cold to live even though it looks like water.", -- Rainwater has frozen
            DIRTY = "It's dirty water.", -- Rainwater has become dirty
            DIRTY_ICE = "It seems to have experienced all the turmoil in the world.", -- Dirty rainwater has frozen
        },

        BUCKET_WOODIE_EMPTY =
        {
            EMPTY = "It's almost just a container.", -- Woodie's empty wooden bucket
            FULL = "Water for mortals.", -- Clean rainwater is filled
            FULL_ICE = "A world too cold to live even though it looks like water.", -- Rainwater has frozen
            DIRTY = "It's dirty water.", -- Rainwater has become dirty
            DIRTY_ICE = "It seems to have experienced all the turmoil in the world.", -- Dirty rainwater has frozen
        },

        BUCKET_EMPTY =
        {
            EMPTY = "A bucket to hold water.", -- Empty wooden bucket
            FULL = "Water for mortals.", -- Clean rainwater is filled
            FULL_ICE = "A world too cold to live even though it looks like water.", -- Rainwater has frozen
            DIRTY = "It's dirty water.", -- Rainwater has become dirty
            DIRTY_ICE = "It seems to have experienced all the turmoil in the world.", -- Dirty rainwater has frozen
        },

        DESALINATOR =
        {
            EMPTY = "It wants salty water, unlike mortals.", -- Desalinator has no water
            PURIFY_LONG = "It will take quite some time.", -- Much time left for purification
            PURIFY_SHORT = "It's almost done!", -- Purification is almost finished
            HASWATER = "It seems it's finally done!", -- Desalinator has clean water
            BURNT = "I guess I have to drink salty water again. Hehehe!", -- Desalinator has burned
            HASSALT = "Eek! It smells like salt!", -- Desalinator still has salt
        },

        BARREL =
        {
            GENERIC = "Filled with water instead of souls.", -- Examining a barrel with water
            BURNT = "Did the water burn too?", -- Barrel has burned
        },

        BREWERY =
        {
            EMPTY = "I don't really understand mortal tastes.", -- Examining an empty brewery
            BURNT = "Hehehe, I can't comprehend mortal cooking at all.", -- Brewery has burned
            FERMENTING_LONG = "It will take quite some time.", -- Much time left for fermentation
            FERMENTING_SHORT = "It's almost done!", -- Fermentation is almost finished
            DONE = "I thought I would die waiting!", -- Brewery has a drink in it
        },

        CAMPKETTLE_ITEM = "A way for mortals to survive.", -- Examining a camp kettle item

        CAMPKETTLE =
        {
            GENERIC = "Creating something from nothing is impossible!", -- Examining a camp kettle with no water
            BOILING_LONG = "It will take quite some time.", -- Boiling water has started
            BOILING_SHORT = "I'm really looking forward to this!", -- Water boiling is almost done
            DONE = "Shall I try some water now?", -- Clean water is obtained
            STOP = "Weak, weak, weak!", -- Dirty water isn't boiling because there's no fire
        },

        CAMPDESALINATOR_ITEM = "A simple tool for removing salt.", -- Examining a camp desalinator item

        CAMPDESALINATOR =
        {
            GENERIC = "It wants salty water, unlike mortals.", -- Camp desalinator has no water
            BOILING_LONG = "It will take quite some time.", -- Boiling water has started
            BOILING_SHORT = "I'm almost done!", -- Salt removal is almost done
            DONE = "Now I can drink it!", -- Clean water is obtained
            STOP = "Weak, weak, weak!", -- Salt removal isn't happening because there's no fire
        },

        KETTLE =
        {
            EMPTY = "It's completely empty.", -- Examining an empty kettle
            BURNT = "I can't understand mortal cuisine at all.", -- Kettle has burned
            BOILING_LONG = "It will take quite some time.", -- Cooking a drink has started
            BOILING_SHORT = "I'm really looking forward to this!", -- Drink preparation is almost done
            DONE = "Shall I try some water now?", -- A drink is complete
            PURIFY_LONG = "It will take quite some time.", -- Purifying dirty water has started
            PURIFY_SHORT = "I'm almost done!", -- Dirty water is almost purified
            HASWATER = "I guess I need to boil it again. There are so many requests!", -- Kettle has clean water
            MELT_LONG = "It will take quite some time.", -- Melting ice water has started
            MELT_SHORT = "It's almost melted!", -- Ice water is almost melted
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "Can I boil souls in it?", -- Examining a portable kettle item
            EMPTY = "It's completely empty.", -- Examining an empty placed portable kettle
            BOILING_LONG = "It will take quite some time.", -- Cooking a drink has started
            BOILING_SHORT = "I'm really looking forward to this!", -- Drink preparation is almost done
            DONE = "Shall I try some water now?", -- A drink is complete
            PURIFY_LONG = "It will take quite some time.", -- Purifying dirty water has started
            PURIFY_SHORT = "I'm almost done!", -- Dirty water is almost purified
            HASWATER = "I guess I need to boil it again. There are so many requests!", -- Placed portable kettle has clean water
            MELT_LONG = "It will take quite some time.", -- Melting ice water has started
            MELT_SHORT = "It's almost melted!", -- Ice water is almost melted
        },

        DISTILLERS =
        {
            EMPTY = "Well, shall we drink some spirits?", -- Examining an empty distiller
            DISTILLTING_LONG = "It will take quite some time.", -- Distillation is taking a long time
            DISTILLING_SHORT = "It was too long!", -- Distillation is almost done
            DONE = "I thought my throat would dry out!", -- Distiller has a drink in it
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "It's making quite a noise!", -- Maximum pressure
            MIDDLE_PRESSURE = "The sound has weakened a bit.", -- Medium pressure
            LOW_PRESSURE = "It looks like it's about to turn off.", -- Almost no pressure
            RECHARG_PRESSURE = "I guess I need to recharge it!", -- No pressure (can't use it until pressure is at maximum)
        },

        WELL_SPRINKLER =
        {
            LOWFUEL = "It looks like it needs more fuel.", -- Examining with almost no fuel
            ON = "A fountain show!", -- It's working
            OFF = "It's not working, just resting.", -- Examining when not working
        },
    }
}