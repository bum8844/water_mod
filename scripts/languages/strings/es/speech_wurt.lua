return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "¡Ya hay una cubeta aquí, baaah!", -- Trying to give a bucket to a well with water
            WELL_BUSY = "¡Está dentro del agujero, baaah!", -- Trying to give a bucket to a well with a filled bucket
        }
    },

        ANNOUNCE_DRUNK = "Me duele la cabeza... me mareo, baaah...", -- Getting drunk
        ANNOUNCE_DRUNK_END = "Baaah! Me siento un poco mejor.", -- Getting sober (hangover)
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary. Exclusive to Wigfrid.
        ANNOUNCE_NOTCHARGE = "¡No sale nada de leche!", -- Trying to milk a charged Volt Goat with a bucket
        ANNOUNCE_NOTHIRSTSLEEP = "Necesito agua, así podré dormir.", -- Trying to sleep at night with thirst
        ANNOUNCE_NOTHIRSTSIESTA = "Necesito agua, así podré tomar una siesta.", -- Trying to take a siesta during the day with thirst
        ANNOUNCE_SLEEP_END = "Baaah, estaré mejor después de una siesta!", -- Waking up and completely sober from sleep
        ANNOUNCE_THIRST = "¡Necesito una bebida!", -- Feeling thirsty

        ANNOUNCE_CAFFINE_BUFF_START = "Estoy lista para correr!", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "No creo poder correr.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Me siento un poco mejor, baaah.", -- Curing a waterborne illness with an item

        ANNOUNCE_DCAPACITY_CRITICAL = "Baaah, me mareo!", -- About to get drunk
        ANNOUNCE_DCAPACITY_HALF = "¡Mi cara esta roja, baaah!", -- Starting to get tipsy

        DESCRIBE =
        {
            BOILBOOK = "¡Un libro lleno de recetas!", -- Recipe book for drinks

            WATER_CLEAN_ICE = "Brrr, ¡Está muy frío!", -- Clean ice water
            WATER_DIRTY_ICE = "Brrr, ¡El agua está congelada!", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "¡Huele picante!", -- Spice: Caffeinpepper

            WELL_KIT = "Jamás he visto búfalos hacer cosas como esas.", -- Well kit
            WELL_SPRINKLER_KIT = "¡Sólo presiónalo una vez, florp!", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "¡Luce difícil de hacer!.", -- Steam water pump kit
            WELL_BURYING_KIT = "¡Tapa el agujero del suelo!", -- Hole burying kit
            WELL_DRILLING = "¡Perforando el suelo, baaah!", -- Drilling holes in the ground
            WELL_DRILLING_ITEM = "¿Por qué perforas el suelo?", -- Drilling item
            HOLE = "Puedo escuchar el agua.", -- Well hole
            WELL = "Los búfalos beben de estos agujeros, ¿Por qué?", -- Well

            -- Water mode plants

            TEA_TREE = "¡Las hojas huelen bien!", -- Tea tree
            DUG_TEA_TREE = "Vayamos a algún lado, baaah.", -- Dug tea tree
            TEA_SEED = "¡Muchas hojas en esta semilla de árbol!", -- Tea tree seed
            TEA_SEED_COOKED = "Ya no está sabroso...", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "¡Crece grande!", -- Tea tree sapling
            TEALEAVES = "Hojas olorosas, baaah.", -- Tea leaves
            TEALEAVES_DRIED = "¡El aroma es increíble!", -- Dried tea leaves

            CAFFEINBERRY = "¡Un snack es revelado!", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "Encontrarás un buen lugar.", -- Dug caffeinberry bush
            CAFFEINBERRY_BEAN = "¡Un delicioso snack!", -- Caffeinberry bean
            CAFFEINBERRY_BEAN_COOKED = "Ya no es delicioso.", -- Cooked caffeinberry bean

            RUINCACAO_TREE = "El fruto oscuro no está bueno por sí solo.", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "Encontrarás un buen lugar.", -- Dug ruincacao tree
            RUINCACAO_SEED = "Ewww, baaah.", -- Ruincacao seed item
            RUINCACAO_SEED_SAPLING = "Es muy pequeño para hacerlo fruta.", -- Ruincacao sapling from a seed
            RUINCACAO = "Ouch! ¡Está muy duro!", -- Ruincacao fruit before smashing
            RUINCACAO_BEAN = "Tiene mucho aceite, baaah.", -- Ruincacao bean after smashing
            RUINCACAO_BEAN_COOKED = "¡Aún no es chocolate!", -- Cooked ruincacao bean

            -- Distillery additives

            ADDITIVE_SEED = "¿No vas a plantar en este suelo?", -- Seed herbs (Anise, Juniper Berry, Star Motif) for distillery
            ADDITIVE_PETALS = "Recolecté muchos pétalos.", -- Herb, Tea, Flower Petal additives for distillery
            ADDITIVE_NUT = "¿No te comerás este snack?", -- Nut additives (Birchnut, Coconut, Coffee Bean, Cacao Bean) for distillery
            ADDITIVE_DAIRY = "¡Es tan blanco como el suelo de nuestra casa!", -- Dairy additives for distillery

            -- Drinks

            WATER_CLEAN = "No huele a que sea algo proveniente del agua!", -- Clean water
            WATER_DIRTY = "¡Es como el agua del estanque de nuestra casa!", -- Dirty water
            WATER_SALTY = "Es como el agua de un gran estanque!", -- Saltwater

            GOOPYDRINK = "¿Es esto el agua del estanque de nuestra casa?Is this our home's pond water?", -- Failed drink (Water boiling concept)

            -- Kettle drinks

            FRUITJUICE = "¡Tiene el sabor de distintas frutas!", -- Mixed fruit juice
            BERRIES_JUICE = "¡Jugo de los arbustos de bayas!", -- Berry juice
            POMEGRANATE_JUICE = "La pulpa del fruto rojo es masticable, baaah!", -- Pomegranate juice
            BANANA_JUICE = "Incluso aunque no esté frío,¡Este jugo está delicioso!", -- Banana juice
            FIG_JUICE = "Hmm, es correoso pero sabe bien", -- Fig juice
            DRAGONJUICE = "Está sin sabor , baaah.", -- Dragon fruit juice
            GLOWBERRYJUICE = "¡Es un jugo brillante!", -- Glowberry juice
            WATERMELON_JUICE = "¡Jugosa sandía!", -- Watermelon juice

            VEGGIE_TEA = "Hmm, ¡Me gusta!", -- Vegetable juice
            CARROT_TEA = "¡Sabe mejor!", -- Carrot tea
            CACTUS_TEA = "¿Sin espinas? ¡Grandioso!", -- Cactus tea
            TOMATO_JUICE = "¡Jugo de tomate!", -- Tomato juice
            LUMPY_TEA = "¡Me gusta el agua de verduras!", -- Root tea
            SEAWEED_SHAKE = "¡También me gustan las cosas viscosas!", -- Seaweed shake

            GREENTEA = "¡Huele como agua!", -- Fresh tea leaves
            BLACKTEA = "¡El agua caliente huele bien!", -- Black tea
            BLACKTEA_ICED = "¡El agua fría huele bien!", -- Black tea iced tea
            FUER = "Las plantas de la cueva se pusieron rojas , baaah!", -- Boik cha, Yip cha, Guk cha
            MIXFLOWER = "¡Las flores feas florecieron!", -- Mixed flower petals
            HIBISCUSTEA = "Hehe, ¡Herví flores rojas!", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Las flores feas florecieron y son dulces, florp.", -- Cactus flower tea
            LOTUSTEA = "Es un agua de flor muy suave, flurp.", -- Lotus tea
            SUSHIBISCUS = "Hay unas flores muy feas en el agua.", -- Sushi cha
            MOON_BLOSSOM_TEA = "Esto huele muy raro.", -- Moon flower tea

            CAFFEINBERRY_JUICE = "Flurp... No tiene sabor.", -- Black coffee
            TOFFEE_LATTE = "Mmm! ¡Nuez dulce!", -- Toffee Nut Latte
            RUINCHA_LATTE = "Absoluto y Perfecto. ¡Sabroso!", -- Mocha Latte (Coffee + Chocolate)

            HOTRUINCOLATE = "Es muy.Sabroso.¡Y cálido!", -- Hot Chocolate
            RUINCOLATE_SMOOTHIE = "Brrr, ¡Está haciendo que me duela la cabeza!", -- Chocolate Smoothie (Cold)
            RUINXOCOLATL = "¡Kachunk! ¡Es muy amargo!", -- Chocolatl (Bitterness)
            TEA_RUINCOLATE_LATTE = "Huele como césped, ¡Lo voy a beber!", -- Matcha Latte

            MULLED = "Mmm, ¡Es cálido ,me da sueño !", -- Banoosh
            BUTTERBEER = "No sabe a bichos ,es muy dulce !", -- Butterbeer (Harry Potter series)

            -- Collaborative Kettle Drinks

            COCONUT_JUICE = "Está lleno de fruta , slurp!", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Glooorp!!", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "¡Está horrible,¡Horrible!", -- Shipwrecked Quartz Jelly Shake
            CHERRY_ROSEBERRIES_TEA = "Fruta fea, ¿Sin pelos?", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "¡Beber agua de miel te mantiene cálido!", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Los merms no hacen está bebida.", -- Vitacorp Sweet Rice Drink
            PINEANANAS_JUICE = "Fruta ácida en agua dulce, slurp.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Jugoso y refrescante, ¡Florp!", -- Moore Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "¡Hurra!, trituré el jugo rojo congelado", -- Moore Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "¡Hurra!, ¡Es ligero!", -- Moore Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "¿Está bien beberlo incluso cuando está podrido?", -- Spoiled drink

            -- Soda Machine

            SODA = "El agua está rara, está burbujeando.", -- Carbonated water
            FRUITSODA = "Sabe a frutas, pero las burbujas son molestas.", -- Fruit Soda
            LEMONLIMESODA = "Es dulce y delicioso ,¡Pero extraño!", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "Wow, ¡Sabe increíble!, flurp!", -- Cola
            COLAQUANTUM = "Brilla y hace ruido, slurp!", -- Cola Quantum
            LUMPY_BEER = "Tiene un sabor medicinal, pero es dulce y burbujeante.", -- Root Beer (not alcoholic)

            -- Brewery Drinks

            CORN_BEER = "Por encima es espumoso, slurp.", -- Corn Beer
            MADHU = "La mujer vikinga me está mirando con intensidad.", -- Mead
            WINE = "Slurp... Es rojo, pero no dulce.", -- Wine (Berry brewing)
            NOBLEWINE = "Ligeramente marrón y no muy dulce ¿Estará bueno?", -- Noble Wine (Roasted Berry brewing)
            SPARKLINGWINE = "Creo que no debo agitarlo.", -- Sparkling Wine
            GLOWBERRYWINE = "Dame un jugo en vez de este vino brillante.", -- Glow Berry Wine
            KUMIS = "¿Es acaso leche ácida podrida?", -- Kumis (Milk of the Mountain Goat)
            LUMPY_WINE = "Esta agua de raíz huele extraño.", -- Sake (Root vegetable brewing)
            PULQUE = "¡Exprimí las plantas espinosa e hice 'baro'!", -- Pulque (Agave Nectar)
            RUINCACAO_WINE = "Ahora la fruta oscura sabe aún más extraño .", -- Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "¡El agua oscura tiene burbujas y sabe a jugo rojo!", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "¡Agua de fruta ácida y burbujeante!", -- Carbonated Pineapple (Oran-C)
            ORANGESODA = "Sorbe, ¡Es refrescante y genial!", -- Carbonated Orange (Fanta)
            STRAWBERRYSODA = "Es una burbujeante agua de fruta roja, slurp.", -- Carbonated Strawberry (Welch's Strawberry)

            -- Collaborative Brewery Drinks

            AUROBOW = "Hermoso pez...¿Por qué?", -- Shipwrecked Rainbow Jelly Mead
            COCONUT_WINE = "Huele como agua de frutas combinado con alcohol.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "¿Hiciste alcohol con flor de cerezo y miel?", -- Cherry Forest Cherry Blossom Honey Mead
            GIANT_BLUEBERRY_WINE = "Explota cuando lo pones en el fuego.", -- Vitacorp Boom! Berry Sapphire (Explodes when set on fire)
            RICE_WINE = "El agua se convirtió en alcohol...", -- Vitacorp Makgeolli (Rice Wine)
            WHEAT_BEER = "Por encima es espumoso, florp.", -- Hip of Food Wheat Beer
            PALE_BEER = "Jamás había visto una fruta de pantano ser usada para hacer alcohol", -- Legion Pale Ale (Uses Monstrata fruit to make light green beer)

            -- Distilled Spirits

            DISINFECTANT = "Esta agua es fría y desaparece rápidamente.", -- Disinfectant
            CORN_WHISKEY = "Huele como peligro, slurp.", -- Corn Whiskey
            LUMPY_VODKA = "¡Esto no es agua!", -- Vodka
            TEQUILA = "Huele a plantas espinosas, ¿Está podrido?", -- Tequila
            MADHU_RUM = "¿Los merms mezclaron un batido con agua?", -- Rum
            BERRY_BRANDY = "¿Dónde está mi aperitivo frutal?", -- Berry Brandy
            AREUHI = "¿A dónde se fue la leche? ", -- Kumis Distilled Spirits (Arhi)

            -- Warly Exclusive Distilled Spirits

            BERRY_GIN = "Tiene un sabor fuerte, flurp.", -- Gin
            GLOWBERRY_GIN = "¡Está brillando!", -- Glow Berry Gin
            ABSINTHE = "Es como una poción verde, ¡Y huele extraño!", -- Absinthe
            TEA_LUMPY_VODKA = "¿Puedo comer las hojas en vez de ponerlas en alcohol?", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Huele como flores podridas, es un sabor muy fuerte, flort.", -- Rose Scented Brandy
            KAHLUA = "¿Puedo comer los frijoles sin mezclarlos con alcohol? slurp...", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKY = "Desearía que me dieran las nueces en vez de usarlas para hacer alcohol.", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "Wow... Huele a dulces deliciosos...", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "¿Por qué mezclar alcohol con leche?", -- Rumchata (Rum with Horchata, a dairy beverage)

            -- Collaborative Distilled Spirits

            MOONWAY = "......", -- Rainbow Jelly Mead Distilled Spirits
            ARRACK = "Por los merms, solamente dame el agua de fruta, flurp.", -- Arrack (Caribbean Rum with Coconut)
            CHERRY_BLOOM_RUM = "¡Las flores feas están bailando!", -- Cherry Honey Rum Distilled Spirits
            RICE_SPIRITS = "¡Luce como agua pero huele a veneno!", -- Soju
            WHEAT_WHISKEY = "En vez de licor, me gustaría un pan, slurp", -- Wheat Whiskey
            PALE_WHISKEY = "Prefería ir al pantano a recoger frutas que tomar esto.", -- Pale Malt Whiskey

            -- Warly Exclusive Collaborative Distilled Spirits

            NUT_COCONUT_BRANDY = "El olor del jugo es fuerte pero...¡tóxico!", -- Coconut Brandy (Caribbean Brandy)
            GIANT_BLUEBERRY_GIN = "¡Kaboom!", -- Boom Berry Sapphire (Explodes when set on fire)

            -- Pot Cookery

            DARK_RUINCOLATE = "El hombre que cocina me dió estos extraños snacks.", -- Dark Chocolate
            WHITE_RUINCOLATE = "Yum! Yum!", -- White Chocolate
            RUINCOLATE = "Cuando lo masticas, ¡Es pegajoso y rico!", -- Just Chocolate
            RUIN_SCHOKAKOLA = "Es delicioso, pero si comes demasiado, ¡No podrás dormir!", -- Chokola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "¡Una cubeta resistente!", -- Empty steel bucket
                FULL = "¡Lleno de agua de lluvia!", -- Clean rainwater inside
                FULL_ICE = "Brrr, no lo quiero tocar .", -- Rainwater has frozen
                DIRTY = "Se convirtió en un pequeño estanque ", -- Rainwater has become dirty
                DIRTY_ICE = "Brrr, el pequeño se ha congelado.", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "El leñador dijo que no me sentará en él.", -- Empty Woodie's wooden bucket
                FULL = "¡Lleno de agua de lluvia!", -- Clean rainwater inside
                FULL_ICE = "Brrr, ¡No lo quiero tocar!.", -- Rainwater has frozen
                DIRTY = "Se convirtió en un pequeño estanque.", -- Rainwater has become dirty
                DIRTY_ICE = "Brrr, el pequeño estanque se ha congelado.", -- Dirty rainwater has frozen
            },

            BUCKET_EMPTY =
            {
                EMPTY = "Es una cubeta, ribbit.", -- Empty wooden bucket
                FULL = "¡Lleno de agua de lluvia!", -- Clean rainwater inside
                FULL_ICE = "Brrr, no lo quiero tocar", -- Rainwater has frozen
                DIRTY = "Se convirtió en un pequeño estanque.!", -- Rainwater has become dirty
                DIRTY_ICE = "Brrr,  el pequeño estanque se ha congelado.", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "¡Le hicieron de beber del gran estanque!", -- Desalinator has no water
                PURIFY_LONG = "Florp, florp, ¡Tomará un tiempo!", -- Still a long time until purification is complete
                PURIFY_SHORT = "Casi listo para beber, ¡Ribbit!", -- Purification is almost complete
                HASWATER = "El agua ya no está salada, ¡Florp!", -- Desalinator has clean water
                BURNT = "No fuí yo, ribbit!", -- Desalinator has burnt
                HASSALT = "Demasiada sal, no es útil, ribbit.", -- Desalinator has excess salt
            },

            BARREL =
            {
                GENERIC = "La señora Wicker se enfado con ellos por meter pescados ahí,  ribbit.", -- Examining the barrel
                BURNT = "¿Por qué se quemó si hay agua adentro?", -- The barrel is burnt
            },

            BREWERY =
            {
                EMPTY = "Puede hacer refresco, no solo alcohol, ¡Florp!", -- Examining the brewery
                BURNT = "Oh no, ribbit.", -- The brewery is burnt
                FERMENTING_LONG = "Está  tomando mucho tiempo, ribbit.", -- Still a long time until fermentation is complete
                FERMENTING_SHORT = "¿Ya está el refresco?", -- Fermentation is almost complete
                DONE = "¿Es refresco?, flurp.", -- There's a drink in the brewery
            },

            CAMPKETTLE_ITEM = "¡Se necesitan agallas para tomar agua del estanque!", -- Examining the camp kettle item
            CAMPKETTLE =
            {
                GENERIC = "Oh, está vacío.", -- Examining the empty camp kettle on the fire pit
                BOILING_LONG = "El agua sigue fría, flort.", -- Starting to boil water
                BOILING_SHORT = "¡Está caliente!", -- Water is almost boiling
                DONE = "¿El agua no huele verdad?, ribbit.", -- Clean water is obtained
                STOP = "Hay un gran estanque en el interior.", -- The fire pit is off, so dirty water isn't boiling
            },

            CAMPDESALINATOR_ITEM = "Esto es muy pesado", -- Examining the camp desalinator item
            CAMPDESALINATOR =
            {
                GENERIC = "Oh, está vacío.", -- No water in the camp desalinator
                BOILING_LONG = "Slush, slush, florp", -- Starting to boil water
                BOILING_SHORT = "El agua se está moviendo, ¡Fascinante!", -- Water is almost boiling
                DONE = "¡El agua ya no está salada, ribbit!", -- Clean water is obtained
                STOP = "Hay un gran estanque en el interior, flurp.", -- The fire pit is offi, so saltwater isn't purifying
            },

            KETTLE =
            {
                EMPTY = "Estaría bien que tuviera una bebida adentro, flurp.", -- Examining the empty kettle
                BURNT = "Oh no, ribbit.", -- The kettle is burnt
                BOILING_LONG = "Está tomando mucho tiempo, florp.", -- Just started making a drink
                BOILING_SHORT = "¡Estará listo muy pronto!, ribbit!", -- Drink is almost done
                DONE = "Es hora de beber algo, ¡Flurp!", -- The drink is ready
                PURIFY_LONG = "Si no hiervo el agua de pantano, te dará dolor de estómago.", -- Just started boiling dirty water
                PURIFY_SHORT = "Ahora ya casi no huele, flurp.", -- Dirty water is almost done boiling
                HASWATER = "Necesita comida también, ribbit.", -- Kettle has clean water
                MELT_LONG = "Brrr, sigue frío.", -- Just started melting ice water
                MELT_SHORT = "¡Se está derritiendo!", -- Ice water is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Hace que el agua tenga mejor sabor, ¡Flurp!", -- Examining the portable kettle item
                EMPTY = "¡Necesito agua y comida!", -- Examining the placed empty portable kettle
                BOILING_LONG = "¡Está tomando mucho tiempo, ribbit!", -- Just started making a drink
                BOILING_SHORT = "¡Bebida! ¡Bebida! ¡Bebida!", -- Drink is almost done
                DONE = "¡Wow!", -- The drink is ready
                PURIFY_LONG = "Si no hierves el agua de pantano, te dará dolor de estómago.", -- Just started boiling dirty water
                PURIFY_SHORT = "¡Ahora ya casi no huele, ribbit!", -- Dirty water is almost done boiling
                HASWATER = "Tú también necesitas comida, flort.", -- Portable kettle has clean water
                MELT_LONG = "Brrr, sigue frío .", -- Just started melting ice water
                MELT_SHORT = "¡Se está derritiendo!", -- Ice water is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "¡Una bonita caldera hecha de piedra!", -- Examining the distiller
                DISTILLTING_LONG = "Si lo miras, ¡Hace ping ping!", -- Still a long time until distillation is complete
                DISTILLING_SHORT = "No bebo alcohol, florp.", -- Distillation is almost complete
                DONE = "¡Démosle a alguien que lo pueda beber, flurp!", -- There's a drink in the distiller
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "¡Está resonando su fuerza!", -- Maximum pressure
                MIDDLE_PRESSURE = "Está bombeando agua desde abajo,  ribbit.", -- Medium pressure
                LOW_PRESSURE = "Luce cansado , florp.", -- Almost no pressure
                RECHARG_PRESSURE = "No está funcionando, ribbit.", -- No pressure at all (can't be used until pressure is maximum).
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "Ponle combustible para poder rociar agua, florp.", -- Examining the sprinkler with low fuel
                ON = "Continua rociando el agua, podría convertirse en un pantano, ¡Florp!", -- Sprinkler is active
                OFF = "¡Una piedra circular que rocía agua!", -- Examining the turned-off sprinkler
            },
        },
    }   
