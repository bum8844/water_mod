return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Si ibas a hacer eso, deberías haber agregado otra polea desde la etapa de diseño.",
            WELL_BUSY = "Detengámonos, solo va a bloquear el pozo.",
        }
    },

        ANNOUNCE_DRUNK = "Hic, ya no puedo trabajar...",
        ANNOUNCE_DRUNK_END = "Eso está mejor. Vamos a dar lo mejor de mí.",
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, for Wigfrid only
        ANNOUNCE_NOTCHARGE = "Hmm... ¿Cuándo puedo ordeñar esta cabra?", 
        ANNOUNCE_NOTHIRSTSLEEP = "Debería beber  agua antes de ir a dormir.", -- Thirsty but attempting to sleep at night
        ANNOUNCE_NOTHIRSTSIESTA = "Debería beber agua antes de descansar.", -- Thirsty but attempting to rest during the day
        ANNOUNCE_SLEEP_END = "Uf, no debería beber tanto la próxima vez.",-- Waking up after sleeping while drunk
        ANNOUNCE_THIRST = "Debo de beber agua.", -- Very thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "¡Reparación a domicilio activado!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Ahora tendré que volver a mi taller.",

        ANNOUNCE_CURE_WATERBORNE = "Me siento mucho mejor ahora.", -- When curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Es difícil concentrarse...", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Hmm, debería empezar a controlarme.", -- Starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "Está lleno de recetas para hacer bebidas con alcohol.",

            WATER_CLEAN_ICE = "Should I chew on this?", 
            WATER_DIRTY_ICE = "Hielo mezclado con polvo.",

            SPICE_CAFFEINPEPPER = "Estaría perfecto si tuviera algo de carne para acompañar...", -- Caffeine pepper spice

            WELL_KIT = "Vamos a intentarlo.",
            WELL_SPRINKLER_KIT = "Hecho a mano, un poco intrigante.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Éstas baterías no pueden tolerar este consumo de energía.", -- Steam water pump kit
            WELL_BURYING_KIT = "No sería seguro dejar el agujero en el suelo desatendido.",
            WELL_DRILLING = "Debería tener cuidado de no ser golpeada por las piedras voladoras.", -- Drilling a hole with a drill
            WELL_DRILLING_ITEM = "Asegúrate que esté sujetado firmemente al suelo antes de operar , ¡Y sigue todas las reglas de seguridad!", -- Drill item
            HOLE = "Agujero conectado a aguas subterráneas.",
            WELL = "Hmm, me pregunto si habrá alguna forma de automatizarlo.", -- Well

            -- Water mode plants

            TEA_TREE = "Este árbol es pequeño y bonito.",
            DUG_TEA_TREE = "No importa ensuciarme las manos .", -- Dug-up tea tree
            TEA_SEED = "Todo lo que necesitas para construir un árbol.",
            TEA_SEED_COOKED = "Parece comestible. ¡Solo hay una forma de averiguarlo!",
            TEA_SEED_SAPLING = "Este árbol continua creciendo.", -- Tea tree sapling
            TEALEAVES = "Olor agradable para una hoja.",
            TEALEAVES_DRIED = "Preparemos agua caliente.", -- Dried tea leaves

            CAFFEINBERRY = "¡Oh mi!, ¡Hay granos de café aquí!",
            DUG_CAFFEINBERRY = "Debo de replantar esto, así tendré mi propio terreno. ¡Ja!", -- Dug-up caffeine berry bush
            CAFFEINBERRY_BEAN = "Necesito arrojarlo al fuego primero.",
            CAFFEINBERRY_BEAN_COOKED = "Me encanta el olor del café por la mañana",

            RUINCACAO_TREE = "Hmm, estas ramas no tiene forma, son algo caóticas.", -- Ruin cacao tree
            DUG_RUINCACAO_TREE = "Cuanto más miro, más extraño se ve este árbol.",
            RUINCACAO_SEED = "¿Había flores dentro de esta fruta?", -- Ruin cacao sapling item
            RUINCACAO_SEED_SAPLING = "Escalofriante... Ahora que lo pienso.", -- Planted ruin cacao sapling
            RUINCACAO = "Así que, ¿Es carbón vegetal o una fruta?", -- Ruin cacao
            RUINCACAO_BEAN = "No parece algo de aceite comestible.",
            RUINCACAO_BEAN_COOKED = "Es lo suficientemente masticable.",

            -- Distillery additives

            ADDITIVE_SEED = "Una serie de extrañas semillas.", -- Additives for liqueurs (anise, juniper berry, octagon motif)
            ADDITIVE_PETALS = "Un montón de hojas y pétalos.", -- Additives for liqueurs (herbs, tea leaves, flower petals)
            ADDITIVE_NUT = "¿No los estabas recolectando para picar?",
            ADDITIVE_DAIRY = "Es crema de leche.", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "Tan limpio.",
            WATER_DIRTY = "Incluso con prisa, no bebas agua estancada.",
            WATER_SALTY = "Beber agua salada es algo suicida.", -- Salty water

            GOOPYDRINK = "Meh.", -- Failed drink (wet goop concept)

            -- Teapot drinks

            FRUITJUICE = "Todo está dentro.",
            BERRIES_JUICE = "Al menos no tendré jugo en mis manos.",
            POMEGRANATE_JUICE = "Por fin puedo limpiar para comer esa fruta.", 
            BANANA_JUICE = "Micrómetro... No quería té de plátano caliente.",
            FIG_JUICE = "Tiene una textura única.", -- Fig juice
            DRAGONJUICE = "Que zumo tan luj-oso.",
            GLOWBERRYJUICE = "Se parece a los productos químicos dentro de una barra luminosa.",
            WATERMELON_JUICE = "Refrescante.", -- Watermelon juice

            VEGGIE_TEA = "Esto debería ayudarme a recuperar energía .", -- Vegetable juice
            CARROT_TEA = "Perfecto, mis ojos estaban tensos de todos modos.",
            CACTUS_TEA = "Incluso con espinas, se volvió blando.", -- Cactus tea
            TOMATO_JUICE = "No lo hubiera buscado, pero no está mal.",
            LUMPY_TEA = "No está mal como pensaba.",
            SEAWEED_SHAKE = "Umm... Parece que es bueno para el estreñimiento.", 

            GREENTEA = "Tiene un aroma sutíl.", -- Green tea
            BLACKTEA = "Prefiero el café, pero lo beberé si no hay nada más.",
            BLACKTEA_ICED = "Debería beber esto después de sudar .", -- Iced black tea
            FUER = "Sorprendentemente, el aroma no está mal.", -- Herbal tea, leaf tea, fern tea
            MIXFLOWER = "Parece que complementa el gusto refinado de una señorita.", -- Mixed flower petal tea
            HIBISCUSTEA = "No hay frutas a la vista, pero es picante y dulce.",
            CACTUSFLOWER_TEA = "Parece está de moda hacer té de flores.", -- Cactus flower tea
            LOTUSTEA = "Es algo exótico..", -- Lotus tea
            SUSHIBISCUS = "¿Qué diablos es este té?",
            MOON_BLOSSOM_TEA = "¡Ufff! Esto realmente me despierta.",

            CAFFEINBERRY_JUICE = "Confío en esto cuando tengo mucho trabajo de noche ", -- Black coffee
            TOFFEE_LATTE = "Prefiero mi café sin azúcar .", -- Toffee nut latte
            RUINCHA_LATTE = "Café y chocolate, y ambos.",

            HOTRUINCOLATE = "Está caliente.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "He visto esto en las tiendas, pero jamás lo he comprado.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Ese sabor es tan intenso como los gases de escape.", 
            TEA_RUINCOLATE_LATTE = "Estoy confundida, ¿Es esto té de leche o es un smoothie de chocolate?", -- Matcha chocolate latte

            MULLED = "El momento perfecto, mi garganta se sentía áspera.", 
            BUTTERBEER = "Cualquier tecnología suficientemente avanzada es indistinguible de la magia.",

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "Dulce y refrescante.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Intentemos beber un arcoíris.",
            QUARTZ_SHAKE = "Esto debería ser suficiente.", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "La acidez lo hace aún mejor.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Necesito beber esto para limpiar el polvo de mi garganta.",
            SWEET_RICE_DRINK = "Hmm,  es algo dulce.", -- Vita Hyup Sikhye
            PINEANANAS_JUICE = "Definitivamente mejor que el jugo en los productos enlatados.", 
            ORANGE_JUICE = "Siempre he visto el refrigerador lleno de esto.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Parece ser del gusto de las trabajadoras. Oh, yo también soy una trabajadora. ¡Hm!",
            STRAWBERRY_MILK_SMOOTHIE = "Sabe a una bebida de postre de la casa de té, pero es deliciosa.",

            -- Distillery Teapot Drinks

            SPOILED_DRINK = "No es acorde con el uso industrial.", -- Spoiled Drink

            -- Distillery Sodas

            SODA = "Agua carbonatada simple.", -- Soda Water
            FRUITSODA = "Nunca bebí esto porque nunca fui a fiestas.",
            LEMONLIMESODA = "Se siente como si me pudriera los dientes.",
            COLA = "Cada vez que voy a beberlo, alguien ya lo ha terminado.", 
            COLAQUANTUM = "Wow, ¿Es seguro beber esto?", -- Cola Quantum
            LUMPY_BEER = "Sabe mejor que la cola, pero no es algo de mi gusto.", -- Root Beer (non-alcoholic)

            -- Distillery Spirits

            CORN_BEER = "¡Justo después del trabajo!",
            MADHU = "Creo que a Wig le gustaría esto.",
            WINE = "No tengo tiempo para saborear el aroma, tengo una montaña de trabajo que hacer.",
            NOBLEWINE = "Estás cosas finas están muy lejos de mí.", -- Noble Wine (cooked berry brew)
            SPARKLINGWINE = "Tengo que sacudirlo delante de Max.",
            GLOWBERRYWINE = "El romance de una hogareña producción de alcohol.", -- Glow Berry Wine
            KUMIS = "Nunca antes había visto alcohol hecho con leche.",
            LUMPY_WINE = "Tiene un sabor bastante refrescante.",
            PULQUE = "No sabía que se podía hacer alcohol con cactus.",
            RUINCACAO_WINE = "Si el vino se puede hacer a partir del cacao, entonces es posible.",

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "Esto no es coca cola.",
            PINEANANASSODA = "Sabe como refresco de piña de tienda comercial.", -- Pineapple Soda (Oranch Soda)
            ORANGESODA = "Sabe como refresco de naranja de tienda comercial.", -- Orange Soda (Frontera)
            STRAWBERRYSODA = "No me sorprende que exista un refresco sabor fresa.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "Aunque los ingredientes son algo cuestionables, ¡Es arcoíris!.",
            COCONUT_WINE = "Es un vino de fruta de palma.",
            CHERRY_BLOOM_MADHU = "Ahora ya no puedo llamarlo pegamento.",
            GIANT_BLUEBERRY_WINE = "No hay razón para hacer vino con mora azul.", -- Vita Hyup Boom Berry Wine (Explodes when ignited)
            RICE_WINE = "Este alcohol es un poco turbio.",
            WHEAT_BEER = "Debería tomar una copa después del trabajo.",
            PALE_BEER = "Beber un poco no me matará, ¿verdad?",

            -- Distilled Spirits

            DISINFECTANT = "Tratamiento de emergencia.", -- Disinfectant
            CORN_WHISKEY = "Prefiero beber en abundancia a dar sorbos.", -- Corn Whiskey
            LUMPY_VODKA = "Debo guardar esto hasta que el tiempo se vuelva frío.", -- Vodka
            TEQUILA = "¡Tiene un aroma atrevido!", -- Tequila
            MADHU_RUM = "La era de los marineros que mezclaban ron con agua ha quedado atrás.", 
            BERRY_BRANDY = "No suelo tener tiempo de beber bebidas costosas como está.", -- Berry Brandy
            AREUHI = "Nunca antes había visto este licor.",

            -- Walani Exclusive Distilled Spirits

            BERRY_GIN = "Conozco a algunos amigos que arruinaron sus vidas debido a esto.",
            GLOWBERRY_GIN = "¿Cuánto tiempo brillará, ya que la energía no es infinita?",
            ABSINTHE = "¡Al menos no lo mezclaron con sulfato de cobre!", -- Absinthe
            TEA_LUMPY_VODKA = "¿Es distinto a la absento?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Seems quite luxurious.", 
            KAHLUA = "Debo beber alcohol y café por separado.",
            NUT_CORN_WHISKY = "La esencia es robusta como el plomo.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "También hay un licor dulce como este, ¡eh!",
            RUMCHATA = "Leche para adultos adultos, ¡eh!",

            -- Collaboration Distilled Spirits

            MOONWAY = "Parece alto en calorías, ¿podría usarse como combustible?",
            ARRACK = "Huele como la palma.", -- Arrack Indonesian version of coconut wine
            CHERRY_BLOOM_RUM = "Parece un recuerdo de aeropuerto." ,
            RICE_SPIRITS = "¡Ahora es claro!", -- Rice Wine
            WHEAT_WHISKEY = "No beber alcohol mientras trabajo.", -- Wheat Whiskey
            PALE_WHISKEY = "Jamás he visto una bebida alcohólica artesanal de este color, antes...", -- Pale Malt Whiskey

            -- Walani Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "Tiene un ligero olor dulce.", -- Coconut Brandy (Replaced Caribbean Rum because she can't make it)
            GIANT_BLUEBERRY_GIN = "¿No es esto más adecuado para uso industrial que comestible?",

            -- Distillery Cooked Dishes

            DARK_RUINCOLATE = "Mi amigo me preparó bocadillos mientras trabajaba.",
            WHITE_RUINCOLATE = "Oh, cauteloso, sabes que no me gustan las cosas dulces.",
            RUINCOLATE = "Es fácil de derretir, así que no lo como a menudo.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "¡Perfecto, no se derrite, tiene un estuche y me da energía mientras trabajo!",

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Bien hecho y robusto.", 
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Parece que será difícil de eliminar.",
                DIRTY = "Parece que se usaba para lavar una fregona.",
                DIRTY_ICE = "Parece que se descuidó después de la limpieza invernal.", 
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Dudo de su durabilidad.",
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Parece que será difícil de eliminar.",
                DIRTY = "Parece que se usaba para lavar una fregona.",
                DIRTY_ICE = "Parece que se descuidó después de la limpieza invernal.", 
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Esta cosa definitivamente no pasaría los estándares de seguridad higiénica.", -- 
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Parece que será difícil de eliminar.",
                DIRTY = "Parece que se usaba para lavar una fregona.",
                DIRTY_ICE = "Parece que se descuidó después de la limpieza invernal.", 
            },

            BUCKET_EMPTY =
            {
                EMPTY = "¿Que debería poner en él?", -- Empty wooden bucket
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Parece que será difícil de eliminar.",
                DIRTY = "Parece que se usaba para lavar una fregona.",
                DIRTY_ICE = "Parece que se descuidó después de la limpieza invernal.", 
            },

            DESALINATOR =
            {
                EMPTY = "Me costó mucho pensar en esto.",
                PURIFY_LONG = "Veamos... la salinidad sigue siendo bastante alta.", -- Still a long way to go for purification
                PURIFY_SHORT = "Veamos... La salinidad no es demasiado alta.",
                HASWATER = "Puedo garantizar que en el interior no hay agua de mar.",
                BURNT = "Esto me está poniendo de los nervios",
                HASSALT = "Necesito quitar la sal de la caja del filtro.",
            },

            BARREL =
            {
                GENERIC = "Woodie y yo juntamos nuestro ingenio para asegurar que el agua no se eche a perder.", -- Inspecting the barrel
                BURNT = "Está bien, hagamos otro.",
            },

            BREWERY =
            {
                EMPTY = "¡Debo decir que usó una madera bastante cara!",
                BURNT = "Pase lo que pase, tengo que enojarme por esto.",
                FERMENTING_LONG = "Escuché que la fermentación lleva mucho tiempo.",
                FERMENTING_SHORT = "¿Está casi hecho?",
                DONE = "Vamos a probarlo.",
            },

            CAMPKETTLE_ITEM = "Es un poco más pesada que las de casa.", -- Inspecting the portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "Tengo que conseguir un poco de agua.", -- There's no water in the camp kettle in the hearth
                BOILING_LONG = "Todavía está alrededor de 68 °F.", -- Starting to boil water
                BOILING_SHORT = "Está hirviendo a 192.2 °F.", -- Water is nearly boiling
                DONE = "Parece suficiente, pero necesito comprobarlo.",
                STOP = "Vaya, probablemente aún no esté listo para beber.",
            },

            CAMPDESALINATOR_ITEM = "Es bastante pesado para ser llamado 'portátil'.'", 
            CAMPDESALINATOR =
            {
                GENERIC = "Una lata vacía.", -- No water in the camp desalinator
                BOILING_LONG = "El nivel de salinidad es alto.", -- Starting to boil seawater
                BOILING_SHORT = "El nivel de agua potable es alto.", -- Water is nearly done boiling
                DONE = "¡Agua potable conseguida!", -- Clean water has been obtained
                STOP = "Necesita combustible.", -- There's no fire in the hearth, so the saltwater won't purify
            },

            KETTLE =
            {
                EMPTY = "Estoy a punto de hacer una taza de café con estilo.", -- Empty kettle inspection
                BURNT = "¿He exagerado?", -- The kettle has burned
                BOILING_LONG = "Aún necesita mucho tiempo.", -- Just started cooking the drink
                BOILING_SHORT = "Ya casi esta.", -- Drink is nearly done cooking
                DONE = "¡Hora de descansar!",
                PURIFY_LONG = "Se mantiene alrededor de 68°F.", -- Just started boiling dirty water
                PURIFY_SHORT = "Esta hirviendo a 192.2°F.", -- Dirty water is nearly done boiling
                HASWATER = "Déjame ver, sería mejor si tuviera café dentro.", -- There's clean water inside
                MELT_LONG = "Es hielo solido.", -- Just started melting ice
                MELT_SHORT = "El hielo esta casi derretido.", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "En términos de calidad, no esta tan detrás de las fabricadas industriales.", -- Inspecting the portable kettle item
                EMPTY = "Ni una gota de agua hay dentro.", -- Inspecting the placed empty portable kettle
                BOILING_LONG = "Las cosas buenas toman tiempo, después de todo.", -- Just started boiling the drink
                BOILING_SHORT = "¡Terminará en un santiamén!", -- Drink is almost done cooking
                DONE = "¡Hora de descansar!",
                PURIFY_LONG = "Se esta calentando.", -- Just started boiling dirty water
                PURIFY_SHORT = "Ya puedo oír las burbujas.", -- Dirty water is nearly done boiling
                HASWATER = "Ahora necesito poner ingredientes.", -- There's clean water inside
                MELT_LONG = "Es todo hielo sólido.", -- Just started melting ice
                MELT_SHORT = "El hielo ya casi se ha derretido.", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Diseñado para soportar el calor y la presión.", -- Inspecting the distiller
                DISTILLTING_LONG = "El temporizador apenas se ha movido.", -- Still a long way to go for distillation
                DISTILLING_SHORT = "No tomará demasiado tiempo.", -- Distillation is almost done
                DONE = "Vamos a probarlo.",
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Extrae agua con una presión aproximada de 123 psi.", -- Maximum pressure
                MIDDLE_PRESSURE = "Extrae agua con una presión aproximada de 81 psi.", -- Pressure is in the middle
                LOW_PRESSURE = "Extrae agua con una presión aproximada de 47 psi.", -- Almost no pressure
                RECHARG_PRESSURE = "Con esta presión, le tomará una cantidad de tiempo enorme volver a extraer agua.", -- No pressure (can't be used until pressure is maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Necesita recargarse.", -- Inspecting the well sprinkler with low fuel
                ON = "No debo estar tan cerca con mi equipo.", -- It's working
                OFF = "Algunas piezas funcionan \"mágicamente\".",
            },
        },
    }
