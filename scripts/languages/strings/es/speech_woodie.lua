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
        ANNOUNCE_DRUNK_END = "Casi supero mi límite.", -- Getting sober after being drunk
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, specific to Wigfrid
        ANNOUNCE_NOTCHARGE = "¿Huh? ¿Sin leche?", -- Attempting to milk a charged Volt Goat with a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "Demasiado sediento para dormir.", -- Trying to sleep at night while very thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "Demasiado sediento para descansar.", -- Trying to rest during the day while very thirsty
        ANNOUNCE_SLEEP_END = "¿Lucy? No me regañarás ¿Verdad? Fue una terrible pesadilla.", -- Waking up after sleeping and being sober
        ANNOUNCE_THIRST = "Tengo un poco de sed.", -- Feeling thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "¡Tan rápido como un coyote!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Es hora de calmarse y talar un árbol.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Mi estómago se siente mejor.", -- Curing a waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Me siento pesado...", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Oh, ¡Esto es bueno!", -- Starting to feel tipsy

        DESCRIBE =
        {
            BOILBOOK = "Bastante conveniente. Lucy, ¿Puedes ayudarme con la hora mientras preparamos bebidas?",

            WATER_CLEAN_ICE = "Necesito derretirlo ¿Verdad?", -- Clean ice
            WATER_DIRTY_ICE = "Está congelado y sucio.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "Creo que la sal es para la carne, ¿Sabes?.", -- Caffeinpepper spice

            WELL_KIT = "Hecharé una mano con esto.", -- Well kit
            WELL_SPRINKLER_KIT = "Completamente automático ¿Verdad?", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Bastante conveniente ¿Verdad?", -- Water pump kit
            WELL_BURYING_KIT = "Deberíamos tapar agujeros innecesarios.", -- Hole-burying kit
            WELL_DRILLING = "Parece que funciona correctamente.", -- Drilling holes with a drill
            WELL_DRILLING_ITEM = "Una máquina para perforar el suelo.", -- Drilling item
            HOLE = "¡Ay! Debemos tener cuidado con esto.", -- Well hole
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
            CAFFEINBERRY_BEAN_COOKED = "Los canadienses amamos el café ¿Verdad?", -- Cooked Caffeinberry

            RUINCACAO_TREE = "Crece en el sur, pero se ve diferente de como lo recuerdo.", -- Ruincacao Tree
            DUG_RUINCACAO_TREE = "Ramas crepitantes por todas partes.", -- Dug Ruincacao Tree
            RUINCACAO_SEED = "Aquí floreció una flor de aspecto algo siniestro.", -- Ruincacao Seed
            RUINCACAO_SEED_SAPLING = "Tiene un aspecto extraño para ser un árbol.", -- Ruincacao Sapling
            RUINCACAO = "Tiene el olor del carbón.", -- Ruincacao (pre-smashed)
            RUINCACAO_BEAN = "No sabe nada a mantequilla.", -- Ruincacao Bean
            RUINCACAO_BEAN_COOKED = "Usualmente no como la mantequilla de esta forma.", -- Cooked Ruincacao Bean

            -- Distillery additives

            ADDITIVE_SEED = "¿Estamos haciendo alcohol ilegal con esto?", -- Seed Herbs (Anise, Juniper Berry, Allspice) additive for liquor
            ADDITIVE_PETALS = "¿Esto va en el alcohol?", -- Petal Herbs (Green Tea, Flower Petals) additive for liquor
            ADDITIVE_NUT = "Una mezcla de nueces.", -- Nut Herbs (Birch Nut, Coconut, Coffee Bean, Ruincacao Bean) additive for liquor
            ADDITIVE_DAIRY = "Es como una crema ¿Verdad?", -- Dairy additive for liquor

            -- Drinks

            WATER_CLEAN = "Es agua limpia.", -- Clean water
            WATER_DIRTY = "Esta sucia.", -- Dirty water
            WATER_SALTY = "Es agua de mar.", -- Salty water

            GOOPYDRINK = "He hecho peores bebidas.", -- Failed drink (boiling concept)

            -- Teapot drinks

            FRUITJUICE = "Jugo de frutas recién exprimido.", -- Generic fruit juice
            BERRIES_JUICE = "Se ha diluido un poco.", -- Berry juice
            POMEGRANATE_JUICE = "Nos ha ahorrado el quitarle las semillas.", -- Pomegranate juice
            BANANA_JUICE = "Una bebida tropical.", -- Banana juice
            FIG_JUICE = "No es un mal jugo en absoluto.", -- Fig juice
            DRAGONJUICE = "Le vendría bien un poco de jarabe.", -- Dragonfruit juice
            GLOWBERRYJUICE = "Podría seguir bebiendo esto.", -- Glowberry juice
            WATERMELON_JUICE = "Está muy aguado.", -- Watermelon juice

            VEGGIE_TEA = "No es mi gusto.", -- Vegetable tea
            CARROT_TEA = "¿Es agua para conejos?", -- Carrot tea
            CACTUS_TEA = "Tengo dudas sobre las espinas.", -- Cactus tea
            TOMATO_JUICE = "Necesita un poco de jarabe.", -- Tomato juice
            LUMPY_TEA = "Preferiría hacer cenizas con esto.", -- Root tea
            SEAWEED_SHAKE = "¿No había una mejor forma de usar las algas?", -- Seaweed shake

            GREENTEA = "Me vendría bien una taza de té.", -- Fresh Green Tea
            BLACKTEA = "¿Ya es hora del té?", -- Black Tea
            BLACKTEA_ICED = "Perfecto para un día caluroso.", -- Iced Black Tea
            FUER = "Lo beberé como venga.", -- Boi Tea (Boi Cha, Leafy Tea, Warrior Tea)
            MIXFLOWER = "Un té bastante sentimental.", -- Mixed Flower Tea
            HIBISCUSTEA = "Es tan rojo como Lucy.", -- Hibiscus Tea
            CACTUSFLOWER_TEA = "Aún sigo escéptico con las espinas.", -- Cactus Flower Tea
            LOTUSTEA = "Nunca había visto este té.", -- Lotus Flower Tea
            SUSHIBISCUS = "¿Que piensas, Lucy? ¿Deberíamos probarlo?", -- Hibiscus Sushi
            MOON_BLOSSOM_TEA = "El olor es impresionante.", -- Moon Blossom Tea

            CAFFEINBERRY_JUICE = "¿Ya es hora del café?", -- Black Coffee
            TOFFEE_LATTE = "Está bastante dulce para ser café.", -- Toffeenut Latte
            RUINCHA_LATTE = "Esto no es moca.", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "Perfecto para sorberlo en la fogata.", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "Dulce y refrescante.", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "La amargura realmente se siente.", -- Chocolatl (Bitter)
            TEA_RUINCOLATE_LATTE = "Sorpresivamente, los sabores se mezclaron bien.", -- Matcha Latte

            MULLED = "Esto es perfecto para cuando no te sientes bien..", -- Bánh Xèo (Savory Vietnamese Crepes)
            BUTTERBEER = "¿Parezco una criatura mágica o un pequeño gigante? Ja.", -- Butterbeer (Harry Potter reference)

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "Ya no quedan muchas partes del coco, ¿Verdad?", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "No sabe a nada.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Pudimos haber hecho sushi.", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "Sospecho que queden partes de pelo.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Olor a miel y árbol, interesante.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Un jugo de granos algo inusual.", -- Vitacomp Sweet Rice Drink
            PINEANANAS_JUICE = "Refrescante, pero no puedo beber mucho.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Agrega algo de jarabe y será perfecto.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "No es mi favorito, pero es agradable.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Es suave y refrescante.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Additives

            SPOILED_DRINK = "Oh dios, creo que salió mal.", -- Spoiled Drink

            -- Distillery Sodas

            SODA = "Es agua carbonatada.", -- Soda
            FRUITSODA = "Es un ponche de frutas ¿Verdad?", -- Fruit Soda
            LEMONLIMESODA = "Es dulce y refrescante.", -- Lemon Lime Soda (Fruit Soda variant)
            COLA = "Debería beberla cuando termine de trabajar.", -- Cola
            COLAQUANTUM = "Es bastante adictivo.", -- Cola Quantum
            LUMPY_BEER = "¿Es bebida de zarzaparrilla?", -- Lumpy Beer (non-alcoholic)

            -- Distillery Spirits

            CORN_BEER = "No es cerveza real, pero está bien.", -- Corn Beer
            MADHU = "Está hecho con miel de abeja.", -- Madhu (Honey Wine)
            WINE = "No está hecho con uvas, pero servirá.", -- Wine (Basic Berry Brew)
            NOBLEWINE = "Es un vino elegante.", -- Noble Wine (Roasted Berry Brew)
            SPARKLINGWINE = "Alguien va a agitarlo y no estaré cerca cuando suceda.", -- Sparkling Wine
            GLOWBERRYWINE = "El sabor no está mal.", -- Glowberry Wine
            KUMIS = "¿Es una bebida de leche fermentada o algo así?", -- Kumis (Fermented Milk Wine)
            LUMPY_WINE = "No es alcohol ilegal, pero servirá.", -- Lumpy Wine (Root Brew)
            PULQUE = "Es una bebida que tomaban los indígenas de mi tierra.", -- Pulque (Agave Wine)
            RUINCACAO_WINE = "Nunca había escuchado de vino de cacao.", -- Ruincacao Wine (Cocoa Wine)

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "Si es dulce y refrescante está bien.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Es refresco de piña.", -- Pineapple Soda (Orancee)
            ORANGESODA = "Es un refresco naranja.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "Refresco de fresa.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "Veo que es licor de medusa.", -- Shipwrecked Aurobow (Rainbow Jellyfish Wine)
            COCONUT_WINE = "Tiene un fuerte olor a madera.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Si nadie más lo beberá, supongo que yo lo haré.", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Ahora esta lleno de moras azules.", -- Vitacomp Boom! Berry Sapphire (Explosive when ignited)
            RICE_WINE = "¿Es vina de arroz mal fermentado?", -- Vitacomp Makgeolli (Rice Wine)
            WHEAT_BEER = "Es cerveza de verdad.", -- Hip of Food Wheat Beer
            PALE_BEER = "El color es extraño.", -- Legion Pale Ale (Green beer made with Monsteras)

            -- Distillery Spirits

            DISINFECTANT = "Sanitizarse es importante ¿Verdad?", -- Disinfectant
            CORN_WHISKEY = "Es whisky estilo americano.", -- Corn Whiskey
            LUMPY_VODKA = "Beber esto cuando tienes frío te calienta ¿Verdad?", -- Vodka
            TEQUILA = "Es una especie de licor fuerte mexicano, ¿Verdad?", -- Tequila
            MADHU_RUM = "Es ron de marinero.", -- Rum
            BERRY_BRANDY = "Este brandy es bastante elegante.", -- Berry Brandy
            AREUHI = "¿Es un vodka hecho con leche?", -- Kumis Distilled Spirit Areuhi

            -- Warly Exclusive Distillery Spirits

            BERRY_GIN = "Parece ginebra.", -- Gin
            GLOWBERRY_GIN = "Es brillante y sabe bien ¿Verdad?", -- Glowberry Gin
            ABSINTHE = "Huele como Wormwood.", -- Absinthe
            TEA_LUMPY_VODKA = "Nunca había visto este tipo de licor, pero no está mal.", -- Matcha Liqueur
            PETALS_BERRY_BRANDY = "Es aromático y sabe bien.", -- Rose Scented Brandy
            KAHLUA = "Preferiría beber café y alcohol de forma separada.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Tiene un aroma robusto.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "No estoy seguro de considerar esto como un licor..", -- Baileys Cocoa Cream Liqueur
            RUMCHATA = "¿La gente del sur mezclaba alcohol con leche?", -- Rumchata (Mixed with Horchata)

            -- Collaboration Distillery Spirits

            MOONWAY = "El color es bonito, pero tengo mis dudas.", -- Rainbow Jellyfish Wine Distilled Spirit
            ARRACK = "Es vino de coco de Indonesia ¿Verdad?", -- Arrack (Coconut Wine) Indonesian Version
            CHERRY_BLOOM_RUM = "Si nadie más me ve, supongo que lo beberé.?", -- Cherry Blossom Honey Rum Distilled Spirit Cherry Blossom Petals Floating
            RICE_SPIRITS = "¿No es demasiado pronto para ser un licor?", -- Cheongju (Korean Rice Wine)
            WHEAT_WHISKEY = "Preferiría un café o un whisky.", -- Wheat Whiskey
            PALE_WHISKEY = "El color es extraño, pero si alguien pide whisky le daré esto.", -- Pale Malt Whiskey

            -- Warly Exclusive Collaboration Distillery Spirits

            NUT_COCONUT_BRANDY = "¿Están listos, chicos?", -- Coconut Brandy (SpongeBob Opening Pirate Parody)
            GIANT_BLUEBERRY_GIN = "Entonces, ¿Ganaste el partido de hockey?", -- Boom Berry Sapphire (Carrot explodes)

            -- Pot Cooking

            DARK_RUINCOLATE = "¿Warly está intentando cocinar o es un intento de preparar una comida saludable??", -- Dark Chocolate
            WHITE_RUINCOLATE = "¿Es dulce y no es pesado?", -- White Chocolate
            RUINCOLATE = "Nunca tuve tiempo de probar el chocolate, gracias.", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Debería darme un impulso de energía.", -- Schokakola

            BUCKET_STEEL_EMPTY = 
            {
                EMPTY = "Una cubeta muy resistente.", -- Empty Steel Bucket
                FULL = "Esta llena de agua de lluvia.", -- Clean rainwater in the bucket
                FULL_ICE = "¿Quién dejó la cubeta afuera para que se congelara?", -- Rainwater frozen in the bucket
                DIRTY = "Debería usar esto para regar el jardín.", -- Rainwater has become dirty
                DIRTY_ICE = "Se congeló antes de que pudiera limpiarla.", -- Dirty rainwater frozen in the bucket
            },

            BUCKET_WOODIE_EMPTY = 
            {
                EMPTY = "¡Buen trabajo Lucy!", -- Empty Woodie's Wooden Bucket
                FULL = "Vaciemos el agua antes de que se hehe a perder.", -- Clean rainwater in the bucket
                FULL_ICE = "¿Quién dejó la cubeta afuera para que se congelara?", -- Rainwater frozen in the bucket
                DIRTY = "Debería usar esto para regar el jardín.", -- Rainwater has become dirty
                DIRTY_ICE = "Se congeló antes de que pudiera limpiarla.", -- Dirty rainwater frozen in the bucket
            },

            BUCKET_EMPTY = 
            {
                EMPTY = "Una cubeta hecha con madera.", -- Empty Wooden Bucket
                FULL = "Vaciemos el agua antes de que se hehe a perder.", -- Clean rainwater in the bucket
                FULL_ICE = "¿Quién dejó la cubeta afuera para que se congelara?", -- Rainwater frozen in the bucket
                DIRTY = "Debería usar esto para regar el jardín.", -- Rainwater has become dirty
                DIRTY_ICE = "Se congeló antes de que pudiera limpiarla.", -- Dirty rainwater frozen in the bucket
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
                GENERIC = "Está bien sellado.", -- Examining the barrel
                BURNT = "Se quemó completamente.", -- Barrel has burnt down
            },

            BREWERY = 
            {
                EMPTY = "Una cervecera bastante sofisticada.", -- Examining the brewery
                BURNT = "Una pena que se haya quemado.", -- Brewery has burnt down
                FERMENTING_LONG = "Aún es agua.", -- Brewing process has a long way to go
                FERMENTING_SHORT = "El aroma a alcohol está aumentando.", -- Brewing process is almost complete
                DONE = "Intentemos beberlo.", -- Beverage is ready in the brewery
            },

            CAMPKETTLE_ITEM = "Me recuerda al hervir agua en los bosques.", -- Examining the portable camp kettle (item)
            CAMPKETTLE = 
            {
                GENERIC = "¿Debería limpiarlo si no lo voy a usar?", -- Examining the empty camp kettle in the hearth
                BOILING_LONG = "¿Realmente quiero beber té hirviendo?", -- Starting to boil water
                BOILING_SHORT = "¡Está casi listo!", -- Water in the kettle is almost boiling
                DONE = "¡Hora del té!", -- Clean water is ready in the kettle
                STOP = "Lucy, consigamos algo de madera.", -- Kettle won't boil without a fire
            },

            CAMPDESALINATOR_ITEM = "¿Es para usarlo en un bote?", -- Examining the portable camp desalinator (item)
            CAMPDESALINATOR = 
            {
                GENERIC = "Está vacío por dentro.", -- Examining the empty camp desalinator
                BOILING_LONG = "Aún es agua salada.", -- Starting to boil seawater
                BOILING_SHORT = "¡Casi está listo!", -- Seawater is almost purified
                DONE = "Esta listo para beberse.", -- Clean water is ready in the desalinator
                STOP = "Lucy, consigamos algo de madera.", -- Desalinator won't work without a fire
            },

            KETTLE = 
            {
                EMPTY = "¿Debería traer algo de hojas de té?", -- Examining the empty kettle
                BURNT = "Se quemó completamente.", -- Kettle has burnt down
                BOILING_LONG = "¿Tardará mucho más?", -- Starting to boil beverage
                BOILING_SHORT = "¡Fantástico! ¡Casi está listo!", -- Beverage in the kettle is almost done
                DONE = "¿Deberíamos intentar beberlo?", -- Beverage is ready in the kettle
                PURIFY_LONG = "No quiero enfermarme por beber agua sucia.", -- Starting to purify dirty water
                PURIFY_SHORT = "Ya casi está listo.", -- Dirty water is almost purified
                HASWATER = "El agua está lista, ahora solo necesito ingredientes.", -- Clean water is in the kettle
                MELT_LONG = "¿Podré hacer té con hielo derretido?", -- Starting to melt ice for tea
                MELT_SHORT = "Está completamente derretido.", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM = 
            {
                GENERIC = "¿Debería llevármela si nadie la va a usar?", -- Examining the portable kettle (item)
                EMPTY = "¿Debería llevármela ahora?.", -- Examining the placed empty portable kettle
                BOILING_LONG = "¿Tomará más tiempo?", -- Starting to boil beverage
                BOILING_SHORT = "¡Fantástico! ¡Casi está listo!", -- Beverage in the portable kettle is almost done
                DONE = "¿Deberíamos intentar beberlo?", -- Beverage is ready in the portable kettle
                PURIFY_LONG = "No quiero enfermarme por beber agua sucia.", -- Starting to purify dirty water
                PURIFY_SHORT = "Ya casi está listo.", -- Dirty water is almost purified
                HASWATER = "El agua está lista, ahora solo necesito ingredientes.", -- Clean water is in the portable kettle
                MELT_LONG = "¿Podré hacer té con hielo derretido?", -- Starting to melt ice for tea
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
                HIGH_PRESSURE = "Estás haciendo un gran trabajo.", -- Pressure is at maximum
                MIDDLE_PRESSURE = "Trabajas duro para sacar agua.", -- Pressure is in the middle
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