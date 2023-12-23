return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Duplicate input denied", -- Attempt to give a full bucket to a well
            WELL_BUSY = "Error: Device is busy", -- Attempt to give a filled bucket to a well (parody of "Printer is busy")
        }
    },

        ANNOUNCE_DRUNK = "WARNING: Output intoxicated", -- Drunk
        ANNOUNCE_DRUNK_END = "Chemical engine output stabilized", -- Sobered up a bit (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "Self-diagnosis: Chemical engine / Normal", -- Temporary. For Wigfrid only.
        ANNOUNCE_NOTCHARGE = "Charging required for this entity", -- Attempting to milk a Volt Goat with no charge
        ANNOUNCE_NOTHIRSTSLEEP = "Insufficient coolant for sleep mode", -- Trying to sleep at night with severe thirst
        ANNOUNCE_NOTHIRSTSIESTA = "Insufficient coolant for session freeze", -- Trying to siesta during the day with severe thirst
        ANNOUNCE_SLEEP_END = "Chemical engine output restored", -- Waking up and fully sober from drinking
        ANNOUNCE_THIRST = "Coolant replenishment required", -- Very thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "All core ratio limit: 49", -- Caffeine buff starts (ALL CORE RATIO LIMIT: 49)
        ANNOUNCE_CAFFINE_BUFF_STOP = "Core limit being reconfigured", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "Adjusting waterborne pH ratio", -- 78 is not actually used.

        ANNOUNCE_DCAPACITY_CRITICAL = "WARNING: Chemical engine output abnormal", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "Chemical engine output fluctuation detected", -- The drunkenness is kicking in

        DESCRIBE =
        {
            BOILBOOK = "A directory containing instructions on combining impurities in coolant.",

            WATER_CLEAN_ICE = "Frozen and trapped water. Hehe.", -- Clean ice water
            WATER_DIRTY_ICE = "Dirty and nasty.", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "Adds flavor to bland food.", -- Caffeine pepper spice

            WELL_KIT = "Requires a water source for installation.", -- Well kit
            WELL_SPRINKLER_KIT = "Use with caution.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "High-performance water pumping device.", -- Steam water pump kit
            WELL_BURYING_KIT = "Tools for filling holes.", -- Hole burial kit
            WELL_DRILLING = "Exploring water veins.", -- Drilling holes with a drill
            WELL_DRILLING_ITEM = "Device for water vein development.", -- Drill item (AFS: "A 'WELL'-DEVELOPING DEVICE"?)
            HOLE = "A hole for extracting water.", -- Well hole
            WELL = "A stable source of water.", -- Well

            -- Water Mode Plants

            TEA_TREE = "A continuous source of tea leaves.", -- Tea tree
            DUG_TEA_TREE = "Requires soil.", -- Dug-up tea tree
            TEA_SEED = "Source code package.", -- Tea tree seed
            TEA_SEED_COOKED = "Life activity suspended.", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "A tree in the early growth stage.", -- Tea tree sapling
            TEALEAVES = "Simple leaves.", -- Tea leaves (JUST A BUNCH OF LEAVES)
            TEALEAVES_DRIED = "Modified.", -- Dried tea leaves (IT IS MODIFIED)

            CAFFEINBERRY = "A lunar-mutated drinkable bean plant.", -- Caffeine berry bush (LUNAR-MUTATED DRINKABLE BEAN PLANT)
            DUG_CAFFEINBERRY = "Requires soil.", -- Dug-up caffeine berry bush
            CAFFEINBERRY_BEAN = "A drinkable bean.", -- Raw caffeine bean
            CAFFEINBERRY_BEAN_COOKED = "Optimized through heating.", -- Cooked caffeine bean (BEANS OPTIMIZED BY FIRE)

            RUINCACAO_TREE = "An unusual form of cocoa tree.", -- Cocoa tree
            DUG_RUINCACAO_TREE = "Requires soil.", -- Dug-up cocoa tree
            RUINCACAO_SEED = "Grow immediately to provide fruit.", -- Cocoa tree sapling item
            RUINCACAO_SEED_SAPLING = "With a trace of shadow and symbiosis.", -- Cocoa tree sapling planted
            RUINCACAO = "Requires some post-processing.", -- Pre-broken cocoa fruit
            RUINCACAO_BEAN = "Worth processing.", -- Cocoa bean after breaking
            RUINCACAO_SEED_COOKED = "Black beans roasted over fire.", -- Roasted cocoa beans

            -- Distillery Additives

            ADDITIVE_SEED = "Destruction of life is enjoyable.", -- Seed herbs (Anise, Juniper Berry, Octagon Motif) as additives for liqueurs
            ADDITIVE_PETALS = "Herbs for enhancing aroma.", -- Herbs, tea leaves, and flower petals as additives for liqueurs
            ADDITIVE_NUT = "Solid additive.", -- Nut additives for liqueurs (Birch Nut, Coconut, Coffee Bean, Cocoa Bean)
            ADDITIVE_DAIRY = "Do not put disgusting impurities in ethanol.", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "Standard coolant. Caution: Leakage.", -- Clean water
            WATER_DIRTY = "External purification device required.", -- Dirty water
            WATER_SALTY = "Corrodes the body.", -- Saltwater

            GOOPYDRINK = "Water turned into something terrible.", -- Failed drink (concept of wet roast)

            -- Kettle Drinks

            FRUITJUICE = "Energy pod mixture.", -- Mixed fruit juice
            BERRIES_JUICE = "Excellent source of sweetness.", -- Berry juice
            POMEGRANATE_JUICE = "The red liquid is reminiscent of blood.", -- Pomegranate juice
            BANANA_JUICE = "Not a dairy product.", -- Banana juice
            FIG_JUICE = "A fluid form of sustenance.", -- Fig juice
            DRAGONJUICE = "Liquid fiber.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Luminous fluid.", -- Glowberry juice
            WATERMELON_JUICE = "A drink with plenty of juice.", -- Watermelon juice

            VEGGIE_TEA = "Fluidized organics.", -- Vegetable juice
            CARROT_TEA = "Concentrated beta-carotene.", -- Carrot juice
            CACTUS_TEA = "Complete firewall neutralization.", -- Cactus juice (PROTECTIVE BARRIER NEUTRALIZED)
            TOMATO_JUICE = "Utterly crushed. Hehe.", -- Tomato juice (IT'S UTTERLY CRUSHED. HA HA)
            LUMPY_TEA = "Root access granted.", -- Root tea (ROOT PERMISSION GRANTED)
            SEAWEED_SHAKE = "50% sea, 50% grass.", -- Seaweed shake (AFS: SpongeBob reference, parody of an episode where plankton controls spongebob and says 50% evil)

            GREENTEA = "Just boiled leaves.", -- Raw green tea (IT IS JUST LEAF JUICE)
            BLACKTEA = "A red extract from black leaves. Contradictory.", -- Black tea (RED EXTRACT FROM BLACK LEAF. CONTRADICTION)
            BLACKTEA_ICED = "Enhanced cooling power.", -- Iced black tea
            FUER = "Extract from fresh leaves.", -- Fu'er, leaf tea, fern tea
            MIXFLOWER = "The taste of destroyed beauty.", -- Mixed flower petal tea
            HIBISCUSTEA = "A solution of intense sourness.", -- Hibiscus tea (CONCENTRATED SOURNESS SOLUTION)
            CACTUSFLOWER_TEA = "Juice from flesh!", -- Cactus flower tea (JUICE FROM FLESH!) (AFS: The cactus flower tea is green. This is a reference to Yichengunso's parody)
            LOTUSTEA = "Boiled water lily flowers into water.", -- Lotus tea
            SUSHIBISCUS = "Quite peculiar.", -- Suicidal tea
            MOON_BLOSSOM_TEA = "No longer capable of regeneration. Hehehe.",

            CAFFEINBERRY_JUICE = "Coolant for overclocking.", -- Black coffee
            TOFFEE_LATTE = "Bolt not included.", -- Toffee nut latte (BOLT NOT INCLUDED)
            RUINCHA_LATTE = "Mixed bean mixture.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Cocoa coolant.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "High-sugar cocoa coolant.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Sugar-free cocoa coolant.", -- Chocolatl (bitter)
            TEA_RUINCOLATE_LATTE = "Crushed tea leaves and bean extract.", -- Matcha latte

            MULLED = "Most ethanol lost.", -- Banchao (mulled wine)
            BUTTERBEER = "Non-alcoholic ethanol antifreeze.", -- Butterbeer (ETHANOL-FREE ETHANOL ANTIFREEZE)

            -- Collaborative Kettle Drinks

            COCONUT_JUICE = "Rich in electrolytes.", -- Cast Away Coconut Juice
            RAINBOW_SHAKE = "Radiates rainbow rays.", -- Cast Away Rainbow Jelly Shake
            QUARTZ_SHAKE = "Mix of land and sea organisms.", -- Cast Away Glitter Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "Fluid with a rose scent.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Attempted sweetness measurement: failed.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Warning: Excessive maltose content.", -- Vitahebok Sikhye (WARNING: CONTAINS EXCESSIVE AMOUNTS OF MALTOSE)
            PINEANANAS_JUICE = "Denies association with sponges.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Crushed for consumption.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Texture makes me uncomfortable.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Strawberries captured in form.", -- More Food Pack Strawberry Smoothie Latte

            -- Brewery Drinks

            SPOILED_DRINK = "Incompatible with cooling systems.", -- Spoiled Drink

            -- Brewery Soda

            SODA = "Carbon dioxide solution.", -- Carbonated Water (CO2 SOLUTION)
            FRUITSODA = "Carbon dioxide solution with added fructose.", -- Fruit Soda (CO2 SOLUTION WITH FRUCTOSE)
            LEMONLIMESODA = "Contains a large amount of citric acid.", -- Lemon Lime Soda (Fruit Soda upgrade)
            COLA = "Caramel liquid loved by foolish organisms.", -- Cola
            COLAQUANTUM = "Contains a large amount of radiation.", -- Quantum Cola
            LUMPY_BEER = "Incomprehensible obsession with carbonation by organisms.", -- Root Beer (not alcoholic)

            -- Brewery Spirits

            CORN_BEER = "Corn - Alcohol add-on installed.", -- Corn Beer
            MADHU = "Processed product of a day's work.", -- Madhu Honey Wine
            WINE = "Berries that have undergone an inefficient process.", -- Wine (basic berry brewing)
            NOBLEWINE = "Underwent one more brewing process.", -- Noble Wine (cooked berry brewing)
            SPARKLINGWINE = "Contains all the elements fatal to the digestive system.", -- Sparkling Wine
            GLOWBERRYWINE = "Self-illuminating alcohol.", -- Glow Berry Wine
            KUMIS = "'/d3d7d4' preserved.", -- Kumis, fermented mare's milk (Fermentation: d3d7d4 is a pale white color code)
            LUMPY_WINE = "Organisms' roots used for various purposes.", -- Sur Wine (potato, sweet potato, etc. root liquor)
            PULQUE = "When will the end of self-evolution of included microbes be?", -- Pulque (Agave wine)
            RUINCACAO_WINE = "Cacao. New possibilities discovered.", -- Cacao Wine

            -- Collaborative Soda

            CHERRY_DOCTOR_COLA = "Who created such a hybrid?", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Pine tuning used.", -- Carbonated Pineapple (Oranchi)
            ORANGESODA = "Produced to encourage the behavior of organisms.", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Evokes thoughts of a demon soul.", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Spirits

            AUROBOW = "Includes a playful add-on.", -- Cast Away Rainbow Jelly Wine
            COCONUT_WINE = "Lubricating oil turned into a drink.", -- Cast Away Coconut Wine
            CHERRY_BLOOM_MADHU = "Pre-made ethanol.", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Still dangerous.", -- Vitahebok Boom! Berry Sapphire (Explodes when ignited)
            RICE_WINE = "Byproduct processed.", -- Vitahebok Makgeolli (Rice wine)
            WHEAT_BEER = "Grain wastefulness.", -- Heap of Food Wheat Beer
            PALE_BEER = "Conventional immiscibility.", -- Legion Pale Ale (Uses Monstera fruit for the green color)

            -- Distilled Spirits

            DISINFECTANT = "Germicidal solution.", -- Disinfectant (ANTISEPTIC REPAIR AGENT)
            CORN_WHISKEY = "Higher concentration achieved.", -- Corn Whiskey
            LUMPY_VODKA = "Very high ethanol concentration.", -- Vodka
            TEQUILA = "Infrared and resonance of the sun.", -- Tequila
            MADHU_RUM = "Compatible with the environment on the stomach.", -- Rum
            BERRY_BRANDY = "Truly lengthy process.", -- Berry Brandy
            AREUHI = "P-type fluid.", -- Kumis Distilled Spirits (Fermentation: d3d7d4 is a pale white color code)

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "Popular in human society.", -- Gin
            GLOWBERRY_GIN = "Contains tremendous dynamic energy.", -- Glow Berry Gin (Explodes when ignited)
            ABSINTHE = "Makes you want to cut your ears.", -- Absinthe
            TEA_LUMPY_VODKA = "Abundant chlorophyll content.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Just like a diffuser.", -- Rose Petal Brandy
            KAHLUA = "High-energy function included.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "Where is the bolt?", -- Nut Whiskey (Kahlua)
            RUINCACAO_CREAM_LIQUEUR = "Disgusting tar and protein ethanol extract",
            RUMCHATA = "Why mix disgusting organics?",

            -- Collaborative Distilled Spirits

            MOONWAY = "Preserves luminescent organic matter.", -- Cast Away Rainbow Jelly Distilled Spirits
            ARRACK = "Highly fibrous ethanol.", -- Arrack (Indonesian version of Coconut Wine)
            CHERRY_BLOOM_RUM = "Unnecessary VFX included.", -- Cherry Blossom Honey Rum (Cherry petals floating)
            RICE_SPIRITS = "Byproduct remains.", -- Rice Spirits (Cheongju)
            WHEAT_WHISKEY = "Invested time and precious grains.", -- Wheat Whiskey
            PALE_WHISKEY = "American style.", -- Pale Malt Whiskey

            -- Warly Exclusive Collaborative Distilled Spirits

            NUT_COCONUT_BRANDY = "Exclusive to unpleasant marine organisms' byproducts.", -- Coconut Brandy (Renamed to Caribbean Brandy because Caribbean Rum could not be created)
            GIANT_BLUEBERRY_GIN = "Has tremendous kinetic energy.", -- Boom Berry Sapphire (Explodes when ignited)

            -- Pot Recipes

            DARK_RUINCOLATE = "Processed pure cacao mass.", -- Dark Chocolate
            WHITE_RUINCOLATE = "Contains 20% cocoa butter.", -- White Chocolate
            RUINCOLATE = "Processed cacao.", -- Just Chocolate
            RUIN_SCHOKAKOLA = "Solid fuel booster.", -- Chokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Advanced sturdiness.", -- Empty Steel Bucket (ADVANCED STURDINESS)
                FULL = "Even damn rain has its uses.", -- Clean Rainwater (EVEN DAMN RAIN HAS ITS USES)
                FULL_ICE = "Frozen.", -- Frozen Rainwater (IT IS FROZEN)
                DIRTY = "Contents corrupted.", -- Dirty Water (CONTENT CORRUPTED)
                DIRTY_ICE = "Filthy solid water.", -- Dirty Frozen Water (FILTHY SOLID WATER)
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "No integrity issue despite the rustic appearance.", -- Empty Wooden Bucket (NO INTEGRITY ISSUE DESPITE THE RUSTIC APPEARANCE)
                FULL = "Even damn rain has its uses.", -- Clean Rainwater (EVEN DAMN RAIN HAS ITS USES)
                FULL_ICE = "Frozen.", -- Frozen Rainwater (IT IS FROZEN)
                DIRTY = "Contents corrupted.", -- Dirty Water (CONTENT CORRUPTED)
                DIRTY_ICE = "Filthy solid water.", -- Dirty Frozen Water (FILTHY SOLID WATER)
            },

            BUCKET_EMPTY =
            {
                EMPTY = "It contains horrible water.", -- Empty Wooden Bucket (IT CONTAINS HORRIBLE WATER)
                FULL = "Even damn rain has its uses.", -- Clean Rainwater (EVEN DAMN RAIN HAS ITS USES)
                FULL_ICE = "Frozen.", -- Frozen Rainwater
                DIRTY = "Contents corrupted.", -- Dirty Water (CONTENT CORRUPTED)
                DIRTY_ICE = "Dirty and solid.", -- Dirty Frozen Water
            },

            DESALINATOR =
            {
                EMPTY = "Input required.", -- Desalinator (NO WATER)
                PURIFY_LONG = "Salt separation in progress.", -- Desalinator (LOTS OF TIME LEFT)
                PURIFY_SHORT = "Salt separation almost complete.", -- Desalinator (ALMOST DONE)
                HASWATER = "Desalination successful.", -- Desalinator (CLEAN WATER)
                BURNT = "Functionality lost.", -- Burnt Desalinator (OUT OF ORDER)
                HASSALT = "Salt removal needed.", -- Desalinator (SALT LEFT)
            },

            BARREL =
            {
                GENERIC = "External water storage device.", -- Barrel (EMPTY)
                BURNT = "Water.exe not responding.", -- Burnt Barrel
            },

            BREWERY =
            {
                EMPTY = "Microorganism incubator.", -- Brewery (EMPTY)
                BURNT = "Forced shutdown in progress.", -- Burnt Brewery (DEVICE SHUT DOWN)
                FERMENTING_LONG = "It will take a long time.", -- Brewery (LOTS OF TIME LEFT)
                FERMENTING_SHORT = "Almost done.", -- Brewery (ALMOST DONE)
                DONE = "Fermentation complete.", -- Brewery (INCUBATION COMPLETE)
            },

            CAMPKETTLE_ITEM = "Primitive method of purification.", -- Camp Kettle Item (PRIMITIVE METHOD OF PURIFICATION)
            CAMPKETTLE =
            {
                GENERIC = "Moisture replenishment needed.", -- Camp Kettle (NO WATER)
                BOILING_LONG = "It will take time.", -- Camp Kettle (STARTED BOILING)
                BOILING_SHORT = "Almost finished.", -- Camp Kettle (ALMOST DONE)
                DONE = "Purification complete.", -- Camp Kettle (PURIFICATION COMPLETE)
                STOP = "Heating required.", -- Camp Kettle (NO FIRE, CONTENT CORRUPTED)
            },

            CAMPDESALINATOR_ITEM = "Device for salt removal.", -- Camp Desalinator Item
            CAMPDESALINATOR =
            {
                GENERIC = "Saltwater replenishment needed.", -- Camp Desalinator (NO WATER)
                BOILING_LONG = "It will take time.", -- Camp Desalinator (STARTED BOILING)
                BOILING_SHORT = "Almost finished.", -- Camp Desalinator (ALMOST DONE)
                DONE = "Salt removal complete.", -- Camp Desalinator (PURIFICATION COMPLETE)
                STOP = "Heating required.", -- Camp Desalinator (NO FIRE, SALT LEFT)
            },

            KETTLE =
            {
                EMPTY = "Bestow purpose upon horrible water.", -- Empty Kettle (EMPTY)
                BURNT = "Kettle overheated.", -- Burnt Kettle
                BOILING_LONG = "It will take time.", -- Kettle (STARTED BOILING)
                BOILING_SHORT = "Almost finished.", -- Kettle (ALMOST DONE)
                DONE = "Coolant mixture complete.", -- Kettle (COOLANT MIXTURE COMPLETE)
                PURIFY_LONG = "Additional purification in progress.", -- Kettle (STARTED PURIFYING)
                PURIFY_SHORT = "Purification almost complete.", -- Kettle (ALMOST DONE)
                HASWATER = "Additional input required.", -- Kettle (CLEAN WATER)
                MELT_LONG = "Thawing in progress.", -- Kettle (STARTED MELTING)
                MELT_SHORT = "Thawing almost complete.", -- Kettle (ALMOST DONE)
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Nice to meet you, my brother.", -- Portable Kettle Item
                EMPTY = "Code 418: Teapot.", -- Installed Empty Portable Kettle (CODE 418: THIS IS A TEAPOT)
                BOILING_LONG = "It will take time.", -- Portable Kettle (STARTED BOILING)
                BOILING_SHORT = "Almost finished.", -- Portable Kettle (ALMOST DONE)
                DONE = "Coolant mixture complete.", -- Portable Kettle (COOLANT MIXTURE COMPLETE)
                PURIFY_LONG = "Additional purification in progress.", -- Portable Kettle (STARTED PURIFYING)
                PURIFY_SHORT = "Purification almost complete.", -- Portable Kettle (ALMOST DONE)
                HASWATER = "Additional input required.", -- Portable Kettle (CLEAN WATER)
                MELT_LONG = "Thawing in progress.", -- Portable Kettle (STARTED MELTING)
                MELT_SHORT = "Thawing almost complete.", -- Portable Kettle (ALMOST DONE)
            },

            DISTILLERS =
            {
                EMPTY = "Another great sibling.", -- Distillers (EMPTY)
                DISTILLTING_LONG = "It will take a long time.", -- Distillers (LOTS OF TIME LEFT)
                DISTILLING_SHORT = "Almost done.", -- Distillers (ALMOST DONE)
                DONE = "Distillation process complete.", -- Distillers (INCUBATION COMPLETE)
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Maximum remaining pressure.", -- Well Water Pump (MAXIMUM PRESSURE)
                MIDDLE_PRESSURE = "Pressure at an adequate level.", -- Well Water Pump (MIDDLE PRESSURE)
                LOW_PRESSURE = "Low remaining pressure.", -- Well Water Pump (LOW PRESSURE)
                RECHARG_PRESSURE = "Time needed to restore pressure.", -- Well Water Pump (OUT OF ORDER)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Do I need to supply fuel to the danger molecule?", -- Well Sprinkler (LOW FUEL)
                ON = "Aaaah!", -- Well Sprinkler (RUNNING)
                OFF = "Keep watching.", -- Well Sprinkler (OFF)
            },
        },
    }