return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "No hay espacio para otro más.", -- Trying to give a full bucket to a well
            WELL_BUSY = "¡No tengo otra cuerda!", -- Trying to give a bucket with water to a well
        }
    },

        ANNOUNCE_DRUNK = "Ugh, mas débil que el alcohol de Wolfgang...", -- Becoming drunk
        ANNOUNCE_DRUNK_END = "Wolfgang se siente mejor.", -- Sobering up from alcohol (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "¡Ja! ¡El alcohol no es nada para el gran Wolfgang!", -- Mighty state alcohol immunity
        ANNOUNCE_NOTCHARGE = "Wolfgang debe darle poder para cargar a la cabra", -- Trying to milk Goat without charged rods
        ANNOUNCE_NOTHIRSTSLEEP = "Wolfgang está demasiado sediento para dormir...", -- Trying to sleep at night with low thirst
        ANNOUNCE_NOTHIRSTSIESTA = "Wolfgang necesita un trago antes de su siesta...", -- Trying to sleep during the day with low thirst
        ANNOUNCE_SLEEP_END = "¡Wolfgang es más fuerte que el alcohol!", -- Waking up after sleeping and sobering up from alcohol
        ANNOUNCE_THIRST = "Poderosos músculos se secan...", -- Becoming too thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "¡Wolfgang corre como un lobo!", -- Starting caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Hora de los ejercicios anaeróbicos de Wolfgang.", -- Ending caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Wolfgang se siente aliviado.", -- Announce when curing waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Wolfgang debería dejar de beber...", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "Wolfgang se siente caluroso...", -- Starting to get drunk

        DESCRIBE =
        {
            BOILBOOK = "¡Una guía para hacer bebidas!",

            WATER_CLEAN_ICE = "El agua de Wolfgang se ha congelado...", -- Clean ice
            WATER_DIRTY_ICE = "Este hielo no se puede consumir.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "Mmm... Huele bien...", -- Caffeine pepper spice

            WELL_KIT = "¡Wolfgang construye pozos para sus amigos!", -- Well kit
            WELL_SPRINKLER_KIT = "¡Un rociador poderoso como Wolfgang!", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Materiales para un fuerte pozo.", -- Steam water pump kit
            WELL_BURYING_KIT = "¿Puede Wolfgang tapar los hoyos que cavó?", -- Hole burying kit
            WELL_DRILLING = "¡La máquina está peleando con el suelo!", -- Drilling the hole
            WELL_DRILLING_ITEM = "Cava el suelo. ¡Qué poderoso!", -- Drilling item
            HOLE = "Wolfgang sacará agua de este pozo.", -- Well hole
            WELL = "¡Ahora Wolfgang sacará agua del pozo!", -- Well

            WX78MODULE_NONEDRUNK = "Son bocadillos de robot. ¿Verdad?", -- 78전용 묘듈

            -- Water mode plants

            TEA_TREE = "Es un pequeño árbol. ¡Tengan cuidado de no pisarlo!", -- Tea tree
            DUG_TEA_TREE = "Este pequeño árbol salió de la tierra.", -- Dug tea tree
            TEA_SEED = "¡Wolfgang puede aplastarlo con sus manos!", -- Tea tree seed
            TEA_SEED_COOKED = "Estas diminutas semillas son demasiado pequeñas para comerlas.", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "¡Es un árbol muy pequeño!", -- Tea tree sapling
            TEALEAVES = "Estas hojas huelen bien.", -- Tea leaves
            TEALEAVES_DRIED = "Las hojas verdes se quemaron.", -- Dried tea leaves

            CAFFEINBERRY = "Esto es diferente de como Wolfgang lo recuerda.", -- Coffee bush
            DUG_CAFFEINBERRY = "Frío y solitario.", -- Dug coffee bush
            CAFFEINBERRY_BEAN = "Mmm... Huele bien.", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "¡Pequeños granos hacen fuerte a Wolfgang!", -- Cooked coffee bean

            RUINCACAO_TREE = "Uhh... Wolfgang tiene un mal presentimiento sobre esto.", -- Cacao tree
            DUG_RUINCACAO_TREE = "Un árbol desagradable.", -- Dug cacao tree
            RUINCACAO_SEED = "Este árbol tenebroso es todavía muy peuqeño y débil.", -- Cacao seed item
            RUINCACAO_SEED_SAPLING = "Un pequeño y aterrador árbol crecerá muy pronto.", -- Cacao sapling planted
            RUINCACAO = "Wolfgang no puede romperlo incluso con su grandeza.", -- Cacao fruit before breaking
            RUINCACAO_BEAN = "El duro fruto ha sido derrotado.", -- Cacao bean after breaking
            RUINCACAO_BEAN_COOKED = "Huele delicioso, pero también da miedo...", -- Cooked cacao bean

            -- Distilled spirit additives

            ADDITIVE_SEED = "Tiene un olor refrescante.", -- Herb (anise, juniper berry, and star-shaped motifs) additive for liqueur production
            ADDITIVE_PETALS = "¿Dónde debería Wolfgang usar estas pequeñas flores?", -- Herb, tea leaves, and flower petal additives for liqueur production
            ADDITIVE_NUT = "Wolfgang puede aplastarlo fácilmente.", -- Nut, coconut, coffee bean, and cacao bean additives for liqueur production
            ADDITIVE_DAIRY = "¿Wolfgang debería beber leche?", -- Dairy product additives for liqueur production

            -- Drinks

            WATER_CLEAN = "¡El agua es importante para crecer músculos fuertes!", -- Clean water
            WATER_DIRTY = "Beber esto enfermaría a Wolfgang.", -- Dirty water
            WATER_SALTY = "¡A Wolfgang no le gusta el agua salada!", -- Saltwater

            GOOPYDRINK = "¿Wolfgang puso algo extraño en ella?", -- Failed drink (Wet Goop concept)

            -- Teapot drinks

            FRUITJUICE = "Es agua con frutas.", -- Mixed fruit juice
            BERRIES_JUICE = "Dulce y rojo.", -- Berry juice
            POMEGRANATE_JUICE = "¿Alguna semilla ahí?", -- Pomegranate juice
            BANANA_JUICE = "¡Fresco y sabroso!", -- Banana juice
            FIG_JUICE = "Hecho con frutas grandes y dulces.", -- Fig juice
            DRAGONJUICE = "¿Por qué la fruta es roja pero el jugo blanco?", -- Dragon fruit juice
            GLOWBERRYJUICE = "¿Puede Wolfgang beber agua brillante?", -- Glowberry juice
            WATERMELON_JUICE = "Hecho con una sandía gigante.", -- Watermelon juice

            VEGGIE_TEA = "¡Sabe a pasto y es muy amargo!", -- Green juice
            CARROT_TEA = "¡Wolfgang disfruta beber zanahorias también!", -- Carrot tea
            CACTUS_TEA = "Sin semillas puntiagudas. ¿Verdad?", -- Cactus tea
            TOMATO_JUICE = "¡Una bebida saludable!", -- Tomato juice
            LUMPY_TEA = "Wolfgang hirvió los músculos de plantas.", -- Root tea
            SEAWEED_SHAKE = "Beber esto no hará a Wolfgang más fuerte.", -- Seaweed shake

            GREENTEA = "Tiene un fuerte olor a pasto.", -- Fresh green tea
            BLACKTEA = "Wolfgang cree que el té negro es peligroso...", -- Black tea
            BLACKTEA_ICED = "¡Esun té refrescante! A Wolfgang le gusta.", -- Black tea iced
            FUER = "Hecho con hojas de árbol.", -- Fuer, leaf tea, fern tea
            MIXFLOWER = "Huele bien.", -- Mixed flower petal tea
            HIBISCUSTEA = "Hace que Wolfgang se ponga emocional.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Té hecho con flores rojas.", -- Cactus flower tea
            LOTUSTEA = "Wolfgang nunca había visto un té rosa", -- Lotus tea
            SUSHIBISCUS = "Incluso los músculos de Wolfgang están temblando...", -- Suicide tea
            MOON_BLOSSOM_TEA = "¡Un té fuerte y aromatico infunde un espíritu fuerte!", -- ㅡMoon Blossom tea

            CAFFEINBERRY_JUICE = "¡Es amargo, pero hace a Wolfgang más fuerte!", -- Black coffee
            TOFFEE_LATTE = "Tiene un olor a nuez.", -- Toffeenut latte
            RUINCHA_LATTE = "Está dulce y hace más fuerte a Wolfgang", -- Mocha latte (coffee + cocoa)

            HOTRUINCOLATE = "Es un dulce chocolante caliente.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Es una fría bebida de chocolate.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "¡Es bastante amargo!", -- Chocotlatl (spicy)
            TEA_RUINCOLATE_LATTE = "Una bebida pastosa con sabor a chocolate.", -- Matcha latte

            MULLED = "Wolfgang no puede oler esto.", -- Bancha
            BUTTERBEER = "Es cerveza, ¡pero dulce!", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "¡La dura nuez-ahora una bebida!", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "¡Una bonita bebida gelatinosa!", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Wolfgang está confundido. ¿Esto beben los peces?", -- Shipwrecked Crystalline Fish Shake
            CHERRY_ROSEBERRIES_TEA = "Huele a rosas preciosas.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "¡Extremadamente dulce!", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Está dulce a pesar de que solo tiene arroz!", -- Vita Hybrids Sikhye
            PINEANANAS_JUICE = "Un jugo increíblemente refrescante.", -- Regal's Pineapple Juice
            ORANGE_JUICE = "Agrio, dulce y naranja.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Está lleno de semillas.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Suave y sabroso.", -- More Food Pack Strawberry Milk Smoothie

            -- Brewery Drinks

            SPOILED_DRINK = "Ugh, ¡Huele terrible!", -- Spoiled drink

            -- Brewery Soda

            SODA = "¡Es buerbujeante!", -- Carbonated Water
            FRUITSODA = "Burbujeante y dulce.", -- Fruit Soda
            LEMONLIMESODA = "¡Extremadamente dulce!", -- Lemon Lime Soda (Superior version of Fruit Soda)
            COLA = "Una bebida dulce y negra.", -- Cola
            COLAQUANTUM = "¡Una bebida poderosa! ¡Le gusta mucho a Wolfgang!", -- Cola Quantum
            LUMPY_BEER = "Tiene un sabor único y refrescante.", -- Root Beer (Not alcoholic)

            -- Brewery Spirits

            CORN_BEER = "Hecho de maíz.", -- Corn Beer
            MADHU = "Hecho con miel de abejas enojadas.", -- Madhu
            WINE = "Para ocasiones especiales.", -- Wine (Made from just berries)
            NOBLEWINE = "¡Hecho con fruta tostada!", -- Noble Wine (Made from roasted berries)
            SPARKLINGWINE = "¡Amarillo y burbujeante!", -- Sparkling Wine
            GLOWBERRYWINE = "Brilla mucho.", -- Glow Berry Wine
            KUMIS = "Leche convertida en alcohol.", -- Kumis (Fermented mare's milk)
            LUMPY_WINE = "Hecho con vegetales de raíz.", -- Sake (Made from potatoes, sweet potatoes, etc.)
            PULQUE = "Se convirtió en una bebida de maguey.", -- Pulque (Agave)
            RUINCACAO_WINE = "¿Puedes hacer alcohol con chocolate?", -- Cacao Wine

            -- Collaboration Soda

            CHERRY_DOCTOR_COLA = "¡Sabe a dulces!", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Agrio y refrescante.", -- Carbonated Pineapple (Orangina)
            ORANGESODA = "Dulce y burbujeante.", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "¡Tantas semillas y burbujas!", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "Bastante gelatinosa.", -- Shipwrecked Aurobouros (Rainbow Jellyfish Wine)
            COCONUT_WINE = "Se hizo vino de ¿Coco?.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "¡Muy dulce!", -- Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "¿Wolfgang va a explotar?", -- Vita Hybrids Boom! Berry Sapphire (Explodes when ignited)
            RICE_WINE = "Blanco como la leche.", -- Vita Koalefant Soju
            WHEAT_BEER = "¡Es como baviera!", -- Hip of Food Wheat Beer
            PALE_BEER = "Pálida como un pequeño fantasma.", -- Regiom Pale Ale (Beer made with Monster Meat)

            -- Distilled Spirits Descriptions

            DISINFECTANT = "Se usa para limpiar cosas.", -- Disinfectant
            CORN_WHISKEY = "Está hecho al estilo escocés..", -- Corn Whiskey
            LUMPY_VODKA = "¡Vodka! ¡Es famoso en la patria!", -- Lumpy Vodka
            TEQUILA = "¡Se disfruta mejor bajo el sol!", -- Tequila
            MADHU_RUM = "A los monos marinos les puede gustar esto.", -- Madhu Rum
            BERRY_BRANDY = "Es un licor de buen sabor.", -- Berry Brandy
            AREUHI = "Está hecho con leche hervida.", -- Creamy Kremez Distilled Spirit Areuhi

            -- Warly-Specific Distilled Spirits

            BERRY_GIN = "¡Mejora cuando se mezcla con tónico!", -- Gin
            GLOWBERRY_GIN = "¡Nunca había visto un licor brillante!", -- Glow Berry Gin
            ABSINTHE = "Wow... es como un licor de hadas verdes.", -- Absinthe
            TEA_LUMPY_VODKA = "Es un vodka extraño con sabor a hierbas.", -- Green Tea Lumpy Vodka
            PETALS_BERRY_BRANDY = "Huele fragante.", -- Rose Petal Berry Brandy
            KAHLUA = "Hecho con café, definitivamente un licor.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Huele a nueces.", -- Nutty Corn Whiskey
            RUINCACAO_CREAM_LIQUEUR = "¿Hicieron licor con chocolate?", -- Bailey's Cacao Cream Liqueur
            RUMCHATA = "Es un extraño licor con leche.", -- Rumchata (Rum and Horchata, a dairy-based beverage)

            -- Collaborative Distilled Spirits

            MOONWAY = "Hecho hirviendo bonitas medusas.", -- Rainbow Jellyfish Spirits
            ARRACK = "Licor de coco hervido.", -- Arrack, Indonesian version of coconut wine spirits
            CHERRY_BLOOM_RUM = "¿Existe un licor tan dulce?", -- Cherry Honey Spirits with cherry blossom petals floating
            RICE_SPIRITS = "Hecho con granitos blancos.", -- Rice Spirits
            WHEAT_WHISKEY = "¡Wolfgang prefiere un whisky fuerte!", -- Wheat Whiskey
            PALE_WHISKEY = "Wolfgang sabe que es estilo americano.", -- Pale Malt Whiskey

            -- Warly Exclusive Spirits

            NUT_COCONUT_BRANDY = "¡El mundo es ancho! ¡Hay mucho que robar!", -- Take what you can! Give nothin' back! - Captain Jack Sparrow, Pirates of the Caribbean
            GIANT_BLUEBERRY_GIN = "¡Wolfgang siente que podría explotar como una bombaya!", -- Boom Berry Sapphire (Carrot explodes)

            -- Pot Cooking Descriptions

            DARK_RUINCOLATE = "Hmm, ¡Está amargo!", -- Dark Chocolate
            WHITE_RUINCOLATE = "Está lleno de grasa.", -- White Chocolate
            RUINCOLATE = "¡A Wolfgang también le gustan los dulces!", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "¡Wolfgang ha probado esto antes!", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "¡Tan robusto como los músculos de Wolfgang!", -- Steel bucket is empty
                FULL = "¡El agua de Wolfgang está lista!", -- Clean rainwater in the steel bucket
                FULL_ICE = "El agua se ha congelado por el frío.", -- Rainwater has frozen in the steel bucket
                DIRTY = "La preciosa agua se ha ensuciado...", -- Rainwater has become dirty
                DIRTY_ICE = "¡Oh no! ¡Qué desperdicio!", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Hecho delicadamente, pero fuerte.", -- Wooden bucket is empty
                FULL = "¡El agua de Wolfgang está lista!", -- Clean rainwater in the wooden bucket
                FULL_ICE = "El agua se ha congelado por el frío.", -- Rainwater has frozen in the wooden bucket
                DIRTY = "La preciosa agua se ha ensuciado...", -- Rainwater has become dirty
                DIRTY_ICE = "¡Oh no! ¡Qué desperdicio!", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "¡Ja! ¡Una taza apta para el poderoso Wolfgang!", -- Empty wooden bucket
                FULL = "¡El agua de Wolfgang está lista!", -- Clean rainwater in the wooden bucket
                FULL_ICE = "El agua se ha congelado por el frío.", -- Rainwater has frozen in the wooden bucket
                DIRTY = "La preciosa agua se ha ensuciado...", -- Rainwater has become dirty
                DIRTY_ICE = "¡Oh no! ¡Qué desperdicio!", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "¿Sin agua salada?.", -- No water in the desalinator
                PURIFY_LONG = "Aún queda agua salada.", -- Purification is in progress, still a lot to go
                PURIFY_SHORT = "¡Casi está listo!", -- Purification is almost complete
                HASWATER = "¡Ahora Wolfgang puede tomar agua!", -- Clean water is ready in the desalinator
                BURNT = "La máquina se quemó, pero la sal quedó ahí.", -- The desalinator has burnt
                HASSALT = "Hay un olor salado que viene del interior..", -- Salt is still inside the desalinator
            },

            BARREL =
            {
                GENERIC = "Wolfgang se prepara para tiempos difíciles.", -- Examining a barrel
                BURNT = "¿Se quemó el agua?", -- The barrel has burnt
            },

            BREWERY =
            {
                EMPTY = "Para convertir el agua en bebidas.", -- Examining an empty brewery
                BURNT = "¿Wolfgang ya no puede beber?", -- The brewery has burnt
                FERMENTING_LONG = "Tomará un largo tiempo.", -- Fermentation will take a while
                FERMENTING_SHORT = "¡Casi listo!", -- Fermentation is nearly complete
                DONE = "¡Finalmente terminó!", -- Brewery contains a drink
            },

            CAMPKETTLE_ITEM = "¡Hay que purificar el agua!", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "Wolfgang necesita agua hirviendo.", -- Examining an empty camp kettle on a fire pit
                BOILING_LONG = "El agua sigue sucia.", -- Starting to boil the water
                BOILING_SHORT = "¡Casi está listo!", -- Water is almost done boiling
                DONE = "¡Ahora puedo beberlo!", -- Clean water is ready in the camp kettle
                STOP = "El fuego necesita más leña.", -- There's no fire to continue boiling
            },

            CAMPDESALINATOR_ITEM = "Now we can drink salty water!", -- Examining the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "Wolfgang debem hervir el agua salada.", -- Examining an empty camp desalinator on a fire pit
                BOILING_LONG = "Aún queda sal.", -- Starting to boil the salty water
                BOILING_SHORT = "¡Está casi listo!", -- Salty water is almost done boiling
                DONE = "¡Ahora puedo beberlo!", -- Clean water is ready in the camp desalinator
                STOP = "El fuego necesita más leña.", -- There's no fire to continue boiling
            },

            KETTLE =
            {
                EMPTY = "La tetera necesita agua.", -- Empty kettle
                BURNT = "¿Se quemó el agua también?", -- The kettle has burnt
                BOILING_LONG = "Necesita tiempo para hervirse.", -- Starting to cook a drink
                BOILING_SHORT = "¡Está casi listo!", -- Drink is nearly ready
                DONE = "¡Hora de tomar agua!", -- Drink is ready
                PURIFY_LONG = "Sigue sucio.", -- Starting to purify dirty water
                PURIFY_SHORT = "¡Está casi listo!", -- Water is almost purified
                HASWATER = "La tetera está llena.", -- Clean water is ready in the kettle
                MELT_LONG = "Necesita más tiempo para derretirse.", -- Starting to melt ice
                MELT_SHORT = "¡Casi está listo!", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "¡Wolfgang puede llevarla adonde sea!", -- Examining the portable kettle item
                EMPTY = "Necesita agua.", -- Examining an empty portable kettle
                BOILING_LONG = "Necesita tiempo para hervirse.", -- Starting to cook a drink
                BOILING_SHORT = "¡Está casi listo!", -- Drink is nearly ready
                DONE = "¡Hora de tomar agua!", -- Drink is ready
                PURIFY_LONG = "Sigue sucio.", -- Starting to purify dirty water
                PURIFY_SHORT = "¡Casi listo!", -- Water is almost purified
                HASWATER = "Está llena.", -- Clean water is ready in the portable kettle
                MELT_LONG = "Necesita más tiempo para derretirse.", -- Starting to melt ice
                MELT_SHORT = "¡Casi está listo!", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Da un poco de miedo...", -- Examining an empty distiller
                DISTILLTING_LONG = "Tomará un poco.", -- Distillation will take a while
                DISTILLING_SHORT = "¡Está casi listo!", -- Distillation is nearly complete
                DONE = "¡La máquina aterradora ha terminado su trabajo!", -- Distiller contains a drink
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Un pozo grandioso, ¡Como Wolfgang!", -- High water pressure in the well
                MIDDLE_PRESSURE = "Aún tiene presión suficiente.", -- Medium water pressure in the well
                LOW_PRESSURE = "Se vé débil...", -- Low water pressure in the well
                RECHARG_PRESSURE = "¿Está descansando?", -- No water pressure, needs recharging (maximum pressure can't be reached).
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Se ve un poco débil.", -- Low fuel condition for the well sprinkler
                ON = "¡Está trabajando duro!", -- Sprinkler is turned on
                OFF = "Se está tomando un descanso.", -- Sprinkler is turned off
            },
        },
    }           