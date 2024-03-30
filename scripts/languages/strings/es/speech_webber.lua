return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Parece que hay un lugar disponible.", -- Well is dry with only one empty bucket attached.
            WELL_BUSY = "Sería divertido, pero si el pozo se obstruye, estaremos en problemas.", -- Well has water-filled buckets attached.
        }
    },

        ANNOUNCE_DRUNK = "¿Cuatro?¿Ocho? No...¡Somos una legion!", -- Drunk
        ANNOUNCE_DRUNK_END = "No... Ahora sólo somos uno...", -- Sobering up from drinking (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. For Wickerbottom only.
        ANNOUNCE_NOTCHARGE = "No creo que produzca leche justo ahora.", -- Lightning goat can't charge to milk with buckets
        ANNOUNCE_NOTHIRSTSLEEP = "Nuestras gargantas están demasiado resecas para un sueño cómodo.", -- Thirsty trying to sleep at night
        ANNOUNCE_NOTHIRSTSIESTA = "Nuestras gargantas están demasiado resecas para la hora de la siesta.", -- Thirsty trying to sleep during the day
        ANNOUNCE_SLEEP_END = "Somo uno. ¡No debemos separarnos!", -- Waking up fully sober from sleep
        ANNOUNCE_THIRST = "¡Es la hora del té!", -- Very thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Hmm, Podría correr una maratón.", -- Starting caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Eh, ahora me siento lento.", -- Ending caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Ah, ¡Refrescante!",  -- Dialogue when curing waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Parece que nos vamos a dividir...", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "Mi cabeza está empezando a girar.", -- Getting tipsy

        DESCRIBE =
        {
            BOILBOOK = "Ugh, tantas recetas que memorizar.",

            WATER_CLEAN_ICE = "Ah, ¡Está frío!", -- Clean ice water
            WATER_DIRTY_ICE = "Está congelado. Bleh.", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "¡Picante!", -- Caffeine pepper spice

            WELL_KIT = "¡Construyamos un pozo espléndido!", -- Well kit
            WELL_SPRINKLER_KIT = "Se activa automáticamente con solo presionar un botón, ¡Increíble!", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "¿Deberíamos montarlo cerca de la fuente de agua de la casa?", -- Steam water pump kit
            WELL_BURYING_KIT = "¿Huh? ¿Vamos a tapar el agujero?", -- Hole burying kit
            WELL_DRILLING = "¡Es increíblemente ruidoso, pero divertido!", -- Drilling the hole with the drill
            WELL_DRILLING_ITEM = "Se siente bastante varonil.", -- Drill item
            HOLE = "¿Hola? ¿Hay alguien ahí?", -- Well hole
            WELL = "Nos dijeron que no nos escondamos ahí.", -- Well

            WX78MODULE_NONEDRUNK = "Huh. ¿Es así como se ven las entrañas de los robots?", -- 78전용 묘듈

            -- Water Mode Plants

            TEA_TREE = "Un poco pequeño para esconderse.", -- Tea tree
            DUG_TEA_TREE = "Con un poco de amor, crecerá de nuevo.", -- Tea tree dug from the ground
            TEA_SEED = "No es mucho que comer.", -- Tea tree seed
            TEA_SEED_COOKED = "No sabe nada bien.", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Wow, ¡Está floreciendo!", -- Tea tree sapling
            TEALEAVES = "Estas hojas tienen un aroma único.", -- Tea leaves
            TEALEAVES_DRIED = "Están un poco tierrosas.", -- Dried tea leaves

            CAFFEINBERRY = "Parecen un montón de granos.", -- Caffeine berry bush
            DUG_CAFFEINBERRY = "Con un poco de amor, crecerá de nuevo.", -- Dug caffeine berry bush
            CAFFEINBERRY_BEAN = "¿Podemos hacer chili con carne con esto?", -- Raw caffeine bean
            CAFFEINBERRY_BEAN_COOKED = "Sabe muy amargo.", -- Cooked caffeine bean

            RUINCACAO_TREE = "¿Otro árbol tropical en las cuevas?", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "¡Al suelo contigo!", -- Dug ruincacao tree
            RUINCACAO_SEED = "Wow, ¡Está floreciendo!", -- Ruincacao sapling item
            RUINCACAO_SEED_SAPLING = "Crecerá grande y dará buenos frutos.", -- Ruincacao sapling
            RUINCACAO = "Escuché algo, hace un ruido pegajoso.", -- Ruincacao fruit before smashing
            RUINCACAO_BEAN = "No puedo comer esto por el olor aceitoso.", -- Smashed ruincacao bean
            RUINCACAO_BEAN_COOKED = "¡Es extremadante amargo!", -- Cooked ruincacao bean

            -- Distillery Additives

            ADDITIVE_SEED = "Semillas de un olor extraño para la destilería", -- Liquor distillery additive seeds (anise, juniper berry, star motif)
            ADDITIVE_PETALS = "Hierbas y pétalos de flores comunes que puedes encontrar en la naturaleza", -- Liquor distillery herb and flower petal additives (tea, flower petals)
            ADDITIVE_NUT = "Una colección de cosas duras.", -- Liquor distillery nut additives (birchnut, coconut, coffee bean, cacao bean)
            ADDITIVE_DAIRY = "¿Nos regañarán si lo comemos tal cual?", -- Liquor distillery dairy additives

            -- Beverages

            WATER_CLEAN = "¡Es agua limpia!", -- Clean water
            WATER_DIRTY = "Agua de un estanque.", -- Dirty water
            WATER_SALTY = "Beber agua del mar está mal.", -- Saltwater

            GOOPYDRINK = "¡Una bebida de castigo!", -- Failed drink (wet roast concept)

            -- Teapot Beverages

            FRUITJUICE = "Jugo hecho con varias frutas.", -- Mixed fruit juice
            BERRIES_JUICE = "¡Jugo de zarzamora!", -- Berry juice
            POMEGRANATE_JUICE = "Sabroso, pero un poco agrio.", -- Pomegranate juice
            BANANA_JUICE = "Hmm, huele a bananas.", -- Banana juice
            FIG_JUICE = "¡Es bastante dulce!", -- Fig juice
            DRAGONJUICE = "Se ve como algo bebible ahora.", -- Dragon fruit juice
            GLOWBERRYJUICE = "¡Esto debería saber bien!", -- Glowberry juice
            WATERMELON_JUICE = "¡Bastante refrescante!", -- Watermelon juice

            VEGGIE_TEA = "¡Una combinación de varias verduras!", -- Vegetable juice
            CARROT_TEA = "No quisiera tomar mucho de esto.", -- Carrot tea
            CACTUS_TEA = "Está lleno de pulpa de cactus.", -- Cactus tea
            TOMATO_JUICE = "Jugo de verduras cuidadosamente triturado.", -- Tomato juice
            LUMPY_TEA = "Creo que sabe algo mal.", -- Root tea
            SEAWEED_SHAKE = "Se ve resbaladizo y viscoso.", -- Seaweed shake

            GREENTEA = "Hmm, huele a hojas.", -- Fresh leaf green tea
            BLACKTEA = "Necesito algunas galletas para acompañar esto.", -- Black tea
            BLACKTEA_ICED = "Té negro helado con hielo.", -- Iced black tea
            FUER = "Mmm, es un té relajante.", -- Foxtail, leaf tea, bracken tea
            MIXFLOWER = "Un té con varios pétalos de flores.", -- Mixed flower petal tea
            HIBISCUSTEA = "Se ha vuelto rojo.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Vamos a beberlo tres veces al día.", -- Cactus flower tea
            LOTUSTEA = "Un té hecho de flores que viven en el agua.", -- Lotus flower tea
            SUSHIBISCUS = "No debería jugar con la comida.", -- Suicide tea
            MOON_BLOSSOM_TEA = "Parece que la luna está dentro del té.", -- Moonflower tea

            CAFFEINBERRY_JUICE = "¡Amargo!", -- Black coffee
            TOFFEE_LATTE = "¡Es como caramelo derretido!", -- Toffee nut latte
            RUINCHA_LATTE = "Sabe bien, pero no bebamos mucho.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Calienta mis garras y mi estómago.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Frío para mantener mis garras y estómago frescos.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Ninguno de nosotros quiere beber esto.", -- Chocolatl (spicy)
            TEA_RUINCOLATE_LATTE = "Se ve raro.", -- Matcha latte

            MULLED = "¡Hace que mi cuerpo se caliente tan pronto como lo bebo!", -- Bancha
            BUTTERBEER = "Wendy me dijo que es una bebida deliciosa de una famosa serie de novelas", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Beverages

            COCONUT_JUICE = "Ugh, no sabe tan bien como parece.", -- Castaway Coconut Juice
            RAINBOW_SHAKE = "Nos gusta su apariencia colorida", -- Castaway Rainbow Jelly Shake
            QUARTZ_SHAKE = "Ugh, sabe a pescado sin importar lo que le pongas.", -- Castaway Clown Fish Shake
            CHERRY_ROSEBERRIES_TEA = "¿Extrajeron esto de una araña del espacio?", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Dulce y caliente, ¡Aunque el color es extraño!", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "¡Tiene unas semillas suaves dentro!", -- Vita Coop Sikhye
            PINEANANAS_JUICE = "Nuestros dientes se sienten raro después de beber esto.", -- Regione Pineapple Juice
            ORANGE_JUICE = "Debería cepillar nuestros dientes.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Tomémoslo lentamente para que no se congele nuestro cerebro.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "¡Esto es un batido de fresa de verdad!", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Teapot Beverages

            SPOILED_DRINK = "¡Completamente hechado a perder!", -- Spoiled Drink

            -- Distillery Soda

            SODA = "¿Qué es esto? ¡Es increíble!", -- Soda
            FRUITSODA = "Mmm, ¡Rico refresco frutal!", -- Fruit Soda
            LEMONLIMESODA = "Es refrescante, pero nuestra garganta se siente pegajosa después de beberlo", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "¡Nunca hubiésemos pensado ver esto de nuevo!", -- Cola
            COLAQUANTUM = "¡El refresco azul está brillando!", -- Cola Quantum
            LUMPY_BEER = "Emm, esto sabe raro.", -- Root Beer (not actual alcohol)

            -- Distillery Spirits

            CORN_BEER = "Wow! ¿Podemos tomar esto también?", -- Corn Beer
            MADHU = "Emm, no tiene nada de dulce; es sólo alcohol.", -- Madhu (Honey Wine)
            WINE = "¡Amargo!", -- Wine (regular berry brewing)
            NOBLEWINE = "Puede que sea dulce, probemos sólo un poco.", -- Noble Wine (cooked berry brewing)
            SPARKLINGWINE = "Quiero agitarlo, pero creo que no deberíamos.", -- Sparkling Wine
            GLOWBERRYWINE = "¡este vino está brillando!", -- Glow Berry Wine
            KUMIS = "¿Es leche hechada a perder?", -- Kumis (Fermented Sheep's Milk)
            LUMPY_WINE = "Hmm, esto es realmente amargo.", -- Soju (root spirits)
            PULQUE = "¿Leche hecha con plantas?", -- Pulque (fermented agave)
            RUINCACAO_WINE = "¡Nos encanta el chocolate!", -- Cacao Wine

            -- Collaboration Soda

            CHERRY_DOCTOR_COLA = "Es similar al cola, pero no igual, ¡Nos gusta!", -- Cherry Forest Doctor Pepper (Dr. Cherry)
            PINEANANASSODA = "Debemos ser cuidadosos de que no se pudra.", -- Pineapple Soda (Oranchi)
            ORANGESODA = "¡Una bebida carbonatada de naranja!", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "La señora wicker nos dijo que bebamos refresco con moderación.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "Lo hicieron con medusas, ¿Verdad?", -- Castaway Aurorabow, Rainbow Jellyfish Spirits
            COCONUT_WINE = "Tiene un ligero aroma a nuez.", -- Castaway Coconut Wine
            CHERRY_BLOOM_MADHU = "Es alcohol, ¡Pero es rosa!", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "Fruta jugosa hecha alcohol.", -- Vita Coop Boom! Berry Sapphire (Explodes when ignited)
            RICE_WINE = "¿Es como leche hecha con semillas?", -- Vita Coop Makgeolli (Rice Wine)
            WHEAT_BEER = "Mmm, está lleno de burbujas.", -- Heap of Food Wheat Beer
            PALE_BEER = "¡Esta cerveza es muy extraña!", -- Regione Pale Ale (Turquoise beer made with Monstra Fruit)

            -- Distillery Spirits

            DISINFECTANT = "Duele bastante usarlo.", -- Disinfectant
            CORN_WHISKEY = "¡Este alcohol es aún más fuerte!", -- Corn Whiskey
            LUMPY_VODKA = "Puede que Willow escupa fuego si bebe esto.", -- Vodka
            TEQUILA = "Hicieron alcohol con los catus.", -- Tequila
            MADHU_RUM = "¡Lo hicieron con azúcar, pero no podemos tomarlo!", -- Rum
            BERRY_BRANDY = "¡Vi a papá escondiendo esto en el estudio!", -- Berry Brandy
            AREUHI = "No creo que pueda aguantar alcohol hecho con leche.", -- Kumis Spirits Areuhi

            -- Collaboration Distillery Spirits (Warly Exclusive)

            BERRY_GIN = "Este tiene un aroma bastante más fuerte.", -- Gin
            GLOWBERRY_GIN = "Ugh, No queremos probarlo.", -- Glow Berry Gin
            ABSINTHE = "¡Es un verde vívido!", -- Absinthe
            TEA_LUMPY_VODKA = "¿Alcohol hecho con vegetales?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Mmm, tiene un aroma placentero.", -- Rose-Scented Brandy
            KAHLUA = "Hmm, creo que pasamos.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "Puede que a Woodie le guste", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "¡Wow! ¡Es licor de chocolate!", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Ugh, solo queremos leche normal.", -- Rumchata (Rum mixed with dairy product)

            -- Collaboration Distillery Spirits (Warly Exclusive)

            MOONWAY = "¡Es un color muy bonito!", -- Rainbow Jellyfish Spirits Liqueur
            ARRACK = "Deberíamos comer cocos en su lugar.", -- Arrack (Indonesian version of Coconut Wine)
            CHERRY_BLOOM_RUM = "Hmm, ¿Deberíamos usar esto para decorar la casa de nuestras amigas arañas?", -- Cherry Blossom Honey Wine Liqueur Floating in Cherry Forest
            RICE_SPIRITS = "¡Esto no es agua!", -- Cheongju (Korean rice wine)
            WHEAT_WHISKEY = "¡Preferiría que fuése pan!", -- Wheat Whiskey
            PALE_WHISKEY = "Ugh, este alcohol es realmente extraño.", -- Pale Malt Whiskey

            -- Warly-exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "¡Sorprendete y aterrador!", -- Coconut Brandy (Renamed as Caribbean Brandy since you can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "¡Quackowak!", -- Boom Berry Sapphire (Explodes into carrots)

            -- Pot Recipes

            DARK_RUINCOLATE = "No parece que se le haya quemado a Warly, ¿Que pasó?", -- Dark Chocolate
            WHITE_RUINCOLATE = "¡Compartámoslo con nuestros amigos!", -- White Chocolate
            RUINCOLATE = "¡Está dulce y rico!", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Hmm, el sabor chocolatoso es muy débil.", -- Schokakola

            -- Bucket Descriptions

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "¡Hagámos castillos de arena con esto!", -- Empty Steel Bucket
                FULL = "¡Está lleno con agua de lluvia!", -- Clean rainwater in the bucket
                FULL_ICE = "¡Está sólidamente congelado!", -- Rainwater frozen into ice
                DIRTY = "Puede que haya bichos dentro.", -- Rainwater turned dirty
                DIRTY_ICE = "¡Ahora esta sucio y congelado!", -- Dirty rainwater frozen into ice
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Se ve frágil para ser usado como silla.", -- Empty Woodie's Bucket
                FULL = "¡Está lleno con agua de lluvia!", -- Clean rainwater in the bucket
                FULL_ICE = "¡Está sólidamente congelado!", -- Rainwater frozen into ice
                DIRTY = "Puede que haya bichos dentro.", -- Rainwater turned dirty
                DIRTY_ICE = "¡Ahora esta sucio y congelado!", -- Dirty rainwater frozen into ice
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Es un poco pequeño para que quepan nuestros amigos.", -- Empty Wooden Bucket
                FULL = "¡Está lleno con agua de lluvia!", -- Clean rainwater in the bucket
                FULL_ICE = "¡Está sólidamente congelado", -- Rainwater frozen into ice
                DIRTY = "Puede que haya bichos dentro.", -- Rainwater turned dirty
                DIRTY_ICE = "¡Ahora esta sucio y congelado!", -- Dirty rainwater frozen into ice
            },

            DESALINATOR =
            {
                EMPTY = "Sr. Desalinizador, ¿Tiene algo de agua?", -- Desalinator with no water
                PURIFY_LONG = "¡Va a tomar un poco para separarla sal del agua!", -- A lot of time left for purification
                PURIFY_SHORT = "¡El agua es casi pura!", -- Purification is almost complete
                HASWATER = "¿Podría tomar un poco de agua limpia, Sr. Desalinizador?", -- Desalinator has clean water
                BURNT = "El Sr. Desalinizador no se ve muy bien.", -- Desalinator is burnt
                HASSALT = "Sr. Desalinizador, ¿Tiene demasiada sal?", -- Desalinator has excess salt
            },

            BARREL =
            {
                GENERIC = "Podemos guardar nuestra agua aquí.", -- Examining a barrel
                BURNT = "Supongo que es inútil ahora.", -- Barrel is burnt
            },

            BREWERY =
            {
                EMPTY = "¡No creo que escondernos dentro de este barril sea buena idea!", -- Examining an empty brewery
                BURNT = "Hmm, está todo quemado.", -- Brewery is burnt
                FERMENTING_LONG = "El maestro dijo que debemos esperar.", -- A lot of time left for fermentation
                FERMENTING_SHORT = "¡Estará listo pronto!", -- Fermentation is almost complete
                DONE = "¡La bebida está lista!", -- Drink is in the brewery
            },

            CAMPKETTLE_ITEM = "¡Deberé cargarlo con nuestros brazos extra!", -- Examining a portable kettle (item)
            CAMPKETTLE =
            {
                GENERIC = "Hmm, no es nada útil así.", -- Examining a camp kettle with no water
                BOILING_LONG = "Nuestras patas se podrían quemar.", -- Just started boiling
                BOILING_SHORT = "¡Está saliendo el vapor!", -- Almost done boiling
                DONE = "¡Agua limpia!", -- Water is ready
                STOP = "Ya no está hieviendo.", -- No fire under the kettle
            },

            CAMPDESALINATOR_ITEM = "¡Tendré que cargarlo con nuestras patas extra!", -- Examining a portable desalinator (item)
            CAMPDESALINATOR =
            {
                GENERIC = "Hmm, no es muy útil así.", -- Examining a camp desalinator with no water
                BOILING_LONG = "Todavía está muy salada.", -- Just started desalination
                BOILING_SHORT = "¡La mayoría está limpia!", -- Almost done desalinating
                DONE = "¡Hora de tomar agua!", -- Clean water is ready
                STOP = "El filtro se ha detenido.", -- No fire under the desalinator
            },

            KETTLE =
            {
                EMPTY = "¡Pon algo de ingredientes para una bebida!", -- Examining an empty kettle
                BURNT = "No podemos tomar nada de aquí.", -- Kettle is burnt
                BOILING_LONG = "No estrá listo tan rápido.", -- Just started making a drink
                BOILING_SHORT = "¡Está casi lsito!", -- Drink is almost ready
                DONE = "¡La bebida está lista!", -- Drink is made
                PURIFY_LONG = "No podemos hacer bebidas con agua así.", -- Just started purifying dirty water
                PURIFY_SHORT = "Hmm, ¡Está casi listo!", -- Almost done purifying dirty water
                HASWATER = "¿Deberíamos recolectar ingredientes?", -- Kettle has clean water
                MELT_LONG = "No puedo hacer bebidas con hielo.", -- Just started melting ice
                MELT_SHORT = "Hmm, ¡El hielo está casi derretido!", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "¡Hagamos algo de jugo para llevar!", -- Examining a portable kettle (item)
                EMPTY = "Oh, no hay nada dentro.", -- Examining an empty placed portable kettle
                BOILING_LONG = "Está tomando demasiado.", -- Just started boiling
                BOILING_SHORT = "¡La bebida estará lista dentro de ´poco!", -- Almost done boiling
                DONE = "Mmm, ¡Bebámoslo rápido!", -- Drink is ready
                PURIFY_LONG = "Ya queremos beberlo.", -- Just started purifying dirty water
                PURIFY_SHORT = "¡Está casi listo!", -- Almost done purifying dirty water
                HASWATER = "¡Agreguémos algunos ingredientes!", -- Portable kettle has clean water
                MELT_LONG = "No puedo preparas bebidas con hielo.", -- Just started melting ice
                MELT_SHORT = "Hmm, ¡El hielo está casi derretido!", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Wow, ¡Parece un experimento gigante!", -- Examining an empty distiller
                DISTILLTING_LONG = "Tardará un poco en estar listo.", -- A lot of time left for distillation
                DISTILLING_SHORT = "¡Está casi listo!", -- Distillation is almost complete
                DONE = "¡Veámos que hemos hecho!", -- Drink is in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "¡Es increíblemente fuerte!", -- Maximum pressure
                MIDDLE_PRESSURE = "Está trabajando duro.", -- Medium pressure
                LOW_PRESSURE = "No se vé muy enérgico.", -- Almost no pressure
                RECHARG_PRESSURE = "Hmm, ¡Vaciaré un poco de agua para nosotros!", -- No pressure (needs to reach maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Ya no tiene combustible.", -- Examining a sprinkler with low fuel
                ON = "¡Hora de jugar con el agua!", -- Sprinkler is on
                OFF = "Está dormido.", -- Sprinkler is off
            },
        },
    }
