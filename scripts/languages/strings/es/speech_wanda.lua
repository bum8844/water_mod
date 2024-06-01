return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Necesito mover la cubeta fuera de mi camino primero.",
            WELL_BUSY = "¿Olvide que había puesto una cubeta en el pozo?", 
        }
    },

    ANNOUNCE_DRUNK = "¡Que molestia, me siento mareada!",
    ANNOUNCE_DRUNK_END = "No more time to waste!", -- 
    ANNOUNCE_DRUNK_IMMUNITY = "", -- 
    ANNOUNCE_NOTCHARGE = "En este momento, no tiene leche.",   
    ANNOUNCE_NOTHIRSTSLEEP = "I should find something to drink first.", -- 
    ANNOUNCE_NOTHIRSTSIESTA = "I should find something to drink first.", -- 
    ANNOUNCE_SLEEP_END = "Oh my, which time phase am I in now?", -- 
    ANNOUNCE_THIRST = "I wonder how long it's been since I had a drink?", -- 

    ANNOUNCE_CAFFINE_BUFF_START = "Excellent, I feel like I can chase time!" , -- 
    ANNOUNCE_CAFFINE_BUFF_STOP = "Darn it! Time is speeding up again!" ,  -- 
    
    ANNOUNCE_CURE_WATERBORNE = "Finalmente se arregló mi relog interno." , 

    ANNOUNCE_DCAPACITY_CRITICAL = "Time is accelerating!", -- 
    ANNOUNCE_DCAPACITY_HALF = "I'm starting to feel more composed as the intoxication wears off.", -- 

    DESCRIBE =
    {
        BOILBOOK = "¡Cuándo voy a tener tiempo de pensar en un refrigerio si hasta me falta tiempo para hervir agua!",

        WATER_CLEAN_ICE = "¿Cuándo podré derretirlo y beberlo?", 
        WATER_DIRTY_ICE = "I'd rather get fresh ice for my drink.", -- 

        SPICE_CAFFEINPEPPER = "No puedo esperar después de marinarlo.",

        WELL_KIT = "Just having it in my hand won't make the water flow, I need to install it!", -- 
        WELL_SPRINKLER_KIT = "Es sofisticado, pero no tardará más de un segundo en instalarse.",
        WELL_WATERPUMP_KIT = "I can get groundwater without wasting time.", 
        WELL_BURYING_KIT = "Oh que molestia, que perdida de tiempo es esto",
        WELL_DRILLING = "It'll do it by itself, let's save my time.", --
        WELL_DRILLING_ITEM = "I should decide where to dig for groundwater first.", -- 
        HOLE = "It takes ages to climb out once you fall in.", -- 
        WELL = "Watching it won't make the water magically appear. I need a tool!", -- 

        WX78MODULE_NONEDRUNK = "Aha! I was wondering when they'd started making these.", -- 78전용 묘듈

        -- Waterlogged Plant Mode

        TEA_TREE = "This tree has reached its growth limit.", 
        DUG_TEA_TREE = "No time to waste, I'll just take it all!", 
        TEA_SEED = "It'll grow into a new tree when the time is right.",
        TEA_SEED_COOKED = "It either gets eaten or rots, there's no in-between future for this.", 
        TEA_SEED_SAPLING = "Este pequeñín parece crecer lentamente a propósito, sólo para fastidiarme.",
        TEALEAVES = "These are the picked tea leaves.", 
        TEALEAVES_DRIED = "Estas son unas hojas de té secas.",

        CAFFEINBERRY = "The past life of a hanging alien plant.", -- 
        DUG_CAFFEINBERRY = "If I take it, maybe I can save some time to rest.", -- 
        CAFFEINBERRY_BEAN = "It combines the states of coffee and peppernut.", --
        CAFFEINBERRY_BEAN_COOKED = "I could eat it right away, but maybe I can stabilize time first.", --

        RUINCACAO_TREE = "It's as twisted as the timelines themselves.", --
        DUG_RUINCACAO_TREE = "No time to waste, I'll just take it all!", --
        RUINCACAO_SEED = "A new life is slowly sprouting.", --
        RUINCACAO_SEED_SAPLING = "Este pequeñín parece crecer lentamente, sólo para fastidiarme.", 
        RUINCACAO = "You can't tell if it's fruit or charcoal until you open it.", --
        RUINCACAO_BEAN = "Eating this will surely turn my stomach upside down.", -- 
        RUINCACAO_BEAN_COOKED = "Is this a waste of time or not? I can't tell.", -- 

        -- Distillery Additives

        ADDITIVE_SEED = "Las semillas convertidas en especias elaborarán potentes licores.",
        ADDITIVE_PETALS = "Bundles of old petals yearning for timeless beauty.", 
        ADDITIVE_NUT = "Should I just pop it in my mouth?", -- 
        ADDITIVE_DAIRY = "When it's easier to drink, I'll drink it faster.", -- 

        -- Drinks

        WATER_CLEAN = "Pure water from a different timeline.", --
        WATER_DIRTY = "If I'm in a hurry, maybe...!", --
        WATER_SALTY = "Impurities from future clouds mixed in.", -- 

        GOOPYDRINK = "Oh botheration, I was too impatient!", -- 

        -- Teapot Drinks

        FRUITJUICE = "Excellent, I can consume multiple fruits at once.", --
        BERRIES_JUICE = "Isn't it faster to just pick and eat them?", -- 
        POMEGRANATE_JUICE = "Now I can consume the seeds as well.", -- 
        BANANA_JUICE = "No baja facilmente por mi garganta cuando esta al tiempo",
        FIG_JUICE = "The essence of sweetness!", -- 
        DRAGONJUICE = "This is definitely fruit juice.", -- 
        GLOWBERRYJUICE = "Delicious and useful!", --
        WATERMELON_JUICE = "It's really refreshing!", --

        VEGGIE_TEA = "¡No tolero el sabor amargo cada vez que toca la punta de mi lengua",
        CARROT_TEA = "Let's drink it quickly.", --
        CACTUS_TEA = "It should aid digestion.", --
        TOMATO_JUICE = "Smooth, perfect for quick consumption.", -- 
        LUMPY_TEA = "I don't have time for a cup, but...", -- 
        SEAWEED_SHAKE = "Seems like a waste of time compared to other options.", -- 

        GREENTEA = "No time to distinguish teas.", -- 
        BLACKTEA = "Maybe I can indulge in a treat once in a while?", -- 
        BLACKTEA_ICED = "A sip of something cold is nice.", --
        FUER = "Maybe I can enjoy a cup once in a while.", -- 
        MIXFLOWER = "Es como si te agarraran por el cuello y te obligaran a oler las flores.",
        HIBISCUSTEA = "Why is it so sour?", --
        CACTUSFLOWER_TEA = "No tengo tiempo para detenerme a oler las flores.",
        LOTUSTEA = "In the past, it might have been a flower or perhaps a fish.", -- 
        SUSHIBISCUS = "No hay tiempo para distinciones... Espera, ¿qué es esto ahora?",
        MOON_BLOSSOM_TEA = "No se que tipo de té es este, pero no tengo tiempo para preocuparme para eso.",

        CAFFEINBERRY_JUICE = "Perfect for staying awake all night in the workshop.", -- Black coffee
        TOFFEE_LATTE = "It's both coffee and dessert.", --
        RUINCHA_LATTE = "I've saved some time by deciding what to drink.", --

        HOTRUINCOLATE = "Warmth and sweetness in abundance.", -- 
        RUINCOLATE_SMOOTHIE = "Coolness and sweetness in abundance.", -- 
        RUINXOCOLATL = "This is truly strange. it shows knowledge from another timeline!", -- 
        TEA_RUINCOLATE_LATTE = "It suits my taste well!", -- 

        MULLED = "I can't remember when I last stayed in bed sick...", -- 
        BUTTERBEER = "I can save time on mealtime by having this.", -- 

        -- Collaboration Teapot Drinks

        COCONUT_JUICE = "I compensated for the empty part with jelly.", -- 
        RAINBOW_SHAKE = "Efficient!", -- 
        QUARTZ_SHAKE = "At least I won't spend time chewing fish.", -- 
        CHERRY_ROSEBERRIES_TEA = "Sometimes, it's nice to have a cup of tea while looking at flowers.", -- 
        CHERRY_HONEY_TEA = "It's elegant and warm.", -- 
        SWEET_RICE_DRINK = "I don't know why these seeds take so long to eat...", -- 
        PINEANANAS_JUICE = "Incluso sin la piel exterior, si comes mucho, tu boca empezará a sangrar." ,
        ORANGE_JUICE = "I should have it as a snack after a meal.", -- 
        STRAWBERRY_SMOOTHIE = "Me atragantaré si trago precipitadamente.",
        STRAWBERRY_MILK_SMOOTHIE = "What a wonderful dessert!", -- 

        -- Distillery Drinks

        SPOILED_DRINK = "It used to be a beverage.", -- 

        -- Sodas

        SODA = "Seguro que no nos pasamos todo este tiempo haciendo burbujas en el agua, ¿verdad?",
        FRUITSODA = "No tardaré mucho en acabarlo, mejor beberlo despacio.",
        LEMONLIMESODA = "Carbonated drinks are delicious because they're sweet.", -- 
        COLA = "It's excellent, except for the burping.", -- 
        COLAQUANTUM = "Interesting, it's a beverage that shouldn't exist in this timeline.", 
        LUMPY_BEER = "¿Cuándo dejó de ser posible utilizar las raíces del árbol de sasafrás?",

        -- Spirits

        CORN_BEER = "¿Donde encontraré tiempo para beber y divertirme?",
        MADHU = "It lost its sweetness, but at least it gained some time.", -- Mead
        WINE = "It won't turn into vinegar too quickly.", --
        NOBLEWINE = "Isn't it just clear wine?", --
        SPARKLINGWINE = "In another timeline, I might be the one popping champagne at a party.", -- 
        GLOWBERRYWINE = "That's it! It doesn't spoil easily and it's efficient!", --
        KUMIS = "I hope the investment of time was worth it.", -- 
        LUMPY_WINE = "Supongo que me beneficiaré de esto.",
        PULQUE = "Creo que podría estropearse rápidamente en comparación con el tiempo invertido.",
        RUINCACAO_WINE = "It's a strange idea, but regardless, I gained some time.", 

        -- Collaboration Sodas

        CHERRY_DOCTOR_COLA = "I don't think this drink involves time travel.", 
        PINEANANASSODA = "Good, I won't waste too much time enjoying this.",
        ORANGESODA = "Good, I won't waste too much time enjoying this.",
        STRAWBERRYSODA = "Good, I won't waste too much time enjoying this.", 

        -- Collaboration Spirits

        AUROBOW = "¡No estoy seguro de si esto es posible, de todas formas, esto es increíble!" ,
        COCONUT_WINE = "If the voyage gets longer, I should have it on hand.", 
        CHERRY_BLOOM_MADHU = "It's quite elegant!", -- 
        GIANT_BLUEBERRY_WINE = "It makes me slightly anxious.", 
        RICE_WINE = "De cualquier manera, no puedo comer esto a menos que pase tiempo cocinándolo.",
        WHEAT_BEER = "Este método no está mal para hacer cerveza.",
        PALE_BEER = "I've seen so many strange things by now that this doesn't surprise me.", 

        -- Distilled Spirits

        DISINFECTANT = "It's useless for me. I only need time!", 
        CORN_WHISKEY = "Honestly, I don't know the taste, but at least it won't spoil quickly.", 
        LUMPY_VODKA = "Be careful not to waste time getting drunk.", 
        TEQUILA = "¡No debo subestimarlo, cerraré los ojos y lo beberé de golpe!",
        MADHU_RUM = "With this, I can set sail, maybe tomorrow, or even now.", 
        BERRY_BRANDY = "Whiskey, Brandy... Honestly, I don't know the difference, as long as it doesn't spoil.", -- Berry Brandy
        AREUHI = "Ahora no se echará a perder rápido.",

        -- Wolly-Exclusive Distilled Spirits

        BERRY_GIN = "Just one drink should be enough.", -- 
        GLOWBERRY_GIN = "It's an excellent spirit, but I still need to be cautious not to overindulge.", -- 
        ABSINTHE = "There's no time to sip it slowly.", --
        TEA_LUMPY_VODKA = "Honestly, I'm not sure if it even has the scent of tea.", --
        PETALS_BERRY_BRANDY = "I don't have the time to enjoy the floral scent in my drinks.", -- 
        KAHLUA = "Fantastic! It helps me overcome fear and boosts my energy.", -- 
        NUT_CORN_WHISKEY = "It's a waste of time to distinguish between types of spirits.", -- 
        RUINCACAO_CREAM_LIQUEUR = "It suits my taste, but I should be cautious about overindulging.", --
        RUMCHATA = "It's a bit less repulsive now.", -- 

        -- Collaboration Distilled Spirits

        MOONWAY = "A high-proof spirit that shines with 7 colors.", -- 
        ARRACK = "Roaming the islands, free from the constraints of time.", -- 
        CHERRY_BLOOM_RUM = "It's a pretty bottle, but I won't waste time admiring it.", --
        RICE_SPIRITS = "One sip, and I'll be wide awake.", -- 
        WHEAT_WHISKEY = "Honestly, I don't know the taste, but at least it doesn't spoil quickly.", -- 
        PALE_WHISKEY = "Once it's in your mouth, all spirits taste the same.", -- 

        -- Wolly-Exclusive Collaboration Distilled Spirits

        NUT_COCONUT_BRANDY = "The sea is fickle. I need something to conquer my fear.", --
        GIANT_BLUEBERRY_GIN = "Someday, someone will surely cause trouble with this.", --

        -- Pot Dishes

        DARK_RUINCOLATE = "¿Comprende Warly el secreto de este bocadillo?",
        WHITE_RUINCOLATE = "¡Warly conoce bien mis gustos!",
        RUINCOLATE = "¡No es soló dulce, pero también se conserva durante mucho tiempo!",
        RUIN_SCHOKAKOLA = "A perfect snack!", 

        BUCKET_STEEL_EMPTY =
        {
            EMPTY = "Is there really a need to stare at this empty bucket?", 
        FULL = "Recuperémosla rápidamente antes de que cambie su estado.",
        FULL_ICE = "Oh botheration, it's frozen over from the passage of time.", -- 
        DIRTY = "Oh botheration, it's been contaminated by time.", -- 
        DIRTY_ICE = "Oh botheration, it's frozen while still contaminated.", -- 
        },

        BUCKET_WOODIE_EMPTY =
        {
            EMPTY = "Woodie's woodworking skills are respectable. he's already emptied it.", --
            FULL = "Recuperémosla rápidamente antes de que deje de estar llena.",
            FULL_ICE = "Oh botheration, it's frozen over from the passage of time.", --
            DIRTY = "Oh botheration, it's been contaminated by time.", -- 
            DIRTY_ICE = "Oh botheration, it's frozen while still contaminated.", -- 
        },

        BUCKET_EMPTY =
        {
            EMPTY = "It's just an ordinary bucket.", -- 
            FULL = "Recuperémosla rápidamente antes de que se pierda el contenido.",
            FULL_ICE = "Oh botheration, it's frozen over from the passage of time.", --
            DIRTY = "Oh botheration, it's been contaminated by time.", -- 
            DIRTY_ICE = "Oh botheration, it's frozen while still contaminated.", -- 
        },

        DESALINATOR =
        {
            EMPTY = "A device that turns seawater into rainwater.", --
            PURIFY_LONG = "I can't just stand around waiting for it to finish. time is precious!", -- Purification has a long way to go
            PURIFY_SHORT = "¡Vamos, deprisa!", 
            HASWATER = "Finally!", --
            BURNT = "There's been a bit of a hiccup.", --
            HASSALT = "¡Contrólate, primero tengo que quitar la sal!",
        },

        BARREL =
        {
            GENERIC = "At least I don't have to worry about the water going bad.", -- Inspecting the barrel
            BURNT = "Who could have predicted that a barrel with water would catch fire?", -- The barrel is burnt
        },

        BREWERY =
        {
            EMPTY = "Esto es un verdadero acaparador de tiempo.",
            BURNT = "I suppose this was its destiny.", --
            FERMENTING_LONG = "Fermentation takes time, and I can't just wait around.", -- 
            FERMENTING_SHORT = "I've been waiting for quite a while!", --
            DONE = "Finally, something to show for it!", 
        },

        CAMPKETTLE_ITEM = "I should carry this around for a while.", 
        CAMPKETTLE =
        {
            GENERIC = "Did I forget to put water in this?", 
            BOILING_LONG = "¡Vamos, date prisa!",
            BOILING_SHORT = "Isn't it ready to drink yet?", -- 
            DONE = "It took this long just to make a drink?", -- 
            STOP = "¿En serio?, ¡El fuego no es lo suficientemente fuerte!",
        },

        CAMPDESALINATOR_ITEM = "Esto será útil porque el océano está a mi alrededor donde quiera que vaya.",
        CAMPDESALINATOR =
        {
            GENERIC = "Was there water in here to begin with, or was it always empty?", -- Camp desalinator is empty
            BOILING_LONG = "!Porque toma tanto tiempo!",
            BOILING_SHORT = "¡Ya casi acaba!",
            DONE = "It took this long just to make a drink?", -- 
            STOP = "¿En serio?, ¡El fuego no es lo suficientemente fuerte!",
        },

        KETTLE =
        {
            EMPTY = "At least I can boil a lot of water at once with this.", -- I
            BURNT = "Oh botheration, I'll have to lick dew off leaves for a while now.", -- 
            BOILING_LONG = "¿Porque toma tanto tiempo hacer una bebida?",
            BOILING_SHORT = "I hope it's not over-extracted. can I drink it now?", --
            DONE = "¡Por fin llegaron las bebidas!",
            PURIFY_LONG = "¡Vamos, date prisa!", 
            PURIFY_SHORT = "¿Todavía no está lista para beber?", 
            HASWATER = "Can I drink it now?", -- 
            MELT_LONG = "Can't I just melt the ice and drink it now?", -- 
            MELT_SHORT = "It's almost melted!", --
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "I don't have time to lay out a picnic blanket and have a tea party.", -- 
            EMPTY = "I'd better just... replenish my fluids from berries or carrots instead.", -- 
            BOILING_LONG = "¿Por qué se tarda tanto en preparar una bebida?",
            BOILING_SHORT = "It won't take too long, right?", -- 
            DONE = "¡Por fin han llegado las bebidas!",
            PURIFY_LONG = "¡Vamos, deprisa!",
            PURIFY_SHORT = "¿Aún no está listo para beber?",
            HASWATER = "Can I drink it now?", -- 
            MELT_LONG = "Can't I just melt the ice and drink it now?", -- 
            MELT_SHORT = "It's almost melted!", -- 
        },

        DISTILLERS =
        {
            EMPTY = "Spirits made with this won't spoil easily, at least.", --
            DISTILLTING_LONG = "Si sigo viendo esto hasta el final, estaré muerta antes de que termine.",
            DISTILLING_SHORT = "It shouldn't take too long!", 
            DONE = "Finally!", 
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "All the hard work paid off!", 
            MIDDLE_PRESSURE = "I can get clean water right away.", 
            LOW_PRESSURE = "It seems the power is running low.", 
            RECHARG_PRESSURE = "Oh molestia, tomará algún tiempo para bombear agua de nuevo.",
        },

        WELL_SPRINKLER =
        {
            LOWFUEL = "If I want, I can refuel it.", --
            ON = "This saves me time when watering!", --
            OFF = "It can be activated anytime.", -- 
        },
    },
}