return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Creo que es en otro orden.", -- Attempting to give a bucket when the well already has a bucket
            WELL_BUSY = "Quitemos lo que ya está ahí primero.", -- Attempting to give a bucket when there's already a bucket inside the well
        }
    },

        ANNOUNCE_DRUNK = "Hip, Me siento como un tronco...", -- Getting drunk
        ANNOUNCE_DRUNK_END = "¿Casi acabó talandomé a mi mismo, eh?", -- Getting sober after being drunk
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, specific to Wigfrid
        ANNOUNCE_NOTCHARGE = "Eh... ¿No sale leche?", -- Attempting to milk a charged Volt Goat with a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "Demasiado sediento para dormir.", -- Trying to sleep at night while very thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "Demasiado sediento para descansar.", -- Trying to rest during the day while very thirsty
        ANNOUNCE_SLEEP_END = "¿Lucy? No me cortarás, ¿eh? Fue una pesadilla terrible.", -- Waking up after sleeping and being sober
        ANNOUNCE_THIRST = "Tengo un poco de sed.", -- Feeling thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "¡Tan rápido como un coyote!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Supongo que es hora de quedarse quieto y cortar leña.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Mi estómago se siente mejor.", -- Curing a waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Me siento pesado...", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Oh, ¡Esto es bueno!", -- Starting to feel tipsy

        DESCRIBE =
        {
            BOILBOOK = "Bastante conveniente. Lucy, ¿Puedes ayudarme con la hora mientras preparamos bebidas?",

            WATER_CLEAN_ICE = "Lo necesitamos para derretirlo", -- Clean ice
            WATER_DIRTY_ICE = "Está congelado y sucio.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "Sólo pienso en la sal para la carne.", -- Caffeinpepper spice

            WELL_KIT = "Hecharé una mano con esto.", -- Well kit
            WELL_SPRINKLER_KIT = "Completamente automatico ¿Eh??", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Esto parece bastante conveniente, ¿Eh?", -- Water pump kit
            WELL_BURYING_KIT = "Deberíamos tapar agujeros innecesarios.", -- Hole-burying kit
            WELL_DRILLING = "Parece que funciona correctamente.", -- Drilling holes with a drill
            WELL_DRILLING_ITEM = "Una máquina para perforar el suelo.", -- Drilling item
            HOLE = "¡Ups! tengon que ser cuidadoso por aqui.", -- Well hole
            WELL = "Todo poblado debería tener uno de éstos.", -- Well

            WX78MODULE_NONEDRUNK = "Algunas piezas de robot elegantes.", -- 78전용 묘듈
            
            -- Water mode plants

            TEA_TREE = "Parece una valla hecha de árboles.", -- Tea Tree
            DUG_TEA_TREE = "Hora de hacer algo de jardinería.", -- Dug Tea Tree
            TEA_SEED = "Parece que tiene más madera que hojas.", -- Tea Tree Seed
            TEA_SEED_COOKED = "Una pena desperdiciar la madera.", -- Cooked Tea Tree Seed
            TEA_SEED_SAPLING = "Le queda un largo camino por recorrer antes de ser un árbol.", -- Tea Tree Sapling
            TEALEAVES = "Parecen hojas de té frescas..", -- Tea Leaves
            TEALEAVES_DRIED = "Parecen hojas de té secas.", -- Dried Tea Leaves

            CAFFEINBERRY = "¡Granos de café!", -- Caffeinberry Bush
            DUG_CAFFEINBERRY = "Debería llevármelo a donde vaya.", -- Dug Caffeinberry Bush
            CAFFEINBERRY_BEAN = "Necesito prepararlos de alguna forma.", -- Raw Caffeinberry
            CAFFEINBERRY_BEAN_COOKED = "A los canadienses les encanta el café, ¿eh?", -- Cooked Caffeinberry

            RUINCACAO_TREE = "Crece en el sur, pero se ve diferente de como lo recuerdo.", -- Ruincacao Tree
            DUG_RUINCACAO_TREE = "Ramas crepitantes por todas partes.", -- Dug Ruincacao Tree
            RUINCACAO_SEED = "Aquí floreció una flor de aspecto algo siniestro.", -- Ruincacao Seed
            RUINCACAO_SEED_SAPLING = "Tiene un largo camino por recorrer antes de convertirse en un árbol.", -- Ruincacao Sapling
            RUINCACAO = "Tiene el olor del carbón.", -- Ruincacao (pre-smashed)
            RUINCACAO_BEAN = "No sabe para nada como mantequilla comestible, ¿eh?", -- Ruincacao Bean
            RUINCACAO_BEAN_COOKED = "Usualmente no como la mantequilla de esta forma.", -- Cooked Ruincacao Bean

            -- Distillery additives

            ADDITIVE_SEED = "¿Estás haciendo alcohol ilegal con esto, eh?", -- Seed Herbs (Anise, Juniper Berry, Allspice) additive for liquor
            ADDITIVE_PETALS = "¿Esto va en el alcohol?", -- Petal Herbs (Green Tea, Flower Petals) additive for liquor
            ADDITIVE_NUT = "Una mezcla de nueces.", -- Nut Herbs (Birch Nut, Coconut, Coffee Bean, Ruincacao Bean) additive for liquor
            ADDITIVE_DAIRY = "Es como crema, ¿eh?", -- Dairy additive for liquor

            -- Drinks

            WATER_CLEAN = "Es agua limpia.", -- Clean water
            WATER_DIRTY = "Está sucio, ¿eh?", -- Dirty water
            WATER_SALTY = "Es agua de mar, ¿eh?", -- Salty water

            GOOPYDRINK = "He bebido cosas peores que esto.", -- Failed drink (boiling concept)

            -- Teapot drinks

            FRUITJUICE = "Es jugo hecho de una mezcla de frutas.",
            BERRIES_JUICE = "Lo has suavizado, ¿eh?",
            POMEGRANATE_JUICE = "Te has ahorrado el trabajo de elegir cada uno.",
            BANANA_JUICE = "Una bebida tropical.", -- Banana juice
            FIG_JUICE = "No es un mal jugo en absoluto.", -- Fig juice
            DRAGONJUICE = "Estaría bien si tuviera algo de sirope en él.", 
            GLOWBERRYJUICE = "Podría seguir bebiendo esto.", -- Glowberry juice
            WATERMELON_JUICE = "Está muy aguado, ¿eh?",

            VEGGIE_TEA = "Si crees que es de mi gusto, definitivamente no lo es.", 
            CARROT_TEA = "¿Es agua para conejos?", -- Carrot tea
            CACTUS_TEA = "Tengo dudas sobre las espinas.", -- Cactus tea
            TOMATO_JUICE = "Añadamos un poco de sirope para endulzarlo",
            LUMPY_TEA = "Prefiero el hachís al té.",
            SEAWEED_SHAKE = "¿No había una mejor forma de usar las algas?", -- Seaweed shake

            GREENTEA = "Me vendría bien una taza de té.", -- Fresh Green Tea
            BLACKTEA = "¿Ya es hora del té?", -- Black Tea
            BLACKTEA_ICED = "Perfecto para un día caluroso.", -- Iced Black Tea
            FUER = "Lo beberé como venga.", -- Boi Tea (Boi Cha, Leafy Tea, Warrior Tea)
            MIXFLOWER = "Un té bastante sentimental.", -- Mixed Flower Tea
            HIBISCUSTEA = "Es tan rojo como Lucy.", -- Hibiscus Tea
            CACTUSFLOWER_TEA = "Teniendo en cuenta el clima en el que crecen las flores, deberíamos estar agradecidos de poder beberlas con agua.",
            LOTUSTEA = "Nunca había visto este té.", -- Lotus Flower Tea
            SUSHIBISCUS = "¿Que piensas, Lucy? ¿Deberíamos probarlo?", -- Hibiscus Sushi
            MOON_BLOSSOM_TEA = "El olor es impresionante.", -- Moon Blossom Tea

            CAFFEINBERRY_JUICE = "¿Ya es hora del café?", -- Black Coffee
            TOFFEE_LATTE = "Este café es súper dulce, ¿eh?",
            RUINCHA_LATTE = "Esto no es moca.", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "Perfecto para sorberlo en la fogata.", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "Dulce y refrescante.", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "Eso es lo que solían beber los nativos del sur.",
            TEA_RUINCOLATE_LATTE = "Los sabores están sorprendentemente bien equilibrados.",

            MULLED = "No hay nada mejor que esto cuando estás enfermo.",
            BUTTERBEER = "¿Te parezco una criatura mágica o un gigante peludo? Eh.",

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "Las partes parecidas a palmeras han desaparecido en su mayoría.",
            RAINBOW_SHAKE = "El hecho de que no tenga sabor es una ventaja.",
            QUARTZ_SHAKE = "Podrías haber hecho sushi con él, ¿eh?", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "Sospecho que queden partes de pelo.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Aroma a miel y árbol, fantástico.",
            SWEET_RICE_DRINK = "Un jugo de granos algo inusual.", -- Vitacomp Sweet Rice Drink
            PINEANANAS_JUICE = "Es refrescante, pero es demasiado amargo para que pueda comer mucho.",
            ORANGE_JUICE = "Es tan agrio que quiero agregar un poco de sirope.",
            STRAWBERRY_SMOOTHIE = "No lo buscaría, pero es bueno tenerlo.",
            STRAWBERRY_MILK_SMOOTHIE = "Es suave y refrescante, ¿eh?",

            -- Distillery Additives

            SPOILED_DRINK = "¡No! Está mohoso.",

            -- Distillery Sodas

            SODA = "Es agua carbonatada.", -- Soda
            FRUITSODA = "Es un ponche de frutas, ¿eh?", -- Fruit Soda
            LEMONLIMESODA = "Es dulce y refrescante.", -- Lemon Lime Soda (Fruit Soda variant)
            COLA = "Debería beberla cuando termine de trabajar.", -- Cola
            COLAQUANTUM = "Es bastante adictivo.", -- Cola Quantum
            LUMPY_BEER = "¿Es bebida de zarzaparrilla?", -- Lumpy Beer (non-alcoholic)

            -- Distillery Spirits

            CORN_BEER = "No es cerveza real, pero está bien.", -- Corn Beer
            MADHU = "Está hecho con miel de abeja.", -- Madhu (Honey Wine)
            WINE = "No está hecho con uvas, pero servirá.", -- Wine (Basic Berry Brew)
            NOBLEWINE = "Este es un vino elegante, ¿eh?",
            SPARKLINGWINE = "Cualquiera que lo desperdicie sacudiéndolo, Lucy y yo no lo dejaremos pasar.", 
            GLOWBERRYWINE = "El sabor no está mal.", -- Glowberry Wine
            KUMIS = "No estoy seguro de si esto es realmente alcohol.",
            LUMPY_WINE = "¿No es acaso alcohol ilegal?, ¿eh?", 
            PULQUE = "Es una bebida que tomaban los indígenas de mi tierra.", -- Pulque (Agave Wine)
            RUINCACAO_WINE = "Nunca había escuchado de vino de cacao.", -- Ruincacao Wine (Cocoa Wine)

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "Mientras sea dulce y refrescante, eso es suficiente.",
            PINEANANASSODA = "Es refresco de piña.", -- Pineapple Soda (Orancee)
            ORANGESODA = "Es un refresco naranja.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "Refresco de fresa.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "He visto mucho, pero nunca he visto alcohol hecho de medusas, ¿eh?",
            COCONUT_WINE = "Tiene un fuerte olor a madera.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Si nadie más lo beberá, supongo que yo lo haré.", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Ahora incluso hay alcohol azul, ¿eh?",
            RICE_WINE = "¿No está poco fermentado?",
            WHEAT_BEER = "¿Es cerveza de verdad? ¿eh?",
            PALE_BEER = "El color es extraño.", -- Legion Pale Ale (Green beer made with Monsteras)

            -- Distillery Spirits

            DISINFECTANT = "La desinfección es importante, eh",
            CORN_WHISKEY = "Es whisky de estilo americano, eh",
            LUMPY_VODKA = "Beber esto cuando hace frío te calienta, ¿eh?",
            TEQUILA = "Es una especie de licor fuerte del sur, ei",
            MADHU_RUM = "Es ron de marinero.", -- Rum
            BERRY_BRANDY = "Este brandy parece bastante elegante, ¿eh?",
            AREUHI = "¿Es un vodka hecho con leche?", -- Kumis Distilled Spirit Areuhi

            -- Warly Exclusive Distillery Spirits

            BERRY_GIN = "Parece ginebra.", -- Gin
            GLOWBERRY_GIN = "Es brillante y agradable, ¿eh?",
            ABSINTHE = "Huele como Wormwood.", -- Absinthe
            TEA_LUMPY_VODKA = "Nunca había visto este tipo de licor, pero no está mal.", -- Matcha Liqueur
            PETALS_BERRY_BRANDY = "Es aromático y sabe bien.", -- Rose Scented Brandy
            KAHLUA = "Preferiría beber café y alcohol de forma separada.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Tiene un aroma robusto.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "No estoy seguro de considerar esto como un licor..", -- Baileys Cocoa Cream Liqueur
            RUMCHATA = "La gente del sur mezcla alcohol con leche, ¿eh?",

            -- Collaboration Distillery Spirits

            MOONWAY = "El color es bonito, pero parece un poco sospechoso.",
            ARRACK = "Está lleno de olor a palmera, ¿eh?", 
            CHERRY_BLOOM_RUM = "Si nadie más me ve, supongo que lo beberé.?", -- Cherry Blossom Honey Rum Distilled Spirit Cherry Blossom Petals Floating
            RICE_SPIRITS = "¿No es esto vodka?",
            WHEAT_WHISKEY = "Debes preguntarles si quieren café o whisky cuando vengan los invitados.",
            PALE_WHISKEY = "El whisky se ve extraño, pero lo beberé si me lo ofrecen.",

            -- Warly Exclusive Collaboration Distillery Spirits

            NUT_COCONUT_BRANDY = "¿Están listos, niños?",
            GIANT_BLUEBERRY_GIN = "Entonces, ¿ganamos el último partido de hockey?",

            -- Pot Cooking

            DARK_RUINCOLATE = "¿Wally estropeó la cocina o tenía la intención de hacer un plato saludable?",
            WHITE_RUINCOLATE = "¿No es esto dulce y grasoso, eh?",
            RUINCOLATE = "Nunca tuve tiempo de probar el chocolate, gracias.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Debería darme un impulso de energía.", -- Schokakola

            BUCKET_STEEL_EMPTY = 
            {
                EMPTY = "Una cubeta muy resistente.", -- Empty Steel Bucket
                FULL = "Esta llena de agua de lluvia.", -- Clean rainwater in the bucket
                FULL_ICE = "¿Quién dejó la cubeta afuera para que se congelara?", -- Rainwater frozen in the bucket
                DIRTY = "Debería usar esto para regar el jardín.", -- Rainwater has become dirty
                DIRTY_ICE = "Incluso se congeló.",
            },

            BUCKET_WOODIE_EMPTY = 
            {
                EMPTY = "¡Buen trabajo Lucy!", -- Empty Woodie's Wooden Bucket
                FULL = "Vaciemos el agua antes de que se hehe a perder.", -- Clean rainwater in the bucket
                FULL_ICE = "¿Quién dejó la cubeta afuera para que se congelara?", -- Rainwater frozen in the bucket
                DIRTY = "Debería usar esto para regar el jardín.", -- Rainwater has become dirty
                DIRTY_ICE = "Se congeló antes de que pudiera limpiarla.", -- Dirty rainwater frozen in the bucket
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Hmm... Creo que tengo que lijarla un poco más.", 
                FULL = "Vaciemos el agua antes de que se hehe a perder.", -- 
                FULL_ICE = "¿Quién dejó la cubeta afuera para que se congelara?", --
                DIRTY = "Debería usar esto para regar el jardín.", -- 
                DIRTY_ICE = "Incluso se congeló.",
            },

            BUCKET_EMPTY = 
            {
                EMPTY = "Una cubeta hecha con madera.", -- Empty Wooden Bucket
                FULL = "Vaciemos el agua antes de que se hehe a perder.", -- Clean rainwater in the bucket
                FULL_ICE = "¿Quién dejó la cubeta afuera para que se congelara?", -- Rainwater frozen in the bucket
                DIRTY = "Debería usar esto para regar el jardín.", -- Rainwater has become dirty
                DIRTY_ICE = "Incluso se congeló.",
            },

            DESALINATOR = 
            {
                EMPTY = "Gran tecnología, intentemos usar agua salada.", -- No water in the desalinator
                PURIFY_LONG = "No le quitará la sal tan rápido.", -- Still a long way to go for purification
                PURIFY_SHORT = "Bien, se está limpiado.", -- Purification is almost complete
                HASWATER = "Esta lleno de agua.", -- Clean water in the desalinator
                BURNT = "Que desperdicio.", -- Desalinator has burnt
                HASSALT = "Queda tanta sal que no se purificará correctamente.", -- Salt is still present in the desalinator
            },

            BARREL = 
            {
                GENERIC = "Hicimos la impermeabilización correctamente.",
                BURNT = "¿Fue un error confiar en el agua y no hacer la ignifugación?",
            },

            BREWERY = 
            {
                EMPTY = "Una cervecera bastante sofisticada.", -- Examining the brewery
                BURNT = "Una pena que se haya quemado.", -- Brewery has burnt down
                FERMENTING_LONG = "Por ahora todavía es jugo.", 
                FERMENTING_SHORT = "El aroma a alcohol está aumentando.", -- Brewing process is almost complete
                DONE = "Intentemos beberlo.", -- Beverage is ready in the brewery
            },

            CAMPKETTLE_ITEM = "Me recuerda al hervir agua en los bosques.", -- Examining the portable camp kettle (item)
            CAMPKETTLE = 
            {
                GENERIC = "¿Debo limpiarlo si has terminado?",
                BOILING_LONG = "No quieres comer eso y que te duela el estómago, ¿eh?",
                BOILING_SHORT = "Está casi listo.",
                DONE = "Esto debería ser seguro para beber.",
                STOP = "Lucy, consigamos algo de madera.", -- Kettle won't boil without a fire
            },

            CAMPDESALINATOR_ITEM = "¿Es para usarlo en un bote?", -- Examining the portable camp desalinator (item)
            CAMPDESALINATOR = 
            {
                GENERIC = "Está vacío por dentro.", -- Examining the empty camp desalinator
                BOILING_LONG = "Aún es agua salada.", -- Starting to boil seawater
                BOILING_SHORT = "Está casi listo.",
                DONE = "Esta listo para beberse.", -- Clean water is ready in the desalinator
                STOP = "Lucy, consigamos algo de madera.", -- Desalinator won't work without a fire
            },

            KETTLE = 
            {
                EMPTY = "Dejarlo vacío, parece un desperdicio.",
                BURNT = "Se quemó completamente.", -- Kettle has burnt down
                BOILING_LONG = "¿Tardará mucho más?", -- Starting to boil beverage
                BOILING_SHORT = "¡Bien, ya casi está hecho!",
                DONE = "¡Es la hora del té!",
                PURIFY_LONG = "No quieres comer eso y que te duela el estómago, ¿eh?",
                PURIFY_SHORT = "Ya casi está listo.", -- Dirty water is almost purified
                HASWATER = "El agua está lista, solo necesitamos los ingredientes ahora.",
                MELT_LONG = "Realmente no crees que el té se prepare con hielo, ¿eh?",
                MELT_SHORT = "Está completamente derretido.", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM = 
            {
                GENERIC = "¿Debería llevármela si nadie la va a usar?", -- Examining the portable kettle (item)
                EMPTY = "Si no lo estás usando, llevémoslo conmigo.", 
                BOILING_LONG = "¿Tomará más tiempo?", -- Starting to boil beverage
                BOILING_SHORT = "¡Bien, ya casi está hecho!",
                DONE = "¿Lo bebemos ahora?",
                PURIFY_LONG = "No quieres comer eso y que te duela el estómago, ¿eh?",
                PURIFY_SHORT = "Ya casi está listo.", -- Dirty water is almost purified
                HASWATER = "El agua está lista, solo necesitamos los ingredientes ahora.",
                MELT_LONG = "Realmente no crees que el té se prepare con hielo, ¿eh?",
                MELT_SHORT = "Está completamente derretido.", -- Ice is almost melted
            },

            DISTILLERS = 
            {
                EMPTY = "Realmente no entiendo cómo funciona esto.", -- Examining the empty distiller
                DISTILLTING_LONG = "Tomará un poco más.", -- Distillation process has a long way to go
                DISTILLING_SHORT = "Ya casi está.", -- Distillation process is almost complete
                DONE = "Probemos beber esto.", -- Beverage is ready in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "¡Funciona muy bien!",
                MIDDLE_PRESSURE = "Está trabajando duro para bombear el agua.",
                LOW_PRESSURE = "La presión esta disminuyendo.", -- Pressure is almost gone
                RECHARG_PRESSURE = "Ya no sale más agua.", -- Pressure is completely gone (can't use until pressure is recharged)
            },

            WELL_SPRINKLER = 
            {
                LOWFUEL = "Parece que se está quedando sin combustible.", -- Examining the sprinkler with low fuel
                ON = "¿Trabajando duro o durando en el trabajo?.", -- Sprinkler is currently on
                OFF = "Gracias a esto, tengo menos trabajo que hacer en el jardín.", -- Sprinkler is off
            },
        },
    }