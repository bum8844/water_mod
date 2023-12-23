return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "You need to empty the bucket first.", -- The well has a dry empty bucket, but you tried to give the bucket
            WELL_BUSY = "Did I forget that I put water in the well?", -- The well has a bucket filled with water, but you tried to give the bucket
        }
    },

    ANNOUNCE_DRUNK = "Oh, I feel so dizzy!", -- Drunk
    ANNOUNCE_DRUNK_END = "No more time to waste!", -- Sobered up from alcohol (hangover)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, reserved for Wigfrid,
    ANNOUNCE_NOTCHARGE = "I don't have any milk on me right now.", -- Time phase = (時相)
    ANNOUNCE_NOTHIRSTSLEEP = "I should find something to drink first.", -- Trying to sleep at night while being thirsty
    ANNOUNCE_NOTHIRSTSIESTA = "I should find something to drink first.", -- Trying to nap during the day while being thirsty
    ANNOUNCE_SLEEP_END = "Oh my, which time phase am I in now?", -- Waking up completely sober after sleeping
    ANNOUNCE_THIRST = "I wonder how long it's been since I had a drink?", -- Too thirsty!

    ANNOUNCE_CAFFINE_BUFF_START = "Excellent, I feel like I can chase time!" , -- Caffeine buff starts
    ANNOUNCE_CAFFINE_BUFF_STOP = "Darn it! Time is speeding up again!" ,  -- Caffeine buff ends
    
    ANNOUNCE_CURE_WATERBORNE = "I finally fixed the pocket watch." ,  -- Dialogue when curing a waterborne disease with an item

    ANNOUNCE_DCAPACITY_CRITICAL = "Time is accelerating!", -- Just before getting drunk (Time stream = flow of time)
    ANNOUNCE_DCAPACITY_HALF = "I'm starting to feel more composed as the intoxication wears off.", -- Intoxication is starting to wear off

    DESCRIBE =
    {
        BOILBOOK = "Who has time to think about tea when there's water to boil?",

        WATER_CLEAN_ICE = "When would anyone thaw and drink this?", -- Clean ice water
        WATER_DIRTY_ICE = "I'd rather get fresh ice for my drink.", -- Dirty ice water

        SPICE_CAFFEINPEPPER = "I wish I had time to marinate.", -- Caffeine pepper spice

        WELL_KIT = "Just having it in my hand won't make the water flow, I need to install it!", -- Well Kit
        WELL_SPRINKLER_KIT = "It won't take more than a second to set up this precise installation.", -- Sprinkler Kit
        WELL_WATERPUMP_KIT = "I can get groundwater without wasting time.", -- Steam Water Pump Kit
        WELL_BURYING_KIT = "Oh my, what a time-consuming task.", -- Hole Burying Kit
        WELL_DRILLING = "It'll do it by itself; let's save my time.", -- Drilling the hole
        WELL_DRILLING_ITEM = "I should decide where to dig for groundwater first.", -- Drilling item
        HOLE = "It takes ages to climb out once you fall in.", -- Well hole
        WELL = "Watching it won't make the water magically appear; I need a tool!", -- Well

        -- Waterlogged Plant Mode

        TEA_TREE = "This tree has reached its growth limit.", -- Tea tree
        DUG_TEA_TREE = "No time to waste; I'll just take it all!", -- Dug-up tea tree
        TEA_SEED = "It'll grow into a new tree when the time is right.", -- Tea tree seed
        TEA_SEED_COOKED = "It either gets eaten or rots; there's no in-between future for this.", -- Roasted tea tree seed
        TEA_SEED_SAPLING = "This little guy seems to be intentionally growing slowly.", -- Tea tree sapling
        TEALEAVES = "These are the picked tea leaves.", -- Tea leaves
        TEALEAVES_DRIED = "Dried tea leaves.", -- Dried tea leaves

        CAFFEINBERRY = "The past life of a hanging alien plant.", -- Coffee Bush (An homage to the non-oxygen-releasing Peppernut from the previous DST 20th update)
        DUG_CAFFEINBERRY = "If I take it, maybe I can save some time to rest.", -- Dug-up Coffee Bush
        CAFFEINBERRY_BEAN = "It combines the states of coffee and peppernut.", -- Fresh coffee bean
        CAFFEINBERRY_BEAN_COOKED = "I could eat it right away, but maybe I can stabilize time first.", -- Roasted coffee bean

        RUINCACAO_TREE = "It's as twisted as the timelines themselves.", -- Cacao tree
        DUG_RUINCACAO_TREE = "No time to waste; I'll just take it all!", -- Dug-up cacao tree
        RUINCACAO_SEED = "A new life is slowly sprouting.", -- Cacao seed item
        RUINCACAO_SEED_SAPLING = "This little guy seems to be intentionally growing slowly.", -- Cacao sapling from a seed
        RUINCACAO = "You can't tell if it's fruit or charcoal until you open it.", -- Unripe cacao pod

        RUINCACAO_BEAN = "Eating this will surely turn my stomach upside down.", -- Crushed cacao pod
        RUINCACAO_BEAN_COOKED = "Is this a waste of time or not? I can't tell.", -- Roasted cacao pod

        -- Distillery Additives

        ADDITIVE_SEED = "These herbs dream of being in a bottle someday.", -- Herb (Anise, Juniper Berry, Allspice) additive for making liquor
        ADDITIVE_PETALS = "Bundles of old petals yearning for timeless beauty.", -- Herb, Tea Leaves, Petals additive for making liquor
        ADDITIVE_NUT = "Should I just pop it in my mouth?", -- Nut (Birchnut, Coconut, Coffee Bean, Cacao Bean) additive for making liquor
        ADDITIVE_DAIRY = "When it's easier to drink, I'll drink it faster.", -- Dairy additive for making liquor

        -- Drinks

        WATER_CLEAN = "Pure water from a different timeline.", -- Clean water
        WATER_DIRTY = "If I'm in a hurry, maybe...!", -- Dirty water
        WATER_SALTY = "Impurities from future clouds mixed in.", -- Saltwater

        GOOPYDRINK = "Oh my, I was too impatient!", -- Failed drink (Concept of Wet Goop)

        -- Teapot Drinks

        FRUITJUICE = "Excellent, I can consume multiple fruits at once.", -- Mixed fruit juice
        BERRIES_JUICE = "Isn't it faster to just pick and eat them?", -- Berry juice
        POMEGRANATE_JUICE = "Now I can consume the seeds as well.", -- Pomegranate juice
        BANANA_JUICE = "It warms you up when it's hot.", -- Banana juice
        FIG_JUICE = "The essence of sweetness!", -- Fig juice
        DRAGONJUICE = "This is definitely fruit juice.", -- Dragon fruit juice
        GLOWBERRYJUICE = "Delicious and useful!", -- Glowberry juice
        WATERMELON_JUICE = "It's really refreshing!", -- Watermelon juice

        VEGGIE_TEA = "I can't spare time for tea.", -- Vegetable juice
        CARROT_TEA = "Let's drink it quickly.", -- Carrot tea
        CACTUS_TEA = "It should aid digestion.", -- Cactus tea
        TOMATO_JUICE = "Smooth; perfect for quick consumption.", -- Tomato juice
        LUMPY_TEA = "I don't have time for a cup, but...", -- Root tea
        SEAWEED_SHAKE = "Seems like a waste of time compared to other options.", -- Seaweed shake

        GREENTEA = "No time to distinguish teas.", -- Green tea
        BLACKTEA = "Maybe I can indulge in a treat once in a while?", -- Black tea
        BLACKTEA_ICED = "A sip of something cold is nice.", -- Iced black tea
        FUER = "Maybe I can enjoy a cup once in a while.", -- Leaf tea (Boikhaai/Leaf tea/Sarsaparilla)
        MIXFLOWER = "It lets you take a moment to smell the flowers.", -- Mixed flower petals tea
        HIBISCUSTEA = "Why is it so sour?", -- Hibiscus tea
        CACTUSFLOWER_TEA = "There's no lingering scent of the flowers.", -- Cactus flower tea
        LOTUSTEA = "In the past, it might have been a flower or perhaps a fish.", -- Lotus flower tea
        SUSHIBISCUS = "No time for tea but... what's this now?", -- Suicide tea (An homage to the weirdness of Wilba's tea party)
        MOON_BLOSSOM_TEA = "A waste of time to decide what tea it is.", --Moon Flower Tea

        CAFFEINBERRY_JUICE = "Perfect for staying awake all night in the workshop.", -- Black coffee
        TOFFEE_LATTE = "It's both coffee and dessert.", -- Toffee-nut latte
        RUINCHA_LATTE = "I've saved some time by deciding what to drink.", -- Mocha latte (Coffee + Cocoa)

        HOTRUINCOLATE = "Warmth and sweetness in abundance.", -- Hot chocolate
        RUINCOLATE_SMOOTHIE = "Coolness and sweetness in abundance.", -- Chocolate smoothie (Cold)
        RUINXOCOLATL = "This is truly strange; it shows knowledge from another timeline!", -- Chocolatl (Bitter)
        TEA_RUINCOLATE_LATTE = "It suits my taste well!", -- Matcha latte

        MULLED = "I can't remember when I last stayed in bed sick...", -- Bancha
        BUTTERBEER = "I can save time on mealtime by having this.", -- Butterbeer (Harry Potter series)

        -- Collaboration Teapot Drinks

        COCONUT_JUICE = "I compensated for the empty part with jelly.", -- Shipwrecked Coconut Juice
        RAINBOW_SHAKE = "Efficient!", -- Shipwrecked Rainbow Jelly Shake
        QUARTZ_SHAKE = "At least I won't spend time chewing fish.", -- Shipwrecked Moon Glass Jelly Shake
        CHERRY_ROSEBERRIES_TEA = "Sometimes, it's nice to have a cup of tea while looking at flowers.", -- Cherry Forest Rosehip Tea
        CHERRY_HONEY_TEA = "It's elegant and warm.", -- Cherry Forest Cherry Blossom Honey Tea
        SWEET_RICE_DRINK = "I don't know why these seeds take so long to eat...", -- Vita Hyphy Sikhye
        PINEANANAS_JUICE = "Even without the skin, it makes you crave more.", -- Legion Pineapple Juice
        ORANGE_JUICE = "I should have it as a snack after a meal.", -- More Food Pack Orange Juice
        STRAWBERRY_SMOOTHIE = "I'll have to drink it quickly.", -- More Food Pack Strawberry Smoothie
        STRAWBERRY_MILK_SMOOTHIE = "What a wonderful dessert!", -- More Food Pack Strawberry Milk Smoothie

        -- Distillery Drinks

        SPOILED_DRINK = "It used to be a drink.", -- Spoiled Drink (the drink that spoils)

        -- Sodas

        SODA = "I don't think they went through all this trouble just to add bubbles to water.", -- Carbonated Water
        FRUITSODA = "It won't take too long to enjoy this carbonated drink.", -- Fruit Soda
        LEMONLIMESODA = "Carbonated drinks are delicious because they're sweet.", -- Lemon Lime Soda (superior to Fruit Soda)
        COLA = "It's excellent, except for the burping.", -- Cola
        COLAQUANTUM = "Interesting, it's a beverage that shouldn't exist in this timeline.", -- Quantum Cola
        LUMPY_BEER = "When did I last use sassafras roots?", -- Root Beer (In the context of the Starving for the Ages world, it was banned in 1979.)

        -- Spirits

        CORN_BEER = "When will I have time to enjoy a drink?", -- Corn Beer
        MADHU = "It lost its sweetness, but at least I gained some time.", -- Mead
        WINE = "It won't turn into vinegar too quickly.", -- Wine (regular berry fermentation)
        NOBLEWINE = "Isn't it just clear wine?", -- Noble Wine (cooked berry fermentation)
        SPARKLINGWINE = "In another timeline, I might be the one popping champagne at a party.", -- Sparkling Wine
        GLOWBERRYWINE = "This is it! It doesn't spoil easily and it's efficient!", -- Glow Berry Wine
        KUMIS = "I hope the investment of time was worth it.", -- Kumis, Fermented Milk
        LUMPY_WINE = "I'll consider it a gain.", -- Moonshine (fermented root-based spirits)
        PULQUE = "It might spoil quickly compared to the time invested.", -- Pulque (Agave sap wine)
        RUINCACAO_WINE = "It's a strange idea, but regardless, I gained some time.", -- Cacao Wine

        -- Collaboration Sodas

        CHERRY_DOCTOR_COLA = "I don't think this drink involves time travel.", -- Cherry Forest Dr. Pepper (Doctor Cherry) (Roughly a Doctor Who parody)
        PINEANANASSODA = "Good, I won't waste too much time enjoying this.", -- Carbonated Pineapple (Ohranjii)
        ORANGESODA = "Good, I won't waste too much time enjoying this.", -- Carbonated Oranj (Fanta)
        STRAWBERRYSODA = "Good, I won't waste too much time enjoying this.", -- Carbonated Strawberry (Welch's Strawberry)

        -- Collaboration Spirits

        AUROBOW = "It's a rainbow high-proof spirit.", -- Shipwrecked Aurobow (Rainbow Jellyfish Spirits)
        COCONUT_WINE = "If the voyage gets longer, I should have it on hand.", -- Shipwrecked Coconut Wine
        CHERRY_BLOOM_MADHU = "It's quite elegant!", -- Cherry Forest Cherry Blossom Honey Wine
        GIANT_BLUEBERRY_WINE = "It makes me slightly anxious.", -- Vita Hyphy Boom!Berry Sapphire (Explodes when lit)
        RICE_WINE = "I didn't spend much time on it anyway.", -- Vita Hyphy Rice Wine (Makgeolli)
        WHEAT_BEER = "It's not a bad way to make beer from breadfruit.", -- Heap of Food Breadfruit Beer
        PALE_BEER = "I've seen so many strange things by now that this doesn't surprise me.", -- Legion Pale Ale (Beer made from monsters' fruit)

        -- Distilled Spirits

        DISINFECTANT = "It's useless for me. I only need time!", -- Disinfectant
        CORN_WHISKEY = "Honestly, I don't know the taste, but at least it won't spoil quickly.", -- Corn Whiskey
        LUMPY_VODKA = "Be careful not to waste time getting drunk.", -- Vodka
        TEQUILA = "Don't hesitate, just close your eyes and drink it!", -- Tequila
        MADHU_RUM = "With this, I can set sail, maybe tomorrow, or even now.", -- Rum
        BERRY_BRANDY = "Whiskey, Brandy... Honestly, I don't know the difference, as long as it doesn't spoil.", -- Berry Brandy
        AREUHI = "I hope it won't spoil quickly now.", -- Kumis, Fermented Milk (Arouhi)

        -- Wolly-Exclusive Distilled Spirits

        BERRY_GIN = "Just one drink should be enough.", -- Gin
        GLOWBERRY_GIN = "It's an excellent spirit, but I still need to be cautious not to overindulge.", -- Glow Berry Gin
        ABSINTHE = "There's no time to sip it slowly.", -- Absinthe
        TEA_LUMPY_VODKA = "Honestly, I'm not sure if it even has the scent of tea.", -- Green Tea Liqueur
        PETALS_BERRY_BRANDY = "I don't have the time to enjoy the floral scent in my drinks.", -- Rose Scented Brandy
        KAHLUA = "Fantastic! It helps me overcome fear and boosts my energy.", -- Coffee Liqueur Kahlúa
        NUT_CORN_WHISKY = "It's a waste of time to distinguish between types of spirits.", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "It suits my taste, but I should be cautious about overindulging.", -- Baileys Cacao Cream Liqueur
        RUMCHATA = "It's a bit less repulsive now.", -- Rumchata (a mixture of rum and Horchata, a dairy-based beverage)

        -- Collaboration Distilled Spirits

        MOONWAY = "A high-proof spirit that shines with 7 colors.", -- Rainbow Jellyfish Spirits Distilled Spirit
        ARRACK = "Roaming the islands, free from the constraints of time.", -- Arrack Indonesian version Coconut Wine Distilled Spirit
        CHERRY_BLOOM_RUM = "It's a pretty bottle, but I won't waste time admiring it.", -- Cherry Blossom Honey Rum Distilled Spirit Cherry Blossom Petals Float
        RICE_SPIRITS = "One sip, and I'll be wide awake.", -- Makgeolli (Rice Wine)
        WHEAT_WHISKEY = "Honestly, I don't know the taste, but at least it doesn't spoil quickly.", -- Wheat Whiskey
        PALE_WHISKEY = "Once it's in your mouth, all spirits taste the same.", -- Pale Malt Whiskey

        -- Wolly-Exclusive Collaboration Distilled Spirits

        NUT_COCONUT_BRANDY = "The sea is fickle; I need something to conquer my fear.", -- Coconut Brandy (Renamed as Caribbean Brandy due to the inability to make Caribbean Rum)
        GIANT_BLUEBERRY_GIN = "Someday, someone will surely cause trouble with this.", -- Boom!Berry Sapphire (Carrot explosion)

        -- Pot Dishes

        DARK_RUINCOLATE = "Does Wollie understand the secret of this snack?", -- Dark Chocolate
        WHITE_RUINCOLATE = "Wollie knows my taste well!", -- White Chocolate
        RUINCOLATE = "It's sweet and doesn't take too long to consume!", -- Chocolate
        RUIN_SCHOKAKOLA = "A perfect snack!", -- Chokola

        BUCKET_STEEL_EMPTY =
        {
            EMPTY = "Is there really a need to stare at this empty bucket?", -- Empty Steel Bucket
        FULL = "Let's retrieve it before the tides change!", -- Clean Rainwater is full
        FULL_ICE = "Oh dear, it's frozen over from the passage of time.", -- Rainwater has frozen
        DIRTY = "Oh my, it's been contaminated by time.", -- Rainwater has become dirty
        DIRTY_ICE = "Oh my, it's frozen while still contaminated.", -- Dirty rainwater has frozen
        },

        BUCKET_WOODIE_EMPTY =
        {
            EMPTY = "Woodie's woodworking skills are respectable; he's already emptied it.", -- Woodie's Empty Wooden Bucket
            FULL = "Let's retrieve it before the tides change!", -- Clean Rainwater is full
            FULL_ICE = "Oh dear, it's frozen over from the passage of time.", -- Rainwater has frozen
            DIRTY = "Oh my, it's been contaminated by time.", -- Rainwater has become dirty
            DIRTY_ICE = "Oh my, it's frozen while still contaminated.", -- Dirty rainwater has frozen
        },

        BUCKET_EMPTY =
        {
            EMPTY = "It's just an ordinary bucket.", -- Empty Wooden Bucket
            FULL = "Let's retrieve it before the tides change!", -- Clean Rainwater is full
            FULL_ICE = "Oh dear, it's frozen over from the passage of time.", -- Rainwater has frozen
            DIRTY = "Oh my, it's been contaminated by time.", -- Rainwater has become dirty
            DIRTY_ICE = "Oh my, it's frozen while still contaminated.", -- Dirty rainwater has frozen
        },

        DESALINATOR =
        {
            EMPTY = "A device that turns seawater into freshwater.", -- Desalinator with no water
            PURIFY_LONG = "I can't just stand around waiting for it to finish; time is precious!", -- Purification has a long way to go
            PURIFY_SHORT = "Hurry up, hurry up!", -- Purification is almost complete
            HASWATER = "Finally!", -- Clean water is available
            BURNT = "There's been a bit of a hiccup.", -- Desalinator is burnt
            HASSALT = "Get a grip, we need to remove the salt first!", -- Desalinator still has salt
        },

        BARREL =
        {
            GENERIC = "At least I don't have to worry about the water going bad.", -- Inspecting the barrel
            BURNT = "Who could have predicted that a barrel with water would catch fire?", -- The barrel is burnt
        },

        BREWERY =
        {
            EMPTY = "Brewing takes its sweet time.", -- Inspecting the empty brewery
            BURNT = "I suppose this was its destiny.", -- The brewery is burnt
            FERMENTING_LONG = "Fermentation takes time, and I can't just wait around.", -- Fermentation has a long way to go
            FERMENTING_SHORT = "I've been waiting for quite a while!", -- Fermentation is almost complete
            DONE = "Finally, something to show for it!", -- There's a drink in the brewery
        },

        CAMPKETTLE_ITEM = "I should carry this around for a while.", -- Inspecting the camp kettle item
        CAMPKETTLE =
        {
            GENERIC = "Did I forget to put water in this?", -- Inspecting the camp kettle without water
            BOILING_LONG = "I can't just stand here waiting for it!", -- Boiling water is starting
            BOILING_SHORT = "Isn't it ready to drink yet?", -- Water is almost done boiling
            DONE = "It took this long just to make a drink?", -- There's clean water in the camp kettle
            STOP = "Oh dear, the fire's not strong enough!", -- There's no fire in the camp kettle
        },

        CAMPDESALINATOR_ITEM = "It might come in handy since there's always the sea nearby.", -- Inspecting the camp desalinator item
        CAMPDESALINATOR =
        {
            GENERIC = "Was there water in here to begin with, or was it always empty?", -- Camp desalinator is empty
            BOILING_LONG = "I can't just stand here waiting for it!", -- Boiling water is starting
            BOILING_SHORT = "Isn't it ready to drink yet?", -- Water is almost done boiling
            DONE = "It took this long just to make a drink?", -- There's clean water in the camp desalinator
            STOP = "Oh dear, the fire's not strong enough!", -- There's no fire in the camp desalinator
        },

        KETTLE =
        {
            EMPTY = "At least I can boil a lot of water at once with this.", -- Inspecting the empty kettle
            BURNT = "Oh my, I'll have to lick dew off leaves for a while now.", -- The kettle is burnt
            BOILING_LONG = "Why does it take so long to make a single drink?", -- Boiling is just starting
            BOILING_SHORT = "I hope it's not over-extracted; can I drink it now?", -- Almost done cooking the drink
            DONE = "Finally, something to show for it!", -- There's a drink in the kettle
            PURIFY_LONG = "I can't just stand around waiting for it to finish; time is precious!", -- Purification has a long way to go
            PURIFY_SHORT = "Hurry up, hurry up!", -- Purification is almost complete
            HASWATER = "Can I drink it now?", -- The kettle has clean water
            MELT_LONG = "Can't I just melt the ice and drink it now?", -- Starting to melt the ice water
            MELT_SHORT = "It's almost melted!", -- Ice water is almost completely melted
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "I don't have time to lay out a picnic blanket and have a tea party.", -- Inspecting the portable kettle item
            EMPTY = "I'd better just replenish my fluids from berries or carrots instead.", -- Inspecting the placed empty portable kettle
            BOILING_LONG = "Why does it take so long to make a single drink?", -- Boiling is just starting
            BOILING_SHORT = "It won't take too long, right?", -- Almost done cooking the drink
            DONE = "Finally, something to show for it!", -- There's a drink in the portable kettle
            PURIFY_LONG = "I can't just stand around waiting for it!", -- Purification has a long way to go
            PURIFY_SHORT = "Hurry up, hurry up!", -- Purification is almost complete
            HASWATER = "Can I drink it now?", -- The portable kettle has clean water
            MELT_LONG = "Can't I just melt the ice and drink it now?", -- Starting to melt the ice water
            MELT_SHORT = "It's almost melted!", -- Ice water is almost completely melted
        },

        DISTILLERS =
        {
            EMPTY = "Spirits made with this won't spoil easily, at least.", -- Inspecting the distiller
            DISTILLTING_LONG = "If I watch this until it's done, I'll age faster than the drink.", -- Distillation has a long way to go
            DISTILLING_SHORT = "It shouldn't take too long!", -- Distillation is almost complete
            DONE = "Finally!", -- There's a drink in the distiller
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "All the hard work paid off!", -- Maximum pressure
            MIDDLE_PRESSURE = "I can get clean water right away.", -- Pressure is moderate
            LOW_PRESSURE = "It seems the power is running low.", -- Almost no pressure
            RECHARG_PRESSURE = "Oh dear, it will take some time to pump water again.", -- No pressure at all (can't use it until pressure is maximum).
        },

        WELL_SPRINKLER =
        {
            LOWFUEL = "If I want, I can refuel it.", -- Inspecting when fuel is almost gone
            ON = "This saves me time when watering!", -- It's operational
            OFF = "It can be activated anytime.", -- Inspecting when it's turned off
        },
    },
}