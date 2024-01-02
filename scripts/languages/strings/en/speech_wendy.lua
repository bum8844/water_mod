return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "I should remove that bucket first.",
            WELL_BUSY = "The bucket is still in the abyss.",
        }
    },

        ANNOUNCE_DRUNK = "Sob... Abigail, I'm so lonely...", -- Drunk
        ANNOUNCE_DRUNK_END = "Don't laugh, Abigail. It's embarrassing.", -- Sobered up (Hungover)
        ANNOUNCE_DRUNK_IMMUNITY = "",
        ANNOUNCE_NOTCHARGE = "Is there no milk to squeeze?", -- Lightning goat can't be charged, so milk can't be squeezed into a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "My throat is submerged in the abyss. I can't sleep now.", -- Trying to sleep at night while thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "My throat is drying up in the sunlight. I can't sleep now.", -- Trying to sleep during the day while thirsty
        ANNOUNCE_SLEEP_END = "It wasn't a dream. It's still a nightmare!", -- Waking up after sleeping and fully sobering up
        ANNOUNCE_THIRST = "My throat is parched!", -- Becoming thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "I feel like my arms and legs are lighter.", -- Caffeine buff starts
        ANNOUNCE_CAFFINE_BUFF_STOP = "My body feels heavy as usual.", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "Even though this pain subsides, more pain will surely come.", -- Curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "I may forget the embarrassment, but Abigail won't.", -- Low sanity warning
        ANNOUNCE_DCAPACITY_HALF = "Now I understand why I was so embarrassed.", -- Half sanity warning

        DESCRIBE =
        {
            BOILBOOK = "Even if I can boil my throat, it will only be consumed in tears.",

            WATER_CLEAN_ICE = "As frozen as my heart.",
            WATER_DIRTY_ICE = "Dirty and frozen water.",

            SPICE_CAFFEINPEPPER = "It's more versatile than I am.",

            WELL_KIT = "It's heavy, but I need to find the motivation.",
            WELL_SPRINKLER_KIT = "If I tell it where to install, the machine will find its place on its own.",
            WELL_WATERPUMP_KIT = "A cold mechanical heart.",
            WELL_BURYING_KIT = "Making such a deep hole and plugging it with stakes won't help.",
            WELL_DRILLING = "Drilling a large hole into the ground.",
            WELL_DRILLING_ITEM = "It will drill a deep hole into the ground.",
            HOLE = "I haven't reached the bottom yet, how can I get back home?", -- (Alice's Adventures in Wonderland)
            WELL = "I wonder if it will grant a wish if I throw a coin in?",

            WX78MODULE_NONEDRUNK = "It looks so fragile... hopefully no tragic accidents befall it.", -- 78전용 묘듈

            -- Waterlogged plants

            TEA_TREE = "The leaves are lush.", -- Tea Tree
            DUG_TEA_TREE = "I like it dead as it is, but I should return it to the ground.", -- Dug up Tea Tree
            TEA_SEED = "Life has found a place amidst instability.", -- Tea Tree Seed
            TEA_SEED_COOKED = "It ended up roasted to death.", -- Cooked Tea Tree Seed
            TEA_SEED_SAPLING = "The roots may be one, but the stems don't get along.", -- Tea Tree Sapling
            TEALEAVES = "The leaves will never attach themselves to the stems again.", -- Tea Leaves
            TEALEAVES_DRIED = "They've wrinkled up a lot in the sun.", -- Dried Tea Leaves

            CAFFEINBERRY = "A plant that forms beans.", -- Caffeine Bush
            DUG_CAFFEINBERRY = "Rest in peace. You have no home now.", -- Dug up Caffeine Bush
            CAFFEINBERRY_BEAN = "Seems quite stimulating.", -- Caffeine Bean
            CAFFEINBERRY_BEAN_COOKED = "Who would have thought you could obtain determination from a bean?", -- Cooked Caffeine Bean

            RUINCACAO_TREE = "It burned its seeds and turned them into nutrients.", -- Ruincacao Tree
            DUG_RUINCACAO_TREE = "Was that cave your hell?", -- Dug up Ruincacao Tree
            RUINCACAO_SEED = "I rescued it before it could burn.", -- Ruincacao Seed
            RUINCACAO_SEED_SAPLING = "Life has sprung forth from the darkness.", -- Ruincacao Seedling
            RUINCACAO = "A makeup jar with tiny lives trapped inside.", -- Ruincacao
            RUINCACAO_BEAN = "It's filled with oil.", -- Ruincacao Bean
            RUINCACAO_BEAN_COOKED = "In the end, it's all the same.", -- Cooked Ruincacao Bean

            -- Distilled Spirits Additives

            ADDITIVE_SEED = "I've collected seeds with unusual scents.", -- Liqueur Additive (Anise, Juniperberry, Parrot Motif)
            ADDITIVE_PETALS = "Dried-up flower petals and leaves.", -- Liqueur Additive (Herbal Tea, Petal)
            ADDITIVE_NUT = "Finely chopped nuts.", -- Liqueur Additive (Birchnut, Coconut, Coffee Bean, Cacao Bean)
            ADDITIVE_DAIRY = "Sealed cream.", -- Liqueur Additive (Dairy)

            -- Drinks

            WATER_CLEAN = "It extends life for a moment.", -- Clean Water
            WATER_DIRTY = "If you want to experience a long-lasting pain, try this.", -- Dirty Water
            WATER_SALTY = "It gives life but also leads to death with its poison.", -- Salt Water (from the novel "Lord of the Flies")

            GOOPYDRINK = "As messed up as life itself.", -- Failed Drink (Wet Roasted)

            -- Teapot Drinks

            FRUITJUICE = "Made with various fruits.", -- Mixed Fruit Juice
            BERRIES_JUICE = "It must have taken a lot of cranberries to make a bottle.", -- Berry Juice
            POMEGRANATE_JUICE = "It will stain your clothes red if you spill it.", -- Pomegranate Juice
            BANANA_JUICE = "If only I could share it with Abigail...", -- Banana Juice
            FIG_JUICE = "Tiny seeds are getting caught in my throat.", -- Fig Juice
            DRAGONJUICE = "Well, now it's juice.", -- Dragon Fruit Juice
            GLOWBERRYJUICE = "Will my body glow blue?", -- Glowberry Juice
            WATERMELON_JUICE = "It's as watery as water itself.", -- Watermelon Juice

            VEGGIE_TEA = "I mixed vegetables and boiled them.", -- Green Tea (Vegetable Tea)
            CARROT_TEA = "I steeped carrots in water.", -- Carrot Tea
            CACTUS_TEA = "Drowned to the point of needing water.", -- Cactus Tea
            TOMATO_JUICE = "It's thicker than water but what I want to drink is just water.", -- Tomato Juice
            LUMPY_TEA = "I can't extract any more roots.", -- Root Tea
            SEAWEED_SHAKE = "I can't understand the foreign words.", -- Seaweed Shake

            GREENTEA = "I'm not sure if I can call this tea.", -- Fresh Leaf Green Tea
            BLACKTEA = "A short break for weary souls...", -- Black Tea (Jane Austen / Pride and Prejudice)
            BLACKTEA_ICED = "A short break for weary souls...", -- Iced Black Tea
            FUER = "A hat salesman for non-birthday days.", -- Fuertea, Leaf Tea, Fern Tea (Alice's Adventures in Wonderland)
            MIXFLOWER = "I gathered petals and boiled them.", -- Mixed Flower Petal Tea
            HIBISCUSTEA = "It's quite tangy.", -- Hibiscus Tea
            CACTUSFLOWER_TEA = "Even though it's boiled, it's still pretty. Jealous?", -- Cactus Flower Tea
            LOTUSTEA = "Calm has taken root even amidst suffering.", -- Lotus Tea
            SUSHIBISCUS = "If only I could spend some time with Abigail...", -- Suicide Tea
            MOON_BLOSSOM_TEA = "I can't be any more beautiful.", -- Moon Blossom Tea

            CAFFEINBERRY_JUICE = "Dark and bitter.", -- Black Coffee
            TOFFEE_LATTE = "It's so sweet that I can't taste the coffee.", -- Toffeenut Latte
            RUINCHA_LATTE = "Coffee for adults who can't drink bitter things.", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "I've missed warm cocoa.", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "A whirlpool of sweetness.", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "Did I and my heart roll down the stairs?", -- Chocolatl (Spicy)
            TEA_RUINCOLATE_LATTE = "It's bitter but also sweet.", -- Matcha Latte

            MULLED = "Can I melt down a cold and shattered heart?", -- Bancha (Mulled)
            BUTTERBEER = "As sweet as magic.", -- Butterbeer (Harry Potter series)

            -- Collaborative Teapot Drinks

            COCONUT_JUICE = "If only I could strengthen my inner self again.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "It's a beautiful death in a cup.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "A fitting death for a fool.", -- Shipwrecked Fool's Goldfish Shake
            CHERRY_ROSEBERRIES_TEA = "I'll be careful not to swallow the flower buds.", -- Cherry Forest Rose Hip Tea
            CHERRY_HONEY_TEA = "Can it get any sweeter than this?", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "There's something chewy in it.", -- Vita-Hybiscus Sikhye
            PINEANANAS_JUICE = "I tore through the tough skin and mashed the pulp.", -- Legacy Pineapple Juice
            ORANGE_JUICE = "Tangy and sweet fruit juice.", -- Moer Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "A drink made by crushing strawberries with ice.", -- Moer Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Smoothly wraps around the tip of your tongue.", -- Moer Food Pack Strawberry Smoothie Latte

            -- Brewing Drinks

            SPOILED_DRINK = "Can it get any worse than this?", -- Spoiled Drink

            -- Soda Machine

            SODA = "It's fizzing.", -- Carbonated Water
            FRUITSODA = "Soda with fruit juice.", -- Fruit Soda
            LEMONLIMESODA = "Excessively sweet carbonated beverage.", -- Lemon Lime Soda (Superior to Fruit Soda)
            COLA = "A dark, sweet substance that dominates many people.", -- Cola
            COLAQUANTUM = "The new black drink even emits light.", -- Cola Quantum
            LUMPY_BEER = "It seems to suit my taste.", -- Root Beer (Not alcoholic)

            -- Distilled Spirits

            CORN_BEER = "Bitter beer with lots of foam.", -- Corn Beer
            MADHU = "How much honey did I have to steal?", -- Bee's Honey Wine
            WINE = "As red and dark as blood.", -- Wine (Berry Brewing)
            NOBLEWINE = "Made from fruits with a high fever.", -- Noble Wine (Baked Berry Brewing)
            SPARKLINGWINE = "It's suppressing my insides with a small cork stopper.", -- Sparkling Wine
            GLOWBERRYWINE = "Did glowing spirits visit it inside the alcohol?", -- Glow Berry Wine
            KUMIS = "It's a pity for the young ones.", -- Kumis, Fermented Horse Milk
            LUMPY_WINE = "It's transparent and slightly mustard-colored.", -- Soju (Root Brewing)
            PULQUE = "All the prideful needles have melted away.", -- Pulque (Saminju)
            RUINCACAO_WINE = "It's in trouble if it gets any sweeter.", -- Cacao Wine

            -- Collaborative Soda

            CHERRY_DOCTOR_COLA = "I'm not a real doctor, but it might provide momentary comfort.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Tangy and sweet soda.", -- Carbonated Pineapple (Orangina)
            ORANGESODA = "Carbonated beverage with squeezed orange juice.", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Carbonated beverage with crushed strawberries.", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Distilled Spirits

            AUROBOW = "It's a rainbow of death.", -- Shipwrecked Aurobou, Rainbow Jelly Wine
            COCONUT_WINE = "Subtly sweet like me.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Did it want to enjoy the ephemeral beauty a little longer?", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Wine with an explosive aroma.", -- Boom Berry Wine (Explodes when lit)
            RICE_WINE = "Rice-made alcohol.", -- Vita-Hybiscus Makgeolli
            WHEAT_BEER = "You can't taste the sweetness of grains.", -- Heap of Food Wheat Beer
            PALE_BEER = "Pale like its name suggests.", -- Legacy Pale Ale (Green beer made with Monstra Fruit)

            -- Distilled Spirits

            DISINFECTANT = "It only turns wounds into wastelands by burning them hot.", -- Disinfectant
            CORN_WHISKEY = "It's just a poison that slowly kills people.", -- Corn Whiskey
            LUMPY_VODKA = "It will burn my throat.", -- Vodka
            TEQUILA = "Rough and toxic.", -- Tequila
            MADHU_RUM = "It will slowly drown itself without even knowing.", -- Rum
            BERRY_BRANDY = "It will make you forget even the act of wanting to forget.", -- Berry Brandy
            AREUHI = "Even without lactose, it must be painful.", -- Kumis Distilled Spirits Areuhi

            -- Exclusive Distilled Spirits for Warly

            BERRY_GIN = "I've never seen it used as medicine.", -- Gin
            GLOWBERRY_GIN = "It seduces people with its blue light.", -- Glow Berry Gin
            ABSINTHE = "A woman in green clothes disguised as a serpent.", -- Absinthe (The Chronicles of Narnia)
            TEA_LUMPY_VODKA = "It won't make you healthier.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "It seduces with the scent of flowers.", -- Rose Petal Brandy
            KAHLUA = "It smells like strongly concentrated coffee.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "If you have a peanut allergy, it will be perfect.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "It has a sweet scent.", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Give this drink to suffering children.", -- Rumchata (Mix of Rum and Horchata)

            -- Collaborative Distilled Spirits

            MOONWAY = "A rainbow of death.", -- Rainbow Jelly Wine Distilled Spirits
            ARRACK = "Palm wine distilled into alcohol.", -- Arrack (Indonesian version of Coconut Wine Distilled Spirits)
            CHERRY_BLOOM_RUM = "It's better to look at it than to drink it.", -- Cherry Honey Wine Distilled Spirits with Cherry Blossom Petals Floating
            RICE_SPIRITS = "It's alcohol disguised as water.", -- Makgeolli
            WHEAT_WHISKEY = "It's just a poison that slowly kills people.", -- Wheat Whiskey
            PALE_WHISKEY = "The pale knight watches over those who drink it.", -- Pale Malt Whiskey

            -- Exclusive Collaborative Distilled Spirits for Warly

            NUT_COCONUT_BRANDY = "Without a doubt, I'm going in unknowingly into the mouth of death...", -- Coconut Brandy (Renamed as Caribbean Brandy since I can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "It has a destructive charm.", -- Boom Berry Sapphire (Explodes when lit)

            -- Pot Cooking

            DARK_RUINCOLATE = "As bitter and dark as my life.", -- Dark Chocolate
            WHITE_RUINCOLATE = "If only I could share this sweetness with Abigail...", -- White Chocolate
            RUINCOLATE = "Edible black fuel.", -- Just Chocolate
            RUIN_SCHOKAKOLA = "I've put everything to wake me up.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Strong but heartless.", -- Empty steel bucket
                FULL = "Filled with rainwater.", -- Clean rainwater inside
                FULL_ICE = "It's frozen solid.", -- Rainwater has frozen
                DIRTY = "Filled with life-rich toxic water.", -- Rainwater has become dirty
                DIRTY_ICE = "Freezing won't make it clean.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "A wooden chunk emptied by death.", -- Empty wooden bucket
                FULL = "Filled with rainwater.", -- Clean rainwater inside
                FULL_ICE = "It's frozen solid.", -- Rainwater has frozen
                DIRTY = "Filled with life-rich toxic water.", -- Rainwater has become dirty
                DIRTY_ICE = "Freezing won't make it clean.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Just an empty bucket.", -- Empty wooden bucket
                FULL = "Filled with rainwater.", -- Clean rainwater inside
                FULL_ICE = "It's frozen solid.", -- Rainwater has frozen
                DIRTY = "Filled with life-rich toxic water.", -- Rainwater has become dirty
                DIRTY_ICE = "Freezing won't make it clean.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Only the sound of emptiness is heard.", -- No water in the desalinator
                PURIFY_LONG = "It's just started to filter the salt.", -- A lot of time left until purification is complete
                PURIFY_SHORT = "The water has become quite fresh.", -- Purification is almost done
                HASWATER = "The clean water is ready.", -- Clean water is in the desalinator
                BURNT = "Only the smell of burnt salt remains.", -- The desalinator has burned
                HASSALT = "Filtering salt with salt, it seems.", -- There is salt left in the desalinator
            },

            BARREL =
            {
                GENERIC = "I'll store my water in it.", -- Examining a barrel
                BURNT = "My throat will soon burn too.", -- The barrel has burned
            },

            BREWERY =
            {
                EMPTY = "It only makes ingredients more palatable.", -- Examining a brewery
                BURNT = "Only a stench remains.", -- The brewery has burned
                FERMENTING_LONG = "It'll probably take a while.", -- A lot of time left until brewing is complete
                FERMENTING_SHORT = "It needs a bit more time to ferment.", -- Brewing is almost done
                DONE = "Another task completed.", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "A handled kettle.", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "I can draw water from a pond with it.", -- Empty portable kettle on a fire pit
                BOILING_LONG = "The water is lukewarm.", -- It's started boiling
                BOILING_SHORT = "I need to boil it a bit more.", -- The water is almost boiled
                DONE = "I've extended its life a bit.", -- Clean water obtained
                STOP = "It's not boiled enough yet.", -- The water isn't boiling due to a lack of fire
            },

            CAMPDESALINATOR_ITEM = "I have to carry it reluctantly.", -- Examining the portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "I can obtain seawater with it.", -- No water in the desalinator
                BOILING_LONG = "Most of it is seawater.", -- It's started boiling
                BOILING_SHORT = "A lot of clean water has accumulated.", -- It's almost boiled
                DONE = "I've extended its life a bit.", -- Clean water obtained
                STOP = "It's not boiled enough yet.", -- The saltwater isn't being purified due to a lack of fire
            },

            KETTLE =
            {
                EMPTY = "As dry as my eyeballs.", -- Examining an empty kettle
                BURNT = "It's been scorched.", -- The kettle has burned
                BOILING_LONG = "It doesn't matter what's inside; it's still alive.", -- It's just started making a drink
                BOILING_SHORT = "It needs a bit more time to cook.", -- It's almost done cooking a drink
                DONE = "I can finally wet my whistle.", -- A drink is ready
                PURIFY_LONG = "The water is still lukewarm.", -- It's just started boiling dirty water
                PURIFY_SHORT = "I need to boil it a bit more.", -- It's almost done boiling dirty water
                HASWATER = "Shall I gather ingredients for a drink?", -- Clean water is inside
                MELT_LONG = "It's still frozen.", -- It's just started melting ice water
                MELT_SHORT = "I need to boil it a bit more to melt it.", -- It's almost done melting ice water
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "For when my throat is parched.", -- Examining the portable kettle item
                EMPTY = "As dry as my eyeballs.", -- Examining an empty placed portable kettle
                BOILING_LONG = "It doesn't matter what's inside; it's still alive.", -- It's just started making a drink
                BOILING_SHORT = "It needs a bit more time to cook.", -- It's almost done cooking a drink
                DONE = "I can finally wet my whistle.", -- A drink is ready
                PURIFY_LONG = "The water is still lukewarm.", -- It's just started boiling dirty water
                PURIFY_SHORT = "I need to boil it a bit more.", -- It's almost done boiling dirty water
                HASWATER = "Shall I gather ingredients for a drink?", -- Clean water is inside
                MELT_LONG = "It's still frozen.", -- It's just started melting ice water
                MELT_SHORT = "I need to boil it a bit more to melt it.", -- It's almost done melting ice water
            },

            DISTILLERS =
            {
                EMPTY = "The machine consumes alcohol, and alcohol consumes people.", -- Examining a distiller
                DISTILLTING_LONG = "It probably takes a while.", -- A lot of time left until distillation is complete
                DISTILLING_SHORT = "I need to wait a bit more.", -- Distillation is almost done
                DONE = "Another task completed.", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "It's pumping vigorously.", -- Maximum pressure
                MIDDLE_PRESSURE = "It will expel water in response to movement.", -- Medium pressure
                LOW_PRESSURE = "It seems there's an arrhythmia.", -- Almost no pressure
                RECHARG_PRESSURE = "The heart has stopped.", -- No pressure at all (can't use it until pressure is at maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "It can be operated again with fuel.", -- Examining a well sprinkler with low fuel
                ON = "It stole my job.", -- It's operating
                OFF = "It has stopped working.", -- Examining a turned-off well sprinkler
            },
        },
}