return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "This well only holds one bucket.", 
            WELL_BUSY = "Let's wait.", 
        }
    },

        ANNOUNCE_DRUNK = "Dige-stive system.. and mentally... ahem..hem..", 
        ANNOUNCE_DRUNK_END = "Anyway, overdrinking is absolutely forbidden.", 
        ANNOUNCE_DRUNK_IMMUNITY = "", 
        ANNOUNCE_NOTCHARGE = "That goat is not in a condition to be milked.", 
        ANNOUNCE_NOTHIRSTSLEEP = "", -- 
        ANNOUNCE_NOTHIRSTSIESTA = "", -- 
        ANNOUNCE_SLEEP_END = "", -- 
        ANNOUNCE_THIRST = "Librarian needs water.", 

        ANNOUNCE_CAFFINE_BUFF_START = "I can feel the caffeine starting to bind to my adenosine receptors.", 
        ANNOUNCE_CAFFINE_BUFF_STOP = "The caffeine has been fully metabolized in my body.", 

        ANNOUNCE_CURE_WATERBORNE = "I can feel the pain from the endemic disease easing up.", 

        ANNOUNCE_DCAPACITY_CRITICAL = "Don't drink alcohol too much. Overdrinking has a negative impact on your liver and...", 
        ANNOUNCE_DCAPACITY_HALF = "Moderate drinking has some benefits for the body.",

        DESCRIBE =
        {
            BOILBOOK = "A compilation of beverage information.",

            WATER_CLEAN_ICE = "A solidified water.", 
            WATER_DIRTY_ICE = "A solidified water containing bacteria.", 

            SPICE_CAFFEINPEPPER = "In the past, this was a very rare and valuable spice.", 

            WELL_KIT = "A building material used for drawing water from deep water vein.", 
            WELL_SPRINKLER_KIT = "A machine used to draw water from deep water vein for farming.", 
            WELL_WATERPUMP_KIT = "A machine used to pump water from deep water vein.", 
            WELL_BURYING_KIT = "Tools for burying a hole when it's no longer needed or functioning.", 
            WELL_DRILLING = "That is trying to dig here to see if there's an aquifer.", 
            WELL_DRILLING_ITEM = "I need to find a suitable spot where there might be an aquifer.", 
            HOLE = "I can hear water, so it looks like I dug it properly.",
            WELL = "A construction used to draw water from deep water vein.", 

            WX78MODULE_NONEDRUNK = "They dislike organics, but don't seem opposed to taking inspiration from them.",

            -- Water mode plants

            TEA_TREE = "A type of small camellia tree.", 
            DUG_TEA_TREE = "It needs soil to grow.", 
            TEA_SEED = "Seeds from a tea tree.", 
            TEA_SEED_COOKED = "Planting it would have been better.", 
            TEA_SEED_SAPLING = "The tea tree seedling will grow.",
            TEALEAVES = "It's a type of tea leaf from the Camellia sinensis variety.", 
            TEALEAVES_DRIED = "That will be used for making black tea.", 

            CAFFEINBERRY = "A low shrub that grows in sandy moon soil.", 
            DUG_CAFFEINBERRY = "That is a combination of coffee and pepper.", 
            CAFFEINBERRY_BEAN = "It has a unique aroma.", 
            CAFFEINBERRY_BEAN_COOKED = "Roasting brings out strong coffee and a hint of pepper.",

            RUINCACAO_TREE = "The fruit must have fallen into a sinkhole.", 
            DUG_RUINCACAO_TREE = "It needs soil to grow.", 
            RUINCACAO_SEED = "Seeds from a cacao tree.", 
            RUINCACAO_SEED_SAPLING = "The cacao tree seedling will grow.", 
            RUINCACAO = "It was used as currency in ancient Aztec civilizations.", 
            RUINCACAO_BEAN = "It's made up of a little butter and cacao beans.", 
            RUINCACAO_BEAN_COOKED = "Used for making chocolate or drinks.", 

            -- Distillery additives

            ADDITIVE_SEED = "Adds a seed flavor to liquors.", 
            ADDITIVE_PETALS = "Adds leaf and flower flavors to liquors.", 
            ADDITIVE_NUT = "Adds nut flavors to liquors.", 
            ADDITIVE_DAIRY = "Adds a creamy flavor to liquors.", 

            -- Beverages

            WATER_CLEAN = "Essential for life. Chemically, it's H₂O.", 
            WATER_DIRTY = "It is teeming with bacteria, posing a risk of endemic diseases.", 
            WATER_SALTY = "Drinking this can lead to dehydration.", 

            GOOPYDRINK = "Oh,no,No,no,no this won't do at all.", 

            -- Teapot drinks

            FRUITJUICE = "It's not bad to make it with slightly imperfect fruits.", 
            BERRIES_JUICE = "The pharmacological effects of the Ardisia crenata fruit include antipyretic and anti-inflammatory properties.",  
            POMEGRANATE_JUICE = "Rich in natural estrogens.", 
            BANANA_JUICE = "It's not bad to have a warm drink.",
            FIG_JUICE = "A refreshing juice traditionally consumed in the Middle East.",
            DRAGONJUICE = "The white variety has a subtle fragrance.", 
            GLOWBERRYJUICE = "I've never seen a drink like this before, amazing!", 
            WATERMELON_JUICE = "It's high water content makes it great for quenching thirst.",  

            VEGGIE_TEA = "Healthy drinks are usually bitter.", 
            CARROT_TEA = "In many ways, it is rich in vitamins and iron.", 
            CACTUS_TEA = "Traditional tea made in some Mexican regions.", 
            TOMATO_JUICE = "It contains components that help detoxify alcohol.", 
            LUMPY_TEA = "It contains components that help alleviate endemic diseases.", 
            SEAWEED_SHAKE = "It's sticky because it is rich in alginic acid.", 

            GREENTEA = "Originated in Asia.", 
            BLACKTEA = "A cup of tea and a good book is needed.", 
            BLACKTEA_ICED = "It invigorates the spirit.", 
            FUER = "It contains components that help alleviate endemic diseases.",  
            MIXFLOWER = "A mixture of various types of flowers.", 
            HIBISCUSTEA = "Made from the flowers of the Hibiscus genus.",
            CACTUSFLOWER_TEA = "In some regions, it's believed to be good for health.",
            LOTUSTEA = "Traditionally consumed during special occasions in Asian regions.",
            SUSHIBISCUS = "Wait... This isn't Hibiscus tea.",
            MOON_BLOSSOM_TEA = "Just looking at it makes me feel calm.", 

            CAFFEINBERRY_JUICE = "I like a cup of coffee and a good book.",
            TOFFEE_LATTE = "It has a rich, nutty aroma.", 
            RUINCHA_LATTE = "It takes its name from a place name. It's a combination of coffee and chocolate.",  

            HOTRUINCOLATE = "It's a modified drink that originated from 'xocolatl' when it was introduced to Europe.", 
            RUINCOLATE_SMOOTHIE = "A modified version of hot chocolate!", 
            RUINXOCOLATL = "An ancient Aztec-originated beverage.",
            TEA_RUINCOLATE_LATTE = "This method adds variety to beverage options.",

            MULLED = "Tastes like the joy of the year-end.",
            BUTTERBEER = "A popular fictional drink. it's not real beer.",

            -- Collaborative Pitcher Drinks

            COCONUT_JUICE = "Coconut water has been jellified by microbial fermentation.", 
            RAINBOW_SHAKE = "Interesting, it maintains bioluminescence.", 
            QUARTZ_SHAKE = "I should study the properties of this fish soup separately.", 
            CHERRY_ROSEBERRIES_TEA = "It's sweet and fragrant.", 
            CHERRY_HONEY_TEA = "I feel like my body is getting warm.", 
            SWEET_RICE_DRINK = "It has been fermented to give it a sweet taste and make it easier to digest.", 
            PINEANANAS_JUICE = "It contains a lot of bromelain, so it can cause mouth sores. Drink it in moderation.", 
            ORANGE_JUICE = "Orange juice, it's like the stereo type of juice.", 
            STRAWBERRY_SMOOTHIE = "Ice and strawberries blended together, it would be even better with milk.", 
            STRAWBERRY_MILK_SMOOTHIE = "A popular strawberry beverage, sometimes made with yogurt instead of milk.", 

            -- Brewing Drinks

            SPOILED_DRINK = "This drink is becoming a breeding ground for bacteria.", 

            -- Brewing Sodas

            SODA = "A water in which carbon dioxide is dissolved and ionized.", 
            FRUITSODA = "Fruit juice added to carbonated water.", 
            LEMONLIMESODA = "It has a strong sweetness.", 
            COLA = "It's a popular drink recently in the United States.",
            COLAQUANTUM = "Hmm... I should investigate if there are any side effects of overconsumption.",
            LUMPY_BEER = "Various root vegetables are mixed in.", 

            -- Brewing Spirits

            CORN_BEER = "It has its origins from ancient Incas.", 
            MADHU = "Mead is known as the first alcoholic drink made by humans.", 
            WINE = "Wine is originally made from grapes, but there is also a long history of wine made from raspberries.", 
            NOBLEWINE = "The deep sweetness is due to a fungus called Botrytis cinerea.", 
            SPARKLINGWINE = "Originally, carbon dioxide is produced through fermentation, but in this case, carbonation was artificially added.", 
            GLOWBERRYWINE = "A new kind of wine, I should find out why it doesn't lose its light during fermentation.", 
            KUMIS = "Traditional Central Asian drink.", 
            LUMPY_WINE = "Mostly brewed in Iceland.",
            PULQUE = "A traditional drink made by Mesoamerican indigenous people.", 
            RUINCACAO_WINE = "A brewing spirit I've never seen before. Quite intriguing.",

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "W.B. Medicinal Drink with 23 spices.", 
            PINEANANASSODA = "Pineapple juice added to carbonated water.", 
            ORANGESODA = "It contains orange juice.",
            STRAWBERRYSODA = "Carbonated water with strawberry juice.", 

            -- Collaborative Spirits

            AUROBOW = "I should research why this drink is glowing.", 
            COCONUT_WINE = "Palm wine is made in various tropical regions.", 
            CHERRY_BLOOM_MADHU = "Made from flower honey, and the color is really impressive.",
            GIANT_BLUEBERRY_WINE = "It retains instability even after fermentation.", 
            RICE_WINE = "One of the methods for long-term storage of grains.", 
            WHEAT_BEER = "It started in ancient Egypt.", 
            PALE_BEER = "A type of top fermentation beer.", 

            -- Distilled Spirits

            DISINFECTANT = "Ethanol used for disinfecting wounds. Its chemical formula is C₂H₅OH.", 
            CORN_WHISKEY = "Bourbon whiskey from Kentucky, USA is famous.", 
            LUMPY_VODKA = "Derived from 'вода', which means 'water' in Russian.",
            TEQUILA = "Conquistadors made mescal from agave when they ran out of grapes.",
            MADHU_RUM = "Diluted with water while sailing to prevent deterioration of drinking water.", 
            BERRY_BRANDY = "Known as the 'king of spirits' due to its high price and complicated production.", 
            AREUHI = "Shimiin Arkhi is made by repeatedly distilling and fractionating kumis to remove impurities.",

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "Originally intended as a medicinal drink for diuresis, antipyretic effects, and to promote digestion.", 
            GLOWBERRY_GIN = "Even after fermentation and distillation, it still emits light.",
            ABSINTHE = "Distilled spirits made by extracting various herbs in alcohol.", 
            TEA_LUMPY_VODKA = "Interesting, the balance of flavors seems to be well-preserved.", 
            PETALS_BERRY_BRANDY = "Flower scent is added to brandy to make it more spectacular.", 
            KAHLUA = "More commonly used for making cocktails due to its coffee aroma and sweetness.", 
            NUT_CORN_WHISKEY = "Emphasizes the body of whiskey, making it robust.", 
            RUINCACAO_CREAM_LIQUEUR = "Originally created to cheaply handle leftover whiskey and cream.", 
            RUMCHATA = "Rum is mixed with cream to make it easier to drink.",

            -- Collaborative Distilled Spirits

            MOONWAY = "Even after distillation, it doesn't lose its light. Interesting.", 
            ARRACK = "Distilled spirits made by South Asian indigenous people using coconut flower sap.", 
            CHERRY_BLOOM_RUM ="It's beautiful, but I'm also interested in its mechanism of action.", 
            RICE_SPIRITS = "Similar to sake.",
            WHEAT_WHISKEY = "It started being made in Ireland or Scotland.", 
            PALE_WHISKEY = "I've never seen this whiskey before. It has a quite unique aroma.", 

            -- Warly Exclusive Collaborative Distilled Spirits

            NUT_COCONUT_BRANDY = "Efforts have been made to create a pirate atmosphere.",
            GIANT_BLUEBERRY_GIN = "It has the opposite properties of fermentation and distillation, considering the inherent properties of the ingredients.",

            -- Pot Cooking

            DARK_RUINCOLATE = "Dark chocolate! It has a very high cocoa mass content.", 
            WHITE_RUINCOLATE = "White chocolate! It has a high cocoa butter content.", 
            RUINCOLATE = "Chocolate! A solid form of xocolatl.", 
            RUIN_SCHOKAKOLA = "A new type of chocolate! Awakening substances have been enhanced.", 

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "A bucket made of steel.", 
                FULL = "Clean water that you can drink.", 
                FULL_ICE = "Small ice chunks.", 
                DIRTY = "Water with bacteria teeming in it.", 
                DIRTY_ICE = "Small ice chunks with bacteria.", 
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "A bucket made of logs.",
                FULL = "Clean water that you can drink.", 
                FULL_ICE = "Small ice chunks.", 
                DIRTY = "Water with bacteria teeming in it.", 
                DIRTY_ICE = "Small ice chunks with bacteria.", 
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "A bucket made of driftwood.", -- 
                FULL = "Clean water that you can drink.", --
                FULL_ICE = "Small ice chunks.", -- 
                DIRTY = "Water with bacteria teeming in it.", 
                DIRTY_ICE = "Small ice chunks with bacteria.", --
            },

            BUCKET_EMPTY =
            {
                EMPTY = "A bucket made of wood.", 
                FULL = "Clean water that you can drink.", -- 
                FULL_ICE = "Small ice chunks.", -- 
                DIRTY = "Water with bacteria teeming in it.", 
                DIRTY_ICE = "Small ice chunks with bacteria.", -- 
            },
            
            DESALINATOR =
            {
                EMPTY = "Water and salt are separated using this desalinator with seawater.", 
                PURIFY_LONG = "It's still a long way to go for desalination.", 
                PURIFY_SHORT = "Desalination is almost done!", 
                HASWATER = "Only pure water remains.", 
                BURNT = "Oh my, it's completely useless in that state.", 
                HASSALT = "Enough salt has been collected.", 
            },

            BARREL =
            {
                GENERIC = "Charcoal is added for safe water storage.",
                BURNT = "Oh no, all the water is gone!", -- 
            },

            BREWERY =
            {
                EMPTY = "To preserve food for a long time, they started making alcohol.", 
                BURNT = "I'll have to put off research on fermentation for a while.", 
                FERMENTING_LONG = "Now we need to be patient as the ingredients ferment.", 
                FERMENTING_SHORT = "Fermentation is almost done!",
                DONE = "You can smell it from afar.", 
            },

            CAMPKETTLE_ITEM = "Boil dirty water to eliminate bacteria.", 
            CAMPKETTLE =
            {
                GENERIC = "It's empty.", 
                BOILING_LONG = "It's still a long way to sterilization.", 
                BOILING_SHORT = "It's almost sterilized!", 
                DONE = "It's sterilized and ready to drink.",
                STOP = "You need to put some firewood to complete the sterilization.", 
            },

            CAMPDESALINATOR_ITEM = "Evaporate seawater to obtain fresh water.", 
            CAMPDESALINATOR =
            {
                GENERIC = "There's no collected fresh water.", 
                BOILING_LONG = "It's still a long way to collecting fresh water.",
                BOILING_SHORT = "It's almost full!", 
                DONE = "It's filled with fresh water.",
                STOP = "The fire has gone out, so it hasn't collected enough fresh water yet.", 
            },

            KETTLE =
            {
                EMPTY = "We need water.", 
                BURNT = "It's really desolate now.", 
                BOILING_LONG = "It's still a long way to extraction.",  
                BOILING_SHORT = "It's almost done!", --
                DONE = "Let's enjoy the taste.", 
                PURIFY_LONG = "We need to wait for sterilization to complete.", 
                PURIFY_SHORT = "It's almost sterilized!", 
                HASWATER = "Ingredients are needed."
                MELT_LONG = "We need to wait for the ice to melt.",
                MELT_SHORT = "It's almost melted!", 
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "We can prepare tea anywhere.",
                EMPTY = "We need to add water before using it.", 
                BOILING_LONG = "Patience is a virtue!",
                BOILING_SHORT = "It's going to finish soon!",
                DONE = "The aroma is invigorating.",
                PURIFY_LONG = "We need to wait for sterilization to complete.", 
                PURIFY_SHORT = "It's almost sterilized!",
                HASWATER = "Hmm, maybe I'll make some tea.", 
                MELT_LONG = "We need to wait for the ice to melt.",
                MELT_SHORT = "It's almost melted!",
            },

            DISTILLERS =
            {
                EMPTY = "It's used to distill spirits or make liqueurs.",
                DISTILLTING_LONG = "Separating, still distilling.",
                DISTILLING_SHORT = "Distillation is almost done!",
                DONE = "Let's make sure it's distilled properly.",
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "The pressure is more than sufficient.", 
                MIDDLE_PRESSURE = "The pressure is just right.", 
                LOW_PRESSURE = "The pressure is very low.", 
                RECHARGE_PRESSURE = "Can't be used until the pressure is recharged.", 
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Fuel is running low.", 
                ON = "Make sure to wear a raincoat before getting close.",
                OFF = "It moistens the surroundings.",
            },
        },
    }