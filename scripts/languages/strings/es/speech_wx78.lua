return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "ENTRADA DUPLICADA DENEGADA", -- Attempt to give a full bucket to a well
            WELL_BUSY = "ERROR, DISPOSITIVO OCUPADO", -- Attempt to give a filled bucket to a well (parody of "Printer is busy")
        }
    },

        ANNOUNCE_DRUNK = "ADEVERTENCIA DE INTOXICACIÓN", -- Drunk
        ANNOUNCE_DRUNK_END = "MOTOR ESTABILIZADO", -- Sobered up a bit (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "AUTO-DIAGNÓSTICO: MOTOR NORMAL", -- Temporary For Wigfrid only
        ANNOUNCE_NOTCHARGE = "RECARGA NECESARIA PARA ESTA ENTIDAD", -- Attempting to milk a Volt Goat with no charge
        ANNOUNCE_NOTHIRSTSLEEP = "REFRIGERANTE INSUFICIENTE PARA EL MODO SUEÑO", -- Trying to sleep at night with severe thirst
        ANNOUNCE_NOTHIRSTSIESTA = "REFRIGERANTE INSUFICIENTE PARA EL MODO DESCANSO", -- Trying to siesta during the day with severe thirst
        ANNOUNCE_SLEEP_END = "MOTOR ESTABILIZADO", -- Waking up and fully sober from drinking
        ANNOUNCE_THIRST = "SE REQUIERE REPOSICIÓN DE REFRIGERANTE", -- Very thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "LÍMITE DE VELOCIDAD: 49", -- Caffeine buff starts (ALL CORE RATIO LIMIT: 49)
        ANNOUNCE_CAFFINE_BUFF_STOP = "LÍMITE DE VELOCIDAD RESTAURADO", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "REAJUSTE DE LA RELACIÓN DEL pH", -- 78 is not actually used

        ANNOUNCE_DCAPACITY_CRITICAL = "ADVERTENCIA: SALIDA DEL MOTOR ANORMAL", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "FLUCTUACIÓN EN LA SALIDA DEL MOTOR DETECTADA", -- The drunkenness is kicking in

        DESCRIBE =
        {
            BOILBOOK = "UN DIRECTORIO QUE CONTIENE INSTRUCCIONES PARA COMBINAR LOS REFRIGERANTES",

            WATER_CLEAN_ICE = "AGUA CONGELADA Y ATRAPADA JEJE", -- Clean ice water
            WATER_DIRTY_ICE = "SUCIO Y ASQUEROSO", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "AGREGA SABOR A COMIDA INSÍPIDA", -- Caffeine pepper spice

            WELL_KIT = "FUENTE DE AGUA NECESARIA PARA INSTALACIÓN", -- Well kit
            WELL_SPRINKLER_KIT = "USAR CON CUIDADO", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "DISPOSITIVO DE BOMBEO DE AGUA DE ALTO RENDIMIENTO", -- Steam water pump kit
            WELL_BURYING_KIT = "HERRAMIENTA PARA RELLENAR AGUJEROS", -- Hole burial kit
            WELL_DRILLING = "EXPLORANDO TÚNELES ACUÍFEROS", -- Drilling holes with a drill
            WELL_DRILLING_ITEM = "DISPOSITIVO PARA EXPLOTAR TÚNELES ACUÍFEROS", -- Drill item (AFS: "A 'WELL'-DEVELOPING DEVICE"?)
            HOLE = "AGUJERO PARA EXTRAER AGUA", -- Well hole
            WELL = "FUENTE DE AGUA ESTABLE", -- Well

            WX78MODULE_NONEDRUNK = "MÓDULO DE ASISTENCIA", -- 78전용 묘듈

            -- Water Mode Plants

            TEA_TREE = "FUENTE CONTINUA DE HOJAS DE TÉ", -- Tea tree
            DUG_TEA_TREE = "REQUIERE DE SUELO", -- Dug-up tea tree
            TEA_SEED = "PAQUETE DE CÓDIGO FUENTE", -- Tea tree seed
            TEA_SEED_COOKED = "VIDA EN SUSPENSIÓN", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "UN ÁRBOL EN ACCESO ANTICIPADO", -- Tea tree sapling
            TEALEAVES = "SIMPLES HOJAS", -- Tea leaves (JUST A BUNCH OF LEAVES)
            TEALEAVES_DRIED = "MODIFICADO", -- Dried tea leaves (IT IS MODIFIED)

            CAFFEINBERRY = "PLANTA DE GRANOS LUNARES PARA BEBER", -- Caffeine berry bush (LUNAR-MUTATED DRINKABLE BEAN PLANT)
            DUG_CAFFEINBERRY = "REQUIERE DE SUELO", -- Dug-up caffeine berry bush
            CAFFEINBERRY_BEAN = "UN GRANO BEBIBLE", -- Raw caffeine bean
            CAFFEINBERRY_BEAN_COOKED = "OPTIMIZADO POR CALENTAMIENTO", -- Cooked caffeine bean (BEANS OPTIMIZED BY FIRE)

            RUINCACAO_TREE = "FORMA INUSUAL DE ÁRBOL DEL CACAO", -- Cocoa tree
            DUG_RUINCACAO_TREE = "REQUIERE DE SUELO", -- Dug-up cocoa tree
            RUINCACAO_SEED = "CRECER PARA COMER", -- Cocoa tree sapling item
            RUINCACAO_SEED_SAPLING = "RASTROS DE SOMBRAS Y SIMBIOSIS", -- Cocoa tree sapling planted
            RUINCACAO = "REQUIERE DE PROCESADO", -- Pre-broken cocoa fruit
            RUINCACAO_BEAN = "PROCESADO", -- Cocoa bean after breaking
            RUINCACAO_SEED_COOKED = "VAINAS TOSTADAS CON EL FUEGO", -- Roasted cocoa beans

            -- Distillery Additives

            ADDITIVE_SEED = "DESTRUIR VIDA ES DIVERTIDO", -- Seed herbs (Anise, Juniper Berry, Octagon Motif) as additives for liqueurs
            ADDITIVE_PETALS = "HIERBAS PARA MEJORAR AROMA", -- Herbs, tea leaves, and flower petals as additives for liqueurs
            ADDITIVE_NUT = "ADITIVO SÓLIDO", -- Nut additives for liqueurs (Birch Nut, Coconut, Coffee Bean, Cocoa Bean)
            ADDITIVE_DAIRY = "NO PONER IMPUREZAS ASQUEROSAS EN ETANOL", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "REFRIGERANTE ESTÁNDAR", -- Clean water
            WATER_DIRTY = "PURIFICACIÓN REQUERIDA", -- Dirty water
            WATER_SALTY = "ADVERTENCIA DE CORROSIÓN", -- Saltwater

            GOOPYDRINK = "AGUA CONVERTIDA EN ALGO TERRIBLE", -- Failed drink (concept of wet roast)

            -- Kettle Drinks

            FRUITJUICE = "MEZCLA ENERGÉTICA", -- Mixed fruit juice
            BERRIES_JUICE = "EXCELENTE RECURSO DE AZÚCARES", -- Berry juice
            POMEGRANATE_JUICE = "EL LÍQUIDO ROJO ME RECUERDA A LA SANGRE", -- Pomegranate juice
            BANANA_JUICE = "NO ES UN LÁCTEO", -- Banana juice
            FIG_JUICE = "FORMA FLUÍDA DE SUSTENTO", -- Fig juice
            DRAGONJUICE = "FIBRA LÍQUIDA", -- Dragon fruit juice
            GLOWBERRYJUICE = "LÍQUIDO LUMINOSO", -- Glowberry juice
            WATERMELON_JUICE = "BEBIDA CON MUCHO JUGO", -- WATERMELON JUICE

            VEGGIE_TEA = "ORGANISMOS ACUÁTICOS", -- VEGETABLE JUICE
            CARROT_TEA = "BETACAROTENO CONCENTRADO", -- CARROT JUICE
            CACTUS_TEA = "FIREWALL COMPLETAMENTE NEUTRALIZADO", -- CACTUS JUICE (PROTECTIVE BARRIER NEUTRALIZED)
            TOMATO_JUICE = "TOTALMENTE APLASTADO JEJE", -- TOMATO JUICE (IT'S UTTERLY CRUSHED HA HA)
            LUMPY_TEA = "ACCESO A LA RAÍZ CONCEDIDO", -- ROOT TEA (ROOT PERMISSION GRANTED)
            SEAWEED_SHAKE = "50% MAR, 50% PASTO", -- SEAWEED SHAKE (AFS: SPONGEBOB REFERENCE, PARODY OF AN EPISODE WHERE PLANKTON CONTROLS SPONGEBOB AND SAYS 50% EVIL)

            GREENTEA = "HOJAS HERVIDAS", -- RAW GREEN TEA (IT IS JUST LEAF JUICE)
            BLACKTEA = "EXTRACTO ROJO DE HOJAS NEGRAS, CONTRADICTORIO", -- BLACK TEA (RED EXTRACT FROM BLACK LEAF CONTRADICTION)
            BLACKTEA_ICED = "PODER CONGELANTE MEJORADO", -- ICED BLACK TEA
            FUER = "EXTRACTO DE HOJAS FRESCAS", -- FU'ER, LEAF TEA, FERN TEA
            MIXFLOWER = "EL SABOR DE LA BELLEZA DESTRUÍDA", -- MIXED FLOWER PETAL TEA
            HIBISCUSTEA = "UNA SOLUCIÓN DE AMARGOR INTENSO", -- HIBISCUS TEA (CONCENTRATED SOURNESS SOLUTION)
            CACTUSFLOWER_TEA = "JUGO DE PULPA", -- CACTUS FLOWER TEA (JUICE FROM FLESH!) (AFS: THE CACTUS FLOWER TEA IS GREEN THIS IS A REFERENCE TO YICHENGUNSO'S PARODY)
            LOTUSTEA = "HOJAS HERVIDAS OTRA VEZ", -- LOTUS TEA
            SUSHIBISCUS = "BASTANTE PECULIAR", -- SUICIDAL TEA
            MOON_BLOSSOM_TEA = "YA NO CRECERÁ JEJE",

            CAFFEINBERRY_JUICE = "REFRIGERANTE PARA VELOCIDAD", -- BLACK COFFEE
            TOFFEE_LATTE = "TORNILLOS NO INCLUÍDOS", -- TOFFEE NUT LATTE (BOLT NOT INCLUDED)
            RUINCHA_LATTE = "MEZCLA DE GRANOS", -- MOCHA LATTE (COFFEE + CHOCOLATE)

            HOTRUINCOLATE = "REFRIGERANTE DE CACAO", -- HOT CHOCOLATE
            RUINCOLATE_SMOOTHIE = "REFRIGERANTE DE COLA ALTO EN CARBOHIDRATOS", -- CHOCOLATE SMOOTHIE (COLD)
            RUINXOCOLATL = "REFRIGERANTE DE COCOA LIBRE DE AZÚCARES", -- CHOCOLATL (BITTER)
            TEA_RUINCOLATE_LATTE = "HOJAS DE TÉ TRITURADAS Y EXTRACTO DE CAFÉ", -- MATCHA LATTE

            MULLED = "MAYORÍA DE ETANOL PERDIDA", -- BANCHAO (MULLED WINE)
            BUTTERBEER = "ANTICONGELANTE SIN ETANOL NI ALCOHOL", -- BUTTERBEER (ETHANOL-FREE ETHANOL ANTIFREEZE)

            -- COLLABORATIVE KETTLE DRINKS

            COCONUT_JUICE = "RICO EN ELECTROLITOS", -- CAST AWAY COCONUT JUICE
            RAINBOW_SHAKE = "IRRADIA UN ARCOÍRIS", -- CAST AWAY RAINBOW JELLY SHAKE
            QUARTZ_SHAKE = "MEZCLA DE LA SUPERFICIE Y ORGANISMOS MARINOS ", -- CAST AWAY GLITTER JELLY SHAKE
            CHERRY_ROSEBERRIES_TEA = "FLUÍDO CON OLOR A ROSAS", -- CHERRY FOREST ROSEHIP TEA
            CHERRY_HONEY_TEA = "INTENTO DE MEDICIÓN DE DULZOR: FALLIDO", -- CHERRY FOREST CHERRY BLOSSOM HONEY TEA
            SWEET_RICE_DRINK = "ADVERTENCIA: CONTENIDO EXCESIVO DE MALTOSA", -- VITAHEBOK SIKHYE (WARNING: CONTAINS EXCESSIVE AMOUNTS OF MALTOSE)
            PINEANANAS_JUICE = "NO ASOCIADO CON LAS ESPONJAS", -- LEGION PINEAPPLE JUICE
            ORANGE_JUICE = "TRITURADO PARA CONSUMIRSE", -- MORE FOOD PACK ORANGE JUICE
            STRAWBERRY_SMOOTHIE = "LA TEXTURA ME PONE INCÓMODO", -- MORE FOOD PACK STRAWBERRY SMOOTHIE
            STRAWBERRY_MILK_SMOOTHIE = "FRESAS CAPTURADAS EN LÍQUIDO", -- MORE FOOD PACK STRAWBERRY SMOOTHIE LATTE

            -- BREWERY DRINKS

            SPOILED_DRINK = "INCOMPATIBLE CON EL SISTEMA", -- SPOILED DRINK

            -- BREWERY SODA

            SODA = "SOLUCIÓN DE DIÓXIDO DE CARBONO", -- CARBONATED WATER (CO2 SOLUTION)
            FRUITSODA = "SOLUCIÓN DE DIÓXIDO DE CARBONO CON FRUCTOSA", -- FRUIT SODA (CO2 SOLUTION WITH FRUCTOSE)
            LEMONLIMESODA = "CONTIENE UNA GRAN CANTIDAD DE ÁCIDO CÍTRICO", -- LEMON LIME SODA (FRUIT SODA UPGRADE)
            COLA = "CARAMELO LÍQUIDO AMADO POR ORGANISMOS TONTOS", -- COLA
            COLAQUANTUM = "CONTIENE UNA GRAN CANTIDAD DE RADIACÓN", -- QUANTUM COLA
            LUMPY_BEER = "OBSESIÓN INCOMPRENDIBLE CON LA CARBONACIÓN DE ORGANISMOS", -- ROOT BEER (NOT ALCOHOLIC)

            -- BREWERY SPIRITS

            CORN_BEER = "MAÍZ, MODIFICACIÓN DE ALCOHOL AGREGADA", -- CORN BEER
            MADHU = "PRODUCTO PROCESADO EN UN DÍA DE TRABAJO", -- MADHU HONEY WINE
            WINE = "BAYAS QUE HAN PASADO POR UN PROCESO INEFICIENTE", -- WINE (BASIC BERRY BREWING)
            NOBLEWINE = "SE REALIZÓ UN PROCESO DE ELABORACIÓN MÁS", -- NOBLE WINE (COOKED BERRY BREWING)
            SPARKLINGWINE = "CONTIENE TODOS LOS INGREDIENTES FATALES PARA LA DIGESTIÓN", -- SPARKLING WINE
            GLOWBERRYWINE = "ALCOHOL BRILLANTE", -- GLOW BERRY WINE
            KUMIS = "'D3D7D4' PRESERVADO", -- KUMIS, FERMENTED MARE'S MILK (FERMENTATION: D3D7D4 IS A PALE WHITE COLOR CODE)
            LUMPY_WINE = "RAÍCES DE ORGANISMOS", -- SUR WINE (POTATO, SWEET POTATO, ETC ROOT LIQUOR)
            PULQUE = "¿CUÁNDO SERÁ EL FINAL DE LA EVOLUCIÓN DE LOS MICROBIOS?", -- PULQUE (AGAVE WINE)
            RUINCACAO_WINE = "COCOA, NUEVAS POSIBILIDADES DESBLOQUEADAS", -- CACAO WINE

            -- COLLABORATIVE SODA

            CHERRY_DOCTOR_COLA = "¿QUIÉN CREO ESTE HÍBRIDO?", -- CHERRY FOREST DOCTOR PEPPER (DOCTOR CHERRY)
            PINEANANASSODA = "PIÑA USADA", -- CARBONATED PINEAPPLE (ORANCHI)
            ORANGESODA = "PRODUCIDO PARA MEJORAR EL COMPORTAMIENTO DE LOS ORGANISMOS", -- CARBONATED ORANGE (FANTA)
            STRAWBERRYSODA = "EVOCA PENSAMIENTOS DE UN ALMA DEMONÍACA", -- CARBONATED STRAWBERRY (WELCH'S STRAWBERRY)

            -- COLLABORATIVE SPIRITS

            AUROBOW = "INCLUYE COLORES DIVERTIDOS", -- CAST AWAY RAINBOW JELLY WINE
            COCONUT_WINE = "ACEITE DE LUBRICACIÓN BEBIBLE", -- CAST AWAY COCONUT WINE
            CHERRY_BLOOM_MADHU = "ETANOL PRE-HECHO", -- CHERRY FOREST CHERRY BLOSSOM HONEY WINE
            GIANT_BLUEBERRY_WINE = "AÚN ES PELIGROSO", -- VITAHEBOK BOOM! BERRY SAPPHIRE (EXPLODES WHEN IGNITED)
            RICE_WINE = "SUBPRODUCTO PROCESADO", -- VITAHEBOK MAKGEOLLI (RICE WINE)
            WHEAT_BEER = "DESPERDICIO DE GRANOS", -- HEAP OF FOOD WHEAT BEER
            PALE_BEER = "INMISCIBILIDAD CONVENCIONAL", -- LEGION PALE ALE (USES MONSTERA FRUIT FOR THE GREEN COLOR)

            -- DISTILLED SPIRITS

            DISINFECTANT = "SOLUCIÓN GERMICIDA", -- DISINFECTANT (ANTISEPTIC REPAIR AGENT)
            CORN_WHISKEY = "ALTA CONCENTRACIÓN CONSEGUIDA", -- CORN WHISKEY
            LUMPY_VODKA = "CONCENTRACIÓN DE ETANOL MUY ALTA", -- VODKA
            TEQUILA = "RESUENA CON EL SOL", -- TEQUILA
            MADHU_RUM = "COMPATIBLE CON EL ENTORNO ESTOMACAL", -- RUM
            BERRY_BRANDY = "UN PROCESO VERDADERAMENTE LARGO", -- BERRY BRANDY
            AREUHI = "FLUÍDO DE TIPO L", -- KUMIS DISTILLED SPIRITS (FERMENTATION: D3D7D4 IS A PALE WHITE COLOR CODE)

            -- WARLY EXCLUSIVE DISTILLED SPIRITS

            BERRY_GIN = "POPULAR EN LA SOCIEDAD HUMANA", -- GIN
            GLOWBERRY_GIN = "CONTIENE MUCHA ENERGIA DINÁMICA", -- GLOW BERRY GIN (EXPLODES WHEN IGNITED)
            ABSINTHE = "HACE QUE QUIERAS TAPARTE LOS OÍDOS", -- ABSINTHE
            TEA_LUMPY_VODKA = "CONTENIDO ALTO EN CLOROFILA", -- GREEN TEA LIQUEUR
            PETALS_BERRY_BRANDY = "JUSTO COMO UN DIFUSOR", -- ROSE PETAL BRANDY
            KAHLUA = "ALTA ENERGÍA INCLUIDA", -- COFFEE LIQUEUR KAHLUA
            NUT_CORN_WHISKEY = "¿DÓNDE ESTA EL SABOR?", -- NUT WHISKEY (KAHLUA)
            RUINCACAO_CREAM_LIQUEUR = "EXTRACTO DE ETANOL Y ALQUITRÁN DESAGRADABLE",
            RUMCHATA = "¿POR QUÉ MEZCLAR ORGANISMOS DESAGRADABLES?",

            -- COLLABORATIVE DISTILLED SPIRITS

            MOONWAY = "TIENE UNA LUMINISCENCIA ORGÁNICA", -- CAST AWAY RAINBOW JELLY DISTILLED SPIRITS
            ARRACK = "ETANOL ALTO EN FIBRA", -- ARRACK (INDONESIAN VERSION OF COCONUT WINE)
            CHERRY_BLOOM_RUM = "EFECTOS INNECESARIOS INCLUÍDOS", -- CHERRY BLOSSOM HONEY RUM (CHERRY PETALS FLOATING)
            RICE_SPIRITS = "RESTOS DEL ARROZ", -- RICE SPIRITS (CHEONGJU)
            WHEAT_WHISKEY = "TIEMPO INVERTIDO Y GRANOS PRECIOSOS", -- WHEAT WHISKEY
            PALE_WHISKEY = "ESTILO AMERICANO", -- PALE MALT WHISKEY

            -- WARLY EXCLUSIVE COLLABORATIVE DISTILLED SPIRITS

            NUT_COCONUT_BRANDY = "HECHO CON ORGANISMOS MARINOS DESAGRADABLES", -- COCONUT BRANDY (RENAMED TO CARIBBEAN BRANDY BECAUSE CARIBBEAN RUM COULD NOT BE CREATED)
            GIANT_BLUEBERRY_GIN = "CONTIENE UNA TREMENDA CANTIDAD DE ENERGÍA CINÉTICA", -- BOOM BERRY SAPPHIRE (EXPLODES WHEN IGNITED)

            -- POT RECIPES

            DARK_RUINCOLATE = "MASA DE CACAO PROCESADA", -- DARK CHOCOLATE
            WHITE_RUINCOLATE = "CONTIENE UN 20% DE MANTEQUILLA DE CACAO", -- WHITE CHOCOLATE
            RUINCOLATE = "CACAO PROCESADO", -- JUST CHOCOLATE
            RUIN_SCHOKAKOLA = "BEBIDA DE COMBUSTIBLE SÓLIDO", -- CHOKAKOLA

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "ROBUSTEZ AVANZADA", -- EMPTY STEEL BUCKET (ADVANCED STURDINESS)
                FULL = "HASTA LA MALDITA LLUVIA TIENE USOS", -- CLEAN RAINWATER (EVEN DAMN RAIN HAS ITS USES)
                FULL_ICE = "CONGELADO", -- FROZEN RAINWATER (IT IS FROZEN)
                DIRTY = "CONTENIDOS CORRUPTOS", -- DIRTY WATER (CONTENT CORRUPTED)
                DIRTY_ICE = "SUCIA AGUA SÓLIDA", -- DIRTY FROZEN WATER (FILTHY SOLID WATER)
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "SIN DEFECTOS A PESAR DE SU APARIENCIA RÚSTICA", -- EMPTY WOODEN BUCKET (NO INTEGRITY ISSUE DESPITE THE RUSTIC APPEARANCE)
                FULL = "HASTA LA MALDITA LLUVIA TIENE USOS", -- CLEAN RAINWATER (EVEN DAMN RAIN HAS ITS USES)
                FULL_ICE = "CONGELADO", -- FROZEN RAINWATER (IT IS FROZEN)
                DIRTY = "CONTENIDOS CORRUPTOS", -- DIRTY WATER (CONTENT CORRUPTED)
                DIRTY_ICE = "SUCIA AGUA SÓLIDA", -- DIRTY FROZEN WATER (FILTHY SOLID WATER)
            },

            BUCKET_EMPTY =
            {
                EMPTY = "CONTIENE HORRIBLE AGUA", -- EMPTY WOODEN BUCKET (IT CONTAINS HORRIBLE WATER)
                FULL = "HASTA LA MALDITA LLUVIA TIENE USOS", -- CLEAN RAINWATER (EVEN DAMN RAIN HAS ITS USES)
                FULL_ICE = "CONGELADO", -- FROZEN RAINWATER
                DIRTY = "CONTENIDOS CORRUPTOS", -- DIRTY WATER (CONTENT CORRUPTED)
                DIRTY_ICE = "SUCIA AGUA SÓLIDA", -- DIRTY FROZEN WATER
            },

            DESALINATOR =
            {
                EMPTY = "ENTRADA REQUERIDA", -- DESALINATOR (NO WATER)
                PURIFY_LONG = "DESALINIZACIÓN EN PROCESO", -- DESALINATOR (LOTS OF TIME LEFT)
                PURIFY_SHORT = "DESALINIZACIÓN CASI COMPLETA", -- DESALINATOR (ALMOST DONE)
                HASWATER = "DESALINIZACIÓN COMPLETADA", -- DESALINATOR (CLEAN WATER)
                BURNT = "FUNCIONALIDAD PERDIDA", -- BURNT DESALINATOR (OUT OF ORDER)
                HASSALT = "ELIMINACIÓN DE SAL NECESARIA", -- DESALINATOR (SALT LEFT)
            },

            BARREL =
            {
                GENERIC = "DISPOSITIVO EXTERNO DE ALMACENAMIENTO DE AGUA", -- BARREL (EMPTY)
                BURNT = "AGUA.EXE NO RESPONDE", -- BURNT BARREL
            },

            BREWERY =
            {
                EMPTY = "INCUBADOR DE MICROORGANISMOS", -- BREWERY (EMPTY)
                BURNT = "APAGADO FORZADO", -- BURNT BREWERY (DEVICE SHUT DOWN)
                FERMENTING_LONG = "TOMARÁ UN LARGO TIEMPO", -- BREWERY (LOTS OF TIME LEFT)
                FERMENTING_SHORT = "CASI LISTO", -- BREWERY (ALMOST DONE)
                DONE = "FERMENTACIÓN COMPLETADA", -- BREWERY (INCUBATION COMPLETE)
            },

            CAMPKETTLE_ITEM = "MÉTODO PRIMITIVO DE PURIFICACIÓN", -- CAMP KETTLE ITEM (PRIMITIVE METHOD OF PURIFICATION)
            CAMPKETTLE =
            {
                GENERIC = "RECARGA DE AGUA REQUERIDA", -- CAMP KETTLE (NO WATER)
                BOILING_LONG = "TOMARÁ TIEMPO", -- CAMP KETTLE (STARTED BOILING)
                BOILING_SHORT = "CASI TERMINADO", -- CAMP KETTLE (ALMOST DONE)
                DONE = "PURIFICACIÓN COMPLETA", -- CAMP KETTLE (PURIFICATION COMPLETE)
                STOP = "CALOR NECESARIO", -- CAMP KETTLE (NO FIRE, CONTENT CORRUPTED)
            },

            CAMPDESALINATOR_ITEM = "DISPOSITIVO PARA REMOVER SAL", -- CAMP DESALINATOR ITEM
            CAMPDESALINATOR =
            {
                GENERIC = "RECARGA DE AGUA SALADA REQUERIDA", -- CAMP DESALINATOR (NO WATER)
                BOILING_LONG = "TOMARÁ TIEMPO", -- CAMP DESALINATOR (STARTED BOILING)
                BOILING_SHORT = "CASI TERMINADO", -- CAMP DESALINATOR (ALMOST DONE)
                DONE = "PURIFICACIÓN COMPLETA", -- CAMP DESALINATOR (PURIFICATION COMPLETE)
                STOP = "CALOR NECESARIO", -- CAMP DESALINATOR (NO FIRE, SALT LEFT)
            },

            KETTLE =
            {
                EMPTY = "SACA LO MEJOR DE LA HORRIBLE AGUA", -- EMPTY KETTLE (EMPTY)
                BURNT = "TETERA SOBRECALENTADA", -- BURNT KETTLE
                BOILING_LONG = "TOMARÁ TIEMPO", -- KETTLE (STARTED BOILING)
                BOILING_SHORT = "CASI TERMINADO", -- KETTLE (ALMOST DONE)
                DONE = "MEZCLA REFRESCANTE COMPLETADA", -- KETTLE (COOLANT MIXTURE COMPLETE)
                PURIFY_LONG = "PURIFICACIÓN ADICIONAL EN PROGRESO", -- KETTLE (STARTED PURIFYING)
                PURIFY_SHORT = "PURIFICACIÓN CASI COMPLETADA", -- KETTLE (ALMOST DONE)
                HASWATER = "ACCIÓN ADICIONAL NECESARIA", -- KETTLE (CLEAN WATER)
                MELT_LONG = "DESCONGELAMIENTO EN CURSO", -- KETTLE (STARTED MELTING)
                MELT_SHORT = "DESCONGELAMIENTO CASI COMPLETADO", -- KETTLE (ALMOST DONE)
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "GUSTO CONOCERTE HERMANO", -- PORTABLE KETTLE ITEM
                EMPTY = "CÓDIGO 418: TETERA", -- INSTALLED EMPTY PORTABLE KETTLE (CODE 418: THIS IS A TEAPOT)
                BOILING_LONG = "TOMARÁ TIEMPO", -- PORTABLE KETTLE (STARTED BOILING)
                BOILING_SHORT = "CASI TERMINADO", -- PORTABLE KETTLE (ALMOST DONE)
                DONE = "MEZCLA REFRESCANTE COMPLETADA", -- PORTABLE KETTLE (COOLANT MIXTURE COMPLETE)
                PURIFY_LONG = "PURIFICACIÓN ADICIONAL EN PROGRESO", -- PORTABLE KETTLE (STARTED PURIFYING)
                PURIFY_SHORT = "PURIFICACIÓN CASI COMPLETADA", -- PORTABLE KETTLE (ALMOST DONE)
                HASWATER = "ACCIÓN ADICIONAL NECESARIA", -- PORTABLE KETTLE (CLEAN WATER)
                MELT_LONG = "DESCONGELAMIENTO EN CURSO", -- PORTABLE KETTLE (STARTED MELTING)
                MELT_SHORT = "DESCONGELAMIENTO CASI COMPLETADO", -- PORTABLE KETTLE (ALMOST DONE)
            },

            DISTILLERS =
            {
                EMPTY = "OTRO GRAN HERMANO", -- DISTILLERS (EMPTY)
                DISTILLTING_LONG = "TOMARÁ UN LARGO TIEMPO", -- DISTILLERS (LOTS OF TIME LEFT)
                DISTILLING_SHORT = "CASI LISTO", -- DISTILLERS (ALMOST DONE)
                DONE = "DESTILACIÓN COMPLETADA", -- DISTILLERS (INCUBATION COMPLETE)
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "PRESIÓN MÁXIMA ALCANZADA", -- WELL WATER PUMP (MAXIMUM PRESSURE)
                MIDDLE_PRESSURE = "PRESIÓN ADECUADA", -- WELL WATER PUMP (MIDDLE PRESSURE)
                LOW_PRESSURE = "PRESIÓN BAJA", -- WELL WATER PUMP (LOW PRESSURE)
                RECHARG_PRESSURE = "NECESITA TIEMPO PARA RECARGAR", -- WELL WATER PUMP (OUT OF ORDER)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "¿NECESITO LLENAR DE COMBUSTIBLE A LA COSA PELIGROSA?", -- WELL SPRINKLER (LOW FUEL)
                ON = "AAAAH!", -- WELL SPRINKLER (RUNNING)
                OFF = "TE ESTOY VIGILANDO", -- WELL SPRINKLER (OFF)
            },
        },
    }