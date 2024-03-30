return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Necesito vaciar la cubeta primero.", -- The well has a dry empty bucket, but you tried to give the bucket
            WELL_BUSY = "¿Se me olvidó que puse una cubeta en el pozo?", -- The well has a bucket filled with water, but you tried to give the bucket
        }
    },

    ANNOUNCE_DRUNK = "Oh, ¡Me siento tan mareada!", -- Drunk
    ANNOUNCE_DRUNK_END = "¡No hay tiempo que perder!", -- Sobered up from alcohol (hangover)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, reserved for Wigfrid,
    ANNOUNCE_NOTCHARGE = "No tengo leche ahora mismo.", -- Time phase = (時相)
    ANNOUNCE_NOTHIRSTSLEEP = "Primero debería encontrar algo para beber.", -- Trying to sleep at night while being thirsty
    ANNOUNCE_NOTHIRSTSIESTA = "Primero debería encontrar algo para beber.", -- Trying to nap during the day while being thirsty
    ANNOUNCE_SLEEP_END = "Oh dios, ¿Que hora es?", -- Waking up completely sober after sleeping
    ANNOUNCE_THIRST = "¿Me pregunto cuánto ha pasado desde que bebí algo?", -- Too thirsty!

    ANNOUNCE_CAFFINE_BUFF_START = "Excelente, ¡Siento como si pudiera perseguir al tiempo mismo!" , -- Caffeine buff starts
    ANNOUNCE_CAFFINE_BUFF_STOP = "Maldición! El tiempo se está acelerando de nuevo" ,  -- Caffeine buff ends
    
    ANNOUNCE_CURE_WATERBORNE = "Finalmente arreglé mi reloj de bolsillo." ,  -- Dialogue when curing a waterborne disease with an item

    ANNOUNCE_DCAPACITY_CRITICAL = "¡El tiempo se está acelerando!", -- Just before getting drunk (Time stream = flow of time)
    ANNOUNCE_DCAPACITY_HALF = "Estoy empezando a sentirme mejor.", -- Intoxication is starting to wear off

    DESCRIBE =
    {
        BOILBOOK = "¿Quién tiene tiempo para pensar en té cuando hay agua que hervir?",

        WATER_CLEAN_ICE = "¿Quién descongelaría y se bebería esto?", -- Clean ice water
        WATER_DIRTY_ICE = "Preferiría hielo fresco para mis bebidas.", -- Dirty ice water

        SPICE_CAFFEINPEPPER = "Ojalá tuviera tiempo de marinar.", -- Caffeine pepper spice

        WELL_KIT = "Tenerlo en la mano no hará que fluya el agua, ¡Debo ponerlo!", -- Well Kit
        WELL_SPRINKLER_KIT = "No tomará más de un segundo instalarlo.", -- Sprinkler Kit
        WELL_WATERPUMP_KIT = "Puedo obtener agua subterránea sin perder el tiempo.", -- Steam Water Pump Kit
        WELL_BURYING_KIT = "Oh dios, que tarea tan tedioso.", -- Hole Burying Kit
        WELL_DRILLING = "Lo hará por si mismo, debo ahorrar mi tiempo.", -- Drilling the hole
        WELL_DRILLING_ITEM = "Debería decidir donde ponerlo para obtener agua subterránea.", -- Drilling item
        HOLE = "Toma años salir una vez que caigas.", -- Well hole
        WELL = "Verlo no hará que aparezca el agua mágicamente, ¡Necesito una herramienta!", -- Well

        WX78MODULE_NONEDRUNK = "¡Ajá! Me preguntaba cuando empezaron a hacerlos.", -- 78전용 묘듈

        -- Waterlogged Plant Mode

        TEA_TREE = "¡Este árbol ha alcanzado su límite de crecimiento!.", -- Tea tree
        DUG_TEA_TREE = "No hay tiempo que perder; ¡Me los llevaré todos!", -- Dug-up tea tree
        TEA_SEED = "Se convertirá en un árbol nuevo cuando sea el momento adecuado.", -- Tea tree seed
        TEA_SEED_COOKED = "Es comido o se pudre; No hay un futuro intermedio para esto.", -- Roasted tea tree seed
        TEA_SEED_SAPLING = "Parece que este amiguito crece lento intencionalmente.", -- Tea tree sapling
        TEALEAVES = "Hojas de té recién recogidas.", -- Tea leaves
        TEALEAVES_DRIED = "Hojas de té recién secadas.", -- Dried tea leaves

        CAFFEINBERRY = "La vida pasada de una planta alienígena colgante.", -- Coffee Bush (An homage to the non-oxygen-releasing Peppernut from the previous DST 20th update)
        DUG_CAFFEINBERRY = "Si me lo llevo, tal vez pueda ahorrar tiempo para descansar.", -- Dug-up Coffee Bush
        CAFFEINBERRY_BEAN = "Una nuez y un café combinados.", -- Fresh coffee bean
        CAFFEINBERRY_BEAN_COOKED = "Podría comerlo ahora mismo, pero quizás pueda preparar otra cosa.", -- Roasted coffee bean

        RUINCACAO_TREE = "Es tan retorcido como las propias líneas del tiempo.", -- Cacao tree
        DUG_RUINCACAO_TREE = "No hay tiempo que perder; ¡Me los llevaré todos!", -- Dug-up cacao tree
        RUINCACAO_SEED = "Una nueva vida florece lentamente.", -- Cacao seed item
        RUINCACAO_SEED_SAPLING = "Parece que este amiguito crece lento intencionalmente.", -- Cacao sapling from a seed
        RUINCACAO = "No sabes si es fruta o carbón hasta que lo abres.", -- Unripe cacao pod

        RUINCACAO_BEAN = "Comer esto seguramente me revolverá el estómago.", -- Crushed cacao pod
        RUINCACAO_BEAN_COOKED = "¿Es una pérdida de tiempo? No lo sé realmente.", -- Roasted cacao pod

        -- Distillery Additives

        ADDITIVE_SEED = "Estas hierbas sueñan con estar dentro de una botella.", -- Herb (Anise, Juniper Berry, Allspice) additive for making liquor
        ADDITIVE_PETALS = "Manojos de pétalos viejos que anhelan una belleza eterna.", -- Herb, Tea Leaves, Petals additive for making liquor
        ADDITIVE_NUT = "¿Debería simplemente meterlo en mi boca?", -- Nut (Birchnut, Coconut, Coffee Bean, Cacao Bean) additive for making liquor
        ADDITIVE_DAIRY = "Como es fácil de beber, lo beberé rápido.", -- Dairy additive for making liquor

        -- Drinks

        WATER_CLEAN = "Agua pura de una línea de tiempo diferente.", -- Clean water
        WATER_DIRTY = "Si estoy en un apuro tal vez...", -- Dirty water
        WATER_SALTY = "Impurezas de futuras nubes mezcladas.", -- Saltwater

        GOOPYDRINK = "Oh dios, ¡Fuí muy impaciente!", -- Failed drink (Concept of Wet Goop)

        -- Teapot Drinks

        FRUITJUICE = "Excelente, puedo comer muchas frutas a la vez.", -- Mixed fruit juice
        BERRIES_JUICE = "¿Agarrarlas y comerlas no es más rápido?", -- Berry juice
        POMEGRANATE_JUICE = "Ahora también puedo comer las semillas.", -- Pomegranate juice
        BANANA_JUICE = "Te calienta cuando hace calor.", -- Banana juice
        FIG_JUICE = "¡La esencia del dulce!", -- Fig juice
        DRAGONJUICE = "Definitivamente es jugo de frutas.", -- Dragon fruit juice
        GLOWBERRYJUICE = "¡Delicioso y útil!", -- Glowberry juice
        WATERMELON_JUICE = "¡Es realmente refrescante!", -- Watermelon juice

        VEGGIE_TEA = "No tengo tiempo para la hora del té.", -- Vegetable juice
        CARROT_TEA = "Vamos a beberlo rápidamente.", -- Carrot tea
        CACTUS_TEA = "Debería ayudar a la digestión.", -- Cactus tea
        TOMATO_JUICE = "Saludable y perfecto para beber rápidamente.", -- Tomato juice
        LUMPY_TEA = "No tengo tiempo para un sorbo, pero...", -- Root tea
        SEAWEED_SHAKE = "Parece una pérdida de tiempo comparado con otras opciones.", -- Seaweed shake

        GREENTEA = "No hay tiempo para distinguir el tipo de té.", -- Green tea
        BLACKTEA = "Tal vez pueda darme un gusto de vez en cuando", -- Black tea
        BLACKTEA_ICED = "Un sorbo de algo frío es agradable.", -- Iced black tea
        FUER = "Tal vez una taza de vez en cuando.", -- Leaf tea (Boikhaai/Leaf tea/Sarsaparilla)
        MIXFLOWER = "Puedo oler las flores.", -- Mixed flower petals tea
        HIBISCUSTEA = "¿Por qué está tan agrio?", -- Hibiscus tea
        CACTUSFLOWER_TEA = "No está el aroma persistente de las flores.", -- Cactus flower tea
        LOTUSTEA = "Pudo haber sido una flor, o un pez en el pasado.", -- Lotus flower tea
        SUSHIBISCUS = "No hay tiempo para el té pero... ¿Qué es esto?", -- Suicide tea (An homage to the weirdness of Wilba's tea party)
        MOON_BLOSSOM_TEA = "Una pérdida de tiempo decidir que tipo de té es este.", --Moon Flower Tea

        CAFFEINBERRY_JUICE = "Perfecto para permanecer despierta toda la noche en el taller.", -- Black coffee
        TOFFEE_LATTE = "Es un té y un postre a la vez.", -- Toffee-nut latte
        RUINCHA_LATTE = "He ahorrado algo de tiempo decidiendo qué beber.", -- Mocha latte (Coffee + Cocoa)

        HOTRUINCOLATE = "Calidez y dulzura en abundancia.", -- Hot chocolate
        RUINCOLATE_SMOOTHIE = "Frialdad y dulzura en abundancia.", -- Chocolate smoothie (Cold)
        RUINXOCOLATL = "Esto es realmente extraño; ¡Revela el conocimiento de otra línea de tiempo!", -- Chocolatl (Bitter)
        TEA_RUINCOLATE_LATTE = "¡Se adapta bien a mi gusto!", -- Matcha latte

        MULLED = "No puedo recordar cuándo me quedé enferma en cama por última vez...", -- Bancha
        BUTTERBEER = "Puedo ahorrar tiempo a la hora de comer bebiendo esto.", -- Butterbeer (Harry Potter series)

        -- Collaboration Teapot Drinks

        COCONUT_JUICE = "Rellené la parte vacía con gelatina.", -- Shipwrecked Coconut Juice
        RAINBOW_SHAKE = "¡Eficiente!", -- Shipwrecked Rainbow Jelly Shake
        QUARTZ_SHAKE = "Al menos no gastaré tiempo masticando pescado.", -- Shipwrecked Moon Glass Jelly Shake
        CHERRY_ROSEBERRIES_TEA = "A veces, es bueno tomar una taza de té mientras miras las flores.", -- Cherry Forest Rosehip Tea
        CHERRY_HONEY_TEA = "Es elegante y cálido.", -- Cherry Forest Cherry Blossom Honey Tea
        SWEET_RICE_DRINK = "No se porque estás semillas tardan tanto en comerse...", -- Vita Hyphy Sikhye
        PINEANANAS_JUICE = "Incluso sin la cáscara, hace que esperes más.", -- Legion Pineapple Juice
        ORANGE_JUICE = "Debería beberlo como un snack después de comer.", -- More Food Pack Orange Juice
        STRAWBERRY_SMOOTHIE = "Deberé beberlo rápido.", -- More Food Pack Strawberry Smoothie
        STRAWBERRY_MILK_SMOOTHIE = "¡Que maravilloso postre!", -- More Food Pack Strawberry Milk Smoothie

        -- Distillery Drinks

        SPOILED_DRINK = "Alguna vez fue una bebida.", -- Spoiled Drink (the drink that spoils)

        -- Sodas

        SODA = "¿Hice todo eso sólo para ponerle burbujas al agua?.", -- Carbonated Water
        FRUITSODA = "No va a tomar tanto beber este refresco.", -- Fruit Soda
        LEMONLIMESODA = "Los refrescos son deliciosos porque son dulces.", -- Lemon Lime Soda (superior to Fruit Soda)
        COLA = "Es excelente, excepto por los eructos.", -- Cola
        COLAQUANTUM = "Interesante, una bebida que no debería existir en esta línea temporal.", -- Quantum Cola
        LUMPY_BEER = "¿Cuándo usé las raíces de Sassafras por última vez?", -- Root Beer (In the context of the Starving for the Ages world, it was banned in 1979.)

        -- Spirits

        CORN_BEER = "¿Cuándo tendré tiempo para disfrutar una bebida?", -- Corn Beer
        MADHU = "Perdió su dulzura, pero gané más tiempo.", -- Mead
        WINE = "No se convertirá en vinagre tan pronto.", -- Wine (regular berry fermentation)
        NOBLEWINE = "¿No es solo un vino claro?", -- Noble Wine (cooked berry fermentation)
        SPARKLINGWINE = "En otra línea temporal, podría ser yo la que destape champaña en una fiesta.", -- Sparkling Wine
        GLOWBERRYWINE = "¡Esto es! No se pudre fácilmente y es eficiente", -- Glow Berry Wine
        KUMIS = "Espero que el tiempo invertido valga la pena.", -- Kumis, Fermented Milk
        LUMPY_WINE = "Lo consideraré de nuevo.", -- Moonshine (fermented root-based spirits)
        PULQUE = "Se pudre rápido en comparación del tiempo invertido.", -- Pulque (Agave sap wine)
        RUINCACAO_WINE = "Que idea tan extraña, pero al menos gané tiempo.", -- Cacao Wine

        -- Collaboration Sodas

        CHERRY_DOCTOR_COLA = "No creo que esta bebida involucre viajes en el tiempo.", -- Cherry Forest Dr. Pepper (Doctor Cherry) (Roughly a Doctor Who parody)
        PINEANANASSODA = "Bien, no usaré mucho tiempo bebiendo esto.", -- Carbonated Pineapple (Ohranjii)
        ORANGESODA = "Bien, no usaré mucho tiempo disfrutando esto.", -- Carbonated Oranj (Fanta)
        STRAWBERRYSODA = "Bien, no perderé mucho tiempo bebiendo esto.", -- Carbonated Strawberry (Welch's Strawberry)

        -- Collaboration Spirits

        AUROBOW = "Es un licor alto en arcoíris.", -- Shipwrecked Aurobow (Rainbow Jellyfish Spirits)
        COCONUT_WINE = "Si el viaje se hace más largo, debería tenerlo a la mano.", -- Shipwrecked Coconut Wine
        CHERRY_BLOOM_MADHU = "Es bastante elegante!", -- Cherry Forest Cherry Blossom Honey Wine
        GIANT_BLUEBERRY_WINE = "Me pone un poco nerviosa.", -- Vita Hyphy Boom!Berry Sapphire (Explodes when lit)
        RICE_WINE = "No me tomó bastante hacerlo de todas formas.", -- Vita Hyphy Rice Wine (Makgeolli)
        WHEAT_BEER = "No es una mala manera de hacer cerveza usando la fruta del pan.", -- Heap of Food Breadfruit Beer
        PALE_BEER = "He visto tantas cosas extrañas que esto no me sorprende.", -- Legion Pale Ale (Beer made from monsters' fruit)

        -- Distilled Spirits

        DISINFECTANT = "Inútil para mí ¡Yo sólo necesito tiempo!", -- Disinfectant
        CORN_WHISKEY = "Honestamente, no conozco el sabor, pero al menos durará bastante.", -- Corn Whiskey
        LUMPY_VODKA = "Tendré cuidado de no desperdiciar tiempo emborrachándome.", -- Vodka
        TEQUILA = "No dudes, ¡Sólo cierra los ojos y bébelo!", -- Tequila
        MADHU_RUM = "Con esto, puedo zarpar mañana, o incluso ahora.", -- Rum
        BERRY_BRANDY = "Whisky, Brandy... Honestamente no conozco la diferencia.", -- Berry Brandy
        AREUHI = "Espero que no se echa a perder rápidamente.", -- Kumis, Fermented Milk (Arouhi)

        -- Wolly-Exclusive Distilled Spirits

        BERRY_GIN = "Un trago debería ser suficiente.", -- Gin
        GLOWBERRY_GIN = "Es un excelente licor, pero aún debo tener cuidado no excederme.", -- Glow Berry Gin
        ABSINTHE = "No hay tiempo para sorberlo lentamente.", -- Absinthe
        TEA_LUMPY_VODKA = "Honestamente, no estoy segura de si incluso tiene el aroma a té.", -- Green Tea Liqueur
        PETALS_BERRY_BRANDY = "No tengo tiempo para disfrutar el aroma floral en mis bebidas.", -- Rose Scented Brandy
        KAHLUA = "¡Fantástico! Me ayuda a superar el miedo y aumenta mis energías.", -- Coffee Liqueur Kahlúa
        NUT_CORN_WHISKEY = "Es una pérdida de tiempo distinguir entre tipos de licores.", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "Encaja con mi gusto, pero debo tener cuidado de no abusar.", -- Baileys Cacao Cream Liqueur
        RUMCHATA = "Es un poco menos repulsivo ahora.", -- Rumchata (a mixture of rum and Horchata, a dairy-based beverage)

        -- Collaboration Distilled Spirits

        MOONWAY = "Un licor de alta calidad que brilla con 7 colores.", -- Rainbow Jellyfish Spirits Distilled Spirit
        ARRACK = "Vagando por las islas, libre de las limitaciones del tiempo.", -- Arrack Indonesian version Coconut Wine Distilled Spirit
        CHERRY_BLOOM_RUM = "Es una linda botella, pero no perderé mi tiempo admirándola.", -- Cherry Blossom Honey Rum Distilled Spirit Cherry Blossom Petals Float
        RICE_SPIRITS = "Un sorbo y estaré bien despierta.", -- Makgeolli (Rice Wine)
        WHEAT_WHISKEY = "Sinceramente, no conozco el sabor, pero al menos no se pudre rápidamente.", -- Wheat Whiskey
        PALE_WHISKEY = "Una vez en la boca, todos los licores saben igual.", -- Pale Malt Whiskey

        -- Wolly-Exclusive Collaboration Distilled Spirits

        NUT_COCONUT_BRANDY = "El mar es grande, necesito algo para vencer mi miedo.", -- Coconut Brandy (Renamed as Caribbean Brandy due to the inability to make Caribbean Rum)
        GIANT_BLUEBERRY_GIN = "Algún día, alguien seguramente causará problemas con esto.", -- Boom!Berry Sapphire (Carrot explosion)

        -- Pot Dishes

        DARK_RUINCOLATE = "¿Warly sabrá el secreto de esta golosina?", -- Dark Chocolate
        WHITE_RUINCOLATE = "¡Warly conoce bien mi gusto!", -- White Chocolate
        RUINCOLATE = "Es dulce y no tarda mucho en consumirse!", -- Chocolate
        RUIN_SCHOKAKOLA = "¡Un snack perfecto!", -- Chokola

        BUCKET_STEEL_EMPTY =
        {
            EMPTY = "¿Realmete es necesario mirar esta cubeta vacía?", -- Empty Steel Bucket
        FULL = "¡Recojámoslo antes que cambien las mareas!", -- Clean Rainwater is full
        FULL_ICE = "Oh dios, se ha congelado con el paso del tiempo.", -- Rainwater has frozen
        DIRTY = "Oh no, se ha contaminado con el paso del tiempo.", -- Rainwater has become dirty
        DIRTY_ICE = "Oh no, ahora se ha congelado mientras aún estaba contaminado.", -- Dirty rainwater has frozen
        },

        BUCKET_WOODIE_EMPTY =
        {
            EMPTY = "Las habilidades de carpintería de Woodie son excepcionales.", -- Woodie's Empty Wooden Bucket
            FULL = "¡Recojámoslo antes que cambien las mareas!", -- Clean Rainwater is full
            FULL_ICE = "Oh dios, se ha congelado con el paso del tiempo.", -- Rainwater has frozen
            DIRTY = "Oh no, se ha contaminado con el paso del tiempo.", -- Rainwater has become dirty
            DIRTY_ICE = "Oh no, ahora se ha congelado mientras aún estaba contaminado.", -- Dirty rainwater has frozen
        },

        BUCKET_EMPTY =
        {
            EMPTY = "It's just an ordinary bucket.", -- Empty Wooden Bucket
            FULL = "¡Recojámoslo antes que cambien las mareas!", -- Clean Rainwater is full
            FULL_ICE = "Oh dios, se ha congelado con el paso del tiempo.", -- Rainwater has frozen
            DIRTY = "Oh no, se ha contaminado con el paso del tiempo.", -- Rainwater has become dirty
            DIRTY_ICE = "Oh no, ahora se ha congelado mientras aún estaba contaminado.", -- Dirty rainwater has frozen
        },

        DESALINATOR =
        {
            EMPTY = "Un dispositivo que convierte el agua salada en agua dulce.", -- Desalinator with no water
            PURIFY_LONG = "No puedo quedarme aquí esperando; ¡El tiempo es valioso !", -- Purification has a long way to go
            PURIFY_SHORT = "¡Date prisa, date prisa!", -- Purification is almost complete
            HASWATER = "¡Por fin!", -- Clean water is available
            BURNT = "Creo que hubo un pequeño problema.", -- Desalinator is burnt
            HASSALT = "Espera, ¡tengo que quitar la sal primero!", -- Desalinator still has salt
        },

        BARREL =
        {
            GENERIC = "Al menos ahora no tendré que preocuparme porque el agua se heche a perder.", -- Inspecting the barrel
            BURNT = "¿Quién hubiera pensado que un barril lleno de agua se quemaría?", -- The barrel is burnt
        },

        BREWERY =
        {
            EMPTY = "La elaboración lleva su tiempo.", -- Inspecting the empty brewery
            BURNT = "Supongo que este era su destino.", -- The brewery is burnt
            FERMENTING_LONG = "Fermentar lleva su tiempo, y no puedo quedarme esperando.", -- Fermentation has a long way to go
            FERMENTING_SHORT = "¡He estado esperando bastante rato!", -- Fermentation is almost complete
            DONE = "¡Finalmente algo apareció!", -- There's a drink in the brewery
        },

        CAMPKETTLE_ITEM = "Debería llevar esto conmigo por un tiempo.", -- Inspecting the camp kettle item
        CAMPKETTLE =
        {
            GENERIC = "¿Olvidé poner agua en esto?", -- Inspecting the camp kettle without water
            BOILING_LONG = "¡No puedo quedarme aquí esperando!", -- Boiling water is starting
            BOILING_SHORT = "Todavía no está listo?", -- Water is almost done boiling
            DONE = "¿Tomó tanto tiempo para hacer una bebida?", -- There's clean water in the camp kettle
            STOP = "Oh dios, ¡El fuego no es suficientemente fuerte!", -- There's no fire in the camp kettle
        },

        CAMPDESALINATOR_ITEM = "Podría ser util ya que siempre hay mar cerca.", -- Inspecting the camp desalinator item
        CAMPDESALINATOR =
        {
            GENERIC = "¿Había agua antes o siempre estuvo vacío?", -- Camp desalinator is empty
            BOILING_LONG = "¡No puedo quedarme aquí esperando!", -- Boiling water is starting
            BOILING_SHORT = "¿Todavía no está listo?", -- Water is almost done boiling
            DONE = "¿Tomó tanto tiempo para hacer una bebida?", -- There's clean water in the camp desalinator
            STOP = "Oh dios, ¡El fuego no es suficientemente fuerte!", -- There's no fire in the camp desalinator
        },

        KETTLE =
        {
            EMPTY = "Al menos puedo hervir mucha agua a la vez con esto.", -- Inspecting the empty kettle
            BURNT = "Oh dios, tendré que beber el rocío de las hojas entonces.", -- The kettle is burnt
            BOILING_LONG = "¿Porqué tarda tanto hacer una sola bebida?", -- Boiling is just starting
            BOILING_SHORT = "Espero que no esté sobre-hervido ¿Puedo beberlo ahora?", -- Almost done cooking the drink
            DONE = "¡Finalmente algo apareció!", -- There's a drink in the kettle
            PURIFY_LONG = "No puedo quedarme aquí esperando, ¡El tiempo es valioso!", -- Purification has a long way to go
            PURIFY_SHORT = "¡Date prisa, date prisa!", -- Purification is almost complete
            HASWATER = "¿Puedo beberlo ahora?", -- The kettle has clean water
            MELT_LONG = "¿No puedo simplemente derretir el hielo y beberlo ahora?", -- Starting to melt the ice water
            MELT_SHORT = "¡Está casi derretido!", -- Ice water is almost completely melted
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "No tengo tiempo para poner una manta de picnic y tener una fiesta de té.", -- Inspecting the portable kettle item
            EMPTY = "Será mejor que me hidrate usando bayas o zanahorias.", -- Inspecting the placed empty portable kettle
            BOILING_LONG = "¿Por qué tarda tanto hacer una sola bebida?", -- Boiling is just starting
            BOILING_SHORT = "No tomará mucho tiempo, ¿verdad?", -- Almost done cooking the drink
            DONE = "¡Finalmente algo apareció!", -- There's a drink in the portable kettle
            PURIFY_LONG = "No puedo quedarme aquí esperando, ¡El tiempo es valioso!", -- Purification has a long way to go
            PURIFY_SHORT = "¡Date prisa, date prisa!", -- Purification is almost complete
            HASWATER = "¿Puedo beberlo ahora?", -- The portable kettle has clean water
            MELT_LONG = "¿No puedo simplemente derretir el hielo y beberlo ahora?", -- Starting to melt the ice water
            MELT_SHORT = "¡Está casi derretido!", -- Ice water is almost completely melted
        },

        DISTILLERS =
        {
            EMPTY = "Al menos los licores usando esto no se echarán a perder fácilmente.", -- Inspecting the distiller
            DISTILLTING_LONG = "Si lo observo hasta que esté listo, envejeceré más rápido que la bebida.", -- Distillation has a long way to go
            DISTILLING_SHORT = "¡No debería tardar mucho!", -- Distillation is almost complete
            DONE = "¡Por fin!", -- There's a drink in the distiller
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "¡Todo el trabajo duro valió la pena!", -- Maximum pressure
            MIDDLE_PRESSURE = "Puedo obtener agua limpia de inmediato.", -- Pressure is moderate
            LOW_PRESSURE = "Parece que la energía disminuye.", -- Almost no pressure
            RECHARG_PRESSURE = "Oh querido, llevará tiempo bombear agua nuevamente.", -- No pressure at all (can't use it until pressure is maximum).
        },

        WELL_SPRINKLER =
        {
            LOWFUEL = "Si quiero, podría recargarlo.", -- Inspecting when fuel is almost gone
            ON = "¡Esto me ahorra tiempo al regar!", -- It's operational
            OFF = "Se puede activar en cualquier momento.", -- Inspecting when it's turned off
        },
    },
}