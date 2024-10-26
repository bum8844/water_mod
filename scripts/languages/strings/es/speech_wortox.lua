return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Una cubeta es suficiente.", -- Trying to give a bucket when the well already has one.
            WELL_BUSY = "No recibirás el regalo si eres codicioso.", -- Trying to give a bucket when there's a bucket inside the well.
        }
    },

    ANNOUNCE_DRUNK = "¡El mundo terrenal y el de las sombras son visibles!", -- Getting drunk
    ANNOUNCE_DRUNK_END = "El mundo terrenal esta aclarándose de nuevo.", -- Sobering up from alcohol (hangover)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Specific to Wickerbottom.
    ANNOUNCE_NOTCHARGE = "Necesita recargarse, amigo", -- Wolfgang can't milk a bucket without enough charge.
    ANNOUNCE_NOTHIRSTSLEEP = "Si duermo así, me convertiré en un diablillo por la mañana.", -- Attempting to sleep when thirsty at night
    ANNOUNCE_NOTHIRSTSIESTA = "No quiero convertirme en carne seca por la sed.", -- Attempting to siesta when thirsty during the day
    ANNOUNCE_SLEEP_END = "¡De vuelta al mundo terrenal!", -- Waking up after sleeping and completely sobering up from alcohol
    ANNOUNCE_THIRST = "Puedo parecer inmortal, ¡Pero aún necesito beber agua!", -- When extremely thirsty
    
    ANNOUNCE_CAFFINE_BUFF_START = "Wow, estoy empezando a temblar", -- Starting the caffeine buff
    ANNOUNCE_CAFFINE_BUFF_STOP = "¿Me pregunto cuánto espíritu queda dentro de mí?", -- Ending the caffeine buff
    
    ANNOUNCE_CURE_WATERBORNE = "Wow, eso no estuvo tan mal.", -- Dialogue when curing a waterborne disease with an item
    
    ANNOUNCE_DCAPACITY_CRITICAL = "Los tragos me van a llevar al mundo de las sombras!", -- About to become drunk
    ANNOUNCE_DCAPACITY_HALF = "Wow, ¡Me siento muy bien!", -- When starting to feel tipsy

    DESCRIBE =
    {
        BOILBOOK = "¿Hay un manual para hervir agua también?",
        
        WATER_CLEAN_ICE = "Debe ser difícil de beber.", -- Clean ice water
        WATER_DIRTY_ICE = "Hugh, ¡Está sucio!", -- Dirty ice water

        SPICE_CAFFEINPEPPER = "Especia picante.", -- Caffeine pepper spice

        WELL_KIT = "Una guía para mortales sobre como construir un pozo.", -- Well kit
        WELL_SPRINKLER_KIT = "No me gusta ser salpicado.", -- Sprinkler kit
        WELL_WATERPUMP_KIT = "Un pozo mágico ¡Qué divertido!", -- Steam water pump kit
        WELL_BURYING_KIT = "Una herramienta para borrar errores pasados.", -- Hole burial kit
        WELL_DRILLING = "Creando agujeros en el mundo.", -- Drilling holes
        WELL_DRILLING_ITEM = "¡Cavemos un poco!", -- Drill item
        HOLE = "¡Está muy profundo ahí dentro!", -- Well hole
        WELL = "Necesito una cubeta para bajarla.", -- Well

        WX78MODULE_NONEDRUNK = "Puede que seas el más inteligente del grupo", -- 78전용 묘듈

        -- Water-mode Plants

        TEA_TREE = "Un árbol aromático y débil.", -- Tea tree
        DUG_TEA_TREE = "Debería plantarlo en algún sitio.", -- Dug tea tree
        TEA_SEED = "Hay algo pequeño dentro.", -- Tea tree seed
        TEA_SEED_COOKED = "No pudo aguantar el calor.", -- Roasted tea tree seed
        TEA_SEED_SAPLING = "¡Está creciendo tan diligentemente!", -- Tea tree sapling
        TEALEAVES = "Hojas fragantes.", -- Tea leaves
        TEALEAVES_DRIED = "Se han secado. La crueldad tiene su propio encanto.", -- Dried tea leaves

        CAFFEINBERRY = "Es azul, a diferencia de mí.", -- Caffeine berry bush
        DUG_CAFFEINBERRY = "¿Hay algún lugar dónde plantar esto?", -- Dug caffeine berry bush
        CAFFEINBERRY_BEAN = "Un grano de olor vivo.", -- Fresh caffeine bean
        CAFFEINBERRY_BEAN_COOKED = "Tiene un olor vigorizante.", -- Roasted caffeine bean

        RUINCACAO_TREE = "Un árbol alegre y misterioso. ¡Qué divertido!", -- Cacao tree
        DUG_RUINCACAO_TREE = "¿Está bien plantar esto cerca de casa?", -- Dug cacao tree
        RUINCACAO_SEED = "¿Está brotando?", -- Cacao seed item
        RUINCACAO_SEED_SAPLING = "¡Extrañamente está creciendo!", -- Cacao seedling
        RUINCACAO = "No soy un Krampus, pero...", -- Cacao before breaking
        RUINCACAO_BEAN = "Huele a quemado.", -- Crushed cacao bean
        RUINCACAO_BEAN_COOKED = "Extrañamente, huele bien.", -- Roasted cacao bean

        -- Distilled Spirits Additives

        ADDITIVE_SEED = "Tiene un olor picante.", -- Herbal additives (Anise, Juniper Berry, Palgak Motive) for liqueurs
        ADDITIVE_PETALS = "Estas hierbas son usadas para hacer bebidas.", -- Herbal, Tea, and Petal additives for liqueurs
        ADDITIVE_NUT = "¡Los mortales pueden romper sus dientes con esto!", -- Nut additives (Burchi Nut, Coconut, Coffee Bean, Cacao Bean) for liqueurs
        ADDITIVE_DAIRY = "¿Me pregunto que harán los mortales con esto?", -- Dairy additives for liqueurs

        -- Drinks

        WATER_CLEAN = "Los mortales no pueden vivir sin esto.", -- Clean water
        WATER_DIRTY = "Hugh, está sucia", -- Dirty water
        WATER_SALTY = "Hugh, cuanto más tomo más me da sed", -- Saltwater

        GOOPYDRINK = "Un desagradable experimento fallido.", -- Failed drink (Wet Goop concept)

        -- Teapot Drinks

        FRUITJUICE = "Tiene de todo dentro.", -- Mixed fruit juice
        BERRIES_JUICE = "Tiene el sabor dulce que le gusta a los mortales.", -- Berry juice
        POMEGRANATE_JUICE = "¿Debería beberlo?", -- Pomegranate juice
        BANANA_JUICE = "A los mortales les gustaría esto.", -- Banana juice
        FIG_JUICE = "Beber esto hará que me echen de la granja.", -- Fig juice
        DRAGONJUICE = "¿Tiene sabor a dragón o sabor a mosca?", -- Dragonfruit juice
        GLOWBERRYJUICE = "Es bueno para brillar, pero no para beber.", -- Glowberry juice
        WATERMELON_JUICE = "Hmmm, paso.", -- Watermelon juice

        VEGGIE_TEA = "Estoy bien, es el alma la que importa.", -- Vegetable juice
        CARROT_TEA = "Beber zanahorias no hace daño.", -- Carrot tea
        CACTUS_TEA = "Una bebida sin espinas y de buen aspecto.", -- Cactus tea
        TOMATO_JUICE = "Tomate triste, jeje", -- Tomato juice
        LUMPY_TEA = "¿A que saben las raíces?", -- Root tea
        SEAWEED_SHAKE = "¿Algas de nuevo?.", -- Seaweed shake

        GREENTEA = "Parece que falta algo.", -- Fresh leaf green tea
        BLACKTEA = "Las hojas no eran rojas.", -- Black tea
        BLACKTEA_ICED = "Oops. Está frío, jeje.", -- Iced black tea
        FUER = "Sólo son hojas secas.", -- Fu Cha, Leaf Tea, Goshari Tea
        MIXFLOWER = "Un té de muchas flores.", -- Mixed flower petal tea
        HIBISCUSTEA = "Se siente como un alma. Jeje.", -- Hibiscus tea
        CACTUSFLOWER_TEA = "Una flor hermosa. ¡Ahora líquida!", -- Cactus flower tea
        LOTUSTEA = "Sin alma.", -- Lotus tea
        SUSHIBISCUS = "¿Es sushi?", -- Seosalt tea
        MOON_BLOSSOM_TEA = "Incluso la bebida brilla como la luna", -- Moon Blossom tea

        CAFFEINBERRY_JUICE = "Te dará energía. Aunque no sabe tan bien.", -- Black coffee
        TOFFEE_LATTE = "No me gustan estas bebidas.", -- Toffee Nut Latte
        RUINCHA_LATTE = "Supongo que debo probarlo.", -- Mocha Latte (Coffee + Chocolate)

        HOTRUINCOLATE = "Una solución para los mortales sin pelaje para invierno.", -- Hot Chocolate
        RUINCOLATE_SMOOTHIE = "Prefiero bebidas frías.", -- Chocolate Smoothie (Chilled)
        RUINXOCOLATL = "Aunque solo pruebes la mitad, es amargo.", -- Chocolatl (Spicy)
        TEA_RUINCOLATE_LATTE = "No me gusta mucho beber.", -- Matcha Latte

        MULLED = "Es una bebida cálida.", -- Banchou
        BUTTERBEER = "Se siente extrañamente mágico.", -- Butterbeer from the Harry Potter series

        -- Collaborative Teapot Drinks

        COCONUT_JUICE = "No tiene ningún tipo de sabor.", -- Shipwrecked Coconut Juice
        RAINBOW_SHAKE = "Con solo ver los colores es suficiente.", -- Shipwrecked Rainbow Jelly Shake
        QUARTZ_SHAKE = "¿Bebida de cerebro? no lo podría haber imaginado.", -- Shipwrecked Brainy Matter Shake
        CHERRY_ROSEBERRIES_TEA = "Tiene un oscuro olor a rosa.", -- Cherry Forest Rosehip Tea
        CHERRY_HONEY_TEA = "Es lo suficientemente dulce para beberlo.", -- Cherry Forest Sakura Honey Tea
        SWEET_RICE_DRINK = "¡Deberías comerlo y beberlo a la vez!", -- Vita Co-op Sikhye
        ANANAS_JUICE = "Podría ser una esencia.", -- Legion Pineapple Juice
        ORANGE_JUICE = "Estoy satisfecho con solo ver el color.", -- More Food Pack Orange Juice
        STRAWBERRY_SMOOTHIE = "¿Una fruta roja hizo esto?.", -- More Food Pack Strawberry Smoothie
        STRAWBERRY_MILK_SMOOTHIE = "Al menos es suave.", -- More Food Pack Strawberry Smoothie Latte

        -- Brewery Drinks

        SPOILED_DRINK = "¡Es agua podrida!", -- Spoiled Drink

        -- Brewery Soda

        SODA = "Hmm, ¡Es como si el agua me atacara!", -- Soda Water
        FRUITSODA = "Parece como si las frutas gritaran", -- Fruit Soda
        LEMONLIMESODA = "Una bebida dulce con sabor frutal.", -- Lemon Lime Soda (Superior to Fruit Soda)
        COLA = "Está bien para estar negro.", -- Cola
        COLAQUANTUM = "Hmm, ¡La radiación es buena!", -- Cola Quantum
        LUMPY_BEER = "Parece estar diseñado para la policía.", -- Root Beer (Not alcohol)

        -- Brewery Spirits

        CORN_BEER = "¿Adónde fue el maíz?", -- Corn Beer
        MADHU = "Si lo bebes ¡Zumbarás como una abeja!", -- Madhu
        WINE = "Sabe a mortal.", -- Wine (Berry Brewing)
        NOBLEWINE = "¿Cómo es que el rojo se hizo blanco?", -- Noble Wine (Baked Berry Brewing)
        SPARKLINGWINE = "Hmm, ¿Lleno de cosas malas para el cuerpo!", -- Sparkling Wine
        GLOWBERRYWINE = "Voy a beber algo extraño.", -- Glow Berry Wine
        KUMIS = "Bueno, no es un regalo si lo bebes.", -- Kumis
        LUMPY_WINE = "No puedo confiar en el subsuelo.", -- Sake (Roots such as potatoes and sweet potatoes)
        PULQUE = "¿Quién diría que las plantas con púas pueden usarse para beber?", -- Pulque
        RUINCACAO_WINE = "Oh, ¿Ahora puedes hacer alcohol con granos?", -- Cacao Wine

        -- Collaborative Soda

        CHERRY_DOCTOR_COLA = "Puede ser una herramienta de toruta, jojo.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
        ANANASSODA = "Prefiero que sea una fruta a que sea bebida.", -- Pineapple Soda (Orangina)
        ORANGESODA = "Naranjas que se hicieron juego.", -- Orange Soda (Fanta)
        STRAWBERRYSODA = "¿Las semillas explotarán?", -- Strawberry Soda (Welch's Strawberry)

        -- Collaborative Spirits

        AUROBOW = "¿Una bebida después de llover?", -- Shipwrecked Rainbow Jelly Wine
        COCONUT_WINE = "No sabe a nada en especial.", -- Shipwrecked Coconut Wine
        CHERRY_BLOOM_MADHU = "Suficientemente dulce para beberlo.", -- Cherry Blossom Honey Wine
        GIANT_BLUEBERRY_WINE = "Bueno para beber, ¡Pero mejor para pelear!", -- Boom Berry Wine (Explodes when ignited)
        RICE_WINE = "¿El arroz se disolvió en el agua?", -- Vita Co-op Makgeolli
        WHEAT_BEER = "Beberé cerveza de trigo cuando haya marea alta.", -- Heap of Food Wheat Beer
        PALE_BEER = "¿Me pondré pálido también?", -- Legion Pale Ale (Beer made with Monster's Fruit)

        -- Distilled Spirits

        DISINFECTANT = "Mientras tengas una alma, no necesitas desinfectarte.", -- Disinfectant
        CORN_WHISKEY = "Es sólo licor de maíz.", -- Corn Whiskey
        LUMPY_VODKA = "Los diablillos tienen problemas con esto.", -- Vodka
        TEQUILA = "Adora al sol, jojojo.!", -- Tequila
        MADHU_RUM = "Dicen que los mortales beben veneno.", -- Rum
        BERRY_BRANDY = "Tiene un sabor que les gustaría a los mortales sofisticados. No a mí.", -- Berry Brandy
        AREUHI = "Me pregunto si los niños mortales lo beben y actúan como adultos.", -- Kumis Distilled Areuhi

        -- Warly Exclusive Distilled Spirits

        BERRY_GIN = "Dicen que los mortales lo mezclan con otras cosas.", -- Gin
        GLOWBERRY_GIN = "¿Tu estómago brillará?", -- Glow Berry Gin
        ABSINTHE = "Es como cuando borras un color.", -- Absinthe
        TEA_LUMPY_VODKA = "No, no, no.", -- Green Tea Liqueur
        PETALS_BERRY_BRANDY = "No es mi estilo.", -- Rose Scented Brandy
        KAHLUA = "En balance como dormir y despertar.", -- Coffee Liqueur Kahlua
        NUT_CORN_WHISKEY = "¿Esto tiene alcohol?", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "Hmm, Estoy bien.", -- Baileys Cacao Cream Liqueur
        RUMCHATA = "¿Esto es común en la sociedad mortal?", -- Rumchata (Rum mixed with Ouatza)

        -- Collaborative Distilled Spirits

        MOONWAY = "No lo entiendo.", -- Shipwrecked Rainbow Jelly Distilled Wine
        ARRACK = "Todavía es un poco sencillo.", -- Arrack (Indonesian version of Coconut Wine Distilled Spirit)
        CHERRY_BLOOM_RUM = "Suficientemente bueno para beber.", -- Cherry Blossom Honey Wine Distilled Spirit with Cherry Blossoms Floating
        RICE_SPIRITS = "Debe ser divertido esconderse en el agua.", -- Cheongju
        WHEAT_WHISKEY = "Los mortales deberían mezclarlo con sus bebidas.", -- Wheat Whiskey
        PALE_WHISKEY = "Está muy pálido.", -- Pale Malt Whiskey

        -- Warly Exclusive Collaborative Distilled Spirits

        NUT_COCONUT_BRANDY = "¡Oye, cabeza de pulpo! ¿Estás buscando algo? ¿Podría ser esto? ¡Se ve bien!", -- ¡Oye, cara de pez! ¿Perdiste algo? ¿Eh?. -- Calypso, Pirates of the Caribbean
        GIANT_BLUEBERRY_GIN = "Hohoho, ¡Esto debería ser divertido!", -- Boom Berry Sapphire (Explodes when carrots are added)

        -- Pot Recipes

        DARK_RUINCOLATE = "¡Un trozo del mundo oscuro!", -- Dark Chocolate
        WHITE_RUINCOLATE = "Sigue siendo más suave que un alma.", -- White Chocolate
        RUINCOLATE = "Es principalmente el dulce favorito.", -- Plain Chocolate
        RUIN_SCHOKAKOLA = "¿Los mortales intentan comer plantas que nunca antes habían visto?", -- Chocacola

        BUCKET_STEEL_EMPTY =
        {
            EMPTY = "¿El agua sabrá a acero?", -- Empty steel bucket
            FULL = "Agua para mortales.", -- Clean rainwater is filled
            FULL_ICE = "Un mundo demasiado frío para vivir.", -- Rainwater has frozen
            DIRTY = "Agua sucia.", -- Rainwater has become dirty
            DIRTY_ICE = "Parece haber experimentado toda la suciedad del mundo.", -- Dirty rainwater has frozen
        },

        BUCKET_WOODIE_EMPTY =
        {
            EMPTY = "Es casi un contenedor.", -- Woodie's empty wooden bucket
            FULL = "Agua para mortales.", -- Clean rainwater is filled
            FULL_ICE = "Un mundo demasiado frío para vivir.", -- Rainwater has frozen
            DIRTY = "Agua sucia.", -- Rainwater has become dirty
            DIRTY_ICE = "Parece haber experimentado toda la suciedad del mundo.", -- Dirty rainwater has frozen
        },

        BUCKET_DRIFTWOOD_EMPTY = 
        {
            EMPTY = "¡Uy uy! Me preguntó si cuando saqué agua me clavaré astillas de la madera", -- Empty wooden bucket
            FULL = "Agua para mortales.", -- Clean rainwater is filled
            FULL_ICE = "Un mundo demasiado frío para vivir.", -- Rainwater has frozen
            DIRTY = "Agua sucia.", -- Rainwater has become dirty
            DIRTY_ICE = "Parece haber experimentado toda la suciedad del mundo.", -- Dirty rainwater has frozen
        },

        BUCKET_EMPTY =
        {
            EMPTY = "A bucket to hold water.", -- Empty wooden bucket
            FULL = "Agua para mortales.", -- Clean rainwater is filled
            FULL_ICE = "Un mundo demasiado frío para vivir.", -- Rainwater has frozen
            DIRTY = "Agua sucia.", -- Rainwater has become dirty
            DIRTY_ICE = "Parece haber experimentado toda la suciedad del mundo.", -- Dirty rainwater has frozen
        },

        DESALINATOR =
        {
            EMPTY = "Quiere agua salada, a diferencia de los mortales.", -- Desalinator has no water
            PURIFY_LONG = "Tomará un poco de tiempo.", -- Much time left for purification
            PURIFY_SHORT = "¡Casi está listo!", -- Purification is almost finished
            HASWATER = "¡Parece que está listo!", -- Desalinator has clean water
            BURNT = "Supongo que beberé agua salada de nuevo, jeje.", -- Desalinator has burned
            HASSALT = "Umm, huele a sal.", -- Desalinator still has salt
        },

        BARREL =
        {
            GENERIC = "Lleno de agua en vez de almas.", -- Examining a barrel with water
            BURNT = "El agua se quemó también?", -- Barrel has burned
        },

        BREWERY =
        {
            EMPTY = "Realmente no entiendo los gustos mortales.", -- Examining an empty brewery
            BURNT = "Jeje, tampoco entiendo la cocina de los mortales.", -- Brewery has burned
            FERMENTING_LONG = "Tomará bastante tiempo.", -- Much time left for fermentation
            FERMENTING_SHORT = "¡Casi está listo!", -- Fermentation is almost finished
            DONE = "¡Pensé que moriría esperando!", -- Brewery has a drink in it
        },

        CAMPKETTLE_ITEM = "Una manera para sobrevivir de los mortales.", -- Examining a camp kettle item
        CAMPKETTLE =
        {
            GENERIC = "¡Crear algo de la nada es imposible!", -- Examining a camp kettle with no water
            BOILING_LONG = "Tomará algo de tiempo.", -- Boiling water has started
            BOILING_SHORT = "¡Realmente estoy esperando esto!", -- Water boiling is almost done
            DONE = "¿Debería tomarlo ahora?", -- Clean water is obtained
            STOP = "¡Que fuego tan débil!", -- Dirty water isn't boiling because there's no fire
        },

        CAMPDESALINATOR_ITEM = "Una herramienta sencilla para quitar la sal.", -- Examining a camp desalinator item
        CAMPDESALINATOR =
        {
            GENERIC = "Quiere agua salada, a diferencia de los mortales.", -- Camp desalinator has no water
            BOILING_LONG = "Tomará algo de tiempo.", -- Boiling water has started
            BOILING_SHORT = "¡Realmente estoy esperando esto!", -- Salt removal is almost done
            DONE = "¿Debería tomármelo ahora?", -- Clean water is obtained
            STOP = "¡Que fuego tan débil!", -- Salt removal isn't happening because there's no fire
        },

        KETTLE =
        {
            EMPTY = "Completamente vacío.", -- Examining an empty kettle
            BURNT = "No entiendo la cocina mortal.", -- Kettle has burned
            BOILING_LONG = "Tomará algo de tiempo.", -- Cooking a drink has started
            BOILING_SHORT = "¡Ya casi está!", -- Drink preparation is almost done
            DONE = "¿Debería beberlo ahora?", -- A drink is complete
            PURIFY_LONG = "Tardará un poco.", -- Purifying dirty water has started
            PURIFY_SHORT = "¡Casi está listo!", -- Dirty water is almost purified
            HASWATER = "Supongo que debería hervirlo de nuevo.", -- Kettle has clean water
            MELT_LONG = "Tomará su tiempo.", -- Melting ice water has started
            MELT_SHORT = "¡Casi está derretido!", -- Ice water is almost melted
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "Can I boil souls in it?", -- Examining a portable kettle item
            EMPTY = "Completamente vacío.", -- Examining an empty placed portable kettle
            BOILING_LONG = "Tomará algo de tiempo.", -- Cooking a drink has started
            BOILING_SHORT = "¡Ya casi está!", -- Drink preparation is almost done
            DONE = "¿Debería beberlo ahora?", -- A drink is complete
            PURIFY_LONG = "Tardará un poco.", -- Purifying dirty water has started
            PURIFY_SHORT = "¡Casi está listo!", -- Dirty water is almost purified
            HASWATER = "Supongo que debería hervirlo de nuevo", -- Placed portable kettle has clean water
            MELT_LONG = "Tomará su tiempo.", -- Melting ice water has started
            MELT_SHORT = "¡Casi está derretido!", -- Ice water is almost melted
        },

        DISTILLERS =
        {
            EMPTY = "¿Deberíamos probar algún licor?", -- Examining an empty distiller
            DISTILLTING_LONG = "Tomará tiempo.", -- Distillation is taking a long time
            DISTILLING_SHORT = "¡Fue demasiado!", -- Distillation is almost done
            DONE = "¡Pensé que mi garganta se secaría!", -- Distiller has a drink in it
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "¡Está haciendo mucho ruido!", -- Maximum pressure
            MIDDLE_PRESSURE = "El ruido ya no es tan alto.", -- Medium pressure
            LOW_PRESSURE = "Parece que se va a apagar.", -- Almost no pressure
            RECHARG_PRESSURE = "¡Supongo que necesito recargarlo!", -- No pressure (can't use it until pressure is at maximum)
        },

        WELL_SPRINKLER =
        {
            LOWFUEL = "Parece que necesita más combustible.", -- Examining with almost no fuel
            ON = "¡Apareció una fuente!", -- It's working
            OFF = "No funciona, está descansando.", -- Examining when not working
        },
    }
}