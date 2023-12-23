return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "First, clear what's already there.", -- Trying to give a bucket to a well that already has water
            WELL_BUSY = "I don't like wells taking their sweet time!", -- Trying to give a bucket to a well that's in the process of filling
        }
    },

        ANNOUNCE_DRUNK = "Hahaha... I feel great...",
        ANNOUNCE_DRUNK_END = "Ugh... my body's sobering up.", -- Sobering up after being drunk
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, specific to Wigfrid
        ANNOUNCE_NOTCHARGE = "Oh dear, it seems you're not charged.", -- Trying to milk the Volt Goat with an uncharged bucket
        ANNOUNCE_NOTHIRSTSLEEP = "I want to sleep, but I'm so thirsty!", -- Trying to sleep at night while thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "I want to rest, but I'm so thirsty!", -- Trying to nap during the day while thirsty
        ANNOUNCE_SLEEP_END = "Alright, time to have a drink again.", -- Waking up from sleep and fully sober
        ANNOUNCE_THIRST = "Why isn't my throat fireproof?", -- Becoming very thirsty

        ANNOUNCE_DCAPACITY_CRITICAL = "Oh~ I feel like I'm floating!", -- Right before getting tipsy
        ANNOUNCE_DCAPACITY_HALF = "I can't see the flames, but I feel warm!", -- Getting tipsy

        ANNOUNCE_CAFFINE_BUFF_START = "I'm in the mood to start a fire.", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Alright, let's save it for tomorrow.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "That was absolutely dreadful.", -- Curing a waterborne illness with an item

        DESCRIBE =
        {
            BOILBOOK = "Looks like it won't be any fun.",

            WATER_CLEAN_ICE = "It's really cold.", -- Clean ice water
            WATER_DIRTY_ICE = "You look really unattractive.", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "I wonder if it would make someone sneeze if they smelled it?", -- Caffeinpepper spice

            WELL_KIT = "Do I have to set this up all by myself?", -- Well kit
            WELL_SPRINKLER_KIT = "What? Are you telling me to install this?", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "I'm not good at assembling machines.", -- Steam water pump kit
            WELL_BURYING_KIT = "It worked out well. The sound of water was bothering me anyway.", -- Burying kit for the well
            WELL_DRILLING = "Would it be quieter if I lit a fire?", -- Drilling hole with drill
            WELL_DRILLING_ITEM = "Can't this be used to light a fire?", -- Drill item
            HOLE = "I'm definitely not falling in.", -- Well hole
            WELL = "If there's a 'well,' there should be a 'fireplace,' right?", -- Well

            -- Water-based plants

            TEA_TREE = "Are you good at catching fire?", -- Tea tree
            DUG_TEA_TREE = "Why are you like this? Is it because there's no dirt?", -- Dug tea tree
            TEA_SEED = "Hello, tree seed.", -- Tea tree seed
            TEA_SEED_COOKED = "Can trees be cooked too now?", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "You'll soon become a real tree.", -- Tea tree sapling
            TEALEAVES = "I bet it would smell good if I burned it.", -- Tea leaves
            TEALEAVES_DRIED = "It looks perfect for making charcoal.", -- Dried tea leaves

            CAFFEINBERRY = "This time, I'm seeing you on a cold moon.", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "What should I do with you now?", -- Dug Caffeinberry bush
            CAFFEINBERRY_BEAN = "In the end, I have to put you in the fire too, huh?", -- Raw caffeinbean
            CAFFEINBERRY_BEAN_COOKED = "Ah, it smells fragrant.", -- Roasted caffeinbean

            RUINCACAO_TREE = "It looks like you've had a run-in with fire too?", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "Is this because there's no dirt around?", -- Dug Ruincacao tree
            RUINCACAO_SEED = "You've already bloomed beautifully, haven't you?", -- Ruincacao seed item
            RUINCACAO_SEED_SAPLING = "You're growing up nicely.", -- Ruincacao sapling
            RUINCACAO = "Hmm - smoky.", -- Unbroken Ruincacao pod
            RUINCACAO_BEAN = "In the end, you also need the help of fire, huh?", -- Broken Ruincacao pod
            RUINCACAO_BEAN_COOKED = "Mmm, it smells good.", -- Roasted Ruincacao pod

            -- Distilling additives

            ADDITIVE_SEED = "These seeds are boring.", -- Seed herbs for liqueurs (anise, juniperberry, pentagon)
            ADDITIVE_PETALS = "You gathered well-burning ones.", -- Herb, tea, and flower petal additives for liqueurs
            ADDITIVE_NUT = "It will probably taste better when burned.", -- Nut, coconut, coffee bean, and cacao bean additives for liqueurs
            ADDITIVE_DAIRY = "Why use milk in alcohol?", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "I should drink it all up and get rid of it.", -- Clean water
            WATER_DIRTY = "No, thanks.", -- Dirty water
            WATER_SALTY = "Why is there so much water in the world?", -- Saltwater

            GOOPYDRINK = "It would have been better if I had put it in the fire.", -- Failed drink (similar to boiling)

            -- Kettle drinks

            FRUITJUICE = "Fruits are better eaten as they are.", -- Mixed fruit juice
            BERRIES_JUICE = "You brewed them a nice red color.", -- Berry juice
            POMEGRANATE_JUICE = "It's red, so it must taste good.", -- Pomegranate juice
            BANANA_JUICE = "Did you brew it with the peel on?", -- Banana juice
            FIG_JUICE = "It's probably less appetizing with water.", -- Fig juice
            DRAGONJUICE = "Why did you put fire-like fruits in water?", -- Dragon fruit juice
            GLOWBERRYJUICE = "It's strange that the water is glowing.", -- Glowberry juice
            WATERMELON_JUICE = "There's so much water in it that it's like a 'river.'", -- Watermelon juice

            VEGGIE_TEA = "No, I don't want to drink it.", -- Vegetable juice
            CARROT_TEA = "Ugh. Did you boil the carrots in water?", -- Carrot tea
            CACTUS_TEA = "It's really watery.", -- Cactus tea
            TOMATO_JUICE = "At least my hands won't get sticky from juice.", -- Tomato juice
            LUMPY_TEA = "I'd rather eat it roasted.", -- Root tea
            SEAWEED_SHAKE = "It got worse.", -- Seaweed shake

            GREENTEA = "It's just water with leaves in it.", -- Green leaf tea
            BLACKTEA = "You can't just brew any leaves, you know?", -- Black tea
            BLACKTEA_ICED = "Why can't you add ice to it?", -- Iced black tea
            FUER = "Aren't all teas the same?", -- Fire tea, leaf tea, fern tea
            MIXFLOWER = "At least the water smells better now.", -- Mixed flower petal tea
            HIBISCUSTEA = "It's tangy, but it tastes good.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "It's just another flower tea.", -- Cactus flower tea
            LOTUSTEA = "You must have been satisfied returning to the water.", -- Lotus tea
            SUSHIBISCUS = "Whose dining table should I put this on?", -- Sushi tea
            MOON_BLOSSOM_TEA = "This is quite impressive.", -- Moon blossom tea

            CAFFEINBERRY_JUICE = "Suddenly, I feel motivated.", -- Black coffee
            TOFFEE_LATTE = "The nuts are chewy.", -- Toffee nut latte
            RUINCHA_LATTE = "It's bitter yet sweet.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Hot chocolate tastes better when it's hot.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "When it's cold, it tastes less sweet.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Even though it's a drink, it's full of the smell of fire, and I really like it.", -- Chocolatl (spicy)
            TEA_RUINCOLATE_LATTE = "Why did you grind leaves into hot chocolate?", -- Tea latte (matcha)

            MULLED = "Ah, it feels like I've lit a heater inside my stomach.", -- Baangso
            BUTTERBEER = "Should I try making it with fire?", -- Butterbeer (from the Harry Potter series)

            -- Collaboration Potable

            COCONUT_JUICE = "Now it actually looks like a drink.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "You made water strangely colorful.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "A collaboration of water and fish gone wild.", -- Shipwrecked Clownfish Shake
            CHERRY_ROSEBERRIES_TEA = "Sure, it smells fragrant.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "At least it looks pretty.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "I prefer the roasted version.", -- Vita-Hyphy Sikhye
            PINEANANAS_JUICE = "It's good to drink, but it'll make your mouth tingle.", -- Legion Pineapple Juice
            ORANGE_JUICE = "If someone's drinking it, I should recommend toothpaste.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "It's been blended nicely into red.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Sometimes, cold things aren't so bad.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Can't even use it as fuel.", -- Spoiled Drink

            -- Sodas

            SODA = "Fizzy water.", -- Soda Water
            FRUITSODA = "Among beverages, this one's the tastiest.", -- Fruit Soda
            LEMONLIMESODA = "They say you should drink this one warm.", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "I can find cola anywhere around here.", -- Cola
            COLAQUANTUM = "This is truly an abnormal drink.", -- Cola Quantum
            LUMPY_BEER = "It's the worst among sodas.", -- Root Beer (not alcoholic)

            -- Brewed Spirits

            CORN_BEER = "Totally looks like something an old man would drink.", -- Corn Beer
            MADHU = "I made it with honey, but it's not that sweet.", -- Madhu (Honey Wine)
            WINE = "If you burn it in an oak barrel, it'll have an amazing aroma.", -- Wine (regular berry fermentation)
            NOBLEWINE = "Goes down smoothly.", -- Noble Wine (roasted berry fermentation)
            SPARKLINGWINE = "Shake it a lot, then BAM!", -- Sparkling Wine
            GLOWBERRYWINE = "It glows even without fire.", -- Glow Berry Wine
            KUMIS = "It's sour and strong.", -- Kumis, fermented mare's milk
            LUMPY_WINE = "It's probably going to smell earthy.", -- Soju (fermented roots)
            PULQUE = "Ugh, it's sticky and sour.", -- Pulque (Agave Wine)
            RUINCACAO_WINE = "Hot chocolate is better when it's hot, but this is fine too.", -- Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "It's a homemade imitation.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "It's just pineapple soda.", -- Pineapple Soda (Oransi)
            ORANGESODA = "Nothing special, just orange soda.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "It's red and fizzy, so it's good, right?", -- Strawberry Soda (Welch's Strawberry)

            -- Collaborative Brewed Spirits

            AUROBOW = "Even if you burn it with fire, it won't change colors like this.", -- Shipwrecked Aurobow (Rainbow Jelly Wine)
            COCONUT_WINE = "The alcohol is good, but the wood can be burned.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "I prefer the way it scatters when it's on fire.", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "I like its new disposition!", -- Vita-Hyphy Boom Berry Wine (explodes when set on fire)
            RICE_WINE = "You can make alcohol with weird ingredients.", -- Vita-Hyphy Makgeolli
            WHEAT_BEER = "I don't want foam on my lips.", -- Hip of Food Wheat Beer
            PALE_BEER = "Why is beer blue?", -- Legion Pale Ale (Beer made with Monstrata Fruit)

            -- Distilled Spirits

            DISINFECTANT = "I tried burning it, but it doesn't show much flame.", -- Disinfectant
            CORN_WHISKEY = "Let's drink roughly and get lightly drunk!", -- Corn Whiskey
            LUMPY_VODKA = "Let's drink roughly and light our insides on fire!", -- Vodka
            TEQUILA = "I can tolerate the strong aroma.", -- Tequila
            MADHU_RUM = "Want to drink this instead of water?", -- Rum
            BERRY_BRANDY = "Hehe... I like it.", -- Berry Brandy
            AREUHI = "It doesn't feel like it was made with milk at all.", -- Kumis Distilled Spirit Aruhi

            -- Exclusive Distilled Spirits for Walani

            BERRY_GIN = "What I truly wanted to set on fire was this rotting world.", -- Gin
            GLOWBERRY_GIN = "Wow. I really like this.", -- Boom Berry Sapphire (explodes like a carrot)
            ABSINTHE = "Viewing arson as art, huh?", -- Absinthe
            TEA_LUMPY_VODKA = "Hey, this is real tea.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "I can smell the flowers, so I'll drink anything.", -- Rose-Scented Brandy
            KAHLUA = "I can drink both coffee and alcohol, hehe...", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "Did you put nuts in whiskey?", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "This tastes really good!", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "I've never seen this drink before, but it looks worth trying.", -- Rumchata (Rum mixed with horchata)

            -- Collaborative Distilled Spirits

            MOONWAY = "Drink whatever you've made as long as it makes you drunk, right?", -- Shipwrecked Rainbow Jelly Distilled Spirit
            ARRACK = "I like that it has a faint fruit aroma.", -- Arrack (Coconut Wine)
            CHERRY_BLOOM_RUM = "It's pretty, but I should drink it all and set it on fire.", -- Cherry Honey Wine Distilled Spirit Cherry Blossom Petal Floating
            RICE_SPIRITS = "I like it strong like this.", -- Cheongju (Clear Rice Wine)
            WHEAT_WHISKEY = "Drinking it would be as good as setting a wheat field on fire.", -- Wheat Whiskey
            PALE_WHISKEY = "This whiskey is also made from fire.", -- Pale Malt Whiskey

            -- Exclusive Collaborative Distilled Spirits for Walani

            NUT_COCONUT_BRANDY = "If I can't own the sea, I'll turn everything into ashes.", -- Coconut Brandy (Named Caribbean Brandy since I can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "Wow. I really like this, huh?", -- Boom Berry Sapphire (explodes like a carrot)

            -- Pot Cooking

            DARK_RUINCOLATE = "Did a lot of things pile up on me, Walani?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Mmm... sweet.", -- White Chocolate
            RUINCOLATE = "Melt it well and make a spread to taste even better!", -- Regular Chocolate
            RUIN_SCHOKAKOLA = "It'll show fire better if you light it. Well, it's chocolate.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Doesn't look like it'll hold water. Should I use it for firewood or something?", -- Empty Steel Bucket
                FULL = "Rainwater has collected inside.", -- Clean rainwater is inside
                FULL_ICE = "It's frozen solid.", -- Rainwater has frozen
                DIRTY = "Dirty water has collected inside!", -- Rainwater has become dirty
                DIRTY_ICE = "Maybe heating it up all at once will solve everything?", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Not an empty wood bucket?", -- Empty Woodie's Wooden Bucket
                FULL = "Rainwater has collected inside.", -- Clean rainwater is inside
                FULL_ICE = "It's frozen solid.", -- Rainwater has frozen
                DIRTY = "Dirty water has collected inside!", -- Rainwater has become dirty
                DIRTY_ICE = "Maybe burning it all at once will solve everything?", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "It would be fun to put firewood in it and burn it all at once!", -- Empty Wooden Bucket
                FULL = "Rainwater has collected inside.", -- Clean rainwater is inside
                FULL_ICE = "It's frozen solid.", -- Rainwater has frozen
                DIRTY = "Dirty water has collected inside!", -- Rainwater has become dirty
                DIRTY_ICE = "Maybe burning it all at once will solve everything?", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "It'd be a great spectacle to set it on fire with a windmill.", -- Desalinator without water
                PURIFY_LONG = "It's boring without a fire.", -- Still a long way to go until purification is complete
                PURIFY_SHORT = "Purification will be done soon.", -- Purification is almost complete
                HASWATER = "Purification is complete.", -- Desalinator has clean water
                BURNT = "At least it was incredibly fun, right?", -- Desalinator has burnt down
                HASSALT = "You need to remove the salt first before you can use it.", -- Desalinator has salt left
            },

            BARREL =
            {
                GENERIC = "How about a powder keg instead of a water barrel?", -- Examining the water barrel
                BURNT = "Water is nothing without firepower.", -- Water barrel has burnt down
            },

            BREWERY =
            {
                EMPTY = "There's nothing you can't do with fire.", -- Examining the Brewery
                BURNT = "It was fermented intensely, for sure.", -- Brewery has burnt down
                FERMENTING_LONG = "It's fermenting nicely with the heat.", -- Still a long way to go until fermentation is complete
                FERMENTING_SHORT = "Fermentation will be done soon.", -- Fermentation is almost complete
                DONE = "There should be a drink brewed with fire inside.", -- Brewery contains a brewed drink
            },

            CAMPKETTLE_ITEM = "I'm going to use fire to sterilize the water.", -- Examining the Camp Kettle (Item)
            CAMPKETTLE =
            {
                GENERIC = "It's empty.", -- Camp Kettle (in Fire Pit) is empty
                BOILING_LONG = "It's boiling away the impurities. I grew up as a clean kid.", -- Water is starting to boil
                BOILING_SHORT = "Hurry up and boil it, my throat is on fire!", -- Water is almost boiled
                DONE = "Heating it with fire can make water better, right?", -- Clean water is inside the Camp Kettle
                STOP = "I need firepower. More firepower!", -- No fire in Fire Pit, so dirty water isn't boiling
            },

            CAMPDESALINATOR_ITEM = "I'm going to make a duel between seawater and fire.", -- Examining the Camp Desalinator (Item)
            CAMPDESALINATOR =
            {
                GENERIC = "There's no contender for the duel.", -- Camp Desalinator (in Fire Pit) has no water
                BOILING_LONG = "Come on, fire up!", -- Water is starting to boil
                BOILING_SHORT = "It's almost gone!", -- Water is almost boiled
                DONE = "Fire always wins.", -- Clean water is inside the Camp Desalinator
                STOP = "Hey, hey! There's no fire!", -- No fire in Fire Pit, so saltwater isn't being purified
            },

            KETTLE =
            {
                EMPTY = "You have to sterilize all water with fire.", -- Empty Kettle
                BURNT = "Without water, it's nothing.", -- Kettle has burnt down
                BOILING_LONG = "Fire is working hard to brew the ingredients.", -- Brewing has just started
                BOILING_SHORT = "Fire, hurry up! My throat is burning!", -- Brewing is almost done
                DONE = "Heating it with fire can make water better, right?", -- The drink is done brewing
                PURIFY_LONG = "Fire is working hard to sterilize the water.", -- Sterilization has just started
                PURIFY_SHORT = "Hurry up, fire!", -- Sterilization is almost done
                HASWATER = "What should I cook next?", -- Kettle contains clean water
                MELT_LONG = "Fire is working hard to melt the ice.", -- Melting the ice has just started
                MELT_SHORT = "Fire, quickly!", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Just an empty can.", -- Examining the Portable Kettle (Item)
                EMPTY = "It's just a can without water.", -- Empty Portable Kettle (placed)
                BOILING_LONG = "Boil it quickly!", -- Brewing has just started
                BOILING_SHORT = "Hurry up, my throat is burning!", -- Brewing is almost done
                DONE = "Alright, let's drink it.", -- The drink is done brewing
                PURIFY_LONG = "Quickly boil it!", -- Sterilization has just started
                PURIFY_SHORT = "Fire, hurry up!", -- Sterilization is almost done
                HASWATER = "What should I cook next?", -- Portable Kettle contains clean water
                MELT_LONG = "Quickly melt it!", -- Melting the ice has just started
                MELT_SHORT = "Fire, quickly!", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "A machine that uses fire effectively.", -- Examining the Distillers
                DISTILLTING_LONG = "It would have ended faster if I had thrown fire inside.", -- Distillation still has a long way to go
                DISTILLING_SHORT = "Hurry up, I want to drink.", -- Distillation is almost complete
                DONE = "It's mine!", -- Distillers contain a drink
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "I only use it when I need to.", -- Maximum pressure
                MIDDLE_PRESSURE = "Look, it's already weakened.", -- Pressure is medium
                LOW_PRESSURE = "The firepower is lacking, that's for sure.", -- Almost no pressure
                RECHARG_PRESSURE = "Maybe it'll work hard if I add some fire?", -- Pressure is completely gone (can't use it until it's back to maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Should I supply it with fuel since it's asking for it?", -- Examining the Sprinkler with low fuel
                ON = "It makes a really annoying noise.", -- Sprinkler is active
                OFF = "Don't bother me when I'm not working.", -- Examining the inactive Sprinkler
            },
        },
    }