return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Su espacio terrenal ya fue ocupado.",
            WELL_BUSY = "La cubeta sigue en el abismo.",
        }
    },

        ANNOUNCE_DRUNK = "Hmmm... Abigail, estoy tan sola...", -- Drunk
        ANNOUNCE_DRUNK_END = "No te rías Abigail, es vergonzoso.", -- Sobered up (Hungover)
        ANNOUNCE_DRUNK_IMMUNITY = "",
        ANNOUNCE_NOTCHARGE = "¿No hay leche para ordeñar?", -- Lightning goat can't be charged, so milk can't be squeezed into a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "La sed me impide disfrutar de mi muerte temporal.", -- Trying to sleep at night while thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "Tengo tanta sed que me secaré como una rosa.", -- Trying to sleep during the day while thirsty
        ANNOUNCE_SLEEP_END = "Eso no fue un sueño ¡Fue una pesadilla!", -- Waking up after sleeping and fully sobering up
        ANNOUNCE_THIRST = "¡Tengo la garganta seca!", -- Becoming thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Me siento tan rauda y fugaz como la vida misma.", -- Caffeine buff starts
        ANNOUNCE_CAFFINE_BUFF_STOP = "Me siento tan pesada como siempre.", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "Cuando este dolor pase, seguramente vendrá más.", -- Curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Puede que olvide la vergüenza pero Abigail no.", -- Low sanity warning
        ANNOUNCE_DCAPACITY_HALF = "Ahora entiendo porque estoy avergonzada.", -- Half sanity warning

        DESCRIBE =
        {
            BOILBOOK = "Aunque pueda alegrarme un poco, mi corazón se consumirá en lágrimas.",

            WATER_CLEAN_ICE = "Tan frío como mi corazón.",
            WATER_DIRTY_ICE = "Suciedad con hielo sucio.",

            SPICE_CAFFEINPEPPER = "Es más versátil que yo.",

            WELL_KIT = "Es pesado pero necesito encontrar motivación.",
            WELL_SPRINKLER_KIT = "Si le indico donde instalarse, la máquina encontrará el camino.",
            WELL_WATERPUMP_KIT = "Un gélido corazón mecánico.",
            WELL_BURYING_KIT = "Hacer un agujero tan profundo y taparlo con estacas no ayudará de nada.",
            WELL_DRILLING = "¿Cavará tan profundo hasta el averno?.",
            WELL_DRILLING_ITEM = "Haré un gran agujero en el suelo.",
            HOLE = "Aún no he tocado el fondo ¿Podré volver a casa?", -- (Alice's Adventures in Wonderland)
            WELL = "¿Me concederá un deseo si lanzo una moneda en el?",

            -- Waterlogged plants

            TEA_TREE = "Las hojas son ostentosas.", -- Tea Tree
            DUG_TEA_TREE = "Me gusta muerto como está, pero debo devolverlo al suelo.", -- Dug up Tea Tree
            TEA_SEED = "La vida ha encontrado un lugar entre la inestabilidad.", -- Tea Tree Seed
            TEA_SEED_COOKED = "Se quemó hasta la muerte.", -- Cooked Tea Tree Seed
            TEA_SEED_SAPLING = "Las raíces pueden ser una, pero los tallos no se llevan bien.", -- Tea Tree Sapling
            TEALEAVES = "Las hojas nunca volverán a unirse al tallo.", -- Tea Leaves
            TEALEAVES_DRIED = "El sol les arrebato todo rastro de vida.", -- Dried Tea Leaves

            CAFFEINBERRY = "Una planta con forma de haba.", -- Caffeine Bush
            DUG_CAFFEINBERRY = "Descansa en paz, no tienes hogar ahora.", -- Dug up Caffeine Bush
            CAFFEINBERRY_BEAN = "Parece bastante estimulante.", -- Caffeine Bean
            CAFFEINBERRY_BEAN_COOKED = "¿Quién hubiera dicho que puedes obtener felicidad de un frijol?", -- Cooked Caffeine Bean

            RUINCACAO_TREE = "Quemé las semillas y se convieron en nutrientes.", -- Ruincacao Tree
            DUG_RUINCACAO_TREE = "¿Es esa caverna tu infierno?", -- Dug up Ruincacao Tree
            RUINCACAO_SEED = "La rescate antes de que ardiera.", -- Ruincacao Seed
            RUINCACAO_SEED_SAPLING = "La vida se abrió paso entre las sombras.", -- Ruincacao Seedling
            RUINCACAO = "Una cajita de maquillaje con pequeñas vidas atrapadas dentro.", -- Ruincacao
            RUINCACAO_BEAN = "Esta lleno de aceite.", -- Ruincacao Bean
            RUINCACAO_BEAN_COOKED = "Al final, todos acabamos igual.", -- Cooked Ruincacao Bean

            -- Distilled Spirits Additives

            ADDITIVE_SEED = "He recogido semillas con olores inusuales.", -- Liqueur Additive (Anise, Juniperberry, Parrot Motif)
            ADDITIVE_PETALS = "Pétalos de flores y hojas secas.", -- Liqueur Additive (Herbal Tea, Petal)
            ADDITIVE_NUT = "Nueces finamente picadas.", -- Liqueur Additive (Birchnut, Coconut, Coffee Bean, Cacao Bean)
            ADDITIVE_DAIRY = "Crema de leche.", -- Liqueur Additive (Dairy)

            -- Drinks

            WATER_CLEAN = "Prolonga la vida por un tiempo.", -- Clean Water
            WATER_DIRTY = "Si quieres experimentar un largo dolor, tómate esto.", -- Dirty Water
            WATER_SALTY = "Regala más vida, pero conduce a la muerte envenenándote.", -- Salt Water (from the novel "Lord of the Flies")

            GOOPYDRINK = "Un fracaso como la vida misma.", -- Failed Drink (Wet Roasted)

            -- Teapot Drinks

            FRUITJUICE = "Hecha con varias frutas.", -- Mixed Fruit Juice
            BERRIES_JUICE = "La vida de muchas bayas debió apagarse para hacer una botella...", -- Berry Juice
            POMEGRANATE_JUICE = "Manchará tu ropa si lo derramas.", -- Pomegranate Juice
            BANANA_JUICE = "Si soló pudieras probarlo Abigail ...", -- Banana Juice
            FIG_JUICE = "Pequeñas semillas se aferran a la vida y a mi garganta.", -- Fig Juice
            DRAGONJUICE = "Bueno, ahora es jugo.", -- Dragon Fruit Juice
            GLOWBERRYJUICE = "¿Mi cuerpo brillará azul?", -- Glowberry Juice
            WATERMELON_JUICE = "Es tan acuoso como el agua misma.", -- Watermelon Juice

            VEGGIE_TEA = "He mezclado vegetales y los herví.", -- Green Tea (Vegetable Tea)
            CARROT_TEA = "Trituré zanahorias en el agua.", -- Carrot Tea
            CACTUS_TEA = "Se ahogó hasta convertirse en agua.", -- Cactus Tea
            TOMATO_JUICE = "Es más espeso que el agua pero lo beberé igual .", -- Tomato Juice
            LUMPY_TEA = "No puedo extraer mas de las raíces.", -- Root Tea
            SEAWEED_SHAKE = "No puedo entender las palabras extranjeras.", -- Seaweed Shake

            GREENTEA = "No estoy segura de llamar esto té.", -- Fresh Leaf Green Tea
            BLACKTEA = "Un breve descanso para las almas cansadas", -- Black Tea (Jane Austen / Pride and Prejudice)
            BLACKTEA_ICED = "Un gélido descanso para las almas cansadas", -- Iced Black Tea
            FUER = "Un vendedor de sombreros para los días sin cumpleaños.", -- Fuertea, Leaf Tea, Fern Tea (Alice's Adventures in Wonderland)
            MIXFLOWER = "Recolecté pétalos y los puse a hervir.", -- Mixed Flower Petal Tea
            HIBISCUSTEA = "Un sabor un poco fuerte.", -- Hibiscus Tea
            CACTUSFLOWER_TEA = "Aunque esté hervido, sigue siendo bonito", -- Cactus Flower Tea
            LOTUSTEA = "La calma ha permanecido incluso en medio del sufrimiento.", -- Lotus Tea
            SUSHIBISCUS = "Si sólo pudiera pasar algún tiempo con Abigail...", -- Suicide Tea
            MOON_BLOSSOM_TEA = "No puede ser más hermoso", -- Moon Blossom Tea

            CAFFEINBERRY_JUICE = "Oscuro y amargo", -- Black Coffee
            TOFFEE_LATTE = "Es tan dulce que no siento el café.", -- Toffeenut Latte
            RUINCHA_LATTE = "Café para adultos que no pueden beber cosas amargas.", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "Echaba de menos el chocolate caliente", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "Un remolino de dulzura.", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "¿Mi corazón y yo rodamos por las escaleras?", -- Chocolatl (Spicy)
            TEA_RUINCOLATE_LATTE = "Es amargo pero dulce.", -- Matcha Latte

            MULLED = "¿Podré derretir un corazón frío y destrozado?", -- Bancha (Mulled)
            BUTTERBEER = "Dulce como la magia.", -- Butterbeer (Harry Potter series)

            -- Collaborative Teapot Drinks

            COCONUT_JUICE = "Si pudiera volver a fortalecer mi yo interior.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Una hermosa muerte dentro de una taza.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Una muerte apropiada para un tonto.", -- Shipwrecked Fool's Goldfish Shake
            CHERRY_ROSEBERRIES_TEA = "Debo tener cuidado de no tragarme los capullos de las flores.", -- Cherry Forest Rose Hip Tea
            CHERRY_HONEY_TEA = "¿Puede haber algo mas dulce que esto?", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "¿Tiene algo masticable dentro?.", -- Vita-Hybiscus Sikhye
            PINEANANAS_JUICE = "Quité la piel dura y machaqué la pulpa", -- Legacy Pineapple Juice
            ORANGE_JUICE = "Un jugo cítrico y dulce.", -- Moer Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Una bebida hecha triturando fresas con hielo.", -- Moer Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Envuelve suavemente la punta de la lengua.", -- Moer Food Pack Strawberry Smoothie Latte

            -- Brewing Drinks

            SPOILED_DRINK = "¿Puede haber algo peor que esto?", -- Spoiled Drink

            -- Soda Machine

            SODA = "Está efervescente.", -- Carbonated Water
            FRUITSODA = "Refresco con jugo de fruta", -- Fruit Soda
            LEMONLIMESODA = "Bebida carbonatada y dulce", -- Lemon Lime Soda (Superior to Fruit Soda)
            COLA = "Una sustancia oscura, que controla a mucha gente", -- Cola
            COLAQUANTUM = "Una nueva sustancia negra que incluso emite luz.", -- Cola Quantum
            LUMPY_BEER = "Parece que se ajusta a mis gustos", -- Root Beer (Not alcoholic)

            -- Distilled Spirits

            CORN_BEER = "Cerveza amarga con mucha espuma.", -- Corn Beer
            MADHU = "¿Cuanta miel tuve que robar?", -- Bee's Honey Wine
            WINE = "Oscuro y carmesí como la sangre", -- Wine (Berry Brewing)
            NOBLEWINE = "Hecho con frutas a temperaturas infernales.", -- Noble Wine (Baked Berry Brewing)
            SPARKLINGWINE = "Está suprimiendo mis entrañas con un pequeño tapón de corcho.", -- Sparkling Wine
            GLOWBERRYWINE = "¿Hay espíritus resplandecientes dentro del alcohol?", -- Glow Berry Wine
            KUMIS = "Es una pena para los jóvenes", -- Kumis, Fermented Horse Milk
            LUMPY_WINE = "Es transparente y ligeramente color mostaza.", -- Soju (Root Brewing)
            PULQUE = "Todas las púas se han derretido.", -- Pulque (Saminju)
            RUINCACAO_WINE = "Tendré problemas si se vuelve mas dulce", -- Cacao Wine

            -- Collaborative Soda

            CHERRY_DOCTOR_COLA = "No es un médico de verdad, pero puede que te consuele momentáneamente.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Un refresco amargo y dulce", -- Carbonated Pineapple (Orangina)
            ORANGESODA = "Bebida carbonatada con jugo de naranja exprimido", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Bebida carbonatada con fresas trituradas.", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Distilled Spirits

            AUROBOW = "Es un arcoíris lleno muerte.", -- Shipwrecked Aurobou, Rainbow Jelly Wine
            COCONUT_WINE = "Sutilmente dulce como yo", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "¿Quisieras disfrutar de la efímera belleza un poco más?", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Vino con un aroma explosivo.", -- Boom Berry Wine (Explodes when lit)
            RICE_WINE = "Alcohol hecho de arroz", -- Vita-Hybiscus Makgeolli
            WHEAT_BEER = "No se puede saborear la dulzura de los granos", -- Heap of Food Wheat Beer
            PALE_BEER = "Pálido como su nombre indica.", -- Legacy Pale Ale (Green beer made with Monstra Fruit)

            -- Distilled Spirits

            DISINFECTANT = "Para una curación llena de dolor y ardor.", -- Disinfectant
            CORN_WHISKEY = "Solo es un veneno que mata lentamente a la gente.", -- Corn Whiskey
            LUMPY_VODKA = "Quema mi garganta.", -- Vodka
            TEQUILA = "Un regalo de los antiguos hijos del sol.", -- Tequila
            MADHU_RUM = "Se ahogarán lentamente sin siquiera saberlo", -- Rum
            BERRY_BRANDY = "Te hará olvidar incluso el querer olvidar.", -- Berry Brandy
            AREUHI = "Incluso sin lactosa debe ser doloroso", -- Kumis Distilled Spirits Areuhi

            -- Exclusive Distilled Spirits for Warly

            BERRY_GIN = "Nunca eh visto que se use como medicina", -- Gin
            GLOWBERRY_GIN = "Seduce a la gente con su luz azul", -- Glow Berry Gin
            ABSINTHE = "Una mujer vestida de verde, disfrazada de serpiente", -- Absinthe (The Chronicles of Narnia)
            TEA_LUMPY_VODKA = "No te hará mas saludable.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Seduce con el perfume de las flores.", -- Rose Petal Brandy
            KAHLUA = "Huele fuertemente a concentrado de café.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "Si eres alérgico a las nueces, es perfecto para ti", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Tiene un dulce aroma.", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Dale a esto a lo niños que sufran", -- Rumchata (Mix of Rum and Horchata)

            -- Collaborative Distilled Spirits

            MOONWAY = "Un arcoíris de muerte.", -- Rainbow Jelly Wine Distilled Spirits
            ARRACK = "Vino de palma, destilado en alcohol.", -- Arrack (Indonesian version of Coconut Wine Distilled Spirits)
            CHERRY_BLOOM_RUM = "Es mejor verlo que beberlo.", -- Cherry Honey Wine Distilled Spirits with Cherry Blossom Petals Floating
            RICE_SPIRITS = "Es alcohol disfrazado de agua.", -- Makgeolli
            WHEAT_WHISKEY = "Solo es un veneno que mata lentamente a las personas", -- Wheat Whiskey
            PALE_WHISKEY = "El caballero pálido vigila a los que lo beben.", -- Pale Malt Whiskey

            -- Exclusive Collaborative Distilled Spirits for Warly

            NUT_COCONUT_BRANDY = "Sin duda, voy a entrar sin saberlo en la boca del lobo...", -- Coconut Brandy (Renamed as Caribbean Brandy since I can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "Posee un encanto destructivo", -- Boom Berry Sapphire (Explodes when lit)

            -- Pot Cooking

            DARK_RUINCOLATE = "Tan amarga y oscura como mi vida.", -- Dark Chocolate
            WHITE_RUINCOLATE = "Si tan sólo pudiera compartir esta dulzura con Abigail...", -- White Chocolate
            RUINCOLATE = "Combustible comestible negro", -- Just Chocolate
            RUIN_SCHOKAKOLA = "He puesto de todo para despertarme", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Fuerte pero sin corazón.", -- Empty steel bucket
                FULL = "Llena con llanto del mundo.", -- Clean rainwater inside
                FULL_ICE = "Frío como la muerte.", -- Rainwater has frozen
                DIRTY = "Lleno de agua tóxica con vida.", -- Rainwater has become dirty
                DIRTY_ICE = "La congelación no lo limpiará.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Un árbol muerto para hacer una cubeta de madera.", -- Empty wooden bucket
                FULL = "Lleno con agua de llanto.", -- Clean rainwater inside
                FULL_ICE = "Esta congelado.", -- Rainwater has frozen
                DIRTY = "Lleno de agua tóxica con vida.", -- Rainwater has become dirty
                DIRTY_ICE = "Estar congelado no lo limpio.", -- Dirty rainwater has frozen
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Pongamos polvo de huesos en esto, y enviémoslo de vuelta al mar como si nada.",
                FULL = "Lleno con lágrimas.", -- Clean rainwater inside
                FULL_ICE = "Esta congelado.", -- Rainwater has frozen
                DIRTY = "Lleno de agua tóxica rica en vida.", -- Rainwater has become dirty
                DIRTY_ICE = "Estar congelado no lo limpiará.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Solo una cubeta vacía.", -- Empty wooden bucket
                FULL = "Lleno con lágrimas.", -- Clean rainwater inside
                FULL_ICE = "Esta congelado.", -- Rainwater has frozen
                DIRTY = "Lleno de agua tóxica rica en vida.", -- Rainwater has become dirty
                DIRTY_ICE = "Estar congelado no lo limpiará.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Se escucha el sonido del vacío", -- No water in the desalinator
                PURIFY_LONG = "¿Se puede filtrar la tristeza de mis lagrimas?.", -- A lot of time left until purification is complete
                PURIFY_SHORT = "El agua se está volviendo pura.", -- Purification is almost done
                HASWATER = "El agua limpia está lista.", -- Clean water is in the desalinator
                BURNT = "Solo quedó el olor a sal tostada.", -- The desalinator has burned
                HASSALT = "Parece que filtramos sal con sal.", -- There is salt left in the desalinator
            },

            BARREL =
            {
                GENERIC = "Puedo guardar mi agua aquí.", -- Examining a barrel
                BURNT = "En cenizas como mis esperanzas.", -- The barrel has burned
            },

            BREWERY =
            {
                EMPTY = "Hace a los ingredientes mas apetecibles.", -- Examining a brewery
                BURNT = "Solo queda el olor.", -- The brewery has burned
                FERMENTING_LONG = "Probablemente le tomará un tiempo.", -- A lot of time left until brewing is complete
                FERMENTING_SHORT = "Necesita un poco más para fermentar.", -- Brewing is almost done
                DONE = "Otra tarea terminada.", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "Una tetera de mano.", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "Puedo hervir agua de un estanque en ella.", -- Empty portable kettle on a fire pit
                BOILING_LONG = "El agua esta tibia.", -- It's started boiling
                BOILING_SHORT = "Necesito que hierva un poco más.", -- The water is almost boiled
                DONE = "Ha extendido su tiempo de vida un poco mas.", -- Clean water obtained
                STOP = "Todavía no está lo suficientemente hervida.", -- The water isn't boiling due to a lack of fire
            },

            CAMPDESALINATOR_ITEM = "Tengo que llevarlo a regañadientes.", -- Examining the portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "Puedo obtener agua potable del mar con ella.", -- No water in the desalinator
                BOILING_LONG = "La mayor parte es agua de mar.", -- It's started boiling
                BOILING_SHORT = "Un montón de agua limpia se esta acumulando.", -- It's almost boiled
                DONE = "Ha extendido su tiempo de vida un poco mas.", -- Clean water obtained
                STOP = "Todavía no ha hervido lo suficiente.", -- The saltwater isn't being purified due to a lack of fire
            },

            KETTLE =
            {
                EMPTY = "Tan seca como mis ojos.", -- Examining an empty kettle
                BURNT = "Reducida a cenizas como mi alegría.", -- The kettle has burned
                BOILING_LONG = "No importa lo que haya dentro, sigue vivo.", -- It's just started making a drink
                BOILING_SHORT = "Necesita un poco más de tiempo para esta listo.", -- It's almost done cooking a drink
                DONE = "Finalmente puedo refrescar mi garganta.", -- A drink is ready
                PURIFY_LONG = "El agua sigue tibia.", -- It's just started boiling dirty water
                PURIFY_SHORT = "Necesita hervir un poco mas.", -- It's almost done boiling dirty water
                HASWATER = "¿Recolecto ingredientes para una bebida?", -- Clean water is inside
                MELT_LONG = "Está congelado.", -- It's just started melting ice water
                MELT_SHORT = "Necesito hervirlo un poco mas para derretirlo.", -- It's almost done melting ice water
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Para evitar una garganta reseca.", -- Examining the portable kettle item
                EMPTY = "Tan seca como mis ojos.", -- Examining an empty placed portable kettle
                BOILING_LONG = "No importa lo que haya dentro, sigue vivo.", -- It's just started making a drink
                BOILING_SHORT = "Necesita un poco más de tiempo para cocinarse.", -- It's almost done cooking a drink
                DONE = "Finalmente puedo refrescar mi garganta.", -- A drink is ready
                PURIFY_LONG = "El agua sigue tibia.", -- It's just started boiling dirty water
                PURIFY_SHORT = "Necesita hervir un poco mas.", -- It's almost done boiling dirty water
                HASWATER = "¿Recolecto ingredientes para una bebida?", -- Clean water is inside
                MELT_LONG = "Está congelado.", -- It's just started melting ice water
                MELT_SHORT = "Necesito hervirlo un poco mas para derretirlo.", -- It's almost done melting ice water
            },

            DISTILLERS =
            {
                EMPTY = "La máquina consume alcohol, y el alcohol consume a la gente.", -- Examining a distiller
                DISTILLTING_LONG = "Probablemente tome un tiempo.", -- A lot of time left until distillation is complete
                DISTILLING_SHORT = "Necesito esperar un poco mas.", -- Distillation is almost done
                DONE = "Otra tarea completada.", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Bombea tan fuerte como el corazón antes de extinguirse.", -- Maximum pressure
                MIDDLE_PRESSURE = "Su fuerza empieza a extinguirse.", -- Medium pressure
                LOW_PRESSURE = "Parece que tiene una arritmia.", -- Almost no pressure
                RECHARG_PRESSURE = "Su corazón se ha parado.", -- No pressure at all (can't use it until pressure is at maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Puede volver a la vida con combustible.", -- Examining a well sprinkler with low fuel
                ON = "Me ha robado el trabajo.", -- It's operating
                OFF = "Ah dejado de trabajar.", -- Examining a turned-off well sprinkler
            },
        },
}