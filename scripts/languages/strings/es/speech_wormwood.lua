return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Ya está lleno.", -- Attempting to give a non-empty bucket to a well
            WELL_BUSY = "Está ocupado.", -- Attempting to give a bucket with water to a well
        }
    },

        ANNOUNCE_DRUNK = "Mareooo...", -- Character is drunk
        ANNOUNCE_DRUNK_END = "Uff...", -- Character sobers up (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Reserved for Wigfrid.
        ANNOUNCE_NOTCHARGE = "Mi amigo cornudo aún no esta listo.", -- Attempting to milk a volt goat with no charge
        ANNOUNCE_NOTHIRSTSLEEP = "Demasiado sediento para dormir.", -- Character is too thirsty to sleep at night
        ANNOUNCE_NOTHIRSTSIESTA = "Demasiada sed para siesta.", -- Character is too thirsty to nap during the day
        ANNOUNCE_SLEEP_END = "", -- Character wakes up after sleeping and fully sobers up from being drunk
        ANNOUNCE_THIRST = "Necesito bebida.", -- Character is very thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Me siento saltarín.", -- Character gains the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "No tan saltarín.", -- Character loses the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "", -- Announcement when curing a waterborne disease with an item (Wormwood's quote, specific to him)

        ANNOUNCE_DCAPACITY_CRITICAL = "Algo se siente mal...", -- Character is about to become drunk
        ANNOUNCE_DCAPACITY_HALF = "Ugh...", -- Character starts feeling the effects of alcohol

        DESCRIBE =
        {
            BOILBOOK = "Cosas de beber",

            WATER_CLEAN_ICE = "Frío, muy frío", -- Clean ice water
            WATER_DIRTY_ICE = "Fríooo", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "(Sniff) ¡Fe-feliz! ¡Fe-feliz!", -- Pepper spice

            WELL_KIT = "Ponlo en un agujero", -- Well kit
            WELL_SPRINKLER_KIT = "Para el pozo", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "Plántalo en un agujero", -- Steam water pump kit
            WELL_BURYING_KIT = "Tapar agujero", -- Hole burying kit
            WELL_DRILLING = "Hacer hoyo en el suelo", -- Drilling a hole
            WELL_DRILLING_ITEM = "Herramienta para hoyos", -- Drilling item
            HOLE = "Hay agua dentro", -- Well hole
            WELL = "Puedes tomar agua", -- Well

            -- Water mode plants

            TEA_TREE = "Amigo con estilo", -- Tea tree
            DUG_TEA_TREE = "Necesita tierra", -- Dug up tea tree
            TEA_SEED = "¡Pequeño con estilo!", -- Tea tree fruit
            TEA_SEED_COOKED = "Se puede comer ahora", -- Cooked tea tree fruit
            TEA_SEED_SAPLING = "¡Crece con estilo!", -- Tea tree sapling
            TEALEAVES = "¡Gracias amigo estiloso!", -- Tea leaves
            TEALEAVES_DRIED = "Hmm... Me gusta el olor", -- Dried tea leaves

            CAFFEINBERRY = "Amigo rocoso comestible", -- Coffee bush
            DUG_CAFFEINBERRY = "Necesita tierra", -- Dug up coffee bush
            CAFFEINBERRY_BEAN = "Huele bien", -- Raw coffee bean
            CAFFEINBERRY_BEAN_COOKED = "¡Muy bien!", -- Cooked coffee bean

            RUINCACAO_TREE = "Un amigo como cactus", -- Cacao tree
            DUG_RUINCACAO_TREE = "Necesita tierra", -- Dug up cacao tree
            RUINCACAO_SEED = "Bebé necesita tierra", -- Cacao sapling item
            RUINCACAO_SEED_SAPLING = "¡Bien hecho!", -- Planted cacao sapling
            RUINCACAO = "Casa de amigo bebé", -- Cacao fruit before breaking
            RUINCACAO_BEAN = "Comida aceitosa", -- Cacao bean after breaking
            RUINCACAO_BEAN_COOKED = "Listo para comer", -- Cooked cacao bean

            -- Distillery additives

            ADDITIVE_SEED = "Pequeños están dentro", -- Liqueur additive for seeds (anise, juniper berry, etc.)
            ADDITIVE_PETALS = "Las cosas bonitas están dentro", -- Liqueur additive for herbs, tea leaves, flower petals
            ADDITIVE_NUT = "Las cosas comibles están dentro", -- Liqueur additive for birchnut, coconut, coffee bean, cacao bean
            ADDITIVE_DAIRY = "¿Hmm?", -- Liqueur additive for dairy products

            -- Drinks

            WATER_CLEAN = "Limpio para beber", -- Clean water
            WATER_DIRTY = "Sucio para beber", -- Dirty water
            WATER_SALTY = "No se puede beber", -- Saltwater

            GOOPYDRINK = "Gulp", -- Failed drink (wet goo concept)

            -- Kettle drinks

            FRUITJUICE = "Mezcla frutal para beber", -- Mixed fruit juice
            BERRIES_JUICE = "Dulce para beber", -- Berry juice
            POMEGRANATE_JUICE = "Semilla frutal para beber", -- Pomegranate juice
            BANANA_JUICE = "Dulce con algo de pelo", -- Banana juice
            FIG_JUICE = "Dulce agua de bolsillo", -- Fig juice
            DRAGONJUICE = "Hermosa fruta para beber", -- Dragonfruit juice
            GLOWBERRYJUICE = "Gulp brillante", -- Glowberry juice
            WATERMELON_JUICE = "Húmedo y dulce para beber", -- Watermelon juice

            VEGGIE_TEA = "¿Naranja para beber?", -- Green juice
            CARROT_TEA = "Naranja para tomar", -- Carrot tea
            CACTUS_TEA = "Algo espinoso dentro", -- Cactus tea
            TOMATO_JUICE = "Bola de agua roja", -- Tomato juice
            LUMPY_TEA = "Hecho de tierra para tomar", -- Root tea
            SEAWEED_SHAKE = "Lleno de cosas resbaladizas", -- Seaweed shake

            GREENTEA = "Elegante", -- Fresh green tea
            BLACKTEA = "Huele bien", -- Black tea
            BLACKTEA_ICED = "Refrescante", -- Iced black tea
            FUER = "Bueno para garganta", -- Leaf tea (ivy leaf, bay leaf, fern)
            MIXFLOWER = "Muchos olores agradables", -- Mixed flower petal tea
            HIBISCUSTEA = "Gustar olor", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Beberlo", -- Cactus flower tea
            LOTUSTEA = "Oler rico", -- Lotus tea
            SUSHIBISCUS = "Hmm... no gustar olor", -- Suicide tea (stinging nettle, carrot leaf, mustard)
            MOON_BLOSSOM_TEA = "Hmm... buen olor", -- Moonflower tea

            CAFFEINBERRY_JUICE = "¡Yey!", -- Black coffee
            TOFFEE_LATTE = "Gustar olor nuez", -- Toffeenut latte
            RUINCHA_LATTE = "¡Dulce y atrevido!", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "Calientito", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Me da frio", -- Chocolate smoothie (chilled)
            RUINXOCOLATL = "Sabor amargo", -- Chocolatl (spicy)
            TEA_RUINCOLATE_LATTE = "Aroma rico", -- Matcha latte

            MULLED = "Calienta vientre, zzz", -- Bángshòu
            BUTTERBEER = "¡Gulp!", -- Butterbeer from the Harry Potter series

            -- Collaborative Kettle Drinks

            COCONUT_JUICE = "Burbujas picantes", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Colores bonitos burbujean", -- Shipwrecked Rainbow Jellyshake
            QUARTZ_SHAKE = "Burbujas duras", -- Shipwrecked Crusted Ellegance
            CHERRY_ROSEBERRIES_TEA = "Huele fuerte", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "A amigas abejas les gusta", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "¡Suave!", -- VitaHive Sake
            PINEANANAS_JUICE = "Digno de coronar", -- Legion Pineananas Juice
            ORANGE_JUICE = "Bola cítrica de tomar", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Frío y ácido", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "Rico, acidito y cremoso", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Cosa de tomar", -- Spoiled Drink

            -- Distillery Soda

            SODA = "Agua burbujeante", -- Carbonated Water
            FRUITSODA = "Burbujas con fruta ", -- Fruit Soda
            LEMONLIMESODA = "Burbujeante y dulce", -- Lemon Lime Soda (a higher tier of Fruit Soda)
            COLA = "Agua negra burbujeante", -- Cola
            COLAQUANTUM = "Burbujea con brillo", -- Cola Quantum
            LUMPY_BEER = "Agua de raíces burbujeantes", -- Root Beer (not an alcoholic beverage)

            -- Distillery Liquor

            CORN_BEER = "Semillitas fermentadas", -- Corn Beer
            MADHU = "Jugo zumbeante fermentado", -- Madhu
            WINE = "Fermentado chiquito", -- Wine (simply made from berries)
            NOBLEWINE = "Cosa chiquita cocinada y fermentada", -- Noble Wine (made from baked berries)
            SPARKLINGWINE = "Fermentado zumbeante", -- Sparkling Wine
            GLOWBERRYWINE = "Fermentado brillante", -- Glowberry Wine
            KUMIS = "Sah-ha-ye", -- Kumis, fermented mare's milk
            LUMPY_WINE = "Piecitos fermentados", -- Sake (made from roots like potatoes or sweet potatoes)
            PULQUE = "Sah-ha-ye", -- Pulque (fermented agave juice)
            RUINCACAO_WINE = "Poco amargo", -- Cacao Wine

            -- Collaborative Soda

            CHERRY_DOCTOR_COLA = "Burbujas oscuras", -- Cherry Forest Doctor Pepper (Doctor Cherry)
            PINEANANASSODA = "Agua burbujeante", -- Carbonated Pineananas (Olimar's)
            ORANGESODA = "Bola naranja burbujeante", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Agua con burbujas frutales", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Liquor

            AUROBOW = "¡Colorido!", -- Shipwrecked Aurobouros, Rainbow Jellywine
            COCONUT_WINE = "No hay cosas enredadas", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Pétalos bonitos flotando", -- Cherry Forest Cherry Blossom Honey Madhu
            GIANT_BLUEBERRY_WINE = "¡Boom!", -- VitaHive Boom!Berry Sapphire (explodes when ignited)
            RICE_WINE = "No es dulce...", -- VitaHive Makgeolli
            WHEAT_BEER = "Semillitas lindas fermentadas", -- Hip of Food Wheat Beer
            PALE_BEER = "Fruta redonda fermentada", -- Legion Pale Ale (beer made with various roots like yams)

            -- Distilled Spirits

            DISINFECTANT = "Bueno para heridas", -- Disinfectant
            CORN_WHISKEY = "Semillitas para beber", -- Corn Whiskey
            LUMPY_VODKA = "Está claro", -- Vodka
            TEQUILA = "No blanco", -- Tequila
            MADHU_RUM = "Burbujas de jugo limpias", -- Rum
            BERRY_BRANDY = "Comer cosas pequeñas, beber rápido", -- Berry Brandy
            AREUHI = "No Ha-ye", -- Kruse Distilled Spirits Areuhi

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "No es dulce pero fácil de beber", -- Gin
            GLOWBERRY_GIN = "Brillante y fácil de beber", -- Glowberry Gin
            ABSINTHE = "Verde y fácil de beber", -- Absinthe
            TEA_LUMPY_VODKA = "Los chicos cool lo toman", -- Vodka
            PETALS_BERRY_BRANDY = "Colorido", -- Rose Brandy
            KAHLUA = "Negro intenso pero fácil de beber", -- Coffee liqueur Kahlua
            NUT_CORN_WHISKY = "Tiene un aroma a amigos", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Sabor intenso", -- Baileys Cocoa Cream Liqueur
            RUMCHATA = "Sabroso", -- Rumchata (a dairy product mixed with rum)

            -- Collaboration Distilled Spirits

            MOONWAY = "Colorido", -- Rainbow Jellyfish Distilled Spirits
            ARRACK = "Bebida suave", -- Arrack Indonesian version of coconut wine distilled spirits
            CHERRY_BLOOM_RUM = "Fácil de beber", -- Cherry Honey Distilled Spirits Cherry Blossom Leaves Floating
            RICE_SPIRITS = "Bebida está muy transparente", -- Rice wine
            WHEAT_WHISKEY = "Semillas bonitas fácil de beber", -- Wheat Whiskey
            PALE_WHISKEY = "Fruta redonda de nuevo", -- Pale Malt Whiskey

            -- Warly Exclusive Distillery Collaborative Liquor

            NUT_COCONUT_BRANDY = "Arrrrr", -- Coconut Brandy (Caribbean Brandy, renamed due to inability to make Caribbean Brandy)
            GIANT_BLUEBERRY_GIN = "Fácil de beber ¡Boom! ¡Boom!", -- Boom Berry Sapphire (carrot explodes when ignited)

            -- Pot Recipes

            DARK_RUINCOLATE = "Dulce amargo", -- Dark Chocolate
            WHITE_RUINCOLATE = "Dulce amargo", -- White Chocolate
            RUINCOLATE = "Beber cosa café", -- Plain Chocolate
            RUIN_SCHOKAKOLA = "Cosa hace que ojos chispen", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "¿Porqué vacío?", -- Empty steel bucket
                FULL = "Agua limpia", -- Clean collected rainwater
                FULL_ICE = "Brr limpio y frío", -- Rainwater has frozen
                DIRTY = "No beber", -- Rainwater has become dirty
                DIRTY_ICE = "Brr frío y sucio", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "Hecho con amigos...", -- Woodie's empty wooden bucket
                FULL = "Agua bebible", -- Clean collected rainwater
                FULL_ICE = "Brr limpio y frío", -- Rainwater has frozen
                DIRTY = "Sucio", -- Rainwater has become dirty
                DIRTY_ICE = "Sucio y congelado", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Hecho de amigos", -- Empty wooden bucket
                FULL = "Agua para tomar", -- Clean collected rainwater
                FULL_ICE = "Brr limpio y frío", -- Rainwater has frozen
                DIRTY = "Sucio", -- Rainwater has become dirty
                DIRTY_ICE = "Sucio y congelado", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Separa agua de sal", -- No water in the desalinator
                PURIFY_LONG = "Esperando.", -- Still a long time left for purification
                PURIFY_SHORT = "¡Ya casi!", -- Purification is almost complete
                HASWATER = "¡Acabó!", -- Clean water is in the desalinator
                BURNT = "No bueno", -- The desalinator has burned down
                HASSALT = "¡Mucha sal!", -- There is still salt in the desalinator
            },

            BARREL =
            {
                GENERIC = "Guarda agua limpia", -- Examining the barrel
                BURNT = "Oh no", -- The barrel has burnt down
            },

            BREWERY =
            {
                EMPTY = "Para burbujas", -- Examining the brewery
                BURNT = "No bueno", -- The brewery has burned down
                FERMENTING_LONG = "Esperar ...", -- A long time left for fermentation
                FERMENTING_SHORT = "¡Casi!", -- Fermentation is almost complete
                DONE = "¡Acabó!", -- The drink is ready in the brewery
            },

            CAMPKETTLE_ITEM = "Hace agua limpia", -- Examining the portable kettle item
            CAMPKETTLE =
            {
                GENERIC = "No tener agua", -- No water in the camp kettle
                BOILING_LONG = "¿Falta mucho? ...", -- Just started boiling water
                BOILING_SHORT = "¿Todavía no?", -- Water is almost boiled
                DONE = "¡Terminado!", -- Clean water is ready
                STOP = "No limpio", -- The campfire is out, and dirty water can't be boiled
            },

            CAMPDESALINATOR_ITEM = "Limpia agua salada", -- Examining the portable desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "No agua", -- No water in the camp desalinator
                BOILING_LONG = "¿Falta mucho?...", -- Just started desalting water
                BOILING_SHORT = "¿Ya casi?", -- Water desalting is almost complete
                DONE = "¡Terminado!", -- Clean water is ready
                STOP = "No bebible", -- The campfire is out, and saltwater can't be purified
            },

            KETTLE =
            {
                EMPTY = "Cosa para agua", -- Empty kettle
                BURNT = "Oh no", -- The kettle has burnt down
                BOILING_LONG = "Esperar...", -- Just started cooking a drink
                BOILING_SHORT = "¿Faltar poco?", -- The drink is nearly done
                DONE = "¡Terminó!", -- The drink is ready
                PURIFY_LONG = "Sigue sucia", -- Just started purifying dirty water
                PURIFY_SHORT = "Faltar poco", -- Dirty water is nearly purified
                HASWATER = "¿Que queremos?", -- Clean water is in the kettle
                MELT_LONG = "Esta frío", -- Just started melting ice water
                MELT_SHORT = "¡Ya casi!", -- Ice water is nearly melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Cosa para bebidas", -- Examining the portable kettle item
                EMPTY = "No agua...", -- Examining an empty placed portable kettle
                BOILING_LONG = "Esperar...", -- Just started boiling water
                BOILING_SHORT = "¿Faltar poco?", -- Water is almost boiled
                DONE = "¡Termino!", -- The drink is ready
                PURIFY_LONG = "Sigue sucia", -- Just started purifying dirty water
                PURIFY_SHORT = "Faltar poco", -- Dirty water is almost purified
                HASWATER = "¿Que queremos?", -- Clean water is in the kettle
                MELT_LONG = "Está frío", -- Just started melting ice water
                MELT_SHORT = "¡Ya casi!", -- Ice water is nearly melted
            },

            DISTILLERS =
            {
                EMPTY = "Burbujas destiladas", -- Examining the distiller
                DISTILLTING_LONG = "Esperar...", -- Still a long time left for distillation
                DISTILLING_SHORT = "Falta poco", -- Distillation is almost complete
                DONE = "¡Listo!", -- The drink is ready in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "¡A chorros!", -- Maximum pressure
                MIDDLE_PRESSURE = "Suficiente", -- Medium pressure
                LOW_PRESSURE = "Necesita vapor", -- Almost no pressure
                RECHARG_PRESSURE = "Sin vapor", -- No pressure at all (this can't be used until the pressure is back to maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Necesita comida", -- Almost out of fuel
                ON = "Dale agua a amigos", -- Currently operating
                OFF = "Es amigo de amigos", -- Turned off and not operating
            },
        },
    }