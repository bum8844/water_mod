return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Looks like there's only one spot left.", -- Well is dry with only one empty bucket attached.
            WELL_BUSY = "That's an amusing thought, but if the well gets clogged, we'll be in trouble.", -- Well has water-filled buckets attached.
        }
    },

        ANNOUNCE_DRUNK = "Four? Sixteen? No, we are legion...!", -- Drunk
        ANNOUNCE_DRUNK_END = "No... we're just one now...", -- Sobering up from drinking (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. For Wickerbottom only.
        ANNOUNCE_NOTCHARGE = "I don't think it's going to produce milk right now.", -- Lightning goat can't charge to milk with buckets
        ANNOUNCE_NOTHIRSTSLEEP = "Our throats are too parched for a comfortable sleep.", -- Thirsty trying to sleep at night
        ANNOUNCE_NOTHIRSTSIESTA = "Our throats are too parched for a nap during the day.", -- Thirsty trying to sleep during the day
        ANNOUNCE_SLEEP_END = "We are one. We must never multiply!", -- Waking up fully sober from sleep
        ANNOUNCE_THIRST = "It's tea time!", -- Very thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Hmm, I feel like running a marathon.", -- Starting caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Ah, feeling sluggish now.", -- Ending caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "", --"Ah, refreshing!"  -- Dialogue when curing waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Feels like we're about to split...!", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "My head is starting to spin for some reason.", -- Getting tipsy

        DESCRIBE =
        {
            BOILBOOK = "Ugh, so many recipes to memorize.",

            WATER_CLEAN_ICE = "Ah, it's cold!", -- Clean ice water
            WATER_DIRTY_ICE = "It's frozen. Bleh.", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "Spicy!!!", -- Caffeine pepper spice

            WELL_KIT = "Let's build our splendid well!", -- Well kit
            WELL_SPRINKLER_KIT = "It automatically sets up with just a press of a button, amazing!", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Should we assemble it near the house's water source?", -- Steam water pump kit
            WELL_BURYING_KIT = "Huh? Are we burying the hole again?", -- Hole burying kit
            WELL_DRILLING = "It's incredibly loud, but fun!", -- Drilling the hole with the drill
            WELL_DRILLING_ITEM = "Feels pretty manly.", -- Drill item
            HOLE = "Hellooo? Is anyone in there?", -- Well hole
            WELL = "We were told not to hide in here.", -- Well

            WX78MODULE_NONEDRUNK = "Huh. Is that what robot insides look like?", -- 78전용 묘듈

            -- Water Mode Plants

            TEA_TREE = "It's a bit small for hiding.", -- Tea tree
            DUG_TEA_TREE = "With a little love, it'll grow back.", -- Tea tree dug from the ground
            TEA_SEED = "Not much to eat for its size.", -- Tea tree seed
            TEA_SEED_COOKED = "Doesn't taste good at all.", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Wow, it's sprouting!", -- Tea tree sapling
            TEALEAVES = "These leaves have a unique aroma.", -- Tea leaves
            TEALEAVES_DRIED = "It's somewhat earthy.", -- Dried tea leaves

            CAFFEINBERRY = "Looks like it's full of beans.", -- Caffeine berry bush
            DUG_CAFFEINBERRY = "With a little love, it'll grow back.", -- Dug caffeine berry bush
            CAFFEINBERRY_BEAN = "Can we make chili con carne with this?", -- Raw caffeine bean
            CAFFEINBERRY_BEAN_COOKED = "Tastes really bitter.", -- Cooked caffeine bean

            RUINCACAO_TREE = "Another tropical cave tree, I guess?", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "Off to the ground with you!", -- Dug ruincacao tree
            RUINCACAO_SEED = "Wow, it's blossomed!", -- Ruincacao sapling item
            RUINCACAO_SEED_SAPLING = "It'll grow big and bear nice fruit.", -- Ruincacao sapling
            RUINCACAO = "I heard something, but it's making a sticky noise.", -- Ruincacao fruit before smashing
            RUINCACAO_BEAN = "I can't eat this because of the oily smell.", -- Smashed ruincacao bean
            RUINCACAO_BEAN_COOKED = "It's extremely bitter!", -- Cooked ruincacao bean

            -- Distillery Additives

            ADDITIVE_SEED = "Strange-smelling seeds for distillery!", -- Liquor distillery additive seeds (anise, juniper berry, star motif)
            ADDITIVE_PETALS = "Common herbs and flower petals you can find in nature!", -- Liquor distillery herb and flower petal additives (tea, flower petals)
            ADDITIVE_NUT = "I've collected some hard things.", -- Liquor distillery nut additives (birchnut, coconut, coffee bean, cacao bean)
            ADDITIVE_DAIRY = "Will we get scolded if we eat it as is?", -- Liquor distillery dairy additives

            -- Beverages

            WATER_CLEAN = "It's clean water!", -- Clean water
            WATER_DIRTY = "Water from a pond.", -- Dirty water
            WATER_SALTY = "Drinking seawater is a no-no.", -- Saltwater

            GOOPYDRINK = "A drink for a punishment game!", -- Failed drink (wet roast concept)

            -- Teapot Beverages

            FRUITJUICE = "Juice made from various fruits.", -- Mixed fruit juice
            BERRIES_JUICE = "Raspberry juice!", -- Berry juice
            POMEGRANATE_JUICE = "Tasty, but a bit sour.", -- Pomegranate juice
            BANANA_JUICE = "Hmm, it smells like bananas.", -- Banana juice
            FIG_JUICE = "It's quite sweet!", -- Fig juice
            DRAGONJUICE = "It looks like something edible now.", -- Dragon fruit juice
            GLOWBERRYJUICE = "This should taste good!", -- Glowberry juice
            WATERMELON_JUICE = "So refreshing!", -- Watermelon juice

            VEGGIE_TEA = "A set of various vegetables!!", -- Vegetable juice
            CARROT_TEA = "I didn't want to eat this much of it.", -- Carrot tea
            CACTUS_TEA = "It's full of cactus flesh.", -- Cactus tea
            TOMATO_JUICE = "Carefully made vegetable juice.", -- Tomato juice
            LUMPY_TEA = "I think it's going bad.", -- Root tea
            SEAWEED_SHAKE = "It's going to be slippery and slimy.", -- Seaweed shake

            GREENTEA = "Hmm, smells leafy.", -- Fresh leaf green tea
            BLACKTEA = "I need some cookies to go with this.", -- Black tea
            BLACKTEA_ICED = "Iced black tea with ice.", -- Iced black tea
            FUER = "Mmm, it's a soothing tea.", -- Foxtail, leaf tea, bracken tea
            MIXFLOWER = "A tea with various flower petals.", -- Mixed flower petal tea
            HIBISCUSTEA = "It's turned red.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Let's have it three times a day.", -- Cactus flower tea
            LOTUSTEA = "A tea made from flowers living in water.", -- Lotus flower tea
            SUSHIBISCUS = "I shouldn't joke around with food.", -- Suicide tea
            MOON_BLOSSOM_TEA = "It seems like the moon is inside the tea.", -- Moonflower tea

            CAFFEINBERRY_JUICE = "Bitter!", -- Black coffee
            TOFFEE_LATTE = "It's like melted butterscotch!", -- Toffee nut latte
            RUINCHA_LATTE = "It's good, but don't drink too much.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Warms both my claws and my stomach.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Chilled to keep my claws and stomach cool.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Both of us don't want to drink this.", -- Chocolatl (spicy)
            TEA_RUINCOLATE_LATTE = "The matcha latte looks odd.", -- Matcha latte

            MULLED = "Makes my body warm as soon as I drink it!", -- Bancha
            BUTTERBEER = "Wendy told me it's a delicious drink from a famous novel series!", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Beverages

            COCONUT_JUICE = "Ugh, it doesn't taste as good as it looks.", -- Castaway Coconut Juice
            RAINBOW_SHAKE = "I like the colorful appearance!", -- Castaway Rainbow Jelly Shake
            QUARTZ_SHAKE = "Ugh, this tastes like fish porridge no matter how you think about it.", -- Castaway Clown Fish Shake
            CHERRY_ROSEBERRIES_TEA = "Did they extract this from an alien spider?", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Sweet and warm, but the color is strange!", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "It has soft seeds in it!", -- Vita Coop Sikhye
            PINEANANAS_JUICE = "My teeth feel weird after drinking this.", -- Regione Pineapple Juice
            ORANGE_JUICE = "I better hold off on brushing for a while.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Let's drink it slowly to avoid brain freeze.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "This is real strawberry shake!", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Teapot Beverages

            SPOILED_DRINK = "Completely spoiled!", -- Spoiled Drink

            -- Distillery Soda

            SODA = "What is this? It's fizzy!", -- Soda
            FRUITSODA = "Mmm, sweet fruit soda!", -- Fruit Soda
            LEMONLIMESODA = "It's refreshing, but my throat feels sticky afterward!", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "I never thought I'd see this again!", -- Cola
            COLAQUANTUM = "The blue soda is glowing!", -- Cola Quantum
            LUMPY_BEER = "Ugh, this tastes weird.", -- Root Beer (not actual alcohol)

            -- Distillery Spirits

            CORN_BEER = "Wow! Can we drink this too?", -- Corn Beer
            MADHU = "Ugh, it's not sweet at all; it's just alcohol.", -- Madhu (Honey Wine)
            WINE = "Bitter!", -- Wine (regular berry brewing)
            NOBLEWINE = "It might be sweet, but let's try just a little.", -- Noble Wine (cooked berry brewing)
            SPARKLINGWINE = "I want to shake it, but I guess I shouldn't.", -- Sparkling Wine
            GLOWBERRYWINE = "This wine is glowing!", -- Glow Berry Wine
            KUMIS = "Is this spoiled milk?", -- Kumis (Fermented Sheep's Milk)
            LUMPY_WINE = "Hmm, this is going to be really bitter.", -- Soju (root spirits)
            PULQUE = "Milk made from grass?", -- Pulque (fermented agave)
            RUINCACAO_WINE = "We love chocolate!", -- Cacao Wine

            -- Collaboration Soda

            CHERRY_DOCTOR_COLA = "It's similar to cola, but not quite the same, and I like it!", -- Cherry Forest Doctor Pepper (Dr. Cherry)
            PINEANANASSODA = "We need to be careful not to let it rot.", -- Pineapple Soda (Oranchi)
            ORANGESODA = "It's orange-flavored carbonated beverage!", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "Wickerbottom said to drink carbonated drinks in moderation.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "They ground up the glowing jellyfish, didn't they?", -- Castaway Aurorabow, Rainbow Jellyfish Spirits
            COCONUT_WINE = "It has a slightly nutty aroma.", -- Castaway Coconut Wine
            CHERRY_BLOOM_MADHU = "It's alcohol, but it's pink!", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Juicy fruit turned into alcohol.", -- Vita Coop Boom! Berry Sapphire (Explodes when ignited)
            RICE_WINE = "Is this like milk made from seeds?", -- Vita Coop Makgeolli (Rice Wine)
            WHEAT_BEER = "Mmm, it's full of bubbles.", -- Heap of Food Wheat Beer
            PALE_BEER = "This beer is really strange!", -- Regione Pale Ale (Turquoise beer made with Monstra Fruit)

            -- Distillery Spirits

            DISINFECTANT = "It hurts more to use it than to fix it.", -- Disinfectant
            CORN_WHISKEY = "This alcohol is even stronger!", -- Corn Whiskey
            LUMPY_VODKA = "Willow might breathe fire if she drinks this.", -- Vodka
            TEQUILA = "They made alcohol from cacti.", -- Tequila
            MADHU_RUM = "They made it with sugar, but I can't drink it!", -- Rum
            BERRY_BRANDY = "I saw Dad hiding this in the study!", -- Berry Brandy
            AREUHI = "I don't think I can stomach alcohol made from milk.", -- Kumis Spirits Areuhi

            -- Collaboration Distillery Spirits (Warly Exclusive)

            BERRY_GIN = "This alcohol has an even stronger smell.", -- Gin
            GLOWBERRY_GIN = "Ugh, I don't want to try it.", -- Glow Berry Gin
            ABSINTHE = "It's vivid green!", -- Absinthe
            TEA_LUMPY_VODKA = "Is this alcohol made from vegetables?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Mmm, it has a pleasant aroma.", -- Rose-Scented Brandy
            KAHLUA = "Hmm, I think I'll pass.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Woody would probably like this!", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Wow! It's chocolate liqueur!", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Ugh, just give me regular milk.", -- Rumchata (Rum mixed with dairy product)

            -- Collaboration Distillery Spirits (Warly Exclusive)

            MOONWAY = "It's such a pretty color!", -- Rainbow Jellyfish Spirits Liqueur
            ARRACK = "We should just eat coconuts.", -- Arrack (Indonesian version of Coconut Wine)
            CHERRY_BLOOM_RUM = "Hmm, should we use this to decorate our spider friends' homes?", -- Cherry Blossom Honey Wine Liqueur Floating in Cherry Forest
            RICE_SPIRITS = "This isn't water!", -- Cheongju (Korean rice wine)
            WHEAT_WHISKEY = "I'd rather it be bread!", -- Wheat Whiskey
            PALE_WHISKEY = "Ugh, this alcohol is really strange.", -- Pale Malt Whiskey

            -- Warly-exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "Shocking and terrifying, oh sea Yogs!", -- Coconut Brandy (Renamed as Caribbean Brandy since you can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "Quackowak!", -- Boom Berry Sapphire (Explodes into carrots)

            -- Pot Recipes

            DARK_RUINCOLATE = "Warly didn't seem to have roasted it, so what happened?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Let's share it with our friends!", -- White Chocolate
            RUINCOLATE = "It's rich and sweet!", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Hmm, the chocolate flavor is a bit subtle.", -- Schokakola

            -- Bucket Descriptions

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Let's make sandcastles with this!", -- Empty Steel Bucket
                FULL = "It's filled with clean rainwater!", -- Clean rainwater in the bucket
                FULL_ICE = "It's frozen solid!", -- Rainwater frozen into ice
                DIRTY = "There might be wrigglers in here.", -- Rainwater turned dirty
                DIRTY_ICE = "It's frozen as it is!", -- Dirty rainwater frozen into ice
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "It looks a bit fragile for us to use as a chair.", -- Empty Woodie's Bucket
                FULL = "It's filled with clean rainwater!", -- Clean rainwater in the bucket
                FULL_ICE = "It's frozen solid!", -- Rainwater frozen into ice
                DIRTY = "There might be wrigglers in here.", -- Rainwater turned dirty
                DIRTY_ICE = "It's frozen as it is!", -- Dirty rainwater frozen into ice
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Let's put our toys in this and float it on the water!", -- Driftwood bucket
                FULL = "It's filled with clean rainwater!", -- Clean rainwater in the bucket
                FULL_ICE = "It's frozen solid", -- Rainwater frozen into ice
                DIRTY = "There might be wrigglers in here.", -- Rainwater turned dirty
                DIRTY_ICE = "It's frozen as it is!", -- Dirty rainwater frozen into ice
            },

            BUCKET_EMPTY =
            {
                EMPTY = "It's a bit small for my friends to fit in.", -- Empty Wooden Bucket
                FULL = "It's filled with clean rainwater!", -- Clean rainwater in the bucket
                FULL_ICE = "It's frozen solid", -- Rainwater frozen into ice
                DIRTY = "There might be wrigglers in here.", -- Rainwater turned dirty
                DIRTY_ICE = "It's frozen as it is!", -- Dirty rainwater frozen into ice
            },

            DESALINATOR =
            {
                EMPTY = "Mr. Desalinator, do you have any water?", -- Desalinator with no water
                PURIFY_LONG = "It's going to take a while for the salt to be removed!", -- A lot of time left for purification
                PURIFY_SHORT = "The water is almost pure now!", -- Purification is almost complete
                HASWATER = "May I take some clean water, Mr. Desalinator?", -- Desalinator has clean water
                BURNT = "Mr. Desalinator doesn't look well.", -- Desalinator is burnt
                HASSALT = "Mr. Desalinator, do you have too much salt?", -- Desalinator has excess salt
            },

            BARREL =
            {
                GENERIC = "We can store our water here.", -- Examining a barrel
                BURNT = "I guess it's useless now.", -- Barrel is burnt
            },

            BREWERY =
            {
                EMPTY = "I don't think hiding inside this barrel is a good idea!", -- Examining an empty brewery
                BURNT = "Hmm, it's all burnt down.", -- Brewery is burnt
                FERMENTING_LONG = "Master said we have to wait a long time for this.", -- A lot of time left for fermentation
                FERMENTING_SHORT = "It'll be ready soon!", -- Fermentation is almost complete
                DONE = "The drink is ready!", -- Drink is in the brewery
            },

            CAMPKETTLE_ITEM = "I'll have to carry it with my extra arms!", -- Examining a portable kettle (item)
            CAMPKETTLE =
            {
                GENERIC = "Hmm, it's not very useful like this.", -- Examining a camp kettle with no water
                BOILING_LONG = "My fingers aren't burning yet.", -- Just started boiling
                BOILING_SHORT = "Steam is coming out!", -- Almost done boiling
                DONE = "Clean water!", -- Water is ready
                STOP = "It's not boiling anymore.", -- No fire under the kettle
            },

            CAMPDESALINATOR_ITEM = "I'll have to carry it with my extra arms!", -- Examining a portable desalinator (item)
            CAMPDESALINATOR =
            {
                GENERIC = "Hmm, it's not very useful like this.", -- Examining a camp desalinator with no water
                BOILING_LONG = "There's still a lot of seawater.", -- Just started desalination
                BOILING_SHORT = "Most of it has become clean water!", -- Almost done desalinating
                DONE = "Time to drink!", -- Clean water is ready
                STOP = "The windmill has stopped turning.", -- No fire under the desalinator
            },

            KETTLE =
            {
                EMPTY = "Put some ingredients in and make a drink!", -- Examining an empty kettle
                BURNT = "I can't drink anything from this now.", -- Kettle is burnt
                BOILING_LONG = "It won't be ready right away.", -- Just started making a drink
                BOILING_SHORT = "It's almost done!", -- Drink is almost ready
                DONE = "The drink is ready!", -- Drink is made
                PURIFY_LONG = "We can't make drinks with pond water as it is.", -- Just started purifying dirty water
                PURIFY_SHORT = "Hmm, it's almost clean!", -- Almost done purifying dirty water
                HASWATER = "Shall we gather some ingredients?", -- Kettle has clean water
                MELT_LONG = "I can't make drinks with ice.", -- Just started melting ice
                MELT_SHORT = "Hmm, the ice is almost melted!", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Let's make juice on the go!", -- Examining a portable kettle (item)
                EMPTY = "Aww, there's nothing inside.", -- Examining an empty placed portable kettle
                BOILING_LONG = "It's taking too long.", -- Just started boiling
                BOILING_SHORT = "The drink will be ready soon!", -- Almost done boiling
                DONE = "Mmm, let's drink it quickly!", -- Drink is ready
                PURIFY_LONG = "I want to make it into a drink quickly.", -- Just started purifying dirty water
                PURIFY_SHORT = "It's almost clean!", -- Almost done purifying dirty water
                HASWATER = "Let's add some ingredients!", -- Portable kettle has clean water
                MELT_LONG = "I can't brew with ice.", -- Just started melting ice
                MELT_SHORT = "Hmm, the ice is almost melted!", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Wow, it looks like a big science experiment!", -- Examining an empty distiller
                DISTILLTING_LONG = "It's going to take a while to finish.", -- A lot of time left for distillation
                DISTILLING_SHORT = "It's almost done!", -- Distillation is almost complete
                DONE = "Let's see what we've made!", -- Drink is in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "It's incredibly strong!", -- Maximum pressure
                MIDDLE_PRESSURE = "It's working hard.", -- Medium pressure
                LOW_PRESSURE = "I don't feel very energetic.", -- Almost no pressure
                RECHARG_PRESSURE = "Hmm, I'll pump some water for us!", -- No pressure (needs to reach maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "It's out of fuel.", -- Examining a sprinkler with low fuel
                ON = "It's water playtime!", -- Sprinkler is on
                OFF = "It's sprinkling water around.", -- Sprinkler is off
            },
        },
    }
