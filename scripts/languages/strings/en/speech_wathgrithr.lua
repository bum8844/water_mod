return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Let's clear the existing bucket first.", -- Trying to give a bucket when the well already has one
            WELL_BUSY = "Have patience, the bucket is still in the well.", -- Trying to give a bucket when the well still contains one
        }
    },

        ANNOUNCE_DRUNK = "Did I lose in the drinking game? Hiccup.", -- Drunk
        ANNOUNCE_DRUNK_END = "Am I still at Egir's banquet?", -- Sobers up from being drunk (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "Hahaha! One more drink!", -- Temporary. Exclusive to Wigfrid.
        ANNOUNCE_NOTCHARGE = "It seems the lightning goat is not ready for charging, so I can't milk it with a bucket.", -- Trying to milk the lightning goat with a bucket when it's not charged
        ANNOUNCE_NOTHIRSTSLEEP = "If I sleep like this, I'll be thirsty all night! I should drink some water first.", -- Trying to sleep at night when thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "How can I rest like this when my throat is so dry!", -- Trying to rest during the day when thirsty
        ANNOUNCE_SLEEP_END = "I feel refreshed!", -- Wakes up after sleeping and completely sobers up
        ANNOUNCE_THIRST = "I wish I could join the banquet now.", -- Very thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "No one can catch up with my pace now!", -- Caffeine buff starts
        ANNOUNCE_CAFFINE_BUFF_STOP = "I'm back to my usual pace.", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "Next time, I should drink purified water to avoid getting sick in battles.", -- Announcing curing waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Thor, I can drink all day!", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "I feel the fear fading away!", -- Beginning to get drunk

        DESCRIBE =
        {
            BOILBOOK = "How many recipes for the banquet are written in this book?",

            WATER_CLEAN_ICE = "It's frozen solid.", -- Clean ice
            WATER_DIRTY_ICE = "Ice with impurities.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "A powder that adds battle excitement to my feast.", -- Pepper spice

            WELL_KIT = "I'll gladly install a well.", -- Well kit
            WELL_SPRINKLER_KIT = "A machine that showers rain without clouds.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Machines will plunder the underground world.", -- Steam water pump kit
            WELL_BURYING_KIT = "Let's make sure no one steps on this.", -- Hole burying kit
            WELL_DRILLING = "Push it all the way to the Styx!", -- Drilling a hole with a drill
            WELL_DRILLING_ITEM = "A mighty tool to bore a path to the underground world.", -- Drill item
            HOLE = "I can hear water down there.", -- Well hole
            WELL = "A well for the thirsty.", -- Well

            WX78MODULE_NONEDRUNK = "These boons shall empower our metal warrior.", -- 78전용 묘듈

            -- Waterlogged plants

            TEA_TREE = "A fragrant shrub.", -- Tea tree
            DUG_TEA_TREE = "I hope it returns to the Earth goddess.", -- Tea tree dug up
            TEA_SEED = "This young tree is wrapped in red cloth.", -- Tea tree seed
            TEA_SEED_COOKED = "The young tree has been cooked.", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Grow strong, young tree!", -- Tea tree sapling
            TEALEAVES = "A bunch of fragrant leaves.", -- Tea leaves
            TEALEAVES_DRIED = "A handful of dried tea leaves.", -- Dried tea leaves

            CAFFEINBERRY = "A thicket bearing beans of vitality.", -- Coffee thicket
            DUG_CAFFEINBERRY = "Let's go together.", -- Dug coffee thicket
            CAFFEINBERRY_BEAN = "It needs to be roasted until it turns black.", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "A bean with an overflowing vitality.", -- Cooked coffee bean

            RUINCACAO_TREE = "A tree from the age of darkness.", -- Cacao tree
            DUG_RUINCACAO_TREE = "I hope it returns to the Earth goddess.", -- Dug cacao tree
            RUINCACAO_SEED = "It overcame fear and bloomed into a flower.", -- Cacao seedling item
            RUINCACAO_SEED_SAPLING = "It has cast off its fear. Grow, young tree!", -- Cacao seedling planted
            RUINCACAO = "Are young trees waiting to be burned?", -- Cacao pod before smashing
            RUINCACAO_BEAN = "It's oozing with oil.", -- Smashed cacao bean
            RUINCACAO_BEAN_COOKED = "The young trees have been cooked.", -- Cooked cacao bean

            -- Distillery additives

            ADDITIVE_SEED = "It will elevate the quality of the feast spirits.", -- Seed herbs (Anise, Juniper Berry, Star of Motif) additive for liqueurs
            ADDITIVE_PETALS = "Gifts from Freya, it seems.", -- Herb, tea leaves, and flower petals additive for liqueurs
            ADDITIVE_NUT = "Young trees have gathered here.", -- Birch Nut, Coconut, Coffee Bean, Cacao Bean additive for liqueurs
            ADDITIVE_DAIRY = "Are we putting dairy in alcohol?", -- Dairy additive for liqueurs

            -- Beverages

            WATER_CLEAN = "Pure water.", -- Clean water
            WATER_DIRTY = "Wild, untamed water.", -- Dirty water
            WATER_SALTY = "A cup of seawater.", -- Seawater

            GOOPYDRINK = "It's mostly food scraps.", -- Failed drink (concept of wet grilling)

            -- Teapot beverages

            FRUITJUICE = "I'll consume only the water of this drink.", -- Mixed fruit juice
            BERRIES_JUICE = "It emits a scent of red fruits.", -- Berry juice
            POMEGRANATE_JUICE = "I should think of it as the blood of the fruit.", -- Pomegranate juice
            BANANA_JUICE = "Monkey's juice, it seems.", -- Banana juice
            FIG_JUICE = "There's an excessive amount of fruit here.", -- Fig juice
            DRAGONJUICE = "Full of white fruit.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Let's pretend it's water from a glowing spring.", -- Glowberry juice
            WATERMELON_JUICE = "This is water, not fruit juice.", -- Watermelon juice

            VEGGIE_TEA = "Do I really have to drink this?", -- Vegetable juice
            CARROT_TEA = "How can warriors serve rabbit food like this!", -- Carrot tea
            CACTUS_TEA = "Alright, let's think of it as a tribute to the blade grass.", -- Cactus tea
            TOMATO_JUICE = "I'll consume only the water of this vegetable.", -- Tomato juice
            LUMPY_TEA = "Let's think of it as the essence of root vegetables in water.", -- Root tea
            SEAWEED_SHAKE = "Dreadful. Absolutely dreadful!", -- Seaweed shake

            GREENTEA = "It's just... leaf-flavored water.", -- Fresh leaf green tea
            BLACKTEA = "I have no time for leisurely gatherings.", -- Black tea
            BLACKTEA_ICED = "This one's cold.", -- Iced black tea
            FUER = "It's just a little bit of fern!", -- Bohee tea, leaf tea, fern tea
            MIXFLOWER = "Freya's blessings are contained within.", -- Mixed flower petal tea
            HIBISCUSTEA = "The flower is shedding tears.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "I'll drink the water, but not the flower.", -- Cactus flower tea
            LOTUSTEA = "Give me fish! Fish!!", -- Lotus flower tea
            SUSHIBISCUS = "This drink is undoubtedly cursed.", -- Suicide tea
            MOON_BLOSSOM_TEA = "Indeed, it contains Mani's blessings.", -- Moonflower tea

            CAFFEINBERRY_JUICE = "It's bitter, and my heart is racing.", -- Black coffee
            TOFFEE_LATTE = "It's sweet and nutty.", -- Toffee nut latte
            RUINCHA_LATTE = "My mind is awakening.", -- Mocha latte (Coffee + Chocolate)

            HOTRUINCOLATE = "It warms the soul.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Is this the drink of frost giants?", -- Chocolate smoothie (Cold)
            RUINXOCOLATL = "A drink of ancient warriors.", -- Chocolatl (Spicy)
            TEA_RUINCOLATE_LATTE = "It awakens my soul.", -- Matcha chocolate latte

            MULLED = "It will give respite to weary souls.", -- Bhang
            BUTTERBEER = "The courage of young wizards is high.", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "It's filled with soft flesh.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "It contains Freya's blessing!", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "I'll gladly drink this!", -- Shipwrecked Cratered Moonrock Shake
            CHERRY_ROSEBERRIES_TEA = "Must I drink a beverage with such vile fruits?", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "This is truly exquisite honeywater.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Doesn't this contain seeds?", -- Vita-Hybiscus Sweet Rice Punch
            PINEANANAS_JUICE = "It has crushed the tough scales to get the flesh.", -- Reign of Giants Pineananas Juice
            ORANGE_JUICE = "Is it asking me to drink its tart juice?", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "A cold, red, fruit concoction.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "A pink, fruity concoction.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Time has given this drink not wisdom but repulsiveness.", -- Spoiled Drink

            -- Distillery Soda

            SODA = "Spring water soda.", -- Carbonated Water
            FRUITSODA = "It's like fruit punch.", -- Fruit Punch Soda
            LEMONLIMESODA = "It's not a drink worthy of a warrior.", -- Lemon Lime Soda (Superior version of Fruit Soda)
            COLA = "It's as seductive as darkness itself.", -- Cola
            COLAQUANTUM = "It makes my heart beat faster!", -- Quantum Cola
            LUMPY_BEER = "It's infused with a variety of scents.", -- Root Beer (Not alcoholic)

            -- Distillery Spirits

            ORN_BEER = "It's an imitation of the fake German beer.", -- Corn Beer
            MADHU = "It's Xiye's honey wine!", -- Mead
            WINE = "It's made from the prophet's blood.", -- Wine (Basic berry brew)
            NOBLEWINE = "Where's the accompanying meat?", -- Noble Wine (Cooked berry brew)
            SPARKLINGWINE = "This is not a celebratory drink for warriors.", -- Sparkling Wine
            GLOWBERRYWINE = "It's like Kvasir's blood.", -- Glow Berry Wine
            KUMIS = "May gods help us, making alcohol from milk?", -- Kumis, fermented yak milk
            LUMPY_WINE = "It won't satisfy my thirst.", -- Mead with Potatoes, Sweet Potatoes, or Roots
            PULQUE = "It's Maya-Uh's blood!", -- Pulque (Agave brew)
            RUINCACAO_WINE = "Is this the wine of the Toltecs?", -- Cacao Wine

            -- Collaboration Soda

            CHERRY_DOCTOR_COLA = "It's a repulsive crimson chaos.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Whether it's pinecones or fruit, it's not right.", -- Pineapple Soda (Orang-Soda)
            ORANGESODA = "It's spring water with a tangy fruit flavor.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "This soda isn't fit for warriors.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "It glimmers beautifully!", -- Shipwrecked Oroborou, Rainbow Jelly Spirits
            COCONUT_WINE = "The scent of palm oil is thick.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "A visually pleasing and delicious drink.", -- Cherry Forest Cherry Blossom Mead
            GIANT_BLUEBERRY_WINE = "It's a powerful drink!", -- Vita-Hybiscus Boom! Berry Sapphire (Explodes when ignited)
            RICE_WINE = "It's as clear as can be!", -- Vita-Hybiscus Makgeolli
            WHEAT_BEER = "It's also beer, right?", -- Hip of Food Wheat Beer
            PALE_BEER = "Is this also beer?", -- Reign of Giants Pale Ale (Turquoise beer made from Monsterlas)

            -- Distillery Liquors

            DISINFECTANT = "It will cleanse wounds and heal them!", -- Disinfectant
            CORN_WHISKEY = "It's sweet and aromatic.", -- Corn Whiskey
            LUMPY_VODKA = "I declare, I shall drink this like water.", -- Vodka
            TEQUILA = "It's a rough and wild drink!", -- Tequila
            MADHU_RUM = "Vikings did not drink such.", -- Rum
            BERRY_BRANDY = "This is the liquor of haughty nobles.", -- Berry Brandy
            AREUHI = "It's not as bad as I thought.", -- Kumis, fermented mare's milk

            -- Warly Exclusive Distillery Spirits

            BERRY_GIN = "It's a mild drink when consumed sparingly, but becomes a bad one if consumed excessively.", -- Gin
            GLOWBERRY_GIN = "It's a drink blessed by Balder's.", -- Glow Berry Gin
            ABSINTHE = "It has a refreshing scent!", -- Absinthe
            TEA_LUMPY_VODKA = "The scent of tea leaves emanates from the liquor.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Warriors have no time to enjoy the scent of flowers.", -- Rose Petal Brandy
            KAHLUA = "As a warrior, this drink is too sweet for me.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "The scent of nuts is prominent.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Is this for children?", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "I prefer to drink alcohol and milk separately.", -- Rumchata (Mixture of rum and dairy)

            -- Collaboration Distillery Spirits

            MOONWAY = "It's the essence of light!", -- Shipwrecked Rainbow Jelly Spirits Distilled
            ARRACK = "I can sense the scenery of palm trees.", -- Arrack, Indonesian version of Coconut Wine Distilled
            CHERRY_BLOOM_RUM = "It captures the essence of grandeur.", -- Cherry Blossom Honey Rum Distilled, Cherry Blossom Petals Floating Drink
            RICE_SPIRITS = "It's clear and refreshing!", -- Soju
            WHEAT_WHISKEY = "It's sweet and aromatic.", -- Wheat Whiskey
            PALE_WHISKEY = "It has a rough and bitter scent.", -- Pale Malt Whiskey

            -- Warly's Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "Vikings are warriors and explorers, not pirates.", -- Coconut Brandy (Renamed to Caribbean Brandy since you can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "Overwhelming power!", -- Boom Berry Sapphire (Explodes like a carrot)

            -- Pot Cooking

            DARK_RUINCOLATE = "Can my comrade make Samiaki as well?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Vikings do not enjoy such sweet snacks.", -- White Chocolate
            RUINCOLATE = "It's an acceptable ration.", -- Just Chocolate
            RUIN_SCHOKAKOLA = "It stirs the excitement of the battlefield.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "It's an iron bucket.", -- Empty iron bucket
                FULL = "It's filled with clean water.", -- Clean rainwater is inside
                FULL_ICE = "It has frozen into perfume.", -- The rainwater has frozen
                DIRTY = "It's dirty.", -- The rainwater has become dirty
                DIRTY_ICE = "It has turned into a dirty lump.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "You've emptied the wooden log skillfully.", -- Empty wooden log bucket
                FULL = "It's filled with clean water.", -- Clean rainwater is inside
                FULL_ICE = "It has frozen into perfume.", -- The rainwater has frozen
                DIRTY = "It's dirty.", -- The rainwater has become dirty
                DIRTY_ICE = "It has turned into a dirty lump.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "It's an empty wooden bucket.", -- Empty wooden bucket
                FULL = "It's filled with clean water.", -- Clean rainwater is inside
                FULL_ICE = "It has frozen into perfume.", -- The rainwater has frozen
                DIRTY = "It's dirty.", -- The rainwater has become dirty
                DIRTY_ICE = "It has turned into a dirty lump.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "It's completely empty.", -- There's no water in the desalinator
                PURIFY_LONG = "It's better to do something else while waiting.", -- There's still a lot of purification left
                PURIFY_SHORT = "It's quite refreshing now.", -- Purification is almost done
                HASWATER = "It's full of spring water.", -- There's clean water in the desalinator
                BURNT = "It has been swallowed by flames.", -- The desalinator has burned down
                HASSALT = "There's too much mineral in it.", -- There's still salt in the desalinator
            },

            BARREL =
            {
                GENERIC = "It will hold my water.", -- Examining the barrel
                BURNT = "It couldn't escape Logi's touch.", -- The barrel has burned down
            },

            BREWERY =
            {
                EMPTY = "I declare that I will make punch with vegetables and fruits here.", -- Examining the brewery
                BURNT = "Crying over dried-up spirits is useless.", -- The brewery has burned down
                FERMENTING_LONG = "It's better to do something else while waiting.", -- There's still a lot of fermentation left
                FERMENTING_SHORT = "Time to prepare for the party!", -- Fermentation is almost done
                DONE = "Is the punch ready for the party?", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "It's a makeshift kettle.", -- Examining the portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "It's empty.", -- There's no water in the makeshift kettle on the campfire
                BOILING_LONG = "Let's be patient; it's not boiling yet.", -- Water is starting to boil
                BOILING_SHORT = "It won't take long.", -- Water is almost boiling
                DONE = "Now it's ready to drink.", -- Clean water is obtained
                STOP = "You need to light the firewood first.", -- The lack of fire in the campfire prevents dirty water from boiling
            },

            CAMPDESALINATOR_ITEM = "It's a pot that converts seawater into spring water.", -- Examining the portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "The pot seems to be in a drought.", -- No water
                BOILING_LONG = "The seawater turns into clouds.", -- Water is starting to boil
                BOILING_SHORT = "It's raining inside the pot!", -- Water is almost boiling
                DONE = "It's full of spring water.", -- Clean water is obtained
                STOP = "You need to light the firewood first.", -- The lack of fire in the campfire prevents saltwater from purifying
            },

            KETTLE =
            {
                EMPTY = "It won't make a meat stew.", -- Examining an empty kettle
                BURNT = "It has been swallowed by flames.", -- The kettle has burned down
                BOILING_LONG = "Let's not wait and do something else.", -- The process of making a drink has just started
                BOILING_SHORT = "Tea is almost ready.", -- The drink is almost ready
                DONE = "The tea is ready.", -- The drink is ready
                PURIFY_LONG = "Let's be patient; it's not boiling yet.", -- The process of boiling dirty water has just started
                PURIFY_SHORT = "It won't take long.", -- The dirty water is almost ready
                HASWATER = "It's full of spring water.", -- There's clean water in the kettle
                MELT_LONG = "It's still quite cold.", -- The process of melting ice water has just started
                MELT_SHORT = "The spring water is almost ready.", -- The ice water is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "The battlefield is not the place for a banquet.", -- Examining the portable kettle item
                EMPTY = "There's no place for meat.", -- Examining an empty placed portable kettle
                BOILING_LONG = "It's better to find my enemies instead of making a drink.", -- The process of making a drink has just started
                BOILING_SHORT = "The drink is almost ready.", -- The drink is almost ready
                DONE = "Let's drink quickly and go to battle.", -- The drink is ready
                PURIFY_LONG = "Let's be patient; it's not boiling yet", -- The process of boiling dirty water has just started
                PURIFY_SHORT = "It won't take long.", -- The dirty water is almost ready
                HASWATER = "A warrior has no time for a banquet; let's remove the water.", -- There's clean water in the portable kettle
                MELT_LONG = "It's still quite cold.", -- The process of melting ice water has just started
                MELT_SHORT = "The spring water is almost ready.", -- The ice water is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "It could be called Hymir's cauldron!", -- Examining the distiller
                DISTILLTING_LONG = "The mood is dropping... Hurry up, cauldron!", -- There's still a lot of distillation left
                DISTILLING_SHORT = "It will be done in no time!", -- Distillation is almost done
                DONE = "Is there strong alcohol?", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Its power is comparable to that of giants.", -- Maximum pressure
                MIDDLE_PRESSURE = "The machine is working hard.", -- Medium pressure
                LOW_PRESSURE = "The machine lacks power.", -- Low pressure
                RECHARG_PRESSURE = "The machine is resting.", -- No pressure (cannot be used until it reaches maximum pressure)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Fuel is running out.", -- Examining the sprinkler with low fuel
                ON = "This rain comes from underground.", -- Sprinkler is active
                OFF = "Have you found a place to sprinkle the rain?", -- Sprinkler is off
            },
        },
    }

   