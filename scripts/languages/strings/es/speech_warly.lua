return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Ocupémonos primero de la cubeta llena.", -- Attempting to give a filled bucket when the well is not empty
            WELL_BUSY = "Ups, parece que la cubeta ya está bajando.", -- Attempting to give a bucket when it's already inside the well
        }
    },

    ANNOUNCE_DRUNK = "Hipo, me dijeron que me divirtiera, pero que no me emborrachara...", -- Drunk
    ANNOUNCE_DRUNK_END = "Necesito preparar una comida que me cure la resaca..", -- Sobering up from being drunk (hungover)
    ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. For Wigfrid only.
    ANNOUNCE_NOTCHARGE = "Ordeñarla ahora no producirá ningún resultado.", -- Trying to milk the Electric Milk Goat without it being charged
    ANNOUNCE_NOTHIRSTSLEEP = "¡Mi sed es mas grande que mi cansancio!", -- Trying to sleep at night with low thirst
    ANNOUNCE_NOTHIRSTSIESTA = "¡Mi sed es mayor que mi fatiga!", -- Trying to take a siesta during the day with low thirst
    ANNOUNCE_SLEEP_END = "Ah... Debo ser más cauteloso y evitar los excesos la próxima vez..", -- Waking up after sleeping and sobering up completely
    ANNOUNCE_THIRST = "Debo beber algo...", -- Very thirsty

    ANNOUNCE_CAFFINE_BUFF_START = "Ahh, ¡Me siento vigorizado!", -- Starting the caffeine buff
    ANNOUNCE_CAFFINE_BUFF_STOP = "Anhelo un espresso recién hecho.", -- Ending the caffeine buff

    ANNOUNCE_CURE_WATERBORNE = "Mi estómago se ha calmado un poco.", -- Wigfrid refusing to drink contaminated water

    ANNOUNCE_DCAPACITY_CRITICAL = "Tengo que dejar de beber.", -- Very close to getting drunk
    ANNOUNCE_DCAPACITY_HALF = "Mmm, me siento un poco mareado.", -- Starting to feel the effects of drinking

    DESCRIBE =
    {
        BOILBOOK = "También debería apuntar algunas recetas de cócteles.",

        WATER_CLEAN_ICE = "¿Debería molerlo para hacer hielo raspado?", -- Clean ice
        WATER_DIRTY_ICE = "No puedo usar este hielo sucio para cocinar.", -- Dirty ice

        SPICE_CAFFEINPEPPER = "Realza el sabor de cualquier plato.", -- Caffeine pepper spice

        WELL_KIT = "¡Si ahora hubiera un manantial de agua limpia...!", -- Well Kit
        WELL_SPRINKLER_KIT = "Con esto puedo servirle agua fácilmente a mis invitados del jardín", -- Sprinkler Kit
        WELL_WATERPUMP_KIT = "¡Es como un dispensador de agua!", -- Steam Water Pump Kit
        WELL_BURYING_KIT = "Debemos asegurarnos que nadie tropiece con estos agujeros.", -- Hole Burying Kit
        WELL_DRILLING = "Debo evitar cocinar cerca de ese taladrerío.", -- Drilling a hole with a drill
        WELL_DRILLING_ITEM = "Esto encontrará la veta de agua y perforará un agujero.", -- Drilling item
        HOLE = "Puedo oír el sonido de el agua fluyendo.", -- Well hole
        WELL = "¡Ampliemos nuestro suministro de agua potable!", -- Well

        WX78MODULE_NONEDRUNK = "Eso le da a nuestro amigo metálico un poco más de sabor, ¿verdad?", -- 

        -- Waterlogged Plant Mod

        TEA_TREE = "Normalmente se encuentran al otro lado del mar, supongo.", -- Tea tree
        DUG_TEA_TREE = "Me abasteceré de las hojas de té localmente.", -- Tea tree dug from the ground
        TEA_SEED = "Me pregunto qué habrá dentro de esta semilla.", -- Tea tree seed
        TEA_SEED_COOKED = "No parece muy valioso como ingrediente culinario.", -- Roasted tea tree seed
        TEA_SEED_SAPLING = "Todavía es muy joven.", -- Tea tree sapling
        TEALEAVES = "Debería procesarlas primero.", -- Tea leaves
        TEALEAVES_DRIED = "Ahora, todo lo que necesita es agua caliente...", -- Dried tea leaves

        CAFFEINBERRY = "Si creciera, tendría granos de café cada mañana.", -- Coffee bush
        DUG_CAFFEINBERRY = "Este es un café para llevar.", -- Coffee bush dug from the ground
        CAFFEINBERRY_BEAN = "Espera, ¿tiene un toque... de aroma a pimienta...?", -- Raw coffee bean
        CAFFEINBERRY_BEAN_COOKED = "¡Espléndido!", -- Roasted coffee bean

        RUINCACAO_TREE = "Usualmente hay que cruzar el mar para verlo.", -- Cacao tree
        DUG_RUINCACAO_TREE = "¿Debería revivirlo?", -- Cacao tree dug from the ground
        RUINCACAO_SEED = "Es bastante escalofriante.", -- Cacao sapling item
        RUINCACAO_SEED_SAPLING = "Es bastante aterrador.", -- Cacao sapling planted
        RUINCACAO = "Debería ver que tiene dentro.", -- Unbroken cacao pod
        RUINCACAO_BEAN = "¡Iug! ¡Esto huele grasoso!", -- Broken cacao pod
        RUINCACAO_BEAN_COOKED = "No puedo comerlo así.", -- Roasted cacao pod

        -- Distiller Additives

        ADDITIVE_SEED = "Añadiré esto para mejorar el sabor de los licores.", -- Liquor additive seed (anise, juniper berry, or star motif)
        ADDITIVE_PETALS = "Le añade un toque de elegancia a los licores.", -- Liquor additive herb or flower petals
        ADDITIVE_NUT = "Esto dará a los licores un aroma único.", -- Liquor additive nut (burchi nut, coconut, coffee bean, or cacao bean)
        ADDITIVE_DAIRY = "Perfecto para preparar bebidas aptas para principiantes.", -- Liquor additive dairy product

        -- Drinks

        WATER_CLEAN = "El agua pura y sin sabor, es esencial para cocinar.", -- Clean water
        WATER_DIRTY = "No puedo usar esta agua para cocinar.", -- Dirty water
        WATER_SALTY = "¿Seguro que es suficiente para purificarla?", -- Saltwater

        GOOPYDRINK = "¡Esto es puro caos! ¡Absolutamente puro caos!", -- Failed drink (wet goop) - Gordon Ramsay's quote

        -- Teapot Drinks

        FRUITJUICE = "¡Es una mezcla de varios sabores frutales!.", -- Mixed fruit juice
        BERRIES_JUICE = "Sencillo, ligeramente ácido y dulce.", -- Berry juice
        POMEGRANATE_JUICE = "¡Su sabor nítido, despierta el apetito!", -- Pomegranate juice
        BANANA_JUICE = "Un éxito en general, sin duda.", -- Banana juice
        FIG_JUICE = "Las semillas le dan una textura interesante.", -- Fig juice
        DRAGONJUICE = "Es suave y exótica, una mezcla perfecta si buscas una aventura.", -- Dragon fruit juice
        GLOWBERRYJUICE = "Hice este jugo con bayas especiales.", -- Glowberry juice
        WATERMELON_JUICE = "¡Cuanto más sediento más dulce es el sabor!", -- Watermelon juice

        VEGGIE_TEA = "Lo amargo puede ser bueno.", -- Green juice
        CARROT_TEA = "Aunque no sea el favorito de todos, sigue siendo sano.", -- Carrot tea
        CACTUS_TEA = "¡La carne del interior es una delicia!", -- Cactus tea
        TOMATO_JUICE = "¡Una bebida que hasta los vampiros disfrutarían!", -- Tomato juice
        LUMPY_TEA = "¡Cuánto mas sorbo mas dulce se vuelve!", -- Root tea
        SEAWEED_SHAKE = "Nunca pensé que podría hacer una bebida con esto...", -- Seaweed shake

        GREENTEA = "Es como un té herbal, no está nada mal.", -- Green tea
        BLACKTEA = "Debería traer algunas galletas.", -- Black tea
        BLACKTEA_ICED = "Un té helado refrescante, sobre todo después de una comida pesada.", -- Iced black tea
        FUER = "Sorprendentemente, tiene un aroma agradable.", -- Baozi tea, leaf tea, fern tea
        MIXFLOWER = "¡Tiene un aroma agradable y es bueno para calmar los nervios!.", -- Mixed flower tea
        HIBISCUSTEA = "Lo recomiendo encarecidamente para nuestras invitadas.", -- Hibiscus tea
        CACTUSFLOWER_TEA = "Es como beber una pieza de arte.", -- Cactus flower tea
        LOTUSTEA = "¡Es completamente exótico y delicioso!", -- Lotus tea
        SUSHIBISCUS = "Esto es una burla al té y al buen gusto.", -- Suicide tea
        MOON_BLOSSOM_TEA = "Tiene un sabor único.", -- Moon blossom tea

        CAFFEINBERRY_JUICE = "Por ahora lo llamaré 'Azul medialuna'.", -- Black coffee
        TOFFEE_LATTE = "Un café dulce y con sabor a nuez para los que buscan algo fácil de tomar.", -- Toffee Nut Latte
        RUINCHA_LATTE = "Echo de menos un auténtico Moca martini.", -- Mocha Latte (Coffee + Chocolate)

        HOTRUINCOLATE = "Puedes disfrutarlo en cualquier lugar para relajarte.", -- Hot Chocolate
        RUINCOLATE_SMOOTHIE = "Los trocitos de chocolate y hielo son excepcionales.", -- Chocolate Smoothie (Chilled)
        RUINXOCOLATL = "Una bebida exótica llena de la sabiduría de los sudamericanos.", -- Xocolatl (Spicy)
        TEA_RUINCOLATE_LATTE = "El amargor de las hojas de té complementa el dulzor del chocolate.", -- Matcha Latte

        MULLED = "Te recomiendo esta bebida si te sientes indispuesto.", -- Bungsho
        BUTTERBEER = "La bebida más deliciosa del callejón Diagon.", -- Butterbeer from the Harry Potter series

        -- Collaboration Teapot Drinks

        COCONUT_JUICE = "Me hace sentir como si estuviera en unas vacaciones tropicales con cada sorbo.", -- Castaway Coconut Juice
        RAINBOW_SHAKE = "No tiene el sabor del arco iris, pero está bien.", -- Castaway Rainbow Jelly Shake
        QUARTZ_SHAKE = "En mi opinión, habría sido preferible que Nam pla", -- Castaway Quartz Crystals Shake
        CHERRY_ROSEBERRIES_TEA = "Tiene una fragancia deliciosa y ayuda a regular el calor corporal.", -- Cherry Blossom Rose Hip Tea
        CHERRY_HONEY_TEA = "Es una solución rápida para el dolor de garganta.", -- Cherry Blossom Cherry Honey Tea
        SWEET_RICE_DRINK = "¡Es dulce con una textura inusual!", -- Vitahebhi Sikhye
        PINEANANAS_JUICE = "Debo cuidar de no beber mucho, o me pelara la lengua.", -- Legion Pineapple Juice
        ORANGE_JUICE = "¡Es zumo de naranja recién exprimido!", -- More Food Pack Orange Juice
        STRAWBERRY_SMOOTHIE = "¡Está fresco y delicioso!.", -- More Food Pack Strawberry Smoothie
        STRAWBERRY_MILK_SMOOTHIE = "¡Es refrescante, y delicioso!", -- More Food Pack Strawberry Smoothie Latte

        --Brewery Drinks

        SPOILED_DRINK = "Ha pasado su fecha de caducidad.", -- Spoiled drink

        -- Brewery Soda

        SODA = "Agua carbonatada sin sabores extraños.", -- Carbonated water
        FRUITSODA = "¡Refrescante sabor frutal con un toque efervescente!", -- Fruit soda
        LEMONLIMESODA = "¡Tan refrescante como un melón!", -- Lemon-lime soda (Superior to fruit soda)
        COLA = "Los niños la adora.", -- Cola
        COLAQUANTUM = "Una dama se volvió loca buscando esto ...", -- Cola Quantum (Forn McRain: Fallout 3 Sierra Petrovita reference)
        LUMPY_BEER = "Los clientes a los que les gusta esta bebida sólo piden ésta.", -- Root beer (non-alcoholic)

        -- Brewery Spirits

        CORN_BEER = "Sabe aún mejor después de una comida grasosa.", -- Corn beer
        MADHU = "Me pregunto si Vilod sigue haciendo ese hidromiel con bayas de enebro mezcladas.", -- Mead (Forn McRain: Skyrim Honningbrew Mead story)
        WINE = "¡Es el mejor regalo de los dioses a los humanos!", -- Wine (Regular berry brewing)
        NOBLEWINE = "Sería mejor con un poco de queso azul y nueces.", -- Noble wine (Roasted berry brewing)
        SPARKLINGWINE = "Refresca y despierta el apetito.", -- Sparkling wine
        GLOWBERRYWINE = "¡Un nuevo intento de vino!", -- Glowberry wine
        KUMIS = "Sabiduría de la gente de Asia Central.", -- Kumis, fermented mare's milk
        LUMPY_WINE = "Tiene un cuerpo ligero con una acidez fresca.", -- Sake (Root liquor, includes potatoes, sweet potatoes, etc.)
        PULQUE = "Tiene una acidez persistente al paladar.", -- Pulque (Agave sap)
        RUINCACAO_WINE = "Lleno de sabor a cacao.", -- Cacao wine

        -- Collaboration Soda

        CHERRY_DOCTOR_COLA = "Es una bebida de nicho que cuenta con apasionados seguidores.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
        PINEANANASSODA = "Esta bebida es perfecta para ayudar a digerir una buena merienda.", -- Pineapple soda (Oran C)
        ORANGESODA = "¡Refrescante después de una comida!", -- Orange soda (Fanta)
        STRAWBERRYSODA = "Refresco dulce con sabor a fresa.", -- Strawberry soda (Welch's Strawberry)

        -- Collaboration Spirits

        AUROBOW = "Es una bebida verdaderamente colorida.", -- Rainbow Jellyfish Liquor (Aurobo)
        COCONUT_WINE = "Cremosamente dulce, con un toque de acidez y viscosidad.", -- Coconut Wine (Aurobo Coconut Wine)
        CHERRY_BLOOM_MADHU = "Se puede sentir la fragancia de fresas, frambuesas y un toque de vainilla.", -- Cherry Blossom Honey Mead (Cherry Forest Cherry Blossom Mead)
        GIANT_BLUEBERRY_WINE = "Parece que mi idea iba en una dirección ligeramente diferente.", -- Boom Berry Wine (Explodes when ignited)
        RICE_WINE = "Es una bebida tradicional de Asia Oriental.", -- Vitahebhi Makgeolli
        WHEAT_BEER = "Aroma de plátano único y fácil de beber.", -- Heap of Food Wheat Beer
        PALE_BEER = "¡Un nuevo intento de cerveza!", -- Legion Pale Ale (Light blue beer with Munstera fruit)

        -- Distilled Spirits

        DISINFECTANT = "¡No lo confundas con alcohol!", -- Disinfectant
        CORN_WHISKEY = "Se caracteriza por un balance entre un sabor dulce, un cosquilleo picante que despierta los sentidos, y un rico sabor cremoso.", -- Corn Whiskey
        LUMPY_VODKA = "Un vodka de alta calidad debe ser transparente, de sabor neutro y sin aroma perceptible.", -- Vodka
        TEQUILA = "Aroma suavemente amaderado.", -- Tequila
        MADHU_RUM = "Aroma dulce característico de las bebidas destiladas.", -- Rum
        BERRY_BRANDY = "Se puede olfatear un aroma abundante.", -- Berry Brandy
        AREUHI = "Sabor fresco y suave, pero cuidado con pasarse.", -- Kumis Distilled Spirit Areuhi

        -- Warly Exclusive Distilled Spirits

        BERRY_GIN = "El aroma a pino recuerda a un paseo por el bosque.", -- Gin
        GLOWBERRY_GIN = "Una fragancia enigmática como si tragase la misma luz.", -- Glow Berry Gin
        ABSINTHE = "Dulzor sutíl, aroma a ajenjo y una mezcla de sabores a especias y hierbas.", -- Absinthe
        TEA_LUMPY_VODKA = "Ha mezclado el amargor y el fuerte aroma de las hojas de té.", -- Green Tea Liqueur
        PETALS_BERRY_BRANDY = "Se siente el aroma de frambuesas, mandarinas, fresas y flores.", -- Rose Petal Brandy
        KAHLUA = "Tiene un fuerte sabor a café negro con un aroma dulce y mantecoso y matices de nuez.", -- Coffee Liqueur Kahlua
        NUT_CORN_WHISKY = "No puedo resistirme ante el ligero amargor y aroma a vainilla.", -- Nut Whiskey
        RUINCACAO_CREAM_LIQUEUR = "Puedes disfrutar del cremoso aroma y el dulce sabor del chocolate belga.", -- Baileys Cacao Cream Liqueur
        RUMCHATA = "El sabor a canela se combina con la vainilla, y resulta en un sabor de nuez cremoso.", -- Rumchata (Rum mixed with horchata, a dairy beverage)

        -- Collaboration Distilled Spirits

        MOONWAY = "Parece que contiene un arcoíris, con colores y aromas complejos.", -- Rainbow Jellyfish Distilled Spirit (Rainbow Jellyfish Liquor)
        ARRACK = "El aroma es rico y complejo, con notas de nuez que recuerdan a la palma.", -- Arrack Indonesian version of Coconut Wine
        CHERRY_BLOOM_RUM = "Incluso mirarlo es agradable.", -- Cherry Blossom Honey Rum (Cherry Blossom petals floating)
        RICE_SPIRITS = "El acabado es limpio y nítido.", -- Cheongju (Korean rice wine)
        WHEAT_WHISKEY = "Necesito platillos para acompañarlo.", -- Wheat Whiskey
        PALE_WHISKEY = "Gusto terroso y áspero, con un sabor único y agradable.", -- Pale Malt Whiskey

        -- Warly Exclusive Collaboration Distilled Spirits

        NUT_COCONUT_BRANDY = "Sería genial hacer una piña Colada con frutas.", -- Coconut Brandy (Caribbean Brandy, renamed as Caribbean Brandy due to not being able to make Caribbean Rum)
        GIANT_BLUEBERRY_GIN = "¡Bromear con comérselo es un pecado!", -- Boom Berry Sapphire (Explodes when ignited)

        -- Pot Cooking

        DARK_RUINCOLATE = "He experimentado y lo hice a mi manera", -- Dark Chocolate
        WHITE_RUINCOLATE = "Los niños se vuelven locos por el.", -- White Chocolate
        RUINCOLATE = "Dulce y encantador.", -- Just Chocolate
        RUIN_SCHOKAKOLA = "Una mordida definitivamente te despertará.", -- Schokakola

        BUCKET_STEEL_EMPTY = 
        {
            EMPTY = "Tuve una idea para hacer pudín con esto.", -- Empty steel bucket
            FULL = "¡Es agua limpia!", -- Clean rainwater is good
            FULL_ICE = "Sería perfecto para guardar el vino.", -- Rainwater has frozen
            DIRTY = "Hay muchos invitados verdes no deseados.", -- Rainwater has become dirty
            DIRTY_ICE = "Después de quitar el hielo, necesito hacer un lavado de utensilios adecuado.", -- Dirty rainwater has frozen
        },

        BUCKET_WOODIE_EMPTY = 
        {
            EMPTY = "Se cuidadoso y meticuloso al vaciarlo.", -- Empty wooden Woody's bucket
            FULL = "¡Es agua limpia!", -- Clean rainwater is good
            FULL_ICE = "Sería perfecto para guardar vino.", -- Rainwater has frozen
            DIRTY = "Hay muchos invitados verdes no deseados.", -- Rainwater has become dirty
            DIRTY_ICE = "Después de quitar el hielo, necesito hacer un lavado de utensilios adecuado.", -- Dirty rainwater has frozen
        },

        BUCKET_DRIFTWOOD_EMPTY = 
        {
            EMPTY = "¿Esta bien usar este tipo de cubos para sacar agua?",
            FULL = "¡Es agua limpia!", -- Clean rainwater is good
            FULL_ICE = "Sería perfecto para guardar vino.", -- Rainwater has frozen
            DIRTY = "Hay muchos invitados verdes no deseados.", -- Rainwater has become dirty
            DIRTY_ICE = "Después de quitar el hielo, necesito hacer un lavado de utensilios adecuado.", -- Dirty rainwater has frozen
        },

        BUCKET_EMPTY = 
        {
            EMPTY = "Es una cubeta hecha de madera tallada.", -- Empty wooden bucket
            FULL = "¡Es agua limpia!", -- Clean rainwater is good
            FULL_ICE = "Sería perfecto para guardar vino.", -- Rainwater has frozen
            DIRTY = "Hay muchos invitados verdes no deseados.", -- Rainwater has become dirty
            DIRTY_ICE = "Después de quitar el hielo, necesito hacer un lavado de utensilios adecuado.", -- Dirty rainwater has frozen
        },

        DESALINATOR =
        {
            EMPTY = "¿Debo llenarlo con agua de mar?", -- No water in the desalinator
            PURIFY_LONG = "Debería preparar algunos aperitivos mientras trabaja.", -- Still a long way to go until purification is complete
            PURIFY_SHORT = "El agua se está volviendo limpia.", -- Purification is almost complete
            HASWATER = "¡Hay suficiente para cocinar!", -- Clean water in the desalinator
            BURNT = "Intentaba conseguir sal asada, ¿eh?", -- The desalinator has burnt
            HASSALT = "Qué error, debería haber quitado la sal primero.", -- There's salt in the desalinator
        },

        BARREL =
        { 
            GENERIC = "Siempre podré tener agua fresca.", -- Inspecting the water barrel
            BURNT = "¿¡Comment est-ce possible?!? (¡¿Como es esto posible?!) ", -- The water barrel has burnt
        },

        BREWERY =
        {
            EMPTY = "El mero hecho de tomar unas copas para acompañar una comida mejora la experiencia.", -- Inspecting the brewery
            BURNT = "¡Mi corazón también se siente quemado!", -- The brewery has burnt
            FERMENTING_LONG = "Naturalmente, la fermentación tarda un tiempo.", -- Still a long way to go until brewing is complete
            FERMENTING_SHORT = "Debería darme prisa y preparar un plato para acompañarlo.", -- Brewing is almost complete
            DONE = "¡Ah, está listo!", -- There's a drink in the brewery
        },

        CAMPKETTLE_ITEM = "Es fiel a su función básica de hervir agua.", -- Inspecting the camp kettle item
        CAMPKETTLE =
        {
            GENERIC = "¿Se evaporó todo el agua?", -- No water in the camp kettle on the stove
            BOILING_LONG = "Debería preparar algo de comida mientras trabaja.", -- Water is starting to boil
            BOILING_SHORT = "El agua ha quedado bastante limpia, ¿no?", -- Water is almost boiled
            DONE = "Debería usar esto para hacer té.", -- Clean water is obtained
            STOP = "Ahora está fría", -- No longer boiling water due to lack of fire in the stove
        },

        CAMPDESALINATOR_ITEM = "Parece bastante complicado, ¿verdad?", -- Inspecting the camp desalinator item
        CAMPDESALINATOR = 
        {
            GENERIC = "Esta completamente vacío.", -- No water
            BOILING_LONG = "Debería hacer algo de comer mientras esta trabajando.", -- Water is starting to boil
            BOILING_SHORT = "El agua ha quedado bastante limpia.", -- Almost done boiling
            DONE = "Debería usar esto para hacer sopa.", -- Clean water is obtained
            STOP = "Todavía es agua de mar.", -- Can't purify seawater without fire in the stove
        },

        KETTLE =
        {
            EMPTY = "Incluso la tetera está vacía, y mi garganta está seca.", -- Empty kettle inspection dialog
            BURNT = "J'ai juste versé des larmes...(Acabo de derramar lágrimas...)", -- The kettle has burned
            BOILING_LONG = "Necesito cocinarlo a fuego lento lo suficiente para resaltar el sabor.", -- Just started making a drink
            BOILING_SHORT = "Ya casi esté listo.", -- Drink is almost ready
            DONE = "¡Está listo!", -- The drink is finished
            PURIFY_LONG = "No puedo tener sabores extraños en la bebida...", -- Just started boiling dirty water
            PURIFY_SHORT = "¡Se han removido la mayoría de las impurezas!", -- Almost done boiling dirty water
            HASWATER = "Me pregunto qué tipo de bebida debería hacer.", -- Kettle has clean water
            MELT_LONG = "Han llegado los invitados del frío.", -- Just started melting ice water
            MELT_SHORT = "Está casi derretido.", -- Almost done melting ice water
        },

        PORTABLEKETTLE_ITEM =
        {
            GENERIC = "Me permite sentir el calor del té en cualquier momento y lugar.", -- Inspecting the portable kettle item
            EMPTY = "¡No puedo salir sin esto!", -- Inspecting the installed empty portable kettle
            BOILING_LONG = "Las buenas bebidas exigen su propio tiempo.", -- Just started making a drink
            BOILING_SHORT = "¡Saldré pronto de aquí!", -- Drink is almost ready
            DONE = "Aquí está la bebida que orde... ah, es un hábito.", -- The drink is finished
            PURIFY_LONG = "La higiene en la cocina siempre es importante.", -- Just started boiling dirty water
            PURIFY_SHORT = "¡Casi ha eliminado las impurezas!", -- Almost done boiling dirty water
            HASWATER = "Me pregunto qué tipo de bebida debería preparar.", -- Kettle has clean water
            MELT_LONG = "Ya han llegado los invitados del frío.", -- Just started melting ice water
            MELT_SHORT = "Está casi derretido.", -- Almost done melting ice water
        },

        DISTILLERS =
        {   
            EMPTY = "¡Te invito un buen licor!", -- Inspecting the distiller
            DISTILLTING_LONG = "¿Debería ir a recoger algunos ingredientes para los cócteles?", -- Still a long way to go until distillation is complete
            DISTILLING_SHORT = "Debería darme prisa y preparar un plato para acompañarlo..", -- Distillation is almost complete
            DONE = "Nuestro asistente ha preparado algunos licores.", -- There's a drink in the distiller
        },

        WELL_WATERPUMP = {
            HIGH_PRESSURE = "Parece ser agua subterránea de alta calidad.", -- Maximum pressure
            MIDDLE_PRESSURE = "Poder sacar agua fresca en cualquier momento es una bendición.", -- Medium pressure
            LOW_PRESSURE = "¡La presión es demasiado baja!", -- Almost no pressure
            RECHARG_PRESSURE = "¡La presión se ha agotado por completo!", -- No pressure (can't be used until pressure is restored)
        },

        WELL_SPRINKLER =
        { 
            LOWFUEL = "Parece que se ha quedado sin combustible.", -- Inspecting the sprinkler with very little fuel
            ON = "¡Está trabajando duro!", -- Currently operational
            OFF = "Se está tomando un descanso.", -- Inspecting when it's not operational
        },
    },
}  