return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Debería remover el balde del pozo primeramente.", -- Trying to use a bucket when there's already a bucket with water in the well
            WELL_BUSY = "Beberé del pozo con el balde .", -- Trying to use a bucket when there's already a bucket attached to it
        }
    },

        ANNOUNCE_DRUNK = "Ugh, me siento un poco borracho.", -- Feeling drunk
        ANNOUNCE_DRUNK_END = "Estoy recobrando mi sobriedad ahora.", -- Sobering up from alcohol
        ANNOUNCE_DRUNK_IMMUNITY = "only_used_by_wathgrithr", -- Temporary. Exclusive to Wigfrid.
        ANNOUNCE_NOTCHARGE = "Esto es innecesario.", -- Trying to milk a Volt Goat that isn't charged with electricity
        ANNOUNCE_NOTHIRSTSLEEP = "Estoy muy sediento como para poder dormir así.", -- Trying to sleep at night while being very thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "Estoy muy sediento para descansar .", -- Trying to rest during the day while being very thirsty
        ANNOUNCE_SLEEP_END = "Debo de haber tenido una pesadilla .", -- Waking up after sleeping and sobering up from alcohol
        ANNOUNCE_THIRST = "Estoy sediento.", -- Feeling very thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "¡Siento la adrenalina en mí!!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Se acabó el show.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Me siento mejor.", -- Curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Comienzo a sentirme alegre.", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "Me siento con calidez y confuso.", -- Getting tipsy

        DESCRIBE =
        {
            BOILBOOK = "Hacer alcohol no debería ser tan difícil, ¿Verdad?",

            WATER_CLEAN_ICE = "Esto es agua en estado sólido .", -- Clean ice
            WATER_DIRTY_ICE = "Hielo basura.", -- Dirty ice

            SPICE_CAFFEINPEPPER = "No le da ningún nuevo valor.", -- Caffein pepper spice

            WELL_KIT = "¿Tengo que cargar esto conmigo?", -- Well kit
            WELL_SPRINKLER_KIT = "Una fusión de maquinaria y magia, al parecer.", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "¿En serio tengo que opinar sobre esta cosa?", -- Steam water pump kit
            WELL_BURYING_KIT = "¿Por qué tengo que realizar un trabajo innecesario?.", -- Burying kit
            WELL_DRILLING = "Trabaja automáticamente, lo cual lo hace práctico.", -- Drilling hole with a drill
            WELL_DRILLING_ITEM = "Tiene una apariencia resistente .", -- Drill item
            HOLE = "No podré ser capaz de obtener huesos si caigo dentro.", -- Well hole
            WELL = "Moriré de sed a lado de este pozo.", -- Well

            -- Water Mode Plants

            TEA_TREE = "Las hojas están floreciente en esta pequeña cosa.", -- Tea tree
            DUG_TEA_TREE = "Sé cómo hacer de jardinero ¿O no?", -- Tea tree dug from the ground
            TEA_SEED = "La persona que sepa sembrar árboles encontraría esto útil.", -- Tea tree seed
            TEA_SEED_COOKED = "No puedo creer que tenga que comer algo como esto.", -- Roasted tea tree seed
            TEA_SEED_SAPLING = "Supongo que tengo que plantar esto en el suelo por mí mismo.", -- Tea tree sapling
            TEALEAVES = "Las debería secar antes de usar.", -- Tea leaves
            TEALEAVES_DRIED = "Estoy añorando una taza de té.", -- Dried tea leaves

            CAFFEINBERRY = "Una mata de café influenciada por la luna.", -- Caffeine bush
            DUG_CAFFEINBERRY = "Vale la pena replantarlo.", -- Dug coffee bush
            CAFFEINBERRY_BEAN = "Luce diferente de los granos de café que conozco..", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "Mejor que comerlo crudo, pero debe haber otros procesos de elaboración.", -- Roasted coffee bean

            RUINCACAO_TREE = "En definitiva influido por magia oscura .", -- Cacao tree
            DUG_RUINCACAO_TREE = "El que siembra árboles encontraría esto útil.", -- Dug cacao tree
            RUINCACAO_SEED = "Parece que ha florecido.", -- Cacao seed item
            RUINCACAO_SEED_SAPLING = "Supongo que no se plantará solo.", -- Planted cacao sapling
            RUINCACAO = "Lo comeré pero no lo voy a disfrutar.", -- Cacao fruit before breaking
            RUINCACAO_BEAN = "Cubierto en aceite barato.", -- Crushed cacao bean
            RUINCACAO_BEAN_COOKED = "Mejor que comerlo crudo, pero debe haber otros métodos.", -- Roasted cacao bean

            -- Distilled Spirit Additives

            ADDITIVE_SEED = "¿Estás tratando de hacer alcohol de verdad?", -- Seed herbs (anise, juniper berry, octagon motif) for adding to liqueurs
            ADDITIVE_PETALS = "¿Estás seguro que el alcohol queda bien con esto?", -- Herb, green tea, and flower petal additives for adding to liqueurs
            ADDITIVE_NUT = "¿La gente joven de verdad pone esto en sus bebidas?", -- Nut, coconut, coffee bean, and cacao bean additives for adding to liqueurs
            ADDITIVE_DAIRY = "Respeto gustos, pero...", -- Dairy additives for adding to liqueurs

            -- Beverages

            WATER_CLEAN = "Un sorbo de agua limpia es valioso.", -- Clean water
            WATER_DIRTY = "Hey, esta agua no se ve tan bien.", -- Dirty water
            WATER_SALTY = "No debería beber esto.", -- Saltwater

            GOOPYDRINK = "Falta de sutileza.", -- Failed drink (wet roast concept)

            -- Teapot Beverages

            FRUITJUICE = "Está mezclado, pero sabe bien.", -- Mixed fruit juice
            BERRIES_JUICE = "Bueno, no está tan mal.", -- Berry juice
            POMEGRANATE_JUICE = "Al menos se ve distinto.", -- Pomegranate juice
            BANANA_JUICE = "¿No había una mejor manera de hacer esto?", -- Banana juice
            FIG_JUICE = "Algo dulce.", -- Fig juice
            DRAGONJUICE = "Tiene una dulzura intensa.", -- Dragon fruit juice
            GLOWBERRYJUICE = "Jugo de fruta bien elaborado .", -- Glowberry juice
            WATERMELON_JUICE = "El sabor de la sandía de alguna manera está diluida.", -- Watermelon juice

            VEGGIE_TEA = "Es momento de cuidar mi salud .", -- Vegetable juice
            CARROT_TEA = "¿Debo de darle un sorbo?.", -- Carrot tea
            CACTUS_TEA = "Siento un pequeño oasis en mi mano.", -- Cactus tea
            TOMATO_JUICE = "Suave y fácil de beber.", -- Tomato juice
            LUMPY_TEA = "De esta manera, parece algo majestuoso.", -- Root tea
            SEAWEED_SHAKE = "Por favor, no...", -- Seaweed shake

            GREENTEA = "Tiene una esencia a hojas.", -- Fresh green tea
            BLACKTEA = "Una taza de té siempre es bienvenida .", -- Black tea
            BLACKTEA_ICED = "Refrescante.", -- Iced black tea
            FUER = "Un poco exótico.", -- Bohe tea, leaf tea, fern tea
            MIXFLOWER = "Deja un sabor raro al final.", -- Mixed flower petal tea
            HIBISCUSTEA = "Delicioso, no tiene comparación.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "No decepciona.", -- Cactus flower tea
            LOTUSTEA = "¿Podría ser esto en lo que estaba pensando?", -- Lotus tea
            SUSHIBISCUS = "Una esencia oscura.", -- Suicide tea
            MOON_BLOSSOM_TEA = "No me va a transformar, ¿Oh sí?", -- Moon flower tea

            CAFFEINBERRY_JUICE = "No puedo esperar para probarlo.", -- Black coffee
            TOFFEE_LATTE = "¿Derritieron whisky escocés para hacer esto ?", -- Toffee nut latte
            RUINCHA_LATTE = "No tengo ni idea de cuál sea el nombre de esto.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Incluso aunque mi alma se desgarre, esto lo podrá enmendar.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Me preocupan mis dientes si tomo ésto.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Puedo sentir una vibra espiritual.", -- Chocolatl (spiciness)
            TEA_RUINCOLATE_LATTE = "¿La gente joven de verdad bebe ésto?", -- Matcha latte

            MULLED = "Puedo divertirme incluso si el clima es extremadamente frío.", -- Bangcho
            BUTTERBEER = " Incluso aunque mi alma se desgarre, esto lo podrá enmendar.", -- Butterbeer from the Harry Potter series

            -- Collaborative Teapot Drinks

            COCONUT_JUICE = "¡Sacía la sed y además llena un poco tu estómago!", -- Shipwrecked coconut juice
            RAINBOW_SHAKE = "Parece comida basura de niños.", -- Shipwrecked rainbow jelly shake
            QUARTZ_SHAKE = "Si tanto solo tuviera limones o lima...", -- Shipwrecked glass jelly shake
            CHERRY_ROSEBERRIES_TEA = "Así que, ¿Dónde están los panecillos?", -- Cherry Forest rosehip tea
            CHERRY_HONEY_TEA = "Estaría mejor con jengibre y limón...", -- Cherry Forest cherry blossom honey tea
            SWEET_RICE_DRINK = "Mmm, reconfortante", -- Vitacomp sweet rice drink
            PINEANANAS_JUICE = "No puedo tomar este jugo de fruta ácido  en un solo instante.", -- Regione pineapple juice
            ORANGE_JUICE = "Nunca noté que esto estuviera en el jardín.", -- Moore Food Pack orange juice
            STRAWBERRY_SMOOTHIE = "Parece una bebida de un vendedor callejero", -- Moore Food Pack strawberry smoothie
            STRAWBERRY_MILK_SMOOTHIE = "No es de mi agrado.", -- Moore Food Pack strawberry milk smoothie

            -- Distilled Spirit Drinks

            SPOILED_DRINK = "Era una bebida antes de que se estropeara..", -- Spoiled drink

            -- Distillery Soda

            SODA = "Nunca hubiera imaginado probar algo como esto.", -- Carbonated water (roughly made carbonation using dust)
            FRUITSODA = "¿Debería ponerlo con el recipiente de ponche?", -- Fruit soda
            LEMONLIMESODA = "Esto destrozará mis diente.", -- Lemon lime soda (superior version of fruit soda)
            COLA = "Desearía tener un popote.", -- Cola
            COLAQUANTUM = "Sospechosamente grandioso.", -- Cola Quantum
            LUMPY_BEER = "¿Cómo recrearon este sabor?", -- Root beer (not alcoholic)

            -- Brewery Drinks

            CORN_BEER = "Hmm... ¿No es este el licor casero de maíz?", -- Corn whiskey (wash - the distillation prior to making whiskey)
            MADHU = "Espero no hagan esto una tradición vikinga", -- Mead
            WINE = "Incluso si está hecho con frutos del bosque, necesita ser refinado.", -- Wine (simple berry brewing)
            NOBLEWINE = "La vida ha prosperado, huh.", -- Noble wine (baked berry brewing)
            SPARKLINGWINE = "Extraño la champaña.", -- Sparkling wine
            GLOWBERRYWINE = "Podría hacer mucho dinero vendiendo esto a fuera.", -- Glowberry wine
            KUMIS = "Algo salvaje.", -- Kumis, fermented mare's milk
            LUMPY_WINE = "Sorprendentemente puro.", -- Rice wine (potato, sweet potato, etc. root liquor)
            PULQUE = "No es adecuado a mi paladar.", -- Pulque (traditional Mexican alcoholic beverage)
            RUINCACAO_WINE = "Es un peculiar vino que no encontrarás en otro lado.", -- Cacao wine

            -- Collaboration Sodas

            CHERRY_DOCTOR_COLA = "Es una lástima que no tengamos ningún doctor aquí .", -- Cherry Forest Dr. Pepper (Doctor Cherry)
            PINEANANASSODA = "Me siento cerca a la civilización.", -- Carbonated pineapple (Oransi)
            ORANGESODA = "Este refresco está excesivamente carbonatado.", -- Carbonated orange (Fanta)
            STRAWBERRYSODA = "Este refresco está excesivamente carbonatado.", -- Carbonated strawberry (Welch's strawberry)

            -- Collaboration Brewery Drinks

            AUROBOW = "Una idea... original.", -- Shipwrecked Oroboros, Rainbow Jelly Brew
            COCONUT_WINE = "Debería comer un cangrejo con esto.", -- Shipwrecked coconut wine
            CHERRY_BLOOM_MADHU = "Espero no sea difícil de quitar de la ropa.", -- Cherry Forest cherry blossom honey mead
            GIANT_BLUEBERRY_WINE = "Comportémonos como individuos cultos.", -- Vitacomp Boom! Berry Wine (explodes when ignited)
            RICE_WINE = "Tiene un sabor agrio.", -- Vitacomp Makgeolli
            WHEAT_BEER = "Me pregunto dónde obtuvieron el trigo.", -- Hip of Food wheat beer
            PALE_BEER = " Dudo que esto, esté hecho con trigo.", -- Regione pale ale (green beer made with monster fruit)

            -- Distilled Drinks

            DISINFECTANT = "¿Has tratado de cortar magia? Necesitas probar esto.", -- Disinfectant
            CORN_WHISKEY = "Finalmente.", -- Corn whiskey
            LUMPY_VODKA = "Desafortunadamente, ahora soy solo un trabajador.", -- Vodka
            TEQUILA = "Se siente con una presentación rústica.", -- Tequila
            MADHU_RUM = "Es algo áspero.", -- Rum
            BERRY_BRANDY = "Encaja con mi sofisticación.", -- Berry brandy
            AREUHI = "Tiene un fuerte olor.", -- Kumis distilled liquor Areuhi

            -- Warly Exclusive Distilled Drinks

            BERRY_GIN = "Al parecer, no es una bebida de baja sofisticación después de todo.", -- Gin
            GLOWBERRY_GIN = "Debería disculparme con ella.", -- Glowberry gin
            ABSINTHE = "Ah,¡Me recuerda a la etapa más oscura de mi vida!", -- Absinthe
            TEA_LUMPY_VODKA = "Hmm, es un sabor sutil.", -- Green tea liqueur
            PETALS_BERRY_BRANDY = "Un poco excesivo.", -- Rose-scented brandy
            KAHLUA = "No está mal.", -- Coffee liqueur Kahlua
            NUT_CORN_WHISKY = "Tengo un antojo de carne ahumada.", -- Nut whiskey
            RUINCACAO_CREAM_LIQUEUR = "Estos jóvenes...", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "¿Qué tipo de bebida es ésta?", -- Rumchata (a mix of rum and horchata, a dairy-based beverage)

            -- Collaboration Distilled Drinks

            MOONWAY = "¿Cómo hicieron esto?", -- Rainbow Jelly Brew Distilled Liquor
            ARRACK = "Está hecho con frutas.", -- Arrack, Indonesian version of coconut wine, distilled
            CHERRY_BLOOM_RUM = "Extravagante, ¿Cierto?", -- Cherry Blossom Honey Rum, cherry blossom petals float
            RICE_SPIRITS = "Puro.", -- Rice spirits
            WHEAT_WHISKEY = "Perfecto.", -- Wheat whiskey
            PALE_WHISKEY = "Para ser honesto, no está nada mal.", -- Pale malt whiskey

            -- Warly Exclusive Collaboration Distilled Spirits

            NUT_COCONUT_BRANDY = "Cuéntame... ¿Qué ha sido de mi barco?", -- Spoken by Barbosa, a Caribbean pirate
            GIANT_BLUEBERRY_GIN = "Captura la esencia de la destrucción.", -- Boom Berry Sapphire (Carrot explosion)

            -- Pot Cooking

            DARK_RUINCOLATE = "¿El chef incursionó en la magia negra?", -- Dark chocolate
            WHITE_RUINCOLATE = "Siguiente.", -- White chocolate
            RUINCOLATE = "Una carnada para  atraer a unos pocos invitados.", -- Plain chocolate
            RUIN_SCHOKAKOLA = "Un concentrado de eficacia.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "Aparenta ser un cubo de acero.", -- Empty metal bucket
                FULL = "Supongo que puedo recolectar agua de lluvia o beberla.", -- Clean rainwater, indeed
                FULL_ICE = "¿Necesito sacar eso?", -- Rainwater has frozen
                DIRTY = "Es asqueroso.", -- Rainwater has become dirty
                DIRTY_ICE = "Ni siquiera quiero mirar.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Es la cubeta de madera de Woodie.", -- Woody's empty wooden bucket
                FULL = "Supongo que puedo recolectar agua de lluvia o beberla.", -- Clean rainwater, indeed
                FULL_ICE = "¿Necesito sacar eso?", -- Rainwater has frozen
                DIRTY = "Es asqueroso.", -- Rainwater has become dirty
                DIRTY_ICE = " Ni siquiera quiero mirar.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Preferiría no ensuciar mis manos.", -- Empty wooden bucket
                FULL = "Supongo que puedo recolectar agua de lluvia o beberla.", -- Clean rainwater, indeed
                FULL_ICE = "¿Necesito sacar eso?", -- Rainwater has frozen
                DIRTY = "Es asqueroso.", -- Rainwater has become dirty
                DIRTY_ICE = "Ni siquiera quiero mirar.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Eso es una idea.", -- No water in the desalinator
                PURIFY_LONG = "Tomará su tiempo.", -- Still a lot of time left for purification
                PURIFY_SHORT = "¡Está casi terminado!", -- Purification is almost complete
                HASWATER = "Parece que ya está terminado.", -- Clean water in the desalinator
                BURNT = "Ahora es inservible.", -- The desalinator has burnt
                HASSALT = "Podría tener algo de utilidad.", -- There's still salt in the desalinator
            },

            BARREL =
            {
                GENERIC = "Es un barril.", -- Examining the barrel
                BURNT = "¿Que pasó con el agua", -- The barrel has burnt
            },

            BREWERY =
            {
                EMPTY = "Tiene un intenso olor a roble.", -- Examining the brewery
                BURNT = "Ah, el aroma a ahumado aquí está .", -- The brewery has burnt
                FERMENTING_LONG = "Tomará un tiempo", -- Still a lot of time left for brewing
                FERMENTING_SHORT = "¡Está casi terminado!", -- Brewing is almost finished
                DONE = "Me pregunto si es bebible.", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "Heh, hay muchas en la vida.", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "Así que, ¿Tengo que encontrar agua para ponerlo aquí?", -- Empty camp kettle on the hearth
                BOILING_LONG = "Sigue estando frío.", -- Starting to boil the water
                BOILING_SHORT = "Es perfecto para calentar mis manos.", -- The water is almost boiling
                DONE = "Tengo tengo que hervir más agua para poder beber.", -- Clean water has been obtained
                STOP = "No creo que vaya a hervir.", -- The fire is out, and dirty water won't boil
            },

            CAMPDESALINATOR_ITEM = "Parece pesado.", -- Examining the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "Así  que, ¿Se supone debo caminar e ir a buscar agua de mar ?", -- No water in the desalinator
                BOILING_LONG = "¿Por cuánto tiempo debo de esperar?", -- Starting to boil the water
                BOILING_SHORT = "Parece que casi termina.", -- It's almost done boiling
                DONE = "Parece que ya está todo listo.", -- Clean water in the desalinator
                STOP = "No creo que hierva", -- There's no fire in the hearth, so the saltwater won't purify
            },

            KETTLE =
            {
                EMPTY = "Se ve solitario.", -- Empty kettle examination
                BURNT = "Está quemado", -- The kettle is burnt
                BOILING_LONG = "Seamos pacientes...", -- Just started making a drink
                BOILING_SHORT = "¡Está casi terminado!", -- The drink is almost ready
                DONE = "Por fin puedo beber algo decente.", -- The drink is finished
                PURIFY_LONG = "Esto no tendrá un buen sabor.", -- Just started boiling dirty water
                PURIFY_SHORT = "Es perfecto para calentar mis manos.", -- Almost done boiling dirty water
                HASWATER = "Me gustaría tener una taza de té.", -- There's clean water in it
                MELT_LONG = "Aún está frío.", -- Just started melting ice water
                MELT_SHORT = "Está temblado.", -- Almost done melting ice water
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Quiero sentarme y tomar una taza de té.", -- Examining the portable kettle item
                EMPTY = "Está vacío.", -- Examining an empty placed portable kettle
                BOILING_LONG = "Necesito ser paciente.", -- Just started making a drink
                BOILING_SHORT = "Pronto estará terminado", -- The drink is almost ready
                DONE = "Puedo tener un breve momento para tomar té.", -- The drink is finished
                PURIFY_LONG = "No tendrá buen sabor.", -- Just started boiling dirty water
                PURIFY_SHORT = "Es perfecto para calentar mis manos.", -- Almost done boiling dirty water
                HASWATER = "Me gustaría tener una taza de té.", -- There's clean water in it
                MELT_LONG = "Aún está frío.", -- Just started melting ice water
                MELT_SHORT = "Está templado.", -- Almost done melting ice water
            },

            DISTILLERS =
            {
                EMPTY = "Es una caldera robusta pero sofisticada.", -- Examining the distiller
                DISTILLTING_LONG = "Dejémoslo trabajar.", -- Still a lot of time left for distillation
                DISTILLING_SHORT = "Parece que ya casi termina.", -- Distillation is almost complete
                DONE = "Ahora podré probar un licor de verdad.", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Hey, ¿No está algo ruidoso?", -- Maximum pressure
                MIDDLE_PRESSURE = "Se siente bien no trabajar con mis manos.", -- Medium pressure
                LOW_PRESSURE = "¿Está cosa está trabajando como debe ser?", -- Almost no pressure
                RECHARG_PRESSURE = "Supongo que tendré que echar el agua con la mano, heh.", -- No pressure, can't be used until the pressure is maximum
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Supongo que mi amigo que juega con máquinas puede resolverlo.", -- Examining when fuel is almost gone
                ON = "Me empaparé si me acerco .", -- It's on
                OFF = "Está apagado.", -- Examining when it's turned off
            },
        },
    }
