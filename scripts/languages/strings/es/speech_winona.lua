return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Si vas a hacer eso, deberías añadir otra cubeta", -- Well has a dry bucket hanging, but trying to hang another bucket
            WELL_BUSY = "Detente, el pozo está tapado.", -- Well has a bucket of water hanging, but trying to hang another bucket
        }
    },

        ANNOUNCE_DRUNK = "Hip, No puedo hacer esto...", -- Drunk
        ANNOUNCE_DRUNK_END = "Me siento un poco mejor, ¿Debería tratar de recuperar fuerza?", -- Sobering up from drinking (groggy)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, for Wigfrid only
        ANNOUNCE_NOTCHARGE = "Hmm... ¿Cuándo tendrá leche?", -- Trying to milk a Volt Goat that isn't charged, so can't use the bucket
        ANNOUNCE_NOTHIRSTSLEEP = "Debería beber  agua antes de ir a dormir.", -- Thirsty but attempting to sleep at night
        ANNOUNCE_NOTHIRSTSIESTA = "Debería beber agua antes de descansar.", -- Thirsty but attempting to rest during the day
        ANNOUNCE_SLEEP_END = "Fiu, la próxima vez no debería beber tanto.", -- Waking up after sleeping while drunk
        ANNOUNCE_THIRST = "Debo de beber agua.", -- Very thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "¡Reparación a domicilio activado!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Necesito regresar al oficio.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Me siento mucho mejor ahora.", -- When curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Es difícil concentrarse...", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Hmm, debería empezar a controlarme.", -- Starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "Está lleno de recetas para hacer bebidas con alcohol.",

            WATER_CLEAN_ICE = "¿Debo de masticar esto?", -- Clean ice
            WATER_DIRTY_ICE = "Parece ser hielo con polvo .", -- Dirty ice

            SPICE_CAFFEINPEPPER = "Estaría perfecto si tuviera algo de carne para acompañar...", -- Caffeine pepper spice

            WELL_KIT = "¿Debería darle una oportunidad?", -- Well kit
            WELL_SPRINKLER_KIT = "Hecho a mano, un poco intrigante.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Éstas baterías no pueden tolerar este consumo de energía.", -- Steam water pump kit
            WELL_BURYING_KIT = "No deberías dejar agujeros en el suelo, es peligroso.", -- Hole burying kit
            WELL_DRILLING = "Debería tener cuidado de no ser golpeada por las piedras voladoras.", -- Drilling a hole with a drill
            WELL_DRILLING_ITEM = "Asegúrate que esté sujetado firmemente al suelo antes de operar , ¡Y sigue todas las reglas de seguridad!", -- Drill item
            HOLE = "Es un agujero conectado a la fuente subterránea de agua.", -- Well hole
            WELL = "Hmm, me pregunto si habrá alguna forma de automatizarlo.", -- Well

            -- Water mode plants

            TEA_TREE = "Es un pequeño y bonito  árbol.", -- Tea tree
            DUG_TEA_TREE = "No importa ensuciarme las manos .", -- Dug-up tea tree
            TEA_SEED = "Esto es lo que necesitas para hacer crecer el árbol.", -- Tea tree seed
            TEA_SEED_COOKED = "Supongo que lo puedo comer. ¡No es tan complicado!!", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Este árbol continua creciendo.", -- Tea tree sapling
            TEALEAVES = "¿Hay algo especial en las hojas?", -- Tea leaves
            TEALEAVES_DRIED = "Preparemos agua caliente.", -- Dried tea leaves

            CAFFEINBERRY = "¡Los granos de café están explotando! Increíble.", -- Caffeine berry bush
            DUG_CAFFEINBERRY = "Debo de replantar esto, así tendré mi propio terreno. ¡Ja!", -- Dug-up caffeine berry bush
            CAFFEINBERRY_BEAN = "¿Se pone al fuego primero, ¿No?", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Ah, el aroma fresco de granos de café tostado!", -- Roasted coffee bean

            RUINCACAO_TREE = "Hmm, estas ramas no tiene forma, son algo caóticas.", -- Ruin cacao tree
            DUG_RUINCACAO_TREE = "Mientras más lo miro, más extraño se ve.", -- Dug-up ruin cacao tree
            RUINCACAO_SEED = "¿Había flores dentro de esta fruta?", -- Ruin cacao sapling item
            RUINCACAO_SEED_SAPLING = "Escalofriante... Ahora que lo pienso.", -- Planted ruin cacao sapling
            RUINCACAO = "Así que, ¿Es carbón vegetal o una fruta?", -- Ruin cacao
            RUINCACAO_BEAN = "No parece algo comestible.", -- Ruin cacao bean
            RUINCACAO_BEAN_COOKED = "Es masticable, supongo.", -- Roasted ruin cacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Una serie de extrañas semillas.", -- Additives for liqueurs (anise, juniper berry, octagon motif)
            ADDITIVE_PETALS = "Un montón de hojas y pétalos.", -- Additives for liqueurs (herbs, tea leaves, flower petals)
            ADDITIVE_NUT = "No recolectaron esto para aperitivos.", -- Additives for liqueurs (burchinut, coconut, coffee bean, cacao bean)
            ADDITIVE_DAIRY = "Es crema de leche.", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "Debo ser agradecida por el agua limpia, daré un sorbo.", -- Clean water
            WATER_DIRTY = "Aunque esté desesperada, no beberé de esta agua estancada.", -- Dirty water
            WATER_SALTY = "Beber agua salada es algo suicida.", -- Salty water

            GOOPYDRINK = "Meh.", -- Failed drink (wet goop concept)

            -- Teapot drinks

            FRUITJUICE = "Tiene un poco de todo.", -- Mixed fruit juice
            BERRIES_JUICE = "No me mancharé de jugo mis manos .", -- Berry juice
            POMEGRANATE_JUICE = "Finalmente puedo comer esta fruta.", -- Pomegranate juice
            BANANA_JUICE = "En realidad, no pedí un té caliente de plátano.", -- Banana juice
            FIG_JUICE = "Tiene una textura única.", -- Fig juice
            DRAGONJUICE = "Es un jugo premium.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Adentro hay un palo brillante.", -- Glowberry juice
            WATERMELON_JUICE = "Refrescante.", -- Watermelon juice

            VEGGIE_TEA = "Esto debería ayudarme a recuperar energía .", -- Vegetable juice
            CARROT_TEA = "Justo lo que necesito en un día relajante..", -- Carrot tea
            CACTUS_TEA = "Incluso con espinas, se volvió blando.", -- Cactus tea
            TOMATO_JUICE = "En realidad, nunca lo habías pensado, pero es bueno.", -- Tomato juice
            LUMPY_TEA = "No es como pensaba. Está bueno.", -- Lumpy tea
            SEAWEED_SHAKE = "Hmm... Es posible que sea bueno para la gripe.", -- Seaweed shake

            GREENTEA = "Tiene un aroma sutíl.", -- Green tea
            BLACKTEA = "Prefiero el café, pero si no hay nada más beberé esto.", -- Black tea
            BLACKTEA_ICED = "Debería beber esto después de sudar .", -- Iced black tea
            FUER = "Sorprendentemente, el aroma no está mal.", -- Herbal tea, leaf tea, fern tea
            MIXFLOWER = "Parece que complementa el gusto refinado de una señorita.", -- Mixed flower petal tea
            HIBISCUSTEA = "Incluso aunque no tenga fruto, sabe ácido y dulce .", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Parece está de moda hacer té de flores.", -- Cactus flower tea
            LOTUSTEA = "Es algo exótico..", -- Lotus tea
            SUSHIBISCUS = "Hay muchos tipos de té.", -- Suicide tea
            MOON_BLOSSOM_TEA = "¡Fiu! ¡Mi mente se aclaró!.", -- Moon blossom tea

            CAFFEINBERRY_JUICE = "Confío en esto cuando tengo mucho trabajo de noche ", -- Black coffee
            TOFFEE_LATTE = "Prefiero mi café sin azúcar .", -- Toffee nut latte
            RUINCHA_LATTE = "Vafei y chocolate, ¿Cuál debo escoger?", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Está caliente.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "He visto esto en las tiendas, pero jamás lo he comprado.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "El sabor es intenso que parece hecha chispas.", -- Xocolatl (bitterness)
            TEA_RUINCOLATE_LATTE = "Estoy confundida, ¿Es esto té de leche o es un smoothie de chocolate?", -- Matcha chocolate latte

            MULLED = "No soy una chica con una chimenea, ¡Pero disfruto las copas!", -- Mulled wine
            BUTTERBEER = "Una tecnología muy avanzada como la magia misma.", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "Dulce y refrescante.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "¿Debería darle una oportunidad a este arcoíris ?", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Esto debería ser suficiente.", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "La acidez lo hace aún mejor.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Con una taza de esto, refresco mi garganta.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Hmm,  es algo dulce.", -- Vita Hyup Sikhye
            PINEANANAS_JUICE = "Definitivamente mejor que el líquido de las sodas.", -- Region of Lekia Pineapples Juice
            ORANGE_JUICE = "Siempre he visto el refrigerador lleno de esto.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Es un sabor que una señorita amará, bueno, yo soy una también. ¡Hm!", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Sabe como el postre bebible de una tienda de té.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Teapot Drinks

            SPOILED_DRINK = "No es acorde con el uso industrial.", -- Spoiled Drink

            -- Distillery Sodas

            SODA = "Agua carbonatada simple.", -- Soda Water
            FRUITSODA = "No necesito beber a menos que vaya a una fiesta.", -- Fruit Soda
            LEMONLIMESODA = "Mis dientes van a podrirse debido a esto...", -- Lemon Lime Soda (higher-tier fruit soda)
            COLA = "No podré probarlo, alguien más que se lo acabé.", -- Cola
            COLAQUANTUM = "Wow, ¿Es seguro beber esto?", -- Cola Quantum
            LUMPY_BEER = "Sabe mejor que la cola, pero no es algo de mi gusto.", -- Root Beer (non-alcoholic)

            -- Distillery Spirits

            CORN_BEER = "¡Es lo ideal para beber después del trabajo!", -- Corn Beer
            MADHU = "Creo que me gustará esto.", -- Mead
            WINE = "No tengo tiempo para olerlo, tengo una montaña de trabajo que hacer.", -- Wine (regular berry brew)
            NOBLEWINE = "Estás cosas finas están muy lejos de mí.", -- Noble Wine (cooked berry brew)
            SPARKLINGWINE = "Tienes que sacudirlo enfrente de Maxwell.", -- Sparkling Wine
            GLOWBERRYWINE = "El romance de una hogareña producción de alcohol.", -- Glow Berry Wine
            KUMIS = "Es la primera vez que veo usar leche con alcohol.", -- Kumis, Fermented Yak Milk
            LUMPY_WINE = "Tiene un sabor refrescante, ¿No lo crees?", -- Sake (root brew)
            PULQUE = "Increíble que puedas hacer alcohol usando cactus.", -- Pulque (Cactus Wine)
            RUINCACAO_WINE = "Un vino hecho con cocoa, cualquier cosa es posible.", -- Cacao Wine

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "Esto no es cola.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "Sabe como refresco de piña de tienda comercial.", -- Pineapple Soda (Oranch Soda)
            ORANGESODA = "Sabe como refresco de naranja de tienda comercial.", -- Orange Soda (Frontera)
            STRAWBERRYSODA = "No me sorprende que exista un refresco sabor fresa.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "Líquido arcoíris, los ingredientes son un poco inusuales.", -- Shipwrecked Aurobow, Rainbow Jelly Liquor
            COCONUT_WINE = "Es un licor hecho con el fruto de una palma.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "No sabe igual.", -- Cherry Forest Cherry Blossom Honey Wine (Foaming Rainbow: When examining Cherry Blossom Honey with Winona's speech 'I'm not sure if this is honey or glue.', there is a dialogue that says 'Is this honey or 'Foaming Rainbow'?')
            GIANT_BLUEBERRY_WINE = "No hay razón para hacer vino con mora azul.", -- Vita Hyup Boom Berry Wine (Explodes when ignited)
            RICE_WINE = "¡El alcohol es claro!", -- Cheongju
            WHEAT_BEER = "¡Debo tomar una bebida después del trabajo!", -- Heap of Food Wheat Beer
            PALE_BEER = "¿Acaso tiene un color equivocado esta cerveza?", -- Region of Lekia Pale Ale (Blue beer made with Monstera fruit)

            -- Distilled Spirits

            DISINFECTANT = "Tratamiento de emergencia.", -- Disinfectant
            CORN_WHISKEY = "Prefiero beber en abundancia a dar sorbos.", -- Corn Whiskey
            LUMPY_VODKA = "Debo guardar esto hasta que el tiempo se vuelva frío.", -- Vodka
            TEQUILA = "¡Tiene un aroma atrevido!", -- Tequila
            MADHU_RUM = "La era de los marinos de combinar ron con agua guardada, ha quedado atrás.", -- Rum
            BERRY_BRANDY = "No suelo tener tiempo de beber bebidas costosas como está.", -- Berry Brandy
            AREUHI = "Tiene una alta graduación de alcohol.", -- Krampus Distilled Spirit Areuhi

            -- Walani Exclusive Distilled Spirits

            BERRY_GIN = "Gracias a esto, he hecho algunos amigos en los barrios bajos.", -- Gin
            GLOWBERRY_GIN = "Me pregunto, ¿Cuánto tiempo seguirá brillando?", -- Glow Berry Gin
            ABSINTHE = "¡Al menos no lo mezclaron con sulfato de cobre!", -- Absinthe
            TEA_LUMPY_VODKA = "¿Es distinto a la absento?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Luce lujoso.", -- Rose Petal Brandy
            KAHLUA = "Creo que beberé el alcohol y el café, separados.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "La esencia es robusta como el plomo.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "¿Hay un licor dulce como este también, ¿Verdad?", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "¡Leche para adultos!", -- Rumchata

            -- Collaboration Distilled Spirits

            MOONWAY = "Parece alto en calorías. ¿Puede usarse como combustible?", -- Rainbow Jellyfish Distilled Spirit
            ARRACK = "Huele como la palma.", -- Arrack Indonesian version of coconut wine
            CHERRY_BLOOM_RUM = "Parece un souvenir de aeropuerto, todos son iguales al final.", -- Cherry Blossom Honey Wine Distilled Spirit Floating Petals
            RICE_SPIRITS = "¡Ahora es claro!", -- Rice Wine
            WHEAT_WHISKEY = "No beber alcohol mientras trabajo.", -- Wheat Whiskey
            PALE_WHISKEY = "Jamás he visto una bebida alcohólica artesanal de este color, antes...", -- Pale Malt Whiskey

            -- Walani Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "Tiene un ligero olor dulce.", -- Coconut Brandy (Replaced Caribbean Rum because she can't make it)
            GIANT_BLUEBERRY_GIN = "Parece que es acorde al consumo insutrial.", -- Boom Berry Sapphire (Explodes if consumed)

            -- Distillery Cooked Dishes

            DARK_RUINCOLATE = "¿El amigo cocinero me ha preparado esta golosina?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Oh, Warly, sabes que no me gustan las cosas dulces...", -- White Chocolate
            RUINCOLATE = "Es fácil de derretir, así que no lo como a menudo.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "No se derrite fácilmente y tiene un estuche. También puedo ganar fuerza mientras trabajo.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Se ve bien hecho y robusto.", -- Empty steel bucket
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Tomará algo de esfuerzo removerlo.", -- Rainwater has frozen
                DIRTY = "Parece que necesita una buena limpieza.", -- Rainwater has become dirty
                DIRTY_ICE = "¿Se olvidaron de limpiarlo y vaciarlo en pleno invierno?", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Tengo mis dudas sobre su durabilidad.", -- Empty wooden bucket of Woody
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Tomará algo de esfuerzo removerlo.", -- Rainwater has frozen
                DIRTY = "Parece que necesita una buena limpieza.", -- Rainwater has become dirty
                DIRTY_ICE = "¿Se olvidaron de limpiarlo y vaciarlo en pleno invierno?", -- Dirty rainwater has frozen
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Esta cosa definitivamente no pasaría los estándares de seguridad higiénica.", -- 
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Tomará algo de esfuerzo removerlo.", -- Rainwater has frozen
                DIRTY = "Parece que necesita una buena limpieza.", -- Rainwater has become dirty
                DIRTY_ICE = "¿Se olvidaron de limpiarlo y vaciarlo en pleno invierno?", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "¿Que debería poner en él?", -- Empty wooden bucket
                FULL = "Se ha acumulado agua de lluvia.", -- Clean rainwater has collected
                FULL_ICE = "Tomará algo de esfuerzo removerlo.", -- Rainwater has frozen
                DIRTY = "Parece que necesita una buena limpieza.", -- Rainwater has become dirty
                DIRTY_ICE = "¿Se olvidaron de limpiarlo y vaciarlo en pleno invierno?", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Se ha pensado mucho en el diseño de este.", -- No water in the desalinator
                PURIFY_LONG = "Veamos... la salinidad sigue siendo bastante alta.", -- Still a long way to go for purification
                PURIFY_SHORT = "No está demasiado salado ahora, ¿Verdad?", -- Purification is almost complete
                HASWATER = "No hay garantías de que no sea agua de mar en el interior.", -- Clean water is in the desalinator
                BURNT = "Esto es bastante exasperante.", -- The desalinator is burnt
                HASSALT = "Es necesario retirar la sal de la caja del filtro.", -- There is salt left in the desalinator
            },

            BARREL =
            {
                GENERIC = "Woodie y yo juntamos nuestro ingenio para asegurar que el agua no se eche a perder.", -- Inspecting the barrel
                BURNT = "Está bien, podemos hacer otro.", -- The barrel has burned
            },

            BREWERY =
            {
                EMPTY = "¡Tiene una madera muy cara, te lo aseguro!", -- Inspecting the brewery
                BURNT = "Se mire como se mire, esto es exasperante.", -- The brewery has burned
                FERMENTING_LONG = "Después de todo, la fermentación lleva un tiempo...", -- A long way to go until fermentation is done
                FERMENTING_SHORT = "Ya casi está, ¿No?", -- Fermentation is almost complete
                DONE = "¿Lo probamos ahora?", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "Es un poco más pesada que las de casa.", -- Inspecting the portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "Tengo que conseguir un poco de agua.", -- There's no water in the camp kettle in the hearth
                BOILING_LONG = "Todavía está alrededor de 68 °F.", -- Starting to boil water
                BOILING_SHORT = "Está hirviendo a 192.2 °F.", -- Water is nearly boiling
                DONE = "¡Es hora de descansar!", -- Clean water has been obtained
                STOP = "Bueno, no va a hervir sin combustible.", -- The hearth doesn't have fire, so dirty water won't boil
            },

            CAMPDESALINATOR_ITEM = "Portátil dicen, pero pesa bastante.", -- Inspecting the camp desalinator item
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
                DONE = "¡Hora del café!", -- The drink is ready
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
                DONE = "¿Valió la pena tanto esfuerzo?", -- The drink is ready
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
                DONE = "¿Deberíamos probarlo ahora?", -- There's a drink in the distiller
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
                OFF = "Algunas partes funcionan \"mágicamente\" cuando está apagado.", -- Inspecting the well sprinkler when it's turned off
            },
        },
    }
