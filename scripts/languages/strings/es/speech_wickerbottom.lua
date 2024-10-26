return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Este pozo solo puede tener una cubeta a la vez.", -- There's a dry bucket on the well, and you tried to put a bucket on it.
            WELL_BUSY = "Esperemos un momento.", -- There's a bucket filled with water on the well, and you tried to put a bucket on it.
        }
    },

        ANNOUNCE_DRUNK = "Mi sistema diges-tivoo, y mentaal ejem edn.", -- Drunk
        ANNOUNCE_DRUNK_END = "De todas formas, beber en exceso esta completamente prohibido.", -- Sobering up from alcohol (Hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Wickerbottom only.
        ANNOUNCE_NOTCHARGE = "La cabra no esta en condiciones de ser ordeñada.", -- Unable to milk with a bucket because the Volt Goat is not charged.
        ANNOUNCE_NOTHIRSTSLEEP = "", -- Thirsty but trying to sleep at night -- Not used for Wickerbottom
        ANNOUNCE_NOTHIRSTSIESTA = "", -- Thirsty but trying to sleep during the day -- Not used for Wickerbottom
        ANNOUNCE_SLEEP_END = "", -- Fully sober after sleeping -- Not used for Wickerbottom
        ANNOUNCE_THIRST = "La bibliotecaria necesita agua.", -- Too thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "Puedo sentir la cafeína empezando a unirse a mis receptores de adenosina.", -- Caffeine buff starts
        ANNOUNCE_CAFFINE_BUFF_STOP = "La cafeína fue metabolizada completamente en mi cuerpo.", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "Puedo sentir el dolor de la enfermedad endémica aliviarse.", -- Dialogue when curing a waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "No debería beber demasiado, tiene efectos nocivos para el hígado y aparato digestivo", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "Beber con moderación tiene efectos positivos en la salud.", -- When starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "Interesante, una compilación de información sobre bebidas.",

            WATER_CLEAN_ICE = "Agua solidificada.", 
            WATER_DIRTY_ICE = "Agua solidificada que contiene bacterias.", 

            SPICE_CAFFEINPEPPER = "En el pasado, era una rara y cara especia.",

            WELL_KIT = "Materiales para la construccion de instalaciones para extraer agua de vetas profundas", 
            WELL_SPRINKLER_KIT = "Una máquina utilizada para extraer agua de vetas profundas para la agricultura.", 
            WELL_WATERPUMP_KIT = "Una máquina usada para bombear agua desde.", 
            WELL_BURYING_KIT = "Herramientas para enterrar un agujero cuando ya no es necesario o no funciona.", 
            WELL_DRILLING = "Que está tratando de cavar aquí para ver si hay un acuífero.", 
            WELL_DRILLING_ITEM = "Necesitó encontrar un lugar adecuado en donde perforar.", -- Drilling item
            HOLE = "Puedo oír el agua, parece que cavé correctamente.", -- Well hole
            WELL = "Construcción utilizada para extraer agua de una vena de agua profunda.", -- Well

            -- Water mode plants

            TEA_TREE = "Un tipo de árbol de camelia.", -- Tea tree
            DUG_TEA_TREE = "Necesita tierra para crecer.", -- Tea tree (dug)
            TEA_SEED = "Semillas de un árbol de té.", -- Tea seed
            TEA_SEED_COOKED = "Plantarla no dará resultados.", -- Cooked tea seed
            TEA_SEED_SAPLING = "La planta de té ah empezado a crecer.", -- Tea tree sapling
            TEALEAVES = "Es un tipo de hoja de té de la variedad Camellia sinensis.", -- Tea leaves
            TEALEAVES_DRIED = "Se usarán para hacer té negro", -- Dried tea leaves

            CAFFEINBERRY = "Un arbusto bajo que crece en suelo lunar arenoso.", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "Es una combinación de café y pimienta.", -- Dug Caffeinberry bush
            CAFFEINBERRY_BEAN = "Posee un aroma único.", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Huele a café con un toque de pimienta.", -- Cooked coffee bean

            RUINCACAO_TREE = "La fruta cayó en un sumidero.", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "Necesita tierra para crecer.", -- Ruincacao tree (dug)
            RUINCACAO_SEED = "Semillas de árbol de cacao.", -- Ruincacao seed
            RUINCACAO_SEED_SAPLING = "La plántula de cacao crecerá.", -- Ruincacao sapling
            RUINCACAO = "Se utilizaba como moneda en las antiguas civilizaciones aztecas.", -- Unsmashed Ruincacao
            RUINCACAO_BEAN = "Se compone de un poco de mantequilla y granos de cacao.", -- Smashed Ruincacao bean
            RUINCACAO_BEAN_COOKED = "Usado para hacer bebidas de chocolate.", -- Cooked Ruincacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Agrega un sabor a semilla a los licores.", -- Seed additives for liquors (Anise, Juniperberry, Palgak motif)
            ADDITIVE_PETALS = "Agrega un sabor de hojas y flores al licor.", -- Herb and petal additives for liquors (Green tea, Flower petals)
            ADDITIVE_NUT = "Añade un sabor de frutos secos a los licores.", -- Nut additives for liquors (Birchnut, Coconut, Coffee bean, Ruincacao bean)
            ADDITIVE_DAIRY = "Añade un sabor cremoso a los licores.", -- Dairy additives for liquors

            -- Beverages

            WATER_CLEAN = "Escencial para la vida. Químicamente es H₂O.", -- Clean water
            WATER_DIRTY = "Hervirla prevé enfermedades transmitidas por el agua.", -- Dirty water
            WATER_SALTY = "Beber esto puede provocar deshidratación.", -- Saltwater

            GOOPYDRINK = "Oh, no, no, no, esto no servirá para nada.", -- Failed beverage (Wet goop concept)

            -- Teapot drinks

            FRUITJUICE = "No está mal hacerlo con frutas ligeramente imperfectas.", -- Mixed fruit juice
            BERRIES_JUICE = "Los efectos farmacológicos del fruto de la Ardisia crenata incluyen propiedades antipiréticas y antiinflamatorias.", -- Berries juice
            POMEGRANATE_JUICE = "Rico en estrógenos naturales.", -- Pomegranate juice
            BANANA_JUICE = "No está mal tomar una bebida caliente.", -- Banana juice
            FIG_JUICE = "Un zumo refrescante consumido tradicionalmente en Oriente Medio.", -- Fig juice
            DRAGONJUICE = "La variedad blanca tiene una sutil fragancia.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Nunca había visto una bebida así, ¡Es increíble!", -- Glowberry juice
            WATERMELON_JUICE = "Su alto contenido en agua lo hace ideal para calmar la sed.", -- Watermelon juice

            VEGGIE_TEA = "Las bebidas saludables suelen ser amargas.", -- Green juice
            CARROT_TEA = "De todas maneras, es rico en hierro y vitaminas.", -- Carrot tea
            CACTUS_TEA = "Opuntia ficus-indica, té tradicional de algunas regiones mexicanas.", -- Cactus tea (Nopales Tea actually exists)
            TOMATO_JUICE = "Contiene componentes que ayudan a desintoxicar el alcohol.", -- Tomato juice
            LUMPY_TEA = "Contiene componentes que ayudan a aliviar las enfermedades endémicas.", -- Root tea
            SEAWEED_SHAKE = "Es pegajosa porque es rica en ácido algínico.", -- Seaweed shake

            GREENTEA = "Originario de Asia.", -- Fresh green tea leaves
            BLACKTEA = "Una taza de té y un buen libro es lo que necesito.", -- Black tea
            BLACKTEA_ICED = "Vigoriza el espíritu.", -- Iced black tea
            FUER = "Contiene componentes que ayudan a aliviar las enfermedades endémicas.", -- Boichaa, Leaf Tea, Gwessari Tea
            MIXFLOWER = "Una mezcla de varios tipos de flores.", -- Mixed flower petal tea
            HIBISCUSTEA = "Hecho con flores de hibisco.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "En algunas regiones se cree que es bueno para la salud.", -- Nopales tea
            LOTUSTEA = "Tradicionalmente consumido durante ocasiones especiales en las regiones asiáticas.", -- Lotus tea
            SUSHIBISCUS = "Espera... Esto no es té de hibisco.", -- Suicide tea
            MOON_BLOSSOM_TEA = "Sólo con mirarlo me siento tranquila.", -- Moonflower tea

            CAFFEINBERRY_JUICE = "Me gusta una rica taza de café con un buen libro.", -- Black coffee
            TOFFEE_LATTE = "Tiene un rico aroma a nuez.", -- Toffeenut latte
            RUINCHA_LATTE = "Toma su nombre de un topónimo. Es una combinación de café y chocolate.", -- Mocha latte (Coffee + Cocoa)

            HOTRUINCOLATE = "Es una bebida modificada que tiene su origen en el 'xocolatl' cuando se introdujo en Europa.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "¡Una versión modificada del chocolate caliente!", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Una antigua bebida de origen azteca.", -- Chocolatl (rich and spicy)
            TEA_RUINCOLATE_LATTE = "Hay variedad a las opciones de bebidas.", -- Matcha latte

            MULLED = "Es como saborear la alegría de fin de año.", -- Bancha
            BUTTERBEER = "Una bebida ficticia popular; no es cerveza de verdad.", -- Butterbeer (Harry Potter series)

            -- Collaborative Pitcher Drinks

            COCONUT_JUICE = "El agua de coco se ha gelificado por fermentación microbiana.", --Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Interesante, mantiene la bioluminiscencia.", --Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Debería estudiar las propiedades de esta sopa de pescado por separado.", --Shipwrecked Quacken Soup Shake
            CHERRY_ROSEBERRIES_TEA = "Es dulce y fragante.", --Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Siento que mi cuerpo se está calentando.", --Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Se ha fermentado para darle un sabor dulce y facilitar su digestión.", --Vitacorp Sweet Hyphae
            ANANAS_JUICE = "Contiene mucha bromelina, por lo que puede provocar llagas en la boca. Bébelo con moderación.", --More Food Pack Pineapple Juice
            ORANGE_JUICE = "Zumo de naranja, es como el tipo de zumo estereotípico.", --More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Hielo y fresas mezclados, estaría aún mejor con leche.", --More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Una popular bebida de fresa, a veces hecha con yogur en lugar de leche.", --More Food Pack Strawberry Milk Smoothie

            -- Brewing Drinks

            SPOILED_DRINK = "Esta bebida se está convirtiendo en un caldo de cultivo para las bacterias.", --Spoiled Drink

            -- Brewing Sodas

            SODA = "Agua en la que el dióxido de carbono está disuelto e ionizado.", --Carbonated Water
            FRUITSODA = "Zumo de frutas añadido al agua carbonatada.", --Fruit Soda
            LEMONLIMESODA = "Tiene una dulzura muy fuerte.", --Lemon Lime Soda (Fruit Soda Superior)
            COLA = "Es una bebida muy popular en Estados Unidos.", --Cola (Background in 1907, Coca-Cola exists)
            COLAQUANTUM = "Hmm... Debería investigar si el consumo excesivo tiene efectos secundarios.", --Cola Quantum (No signs of Cherenkov radiation yet (estimated around 1911))
            LUMPY_BEER = "Se mezclaron diversos tubérculos.", --Root Beer (Not an alcoholic beverage)

            -- Brewing Spirits

            CORN_BEER = "Tiene su origen en los antiguos incas.", --Corn Beer
            MADHU = "La hidromiel es conocida como la primera bebida alcohólica elaborada por el ser humano.", --Mead
            WINE = "El vino se elabora originalmente con uvas, pero también hay una larga historia de vino elaborado con frambuesas.", --Wine (Berry Brewing)
            NOBLEWINE = "El profundo dulzor se debe a un hongo llamado Botrytis cinerea.", --Noble Wine (Roasted Berry Brewing)
            SPARKLINGWINE = "Originalmente, el dióxido de carbono se produce a través de la fermentación, pero en este caso, la carbonatación se añadió artificialmente.", --Sparkling Wine
            GLOWBERRYWINE = "Un nuevo tipo de vino, debería averiguar por qué no pierde la luz durante la fermentación.", --Glow Berry Wine
            KUMIS = "Bebida tradicional de Asia Central.", --Kumis (Fermented Horse Milk)
            LUMPY_WINE = "Mayoritariamente fabricado en Islandia.", --Lumpy Wine (Root Vegetable Wine)
            PULQUE = "Bebida tradicional de los indígenas mesoamericanos.", --Pulque (Agave Wine)
            RUINCACAO_WINE = "Un licor cervecero que nunca antes había visto.", --Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "W. B. Bebida medicinal con 23 especias.", --Cherry Forest Doctor Pepper (Doctor Cherry)
            ANANASSODA = "Zumo de piña con agua carbonatada.", --Carbonated Pineapple (Orancee)
            ORANGESODA = "Contiene zumo de naranja.", --Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Agua carbonatada con zumo de fresa.", --Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Spirits

            AUROBOW = "Debería investigar por qué esta bebida brilla.", --Shipwrecked Auroboros (Bioluminescent Jellyfish Spirits)
            COCONUT_WINE = "El vino de palma se hace en varios países tropicales.", --Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Hecho de miel de flores, el color es realmente impresionante.", --Cherry Forest Cherry Blossom Honey Spirits
            GIANT_BLUEBERRY_WINE = "Conserva la inestabilidad incluso después de la fermentación.", --Vitacorp Boom Berry Wine (Explodes when ignited)
            RICE_WINE = "Uno de los métodos para el almacenamiento a largo plazo de cereales.", --Vitacorp Makgeolli (Korean rice wine)
            WHEAT_BEER = "Comenzó en el antiguo Egipto.", --Heap of Food Wheat Beer
            PALE_BEER = "Un tipo de cerveza de alta fermentación.", --Leigion Pale Ale (Green beer made from Monstra fruits)

            -- Distilled Spirits

            DISINFECTANT = "El etanol se utiliza para desinfectar heridas. Su fórmula química es C₂H₅OH.", --Disinfectant
            CORN_WHISKEY = "El whisky Bourbon de Kentucky EU, es famoso.", --Corn Whiskey
            LUMPY_VODKA = "Derivado de \"вода\", que significa \"agua\" en ruso.", --Vodka
            TEQUILA = "Los conquistadores hicieron mezcal de agave cuando se les acabaron las uvas.", --Tequila
            MADHU_RUM = "Se diluye con agua durante la navegación para evitar el deterioro del agua potable.", --Rum
            BERRY_BRANDY = "Conocido como el \"rey de los licores\" por su elevado precio y complicada elaboración.", --Berry Brandy
            AREUHI = "El Shimiin Arkhi se elabora destilando y fraccionando repetidamente los kumis para eliminar las impurezas.", --Kumis Distilled Spirits Areuhi

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "Originalmente se utilizaba como bebida medicinal para la diuresis, con efectos antipiréticos y para favorecer la digestión.", --Gin
            GLOWBERRY_GIN = "Incluso después de la fermentación y la destilación, sigue emitiendo luz.", --Glow Berry Gin
            ABSINTHE = "Bebida destilada mediante la extracción de diversas hierbas en alcohol.", --Absinthe
            TEA_LUMPY_VODKA = "Interesante, el equilibrio de sabores parece estar bien conservado.", --Green Tea Liqueur
            PETALS_BERRY_BRANDY = "El aroma de las flores se añade al brandy para hacerlo más espectacular.", --Rose Petal Brandy
            KAHLUA = "Comúnmente utilizado para preparar cócteles por su aroma a café y su dulzor.", --Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "Acentúa el cuerpo del whisky, haciéndolo robusto.", --Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Creado originalmente para manejar de forma barata los restos de whisky y crema.", --Baileys Cacao Cream Liqueur
            RUMCHATA = "El ron se mezcla con leche para que sea más fácil de beber.", --Rumchata (Rum with Horchata)

            -- Collaborative Distilled Spirits

            MOONWAY = "Incluso después de la destilación, no pierde su luz. Interesante.", --Shipwrecked Moonway (Distilled Bioluminescent Jellyfish Spirits)
            ARRACK = "Destilado de savia de coco elaborado por los indígenas del sur de Asia.", --Arrack Indonesian Version Coconut Wine Distilled Spirits
            CHERRY_BLOOM_RUM = "Es precioso, pero también me interesa su mecanismo de acción.", --Cherry Blossom Honey Spirits Distilled Spirits Cherry Blossom Petals Floating in Liquor
            RICE_SPIRITS = "Similar al sake.", --Cheongju (Korean Rice Wine)
            WHEAT_WHISKEY = "Empezó a fabricarse en Irlanda o Escocia.", --Heap of Food Malt Whiskey
            PALE_WHISKEY = "Nunca había visto este whisky. Tiene un aroma bastante único.", --Pale Malt Whiskey

            -- Warly Exclusive Collaborative Distilled Spirits

            NUT_COCONUT_BRANDY = "Se han hecho esfuerzos por un ambiente pirata.", --Coconut Brandy (Replaced with Caribbean Brandy as Caribbean Rum cannot be made)
            GIANT_BLUEBERRY_GIN = "Tiene las propiedades opuestas de la fermentación y la destilación, teniendo en cuenta las propiedades inherentes de los ingredientes.", --Boom Berry Sapphire (Explodes when ignited)

            -- Pot Cooking

            DARK_RUINCOLATE = "¡Chocolate negro! Tiene un contenido muy elevado de manteca de cacao.", --Dark Chocolate
            WHITE_RUINCOLATE = "¡Chocolate blanco! Tiene un alto contenido en manteca de cacao.", --White Chocolate
            RUINCOLATE = "¡Chocolate! Una forma deliciosa del chocolate.", --Chocolate
            RUIN_SCHOKAKOLA = "¡Un nuevo tipo de chocolate!.", --Shocka-Cola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Una cubeta hecha de hierro.", --Empty steel bucket
                FULL = "Agua limpia para beber.", -- Clean rainwater
                FULL_ICE = "Pequeños pedazos de hielo.", -- Rainwater frozen
                DIRTY = "Agua en la que pululan bacterias.", -- Rainwater got dirty
                DIRTY_ICE = "Pequeños pedazos de hielo con bacterias.", -- Dirty rainwater frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Una cubeta hecha habilidosamente con troncos.", --Empty wooden bucket of Woody
                FULL = "Agua limpia para beber.", -- Clean rainwater
                FULL_ICE = "Pequeños pedazos de hielo.", -- Rainwater frozen
                DIRTY = "Agua llena de bacterias", -- Rainwater got dirty
                DIRTY_ICE = "Pequeños pedazos de hielo con bacterias.", -- Dirty rainwater frozen
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY = "Es un cubo hecho de madera flotante.", 
                FULL = "Agua limpia para beber.", -- Clean rainwater
                FULL_ICE = "Pequeños pedazos de hielo.", -- Rainwater frozen
                DIRTY = "Agua en camino a ser caldo de cultivo", -- Rainwater got dirty
                DIRTY_ICE = "Pequeños pedazos de hielo con bacterias.", -- Dirty rainwater frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Una cubeta hecha de madera.", -- Empty wooden bucket
                FULL = "Agua limpia para beber.", -- Clean rainwater
                FULL_ICE = "Pequeños pedazos de hielo.", -- Rainwater frozen
                DIRTY = "Un caldo de cultivo de bacterias.", -- Rainwater got dirty
                DIRTY_ICE = "Pequeños pedazos de hielo con bacterias.", -- Dirty rainwater frozen
            },

            DESALINATOR =
            {
                EMPTY = "El agua y la sal se separan con este desalinizador.", -- Desalinator has no water
                PURIFY_LONG = "Todavía queda mucho camino por recorrer para la desalinización.", -- A long way to go until purification is complete
                PURIFY_SHORT = "¡La desalinización casi termina!", -- Desalination is almost complete
                HASWATER = "Solo el agua potable permanece.", -- Desalinator has clean water
                BURNT = "Oh, es completamente inútil en ese estado..", -- Desalinator has burnt
                HASSALT = "Suficiente sal fue recolectada.", -- Desalinator has salt
            },

            BARREL =
            {
                GENERIC = "Un filtro de carbón es agregado para un seguro almacenamiento de agua.", -- Inspect empty barrel
                BURNT = "¡Oh no, se ah perdido toda el agua!", -- Barrel burnt
            },

            BREWERY =
            {
                EMPTY = "Para conservar los alimentos durante mucho tiempo, empezaron a fabricar alcohol.", -- Inspect empty brewery
                BURNT = "Tendré que aplazar por un tiempo la investigación sobre la fermentación.", -- Brewery burnt
                FERMENTING_LONG = "Tendremos que tener paciencia hasta que los ingredientes fermenten.", -- A long way to go until fermentation is complete
                FERMENTING_SHORT = "¡La fermentación ya casi acaba!", -- Fermentation is almost complete
                DONE = "Puedes olerlo desde lejos.", -- Brewery has beverage
            },

            CAMPKETTLE_ITEM = "Hierve el agua para eliminar las bacterias.", -- Inspect portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "Esta vacío.", -- Empty camp kettle inspect
                BOILING_LONG = "Aún queda mucho para la esterilización.", -- Boiling has just started
                BOILING_SHORT = "¡Ya casi termina la esterilización!", -- Boiling is almost complete
                DONE = "Esta esterilizado y listo para beber.", -- Clean water is ready
                STOP = "Necesito poner algo de leña.", -- Campfire has no fire so water is not boiling
            },

            CAMPDESALINATOR_ITEM = "Evapora el agua salada para obtener agua potable.", -- Inspect portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "No tiene agua potable.", -- No water
                BOILING_LONG = "Aún queda mucho tiempo para recolectar el agua potable.", -- Boiling has just started
                BOILING_SHORT = "¡Ya casi está lleno!", -- Boiling is almost complete
                DONE = "Esta lleno de agua potable.", -- Clean water is collected
                STOP = "El fuego se ha apagado, por lo que no ha recogido suficiente agua fresca todavía.", -- Campfire has no fire so saltwater is not distilled
            },

            KETTLE =
            {
                EMPTY = "Necesitamos agua.", -- Empty kettle inspect
                BURNT = "Esta desolado ahora.", -- Kettle burnt
                BOILING_LONG = "Aún queda mucho para la extracción.", -- Boiling has just started
                BOILING_SHORT = "¡Ya casi termina!", -- Boiling is almost complete
                DONE = "Probemos el resultado.", -- Beverage is ready
                PURIFY_LONG = "Necesitamos esperar hasta que la esterilización finalice.", -- Boiling dirty water has just started
                PURIFY_SHORT = "¡Está casi esterilizado!", -- Boiling dirty water is almost complete
                HASWATER = "Mas ingredientes son necesarios.", -- Clean water is in the kettle
                MELT_LONG = "Le tomará un tiempo derretir el hielo.", -- Melting ice water has just started
                MELT_SHORT = "¡Ya casi se derrite!", -- Melting ice water is almost complete
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Podemos preparar el té en cualquier lugar.", -- Portable kettle item inspect
                EMPTY = "Necesitamos agregar agua antes de usarla.", -- Empty portable kettle inspect
                BOILING_LONG = "La paciencia es una virtud", -- Boiling has just started
                BOILING_SHORT = "¡Terminará pronto!", -- Boiling is almost complete
                DONE = "El aroma es vigorizante.", -- Beverage is ready
                PURIFY_LONG = "Tenemos que esperar a que se complete la esterilización.", -- Boiling dirty water has just started
                PURIFY_SHORT = "¡Está casi esterilizado!", -- Boiling dirty water is almost complete
                HASWATER = "Hmm, Quizá deba hacer algo de té.", -- Clean water is in the portable kettle
                MELT_LONG = "Necesitamos esperar a que el hielo se derrita.", -- Melting ice water has just started
                MELT_SHORT = "¡Ya casi se derrite!", -- Melting ice water is almost complete
            },

            DISTILLERS =
            {
                EMPTY = "Se utiliza para destilar bebidas alcohólicas o hacer licores.", -- Distiller inspect
                DISTILLTING_LONG = "Sigue destilando.", -- A long way to go until distillation is complete
                DISTILLING_SHORT = "¡La destilación ya casi acaba!", -- Distillation is almost complete
                DONE = "Hay que asegurarse que se destiló correctamente.", -- Distiller has a beverage
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "La presión es más que suficiente.", -- Maximum pressure
                MIDDLE_PRESSURE = "La presión es la correcta.", -- Medium pressure
                LOW_PRESSURE = "La presión es muy baja.", -- Almost no pressure
                RECHARGE_PRESSURE = "No puede ser utilizado hasta que la presión se recupere.", -- Pressure is zero
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Está bajo de combustible.", -- Low fuel inspect
                ON = "Asegúrate de llevar un impermeable antes de acercarte.", -- Sprinkler is running
                OFF = "Encenderlo humedece los alrededores.", -- Sprinkler is not running
            },
        },
    }