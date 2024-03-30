return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Hay que quitar la cubeta primero.", -- Trying to give a bucket when the well already has one
            WELL_BUSY = "Ten paciencia, el pozo ya tiene una cubeta.", -- Trying to give a bucket when the well still contains one
        }
    },

        ANNOUNCE_DRUNK = "¿Perdí en el juego de beber? Hip.", -- Drunk
        ANNOUNCE_DRUNK_END = "¿Aún estoy en el banquete de Egis?", -- Sobers up from being drunk (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "¡Jajaja! ¡Otro trago!", -- Temporary. Exclusive to Wigfrid.
        ANNOUNCE_NOTCHARGE = "Parece que la cabra rayo no esta cargada, así no puedo ordeñarla.", -- Trying to milk the lightning goat with a bucket when it's not charged
        ANNOUNCE_NOTHIRSTSLEEP = "Si duermo así, tendré sed toda la noche, antes debería beber agua..", -- Trying to sleep at night when thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "¿Cómo puedo descansar así cuando tengo la garganta tan seca?", -- Trying to rest during the day when thirsty
        ANNOUNCE_SLEEP_END = "¡Me siento renovada!", -- Wakes up after sleeping and completely sobers up
        ANNOUNCE_THIRST = "Desearía tener una bebida fresca.", -- Very thirsty!

        ANNOUNCE_CAFFINE_BUFF_START = "¡Nadie puede alcanzar mi ritmo!", -- Caffeine buff starts
        ANNOUNCE_CAFFINE_BUFF_STOP = "Eh vuelto a mi ritmo usual.", -- Caffeine buff ends

        ANNOUNCE_CURE_WATERBORNE = "La próxima vez, debería beber agua purificada para evitar enfermar en las batallas.", -- Announcing curing waterborne disease with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "¡Thor, podría estar bebiendo todo el día!", -- Just before getting drunk
        ANNOUNCE_DCAPACITY_HALF = "¡Siento que el miedo se desvanece!", -- Beginning to get drunk

        DESCRIBE =
        {
            BOILBOOK = "¿Cuántas recetas para un banquete estarán escritas en este libro?",

            WATER_CLEAN_ICE = "Congelado.", -- Clean ice
            WATER_DIRTY_ICE = "Hielo con impurezas.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "Un polvo que añade emoción de batalla a mi festín.", -- Pepper spice

            WELL_KIT = "Con gusto instalaré un pozo.", -- Well kit
            WELL_SPRINKLER_KIT = "Una máquina que hace llover sin nubes.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Las máquinas saquearán el mundo subterráneo.", -- Steam water pump kit
            WELL_BURYING_KIT = "Asegurémonos de que nadie pise esto.", -- Hole burying kit
            WELL_DRILLING = "¡Empuja todo el camino hasta Styx!", -- Drilling a hole with a drill
            WELL_DRILLING_ITEM = "Una poderosa herramienta para abrir un camino al mundo subterráneo.", -- Drill item
            HOLE = "Puedo escuchar agua ahí abajo.", -- Well hole
            WELL = "Un pozo para la sed.", -- Well

            -- Waterlogged plants

            TEA_TREE = "Un arbusto aromático.", -- Tea tree
            DUG_TEA_TREE = "Tengo esperanza de regresarlo a la diosa Sif.", -- Tea tree dug up
            TEA_SEED = "Este joven árbol esta atrapado en sus ropas rojas.", -- Tea tree seed
            TEA_SEED_COOKED = "El joven árbol fue cocinado.", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "¡Crece fuerte joven árbol!", -- Tea tree sapling
            TEALEAVES = "Un montón de hojas perfumadas.", -- Tea leaves
            TEALEAVES_DRIED = "Un puñado de hojas de té secas.", -- Dried tea leaves

            CAFFEINBERRY = "Un matorral que da granos de vitalidad.", -- Coffee thicket
            DUG_CAFFEINBERRY = "Vayamos juntos.", -- Dug coffee thicket
            CAFFEINBERRY_BEAN = "Necesita tostarse para ponerse negro.", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Un grano con vitalidad desbordante.", -- Cooked coffee bean

            RUINCACAO_TREE = "Un árbol de eras oscuras.", -- Cacao tree
            DUG_RUINCACAO_TREE = "Tengo esperanza de que regrese a la diosa Sif.", -- Dug cacao tree
            RUINCACAO_SEED = "Superó el miedo para convertirse en un brote.", -- Cacao seedling item
            RUINCACAO_SEED_SAPLING = "Ha dejado el miedo atrás, ¡Crece joven árbol!", -- Cacao seedling planted
            RUINCACAO = "¿Hay árboles jóvenes esperando a ser quemados?", -- Cacao pod before smashing
            RUINCACAO_BEAN = "Está rebosante de aceite", -- Smashed cacao bean
            RUINCACAO_BEAN_COOKED = "El árbol joven fue cocinado.", -- Cooked cacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Elevará la calidad de los licores del banquete.", -- Seed herbs (Anise, Juniper Berry, Star of Motif) additive for liqueurs
            ADDITIVE_PETALS = "Parecen regalos de la diosa Freya.", -- Herb, tea leaves, and flower petals additive for liqueurs
            ADDITIVE_NUT = "Jovenes árboles que fueron recolectados.", -- Birch Nut, Coconut, Coffee Bean, Cacao Bean additive for liqueurs
            ADDITIVE_DAIRY = "¿Estamos poniendo lácteos en el alcohol?", -- Dairy additive for liqueurs

            -- Beverages

            WATER_CLEAN = "Agua pura.", -- Clean water
            WATER_DIRTY = "Agua salvaje e indómita.", -- Dirty water
            WATER_SALTY = "Una taza de agua marina.", -- Seawater

            GOOPYDRINK = "Principalmente desechos de comida.", -- Failed drink (concept of wet grilling)

            -- Teapot beverages

            FRUITJUICE = "Soló me tomaré el agua de esta bebida.", -- Mixed fruit juice
            BERRIES_JUICE = "Siento el olor a frutos rojos.", -- Berry juice
            POMEGRANATE_JUICE = "Voy a pensar que es la sangre de la fruta.", -- Pomegranate juice
            BANANA_JUICE = "Jugo para monos, parece.", -- Banana juice
            FIG_JUICE = "Hay una cantidad excesiva de fruta ahí.", -- Fig juice
            DRAGONJUICE = "Lleno de fruta blanca.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Voy a pretender que es agua de un manantial brillante.", -- Glowberry juice
            WATERMELON_JUICE = "Esto es agua, no jugo de fruta.", -- Watermelon juice

            VEGGIE_TEA = "¿En verdad voy a beber esto?", -- Vegetable juice
            CARROT_TEA = "¡Cómo es que los guerreros sirven comida para conejos de esta forma!", -- Carrot tea
            CACTUS_TEA = "Muy bien, vamos a pensar en ello como un homenaje a las hojas.", -- Cactus tea
            TOMATO_JUICE = "Solo me tomaré el agua de estos vegetales.", -- Tomato juice
            LUMPY_TEA = "Pensemos que es la esencia de las hortalizas de raíz en agua.", -- Root tea
            SEAWEED_SHAKE = "Espantoso. ¡Absolutamente espantoso!", -- Seaweed shake

            GREENTEA = "Es sólo... agua con sabor a hoja.", -- Fresh leaf green tea
            BLACKTEA = "No tengo tiempo para reuniones ociosas.", -- Black tea
            BLACKTEA_ICED = "Está frío.", -- Iced black tea
            FUER = "¡Es sólo un poco de helecho!", -- Bohee tea, leaf tea, fern tea
            MIXFLOWER = "Las bendiciones de Freya están aquí.", -- Mixed flower petal tea
            HIBISCUSTEA = "La flor está derramando lágrimas.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Me tomaré el agua, pero no la flor.", -- Cactus flower tea
            LOTUSTEA = "¡Dame pescado! ¡Pescado!", -- Lotus flower tea
            SUSHIBISCUS = "Está indudablemente maldito.", -- Suicide tea
            MOON_BLOSSOM_TEA = "En efecto, contiene las bendiciones de Mani.", -- Moonflower tea

            CAFFEINBERRY_JUICE = "Es amargo, y mi corazón se acelera.", -- Black coffee
            TOFFEE_LATTE = "Es dulce y con sabor a nueces.", -- Toffee nut latte
            RUINCHA_LATTE = "Mi mente esta despertando.", -- Mocha latte (Coffee + Chocolate)

            HOTRUINCOLATE = "Calienta incluso el alma.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "¿Esta es la bebida de los gigantes de hielo?", -- Chocolate smoothie (Cold)
            RUINXOCOLATL = "Una bebida de guerreros ancestrales.", -- Chocolatl (Spicy)
            TEA_RUINCOLATE_LATTE = "Despierta mi alma.", -- Matcha chocolate latte

            MULLED = "Dará un respiro a las almas cansadas.", -- Bhang
            BUTTERBEER = "El valor de los jóvenes magos es alto.", -- Butterbeer from the Harry Potter series

            -- Collaboration Teapot Drinks

            COCONUT_JUICE = "Está lleno de pulpa blanda.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "¡Tiene la bendición de Freya!", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "¡Beberé esto con gusto!", -- Shipwrecked Cratered Moonrock Shake
            CHERRY_ROSEBERRIES_TEA = "¿Debo beber una bebida con frutos tan viles?", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Esta agua miel es realmente exquisita.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "¿Esto no contiene semillas?", -- Vita-Hybiscus Sweet Rice Punch
            PINEANANAS_JUICE = "Aplastaron las duras escamas para obtener la carne.", -- Reign of Giants Pineananas Juice
            ORANGE_JUICE = "¿Me está pidiendo que beba su jugo agrio?", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Un brebaje frío de frutas rojas.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Un brebaje rosa y afrutado.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "El tiempo no le dio conocimiento, sino podredumbre.", -- Spoiled Drink

            -- Distillery Soda

            SODA = "Refresco de agua manantial.", -- Carbonated Water
            FRUITSODA = "Es ponche de frutas.", -- Fruit Punch Soda
            LEMONLIMESODA = "No es una bebida digna de un guerrero.", -- Lemon Lime Soda (Superior version of Fruit Soda)
            COLA = "Es tan seductor como la oscuridad misma.", -- Cola
            COLAQUANTUM = "¡Hace que mi corazón se acelere!", -- Quantum Cola
            LUMPY_BEER = "Esta imbuido con una variedad de esencias.", -- Root Beer (Not alcoholic)

            -- Distillery Spirits

            CORN_BEER = "Es una imitación falsa de la cerveza alemana.", -- Corn Beer
            MADHU = "¡Es el dulce vino de Xiye!", -- Mead
            WINE = "Esta hecho con la sangre del profeta.", -- Wine (Basic berry brew)
            NOBLEWINE = "¿Es para acompañar mi carne?", -- Noble Wine (Cooked berry brew)
            SPARKLINGWINE = "No es una bebida para la celebración de guerreros.", -- Sparkling Wine
            GLOWBERRYWINE = "Es como la sangre de Knasir.", -- Glow Berry Wine
            KUMIS = "Que los dioses nos ayuden, ¿Hacer alcohol con leche?", -- Kumis, fermented yak milk
            LUMPY_WINE = "Esto no saciará mi sed.", -- Mead with Potatoes, Sweet Potatoes, or Roots
            PULQUE = "¡Es la sangre de Mayahuel!", -- Pulque (Agave brew)
            RUINCACAO_WINE = "¿Este es el vino de los toltecas?", -- Cacao Wine

            -- Collaboration Soda

            CHERRY_DOCTOR_COLA = "Es un repulsivo caos carmesí.", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Ya sean piñas o fruta, no está bien.", -- Pineapple Soda (Orang-Soda)
            ORANGESODA = "Es agua mineral con un penetrante sabor a frutas.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "Este refresco no da el ancho para los guerreros.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaboration Spirits

            AUROBOW = "Brilla con una luz tenue y hermosa", -- Shipwrecked Oroborou, Rainbow Jelly Spirits
            COCONUT_WINE = "El olor al aceite de palma es fuerte.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Una bebida deliciosa y con una bella presentación .", -- Cherry Forest Cherry Blossom Mead
            GIANT_BLUEBERRY_WINE = "¡Es una bebida poderosa!", -- Vita-Hybiscus Boom! Berry Sapphire (Explodes when ignited)
            RICE_WINE = "¡Es tan claro que es transparente!", -- Vita-Hybiscus Makgeolli
            WHEAT_BEER = "Solo es cerveza ¿Cierto?", -- Hip of Food Wheat Beer
            PALE_BEER = "¿Esto es cerveza?", -- Reign of Giants Pale Ale (Turquoise beer made from Monsterlas)

            -- Distillery Liquors

            DISINFECTANT = "¡Para limpiar heridas y realizar curaciones!", -- Disinfectant
            CORN_WHISKEY = "Es dulce y aromatico.", -- Corn Whiskey
            LUMPY_VODKA = "Yo declaro, que beberé esto como agua.", -- Vodka
            TEQUILA = "¡Es una bebida áspera y salvaje!", -- Tequila
            MADHU_RUM = "Los vikingos no bebían esto.", -- Rum
            BERRY_BRANDY = "Este es el licor de los nobles altaneros.", -- Berry Brandy
            AREUHI = "No está mal, creo.", -- Kumis, fermented mare's milk

            -- Warly Exclusive Distillery Spirits

            BERRY_GIN = "Es una bebida suave cuando se consume con moderación, pero se convierte en mala si se consume en exceso.", -- Gin
            GLOWBERRY_GIN = "Es una bebida bendecida por el dios Balder.", -- Glow Berry Gin
            ABSINTHE = "¡Tiene un olor refrescante!", -- Absinthe
            TEA_LUMPY_VODKA = "El aroma de las hojas de té emana del licor.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Los guerreros no tienen tiempo para disfrutar del perfume de las flores.", -- Rose Petal Brandy
            KAHLUA = "Soy una guerrera, esta bebida es demasiado dulce para mi.", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "El olor a nueces es muy fuerte.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "¿Esto es para niños?", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Yo prefiero beber el alcohol y la leche separados.", -- Rumchata (Mixture of rum and dairy)

            -- Collaboration Distillery Spirits

            MOONWAY = "¡Es la esencia de la luz!", -- Shipwrecked Rainbow Jelly Spirits Distilled
            ARRACK = "Puedo sentir los aromas de las palmeras.", -- Arrack, Indonesian version of Coconut Wine Distilled
            CHERRY_BLOOM_RUM = "Captura la esencia de la grandeza.", -- Cherry Blossom Honey Rum Distilled, Cherry Blossom Petals Floating Drink
            RICE_SPIRITS = "¡Es muy limpio y refrescante!", -- Soju
            WHEAT_WHISKEY = "Es dulce y aromático.", -- Wheat Whiskey
            PALE_WHISKEY = "Tiene un aroma áspero y amargo.", -- Pale Malt Whiskey

            -- Warly's Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "Los vikingos eran guerreros y exploradores, no piratas.", -- Coconut Brandy (Renamed to Caribbean Brandy since you can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "¡Poder abrumador!", -- Boom Berry Sapphire (Explodes like a carrot)

            -- Pot Cooking

            DARK_RUINCOLATE = "¿Puede mi camarada hacer salmiakki?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Los vikingos no disfrutan los bocadillos dulces.", -- White Chocolate
            RUINCOLATE = "Es una porción aceptable.", -- Just Chocolate
            RUIN_SCHOKAKOLA = "Despierta la emoción del campo de batalla.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Es una cubeta de hierro.", -- Empty iron bucket
                FULL = "Esta llena de agua limpia.", -- Clean rainwater is inside
                FULL_ICE = "Se ha congelado.", -- The rainwater has frozen
                DIRTY = "Está sucio.", -- The rainwater has become dirty
                DIRTY_ICE = "Se ha vuelto un vertedero sucio.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Convirtió los troncos el tronco con gran habilidad.", -- Empty wooden log bucket
                FULL = "Está lleno de agua limpia.", -- Clean rainwater is inside
                FULL_ICE = "Se ha congelado.", -- The rainwater has frozen
                DIRTY = "Esta sucio.", -- The rainwater has become dirty
                DIRTY_ICE = "Se volvió un vertedero sucio.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Es una cubeta de madera vacía.", -- Empty wooden bucket
                FULL = "Está lleno de agua limpia.", -- Clean rainwater is inside
                FULL_ICE = "Se ha congelado.", -- The rainwater has frozen
                DIRTY = "Esta sucio.", -- The rainwater has become dirty
                DIRTY_ICE = "Se volvió un vertedero sucio.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Esta completamente vacío.", -- There's no water in the desalinator
                PURIFY_LONG = "Es mejor hacer algo a quedarme esperando.", -- There's still a lot of purification left
                PURIFY_SHORT = "Es bastante refrescante.", -- Purification is almost done
                HASWATER = "Está lleno de agua dulce.", -- There's clean water in the desalinator
                BURNT = "Se lo tragaron las llamas.", -- The desalinator has burned down
                HASSALT = "Hay mucho mineral ahí.", -- There's still salt in the desalinator
            },

            BARREL =
            {
                GENERIC = "Retendrá mi agua.", -- Examining the barrel
                BURNT = "No pudo escapar del toque de Logi.", -- The barrel has burned down
            },

            BREWERY =
            {
                EMPTY = "Declaro que no haré ponche con verduras y frutas.", -- Examining the brewery
                BURNT = "Llorar por espíritus secos es inútil.", -- The brewery has burned down
                FERMENTING_LONG = "Es mejor hacer otra cosa mientras espero.", -- There's still a lot of fermentation left
                FERMENTING_SHORT = "¡Es hora de prepararse para la fiesta!", -- Fermentation is almost done
                DONE = "¿Está listo el ponche para la fiesta?", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "Es una tetera improvisada.", -- Examining the portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "Esta vacía.", -- There's no water in the makeshift kettle on the campfire
                BOILING_LONG = "Seamos pacientes, no ha hervido suficiente.", -- Water is starting to boil
                BOILING_SHORT = "No le tomará mucho.", -- Water is almost boiling
                DONE = "Ahora está listo para beber.", -- Clean water is obtained
                STOP = "Primero hay que encender la leña.", -- The lack of fire in the campfire prevents dirty water from boiling
            },

            CAMPDESALINATOR_ITEM = "Es una olla que convierte el agua salada en dulce.", -- Examining the portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "La olla parece estar en sequía.", -- No water
                BOILING_LONG = "El agua salada se convierte en nubes.", -- Water is starting to boil
                BOILING_SHORT = "¡Está lloviendo dentro de la olla!", -- Water is almost boiling
                DONE = "Esta llena de agua dulce.", -- Clean water is obtained
                STOP = "Necesitamos encender el fuego primero.", -- The lack of fire in the campfire prevents saltwater from purifying
            },

            KETTLE =
            {
                EMPTY = "No es para hacer estofados de carne.", -- Examining an empty kettle
                BURNT = "Fue devorado por las llamas.", -- The kettle has burned down
                BOILING_LONG = "No esperemos, hagamos otra cosa.", -- The process of making a drink has just started
                BOILING_SHORT = "El té esta casi listo.", -- The drink is almost ready
                DONE = "El té esta listo.", -- The drink is ready
                PURIFY_LONG = "Hay que ser pacientes, no ha hervido lo suficiente.", -- The process of boiling dirty water has just started
                PURIFY_SHORT = "Ya no le tomará mucho.", -- The dirty water is almost ready
                HASWATER = "Esta lleno de agua dulce.", -- There's clean water in the kettle
                MELT_LONG = "Todavía está helado.", -- The process of melting ice water has just started
                MELT_SHORT = "El agua dulce esta casi lista.", -- The ice water is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "El campo de batalla no es lugar para un banquete.", -- Examining the portable kettle item
                EMPTY = "No hay lugar para carne.", -- Examining an empty placed portable kettle
                BOILING_LONG = "Es mejor encontrar a mis enemigos en lugar de hacer una bebida.", -- The process of making a drink has just started
                BOILING_SHORT = "La bebida está casi lista.", -- The drink is almost ready
                DONE = "Bebámoslo rápido y volvamos a la batalla.", -- The drink is ready
                PURIFY_LONG = "Hay que ser pacientes, no ha hervido lo suficiente", -- The process of boiling dirty water has just started
                PURIFY_SHORT = "Ya no le tomará mucho.", -- The dirty water is almost ready
                HASWATER = "Un guerrero no tiene tiempo para un banquete, retiremos el agua.", -- There's clean water in the portable kettle
                MELT_LONG = "Todavía esta helado.", -- The process of melting ice water has just started
                MELT_SHORT = "El agua dulce esta lista.", -- The ice water is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "¡Podría llamarse el caldero de Hymir!", -- Examining the distiller
                DISTILLTING_LONG = "El ambiente está apagándose ... ¡Date prisa, caldero!", -- There's still a lot of distillation left
                DISTILLING_SHORT = "Estará listo en un santiamén.", -- Distillation is almost done
                DONE = "¿Hay alcohol fuerte?", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Su poder es comparable al de gigantes.", -- Maximum pressure
                MIDDLE_PRESSURE = "La bestia mecánica esta trabajando duro.", -- Medium pressure
                LOW_PRESSURE = "La bestia mecánica esta perdiendo poder.", -- Low pressure
                RECHARG_PRESSURE = "La bestia esta descansando.", -- No pressure (cannot be used until it reaches maximum pressure)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "El combustible se esta acabando.", -- Examining the sprinkler with low fuel
                ON = "La lluvia viene desde el subterráneo.", -- Sprinkler is active
                OFF = "¿Has encontrado un lugar para rociar la lluvia?", -- Sprinkler is off
            },
        },
    }

   