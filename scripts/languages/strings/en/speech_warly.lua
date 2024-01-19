return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Let's deal with the full bucket first.", -- Attempting to give a filled bucket when the well is not empty
            WELL_BUSY = "Oops, it seems the bucket is already on its way down.", -- Attempting to give a bucket when it's already inside the well
        }
    },

    ANNOUNCE_DRUNK = "Hiccup, 'tis a merry time, but I shall not overindulge...", -- Drunk
    ANNOUNCE_DRUNK_END = "Hm... I ought to whip up some hangover cures.", -- Sobering up from being drunk (hungover)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. For Wigfrid only.
    ANNOUNCE_NOTCHARGE = "Milking now won't yield any results.", -- Trying to milk the Electric Milk Goat without it being charged
    ANNOUNCE_NOTHIRSTSLEEP = "I'm parched, but I mustn't slumber just yet.", -- Trying to sleep at night with low thirst
    ANNOUNCE_NOTHIRSTSIESTA = "I'm parched, but it's not time for a siesta yet.", -- Trying to take a siesta during the day with low thirst
    ANNOUNCE_SLEEP_END = "Ah... I must be more cautious and avoid overindulgence next time.", -- Waking up after sleeping and sobering up completely
    ANNOUNCE_THIRST = "I must drink something...", -- Very thirsty

    ANNOUNCE_CAFFINE_BUFF_START = "Ahh, I feel invigorated!", -- Starting the caffeine buff
    ANNOUNCE_CAFFINE_BUFF_STOP = "I yearn for a freshly brewed espresso.", -- Ending the caffeine buff

    ANNOUNCE_CURE_WATERBORNE = "My stomach has settled a bit.", -- Wigfrid refusing to drink contaminated water

    ANNOUNCE_DCAPACITY_CRITICAL = "I must exercise restraint; I can't afford to drink any more.", -- Very close to getting drunk
    ANNOUNCE_DCAPACITY_HALF = "Mmm, I'm feeling just the right amount of merry.", -- Starting to feel the effects of drinking

    DESCRIBE =
    {
        BOILBOOK = "I should jot down some cocktail recipes as well.",

        WATER_CLEAN_ICE = "Should I grind it finely to make shaved ice?", -- Clean ice
        WATER_DIRTY_ICE = "I can't use this dirty ice for cooking.", -- Dirty ice

        SPICE_CAFFEINPEPPER = "It enhances the flavor of any dish.", -- Caffeine pepper spice

        WELL_KIT = "Now, all we need is a bubbling wellspring!", -- Well Kit
        WELL_SPRINKLER_KIT = "I can easily serve water to my garden guests with this.", -- Sprinkler Kit
        WELL_WATERPUMP_KIT = "It's like a water dispenser!", -- Steam Water Pump Kit
        WELL_BURYING_KIT = "We must ensure no one stumbles into these holes.", -- Hole Burying Kit
        WELL_DRILLING = "I should avoid cooking near that drilling.", -- Drilling a hole with a drill
        WELL_DRILLING_ITEM = "I'll find an aquifer and drill it.", -- Drilling item
        HOLE = "I can hear the sound of flowing water.", -- Well hole
        WELL = "Let's extend our supply of drinking water!", -- Well

        WX78MODULE_NONEDRUNK = "They give our metal friend a little extra zest, non?", -- 78전용 묘듈

        -- Waterlogged Plant Mod

        TEA_TREE = "Usually found across the sea, I suppose.", -- Tea tree
        DUG_TEA_TREE = "It's like takeout tea.", -- Tea tree dug from the ground
        TEA_SEED = "I wonder what's inside this seed.", -- Tea tree seed
        TEA_SEED_COOKED = "It doesn't seem very valuable as a cooking ingredient.", -- Roasted tea tree seed
        TEA_SEED_SAPLING = "It's still quite young.", -- Tea tree sapling
        TEALEAVES = "I should process them first.", -- Tea leaves
        TEALEAVES_DRIED = "Now, all I need is hot water...", -- Dried tea leaves

        CAFFEINBERRY = "If only it grew coffee beans every morning.", -- Coffee bush
        DUG_CAFFEINBERRY = "A coffee to-go.", -- Coffee bush dug from the ground
        CAFFEINBERRY_BEAN = "It has a hint of a peppery aroma...", -- Raw coffee bean
        CAFFEINBERRY_BEAN_COOKED = "Splendid!", -- Roasted coffee bean

        RUINCACAO_TREE = "You typically have to cross the sea to find these.", -- Cacao tree
        DUG_RUINCACAO_TREE = "Should I resurrect it?", -- Cacao tree dug from the ground
        RUINCACAO_SEED = "It's rather spine-chilling.", -- Cacao sapling item
        RUINCACAO_SEED_SAPLING = "It's rather spine-chilling.", -- Cacao sapling planted
        RUINCACAO = "I should check what's inside.", -- Unbroken cacao pod
        RUINCACAO_BEAN = "It has a strong cocoa scent!", -- Broken cacao pod
        RUINCACAO_BEAN_COOKED = "I can't eat it like this.", -- Roasted cacao pod

        -- Distiller Additives

        ADDITIVE_SEED = "I'll add this to enhance the flavor of spirits.", -- Liquor additive seed (anise, juniper berry, or star motif)
        ADDITIVE_PETALS = "It adds a touch of elegance to spirits.", -- Liquor additive herb or flower petals
        ADDITIVE_NUT = "This will give the spirits a unique aroma.", -- Liquor additive nut (burchi nut, coconut, coffee bean, or cacao bean)
        ADDITIVE_DAIRY = "Perfect for making beginner-friendly drinks.", -- Liquor additive dairy product

        -- Drinks

        WATER_CLEAN = "Clean water without any impurities is essential for cooking.", -- Clean water
        WATER_DIRTY = "I can't use this water for cooking.", -- Dirty water
        WATER_SALTY = "I don't think this is suitable for making broth.", -- Saltwater

        GOOPYDRINK = "This is chaos incarnate, pure chaos!", -- Failed drink (wet goop) - Gordon Ramsay's quote

        -- Teapot Drinks

        FRUITJUICE = "It's a blend of various fruit flavors!", -- Mixed fruit juice
        BERRIES_JUICE = "Simple, slightly tart, and sweet.", -- Berry juice
        POMEGRANATE_JUICE = "Its sharpness awakens the appetite!", -- Pomegranate juice
        BANANA_JUICE = "A crowd-pleaser, no doubt.", -- Banana juice
        FIG_JUICE = "The seeds give it an interesting texture.", -- Fig juice
        DRAGONJUICE = "It's both mild and exotic, perfect for those who seek adventure.", -- Dragon fruit juice
        GLOWBERRYJUICE = "I made this juice with special berries.", -- Glowberry juice
        WATERMELON_JUICE = "The thirstier you are, the sweeter it tastes!", -- Watermelon juice

        VEGGIE_TEA = "Bitterness can be good for you.", -- Green juice
        CARROT_TEA = "Even if it's not everyone's favorite, it's still healthy.", -- Carrot tea
        CACTUS_TEA = "The flesh inside is a treat!", -- Cactus tea
        TOMATO_JUICE = "A drink even vampires would enjoy!", -- Tomato juice
        LUMPY_TEA = "The more I sip, the sweeter it becomes!", -- Root tea
        SEAWEED_SHAKE = "I never thought you could make a drink out of this...", -- Seaweed shake

        GREENTEA = "It's like a herbal tea, not bad at all.", -- Green tea
        BLACKTEA = "I should bring some biscuits.", -- Black tea
        BLACKTEA_ICED = "A refreshing iced tea, especially after a heavy meal.", -- Iced black tea
        FUER = "Surprisingly, it has a pleasant aroma.", -- Baozi tea, leaf tea, fern tea
        MIXFLOWER = "It has a nice aroma and is good for calming nerves!", -- Mixed flower tea
        HIBISCUSTEA = "I'd highly recommend it for our female guests.", -- Hibiscus tea
        CACTUSFLOWER_TEA = "It's like drinking a piece of art.", -- Cactus flower tea
        LOTUSTEA = "It's truly exotic and beautiful!", -- Lotus tea
        SUSHIBISCUS = "This is a mockery of tea.", -- Suicide tea
        MOON_BLOSSOM_TEA = "It has a unique taste.", -- Moon blossom tea

        CAFFEINBERRY_JUICE = "From now on, I'll call it 'Blue Moon-tain'.", -- Black coffee
        TOFFEE_LATTE = "A sweet and nutty coffee for those looking for something easy to drink.", -- Toffee Nut Latte
        RUINCHA_LATTE = "I miss a real Mocha Martini.", -- Mocha Latte (Coffee + Chocolate)

        HOTRUINCOLATE = "You can enjoy it anywhere for a relaxing feeling.", -- Hot Chocolate
        RUINCOLATE_SMOOTHIE = "The chewy chocolate chips and ice are exceptional.", -- Chocolate Smoothie (Chilled)
        RUINXOCOLATL = "An exotic drink filled with the wisdom of South Americans!", -- Xocolatl (Spicy)
        TEA_RUINCOLATE_LATTE = "The bitterness of the tea leaves complements the sweetness of the chocolate.", -- Matcha Latte

        MULLED = "This is great for when you're feeling under the weather.", -- Bungsho
        BUTTERBEER = "The most delicious drink in Diagon Alley.", -- Butterbeer from the Harry Potter series

        -- Collaboration Teapot Drinks

        COCONUT_JUICE = "It makes me feel like I'm on a tropical vacation with every sip.", -- Castaway Coconut Juice
        RAINBOW_SHAKE = "It's not quite the taste of a rainbow, but it's close.", -- Castaway Rainbow Jelly Shake
        QUARTZ_SHAKE = "I should've gone with the more appetizing Moon Rock Shake.", -- Castaway Quartz Crystals Shake
        CHERRY_ROSEBERRIES_TEA = "It has a delightful fragrance and helps regulate body heat.", -- Cherry Blossom Rose Hip Tea
        CHERRY_HONEY_TEA = "It's a quick fix for a sore throat.", -- Cherry Blossom Cherry Honey Tea
        SWEET_RICE_DRINK = "It's sweet and has an unusual texture!", -- Vitahebhi Sikhye
        PINEANANAS_JUICE = "Be careful not to drink too much; it might make your mouth sweet!", -- Legion Pineapple Juice
        ORANGE_JUICE = "It's freshly squeezed orange juice!", -- More Food Pack Orange Juice
        STRAWBERRY_SMOOTHIE = "It's refreshing and delicious!", -- More Food Pack Strawberry Smoothie
        STRAWBERRY_MILK_SMOOTHIE = "It's cool and refreshing!", -- More Food Pack Strawberry Smoothie Latte

        --Brewery Drinks

        SPOILED_DRINK = "It's way past its expiration date.", -- Spoiled drink

        -- Brewery Soda

        SODA = "Carbonated water without any strange flavors.", -- Carbonated water
        FRUITSODA = "Refreshing fruitiness with a fizzy kick!", -- Fruit soda
        LEMONLIMESODA = "As refreshing as a honeydew!", -- Lemon-lime soda (Superior to fruit soda)
        COLA = "Kids always love it.", -- Cola
        COLAQUANTUM = "One lady went crazy looking for this...", -- Cola Quantum (Forn McRain: Fallout 3 Sierra Petrovita reference)
        LUMPY_BEER = "Only preferred by certain customers.", -- Root beer (non-alcoholic)

        -- Brewery Spirits

        CORN_BEER = "Tastes even better after a greasy meal.", -- Corn beer
        MADHU = "I wonder if Bilroad is still making honey mead with oak fruits.", -- Mead (Forn McRain: Skyrim Honningbrew Mead story)
        WINE = "It's the best gift from the gods to humans!", -- Wine (Regular berry brewing)
        NOBLEWINE = "Would be better with some blue cheese and nuts.", -- Noble wine (Roasted berry brewing)
        SPARKLINGWINE = "Refreshing and whets the appetite.", -- Sparkling wine
        GLOWBERRYWINE = "A new attempt at wine!", -- Glowberry wine
        KUMIS = "Wisdom from the people of Central Asia.", -- Kumis, fermented mare's milk
        LUMPY_WINE = "Light and slightly tangy.", -- Sake (Root liquor, includes potatoes, sweet potatoes, etc.)
        PULQUE = "A bit sticky and has a tangy flavor.", -- Pulque (Agave sap)
        RUINCACAO_WINE = "Full of cocoa flavor.", -- Cacao wine

        -- Collaboration Soda

        CHERRY_DOCTOR_COLA = "Preferred by enthusiasts for sure.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
        PINEANANASSODA = "Perfect if you've eaten too much delicious food.", -- Pineapple soda (Oran C)
        ORANGESODA = "Refreshing after a meal!", -- Orange soda (Fanta)
        STRAWBERRYSODA = "Sweet strawberry-flavored soda.", -- Strawberry soda (Welch's Strawberry)

        -- Collaboration Spirits

        AUROBOW = "A drink with complex colors and aromas like a rainbow.", -- Rainbow Jellyfish Liquor (Aurobo)
        COCONUT_WINE = "Creamy sweetness with a hint of acidity and viscosity.", -- Coconut Wine (Aurobo Coconut Wine)
        CHERRY_BLOOM_MADHU = "You can feel the fragrance of strawberries, raspberries, and a hint of vanilla.", -- Cherry Blossom Honey Mead (Cherry Forest Cherry Blossom Mead)
        GIANT_BLUEBERRY_WINE = "It seems like my idea went in a slightly different direction.", -- Boom Berry Wine (Explodes when ignited)
        RICE_WINE = "Traditional liquor from East Asia.", -- Vitahebhi Makgeolli
        WHEAT_BEER = "Unique banana aroma and easy to drink.", -- Heap of Food Wheat Beer
        PALE_BEER = "A new attempt at beer!", -- Legion Pale Ale (Light blue beer with Munstera fruit)

        -- Distilled Spirits

        DISINFECTANT = "Don't confuse it with alcohol!", -- Disinfectant
        CORN_WHISKEY = "Sweetness, spiciness, and a rich texture.", -- Corn Whiskey
        LUMPY_VODKA = "The purer, milder, and odorless, the better the vodka.", -- Vodka
        TEQUILA = "Smooth wood-like aroma.", -- Tequila
        MADHU_RUM = "Distinctive sweet aroma of distilled spirits.", -- Rum
        BERRY_BRANDY = "You can feel the rich aroma.", -- Berry Brandy
        AREUHI = "Fresh and mild taste, but be careful not to overdo it.", -- Kumis Distilled Spirit Areuhi

        -- Warly Exclusive Distilled Spirits

        BERRY_GIN = "Distinctive pine scent.", -- Gin
        GLOWBERRY_GIN = "An enigmatic fragrance as if swallowing light.", -- Glow Berry Gin
        ABSINTHE = "Subtle sweetness, wormwood aroma, and a blend of spice and herbal flavors.", -- Absinthe
        TEA_LUMPY_VODKA = "I've blended the bitterness and strong aroma of tea leaves.", -- Green Tea Liqueur
        PETALS_BERRY_BRANDY = "You can feel the aroma of raspberries, tangerines, strawberries, and flowers.", -- Rose Petal Brandy
        KAHLUA = "Intense black coffee with a sweet buttery hint, nutty, and slightly bitter.", -- Coffee Liqueur Kahlua
        NUT_CORN_WHISKEY = "I can't resist the slight bitterness and vanilla aroma.", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "You can enjoy the creamy aroma and sweet taste of Belgian chocolate.", -- Baileys Cacao Cream Liqueur
        RUMCHATA = "Cinnamon flavor combines with vanilla, and it feels creamy and nutty.", -- Rumchata (Rum mixed with horchata, a dairy beverage)

        -- Collaboration Distilled Spirits

        MOONWAY = "It looks like it contains a rainbow, with complex colors and aromas.", -- Rainbow Jellyfish Distilled Spirit (Rainbow Jellyfish Liquor)
        ARRACK = "Distinctive heaviness of palm fruit and a complex aroma of nuts.", -- Arrack Indonesian version of Coconut Wine
        CHERRY_BLOOM_RUM = "Even just looking at it is enjoyable.", -- Cherry Blossom Honey Rum (Cherry Blossom petals floating)
        RICE_SPIRITS = "A clean finish!", -- Cheongju (Korean rice wine)
        WHEAT_WHISKEY = "I need to prepare dishes to pair with it.", -- Wheat Whiskey
        PALE_WHISKEY = "Rough and subtle earthy taste with a unique and pleasant flavor.", -- Pale Malt Whiskey

        -- Warly Exclusive Collaboration Distilled Spirits

        NUT_COCONUT_BRANDY = "It would be great to make a Piña Colada with fruit.", -- Coconut Brandy (Caribbean Brandy, renamed as Caribbean Brandy due to not being able to make Caribbean Rum)
        GIANT_BLUEBERRY_GIN = "Making a joke by eating it is a sin!", -- Boom Berry Sapphire (Explodes when ignited)

        -- Pot Cooking

        DARK_RUINCOLATE = "I experimented and made it my way.", -- Dark Chocolate
        WHITE_RUINCOLATE = "Kids go crazy for it.", -- White Chocolate
        RUINCOLATE = "Sweet and lovely.", -- Just Chocolate
        RUIN_SCHOKAKOLA = "One bite will definitely wake you up.", -- Schokakola

        BUCKET_STEEL_EMPTY = 
        {
            EMPTY = "I had an idea to make pudding with this.", -- Empty steel bucket
            FULL = "It's clean water!", -- Clean rainwater is good
            FULL_ICE = "It would be perfect for holding wine.", -- Rainwater has frozen
            DIRTY = "There are a lot of inconvenient green guests.", -- Rainwater has become dirty
            DIRTY_ICE = "After removing the ice, I need to do proper dishwashing.", -- Dirty rainwater has frozen
        },

        BUCKET_WOODIE_EMPTY = 
        {
            EMPTY = "I carefully and meticulously emptied it.", -- Empty wooden Woody's bucket
            FULL = "It's clean water!", -- Clean rainwater is good
            FULL_ICE = "It would be perfect for holding wine.", -- Rainwater has frozen
            DIRTY = "There are a lot of inconvenient green guests.", -- Rainwater has become dirty
            DIRTY_ICE = "After removing the ice, I need to do proper dishwashing.", -- Dirty rainwater has frozen
        },

        BUCKET_EMPTY = 
        {
            EMPTY = "It's a water bucket made from carved wood.", -- Empty wooden bucket
            FULL = "It's clean water!", -- Clean rainwater is good
            FULL_ICE = "It would be perfect for holding wine.", -- Rainwater has frozen
            DIRTY = "There are a lot of inconvenient green guests.", -- Rainwater has become dirty
            DIRTY_ICE = "After removing the ice, I need to do proper dishwashing.", -- Dirty rainwater has frozen
        },

        DESALINATOR =
        {
            EMPTY = "Should I fill it with seawater?", -- No water in the desalinator
            PURIFY_LONG = "I should prepare some simple snacks while it's working.", -- Still a long way to go until purification is complete
            PURIFY_SHORT = "The water has become quite clear.", -- Purification is almost complete
            HASWATER = "There's enough to use for cooking!", -- Clean water in the desalinator
            BURNT = "I was trying to get roasted salt, huh?", -- The desalinator has burnt
            HASSALT = "What a mistake, I should have harvested the salt first.", -- There's salt in the desalinator
        },

        BARREL =
        { 
            GENERIC = "I can always keep water fresh.", -- Inspecting the water barrel
            BURNT = "Comment est-ce possible?! (How is this possible?!) ", -- The water barrel has burnt
        },

        BREWERY =
        {
            EMPTY = "Just having some drinks to accompany a meal elevates the experience.", -- Inspecting the brewery
            BURNT = "My heart feels like it's burnt too!", -- The brewery has burnt
            FERMENTING_LONG = "Fermentation naturally takes a while.", -- Still a long way to go until brewing is complete
            FERMENTING_SHORT = "I should hurry and prepare a dish to pair with it.", -- Brewing is almost complete
            DONE = "Ah, it's ready!", -- There's a drink in the brewery
        },

        CAMPKETTLE_ITEM = "It's faithful to its core function of boiling water.", -- Inspecting the camp kettle item
        CAMPKETTLE =
        {
            GENERIC = "Did all the water evaporate from it?", -- No water in the camp kettle on the stove
            BOILING_LONG = "I should make some food while it's working.", -- Water is starting to boil
            BOILING_SHORT = "The water has become quite clean, hasn't it?", -- Water is almost boiled
            DONE = "I should use this to make tea.", -- Clean water is obtained
            STOP = "It's cold now.", -- No longer boiling water due to lack of fire in the stove
        },

        CAMPDESALINATOR_ITEM = "It looks quite complicated, doesn't it?", -- Inspecting the camp desalinator item
        CAMPDESALINATOR = 
        {
            GENERIC = "It's completely empty.", -- No water
            BOILING_LONG = "I should make some food while it's working.", -- Water is starting to boil
            BOILING_SHORT = "The water has become quite clean.", -- Almost done boiling
            DONE = "I should use this to make soup.", -- Clean water is obtained
            STOP = "It's still seawater.", -- Can't purify seawater without fire in the stove
        },

        KETTLE =
        {
            EMPTY = "Even the kettle is empty, and my throat is parched.", -- Empty kettle inspection dialog
            BURNT = "J'ai juste versé des larmes.. (I'm just shedding tears...)", -- The kettle has burned
            BOILING_LONG = "I need to simmer it enough to bring out the flavor.", -- Just started making a drink
            BOILING_SHORT = "It's almost done.", -- Drink is almost ready
            DONE = "Ah, it's ready!", -- The drink is finished
            PURIFY_LONG = "I can't have any off-flavors in the drink.", -- Just started boiling dirty water
            PURIFY_SHORT = "I've almost removed the impurities!", -- Almost done boiling dirty water
            HASWATER = "I wonder what kind of drink I should make.", -- Kettle has clean water
            MELT_LONG = "Chilly guests have arrived.", -- Just started melting ice water
            MELT_SHORT = "It's almost melted.", -- Almost done melting ice water
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "It allows me to feel the warmth of tea anytime, anywhere.", -- Inspecting the portable kettle item
            EMPTY = "I can't go out without this!", -- Inspecting the installed empty portable kettle
            BOILING_LONG = "Good drinks require their own efforts.", -- Just started making a drink
            BOILING_SHORT = "I'll be out of here soon!", -- Drink is almost ready
            DONE = "The drink I ordered... ah, it's a habit.", -- The drink is finished
            PURIFY_LONG = "Hygiene in the kitchen is always important.", -- Just started boiling dirty water
            PURIFY_SHORT = "I've almost removed the impurities!", -- Almost done boiling dirty water
            HASWATER = "I wonder what kind of drink I should make.", -- Kettle has clean water
            MELT_LONG = "Chilly guests have arrived.", -- Just started melting ice water
            MELT_SHORT = "It's almost melted.", -- Almost done melting ice water
        },

        DISTILLERS =
        {   
            EMPTY = "I'll treat you to a good liqueur!", -- Inspecting the distiller
            DISTILLTING_LONG = "Shall I go gather some ingredients for cocktails?", -- Still a long way to go until distillation is complete
            DISTILLING_SHORT = "I should hurry and prepare a dish to pair with it.", -- Distillation is almost complete
            DONE = "Our assistant has prepared some spirits.", -- There's a drink in the distiller
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "It seems to be high-quality groundwater.", -- Maximum pressure
            MIDDLE_PRESSURE = "Being able to draw fresh water anytime is a blessing.", -- Medium pressure
            LOW_PRESSURE = "The pressure is too low!", -- Almost no pressure
            RECHARG_PRESSURE = "The pressure has completely run out!", -- No pressure (can't be used until pressure is restored)
        },

        WELL_SPRINKLER =
        { 
            LOWFUEL = "It seems to have run out of fuel.", -- Inspecting the sprinkler with very little fuel
            ON = "It's working hard!", -- Currently operational
            OFF = "It's break time.", -- Inspecting when it's not operational
        },
    },
}  