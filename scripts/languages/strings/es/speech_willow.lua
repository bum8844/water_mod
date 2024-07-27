return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "Primero necesito hacer espacio en esto", -- Trying to give a bucket to a well that already has water
            WELL_BUSY = "¡No te hagás ilusiones!", -- Trying to give a bucket to a well that's in the process of filling
        }
    },

        ANNOUNCE_DRUNK = "Hehe... Me siento tan bien...",

        ANNOUNCE_DRUNKING =
        {
            "Huff... Pant...",
            "I should have built... a lifting machine...",
            "Lift... with your back...",
            "This isn't... gentleman's work...",
            "For... science... oof!",
            "Is this... messing up my hair?",
            "Hngh...!",
            "Pant... Pant...",
            "This is the worst... experiment...",
        },

        ANNOUNCE_DRUNK_END = "Ugh... mi cuerpo se está enfriando.", -- Sobering up after being drunk
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, specific to Wigfrid
        ANNOUNCE_NOTCHARGE = "Uh oh, no estás brindando leche.", -- Trying to milk the Volt Goat with an uncharged bucket
        ANNOUNCE_NOTHIRSTSLEEP = "Quiero dormir, pero tengo mucha sed.", -- Trying to sleep at night while thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "Quiero descansar, pero tengo mucha sed.", -- Trying to nap during the day while thirsty
        ANNOUNCE_SLEEP_END = "Muy bien, hora de beber otra cosa.", -- Waking up from sleep and fully sober
        ANNOUNCE_THIRST = "¿Porqué mi garganta no es a prueba de fuego también?", -- Becoming very thirsty

        ANNOUNCE_DCAPACITY_CRITICAL = "¡Siento que estoy flotando!", -- Right before getting tipsy
        ANNOUNCE_DCAPACITY_HALF = "No puedo ver las llamas, ¡pero siento calor!", -- Getting tipsy

        ANNOUNCE_CAFFINE_BUFF_START = "Tengo ganas de iniciar un incendio.", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "De acuerdo, dejémoslo para mañana.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Eso fue absolutamente terrible..", -- Curing a waterborne illness with an item

        DESCRIBE =
        {
            BOILBOOK = "Parece que no es nada divertido.",

            WATER_CLEAN_ICE = "Eres realmente frío.", -- Clean ice water
            WATER_DIRTY_ICE = "Se vez muy feo.", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "Haré que respiren fuego por la nariz.", -- Caffeinpepper spice

            WELL_KIT = "¿Tengo que construir todo esto yo sola?", -- Well kit
            WELL_SPRINKLER_KIT = "¿Qué? ¿Tengo que instalarlo?", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "No soy buena con las máquinas.", -- Steam water pump kit
            WELL_BURYING_KIT = "El sonido del agua me molesta.", -- Burying kit for the well
            WELL_DRILLING = "¿Haría menos ruido si le prendo fuego?", -- Drilling hole with drill
            WELL_DRILLING_ITEM = "¿Le puedo prender fuego?", -- Drill item
            HOLE = "Definitivamente no voy a caer ahí.", -- Well hole
            WELL = "ABien está lo que bien acaba, pero si acaba en un pozo, no está tan bien.", -- Well

            WX78MODULE_NONEDRUNK = "Oye Wx, ¿Cuando vas a instalarte un lanzallamas?", -- 78전용 묘듈

            -- Water-based plants

            TEA_TREE = "¡Qué bien se te da prender fuego!", -- Tea tree
            DUG_TEA_TREE = "Quedará más bonito si se enciende en llamas.", -- Dug tea tree
            TEA_SEED = "Hola, semilla de árbol.", -- Tea tree seed
            TEA_SEED_COOKED = "No puede ser un árbol más, ¿verdad?", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Pronto te convertirás en un árbol.", -- Tea tree sapling
            TEALEAVES = "Apuesto a que olerían mejor si las quemo.", -- Tea leaves
            TEALEAVES_DRIED = "Se ven perfectas para hacer carbón.", -- Dried tea leaves

            CAFFEINBERRY = "Té-veré con la luz de la luna.", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "¿Que debería hacer contigo?", -- Dug Caffeinberry bush
            CAFFEINBERRY_BEAN = "Al final, también tiene que ir a la hoguera.", -- Raw caffeinbean
            CAFFEINBERRY_BEAN_COOKED = "Ah, huele fragante.", -- Roasted caffeinbean

            RUINCACAO_TREE = "¿También parece que te has hecho amigo del fuego?", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "¿Por qué estás así? ¿Es porque no hay suciedad?", -- Dug Ruincacao tree
            RUINCACAO_SEED = "¡Las bonitas flores ya han florecido!", -- Ruincacao seed item
            RUINCACAO_SEED_SAPLING = "Estás creciendo muy bien.", -- Ruincacao sapling
            RUINCACAO = "Hmm, humoso.", -- Unbroken Ruincacao pod
            RUINCACAO_BEAN = "¿También necesitas eventualmente la ayuda del fuego?", -- Broken Ruincacao pod
            RUINCACAO_BEAN_COOKED = "Mmm, huele bien.", -- Roasted Ruincacao pod

            -- Distilling additives

            ADDITIVE_SEED = "Estas semillas me aburren.", -- Seed herbs for liqueurs (anise, juniperberry, pentagon)
            ADDITIVE_PETALS = "Reuniste los que se queman bien.", -- Herb, tea, and flower petal additives for liqueurs
            ADDITIVE_NUT = "Probablemente sepa mejor cuando se queme.", -- Nut, coconut, coffee bean, and cacao bean additives for liqueurs
            ADDITIVE_DAIRY = "¿Porqué usar leche en el alcohol?", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "Debería beberla toda.", -- Clean water
            WATER_DIRTY = "Nope.", -- Dirty water
            WATER_SALTY = "¿Porqué hay tanta agua en el mundo?", -- Saltwater

            GOOPYDRINK = "No habría llegado a esto si hubiera sido arrojado al fuego.", -- Failed drink (similar to boiling)

            -- Kettle drinks

            FRUITJUICE = "Prefiero las frutas como son.", -- Mixed fruit juice
            BERRIES_JUICE = "Las preparé con un buen color.", -- Berry juice
            POMEGRANATE_JUICE = "Es rojo, así que debe saber bien.", -- Pomegranate juice
            BANANA_JUICE = "¿Le quitaron antes la cáscara?", -- Banana juice
            FIG_JUICE = "laro que sabe peor cocinado con agua.", -- Fig juice
            DRAGONJUICE = "¿Porqué hay frutas del fuego en el agua?", -- Dragon fruit juice
            GLOWBERRYJUICE = "Es raro que el agua brille.", -- Glowberry juice
            WATERMELON_JUICE = "Hay tanta agua dentro que parece un río.'", -- Watermelon juice

            VEGGIE_TEA = "¡Yo, no, quiero, beberlo!", -- Vegetable juice
            CARROT_TEA = "Ugh, ¿Son zanahorias hervidas?", -- Carrot tea
            CACTUS_TEA = "Está muy pastoso.", -- Cactus tea
            TOMATO_JUICE = "Al menos mis manos no se pondrán jugosas.", -- Tomato juice
            LUMPY_TEA = "Preferiría comerlo tostado.", -- Root tea
            SEAWEED_SHAKE = "Ahora está peor.", -- Seaweed shake

            GREENTEA = "Es sólo agua con hojas dentro.", -- Green leaf tea
            BLACKTEA = "¿No sirve cualquier hoja? ¿Y qué?", -- Black tea
            BLACKTEA_ICED = "¿Por qué están tan ansiosos por añadir hielo?", -- Iced black tea
            FUER = "¿No son todos los tés así?", -- Fire tea, leaf tea, fern tea
            MIXFLOWER = "Al menos el agua huele mejor así.", -- Mixed flower petal tea
            HIBISCUSTEA = "Sabe raro, pero está bien.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Es otro té de flores.", -- Cactus flower tea
            LOTUSTEA = "Debió sentirse satisfecho al volver al agua.", -- Lotus tea
            SUSHIBISCUS = "¿En qué mesa debería poner esto?", -- Sushi tea
            MOON_BLOSSOM_TEA = "Esto es algo impresionante.", -- Moon blossom tea

            CAFFEINBERRY_JUICE = "De repente me siento motivada.", -- Black coffee
            TOFFEE_LATTE = "Puedo masticar las sabrosas nueces.", -- Toffee nut latte
            RUINCHA_LATTE = "Es amargo y dulce a la vez.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "El chocolate caliente sabe mejor si está caliente.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "No sabe tan dulce cuando está frío.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Me gusta mucho que esta bebida esté llena de sabor ahumado.", -- Chocolatl (spicy)
            TEA_RUINCOLATE_LATTE = "¿Porque molimos hojas en el chocolate?", -- Tea latte (matcha)

            MULLED = "Ah, parece que encendí un calentador en mi estómago.", -- Baangso
            BUTTERBEER = "Creo que puedo encender un fuego, ¿debería intentarlo?", -- Butterbeer (from the Harry Potter series)

            -- Collaboration Potable

            COCONUT_JUICE = "Parece mas un bocadillo que una bebida.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "¿Quién hizo que el agua pareciera extrañamente brillante?", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Una combinación de agua con pescado llevaba al límite.", -- Shipwrecked Clownfish Shake
            CHERRY_ROSEBERRIES_TEA = "Sí, huele fragante.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Al menos se ve bonito.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Prefiero la versión tostada.", -- Vita-Hyphy Sikhye
            PINEANANAS_JUICE = "Está bueno cuando lo bebes, pero después te hormiguea la boca.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Si alguien se lo bebe, le sugiero que se lave los dientes.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Ha sido mezclado hasta tener un rojo bonito.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "A veces, las cosas frías no están tan mal.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Ni siquiera puedo usarlo como combustible.", -- Spoiled Drink

            -- Sodas

            SODA = "Agua burbujeante.", -- Soda Water
            FRUITSODA = "De todas las bebidas, esta es la más sabrosa.", -- Fruit Soda
            LEMONLIMESODA = "El agua con miel se bebe caliente.", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "¿Quién iba a pensar que vería cola aquí?", -- Cola
            COLAQUANTUM = "Esto es totalmente anormal.", -- Cola Quantum
            LUMPY_BEER = "El peor refresco.", -- Root Beer (not alcoholic)

            -- Brewed Spirits

            CORN_BEER = "Parece totalmente del gusto de un viejo.", -- Corn Beer
            MADHU = "Está hecho con miel, pero no es tan dulce.", -- Madhu (Honey Wine)
            WINE = "Si quemo una barrica de roble entera, se crearía un aroma increíble.", -- Wine (regular berry fermentation)
            NOBLEWINE = "Pasa muy bien.", -- Noble Wine (roasted berry fermentation)
            SPARKLINGWINE = "Agítalo, y hará ¡BAM!", -- Sparkling Wine
            GLOWBERRYWINE = "Es un vino que brilla como si estuviera ardiendo.", -- Glow Berry Wine
            KUMIS = "¡Acida y desagradable!", -- Kumis, fermented mare's milk
            LUMPY_WINE = "La bebida probablemente olerá a suciedad.", -- Soju (fermented roots)
            PULQUE = "Ugh, Es pegajoso y agrio.", -- Pulque (Agave Wine)
            RUINCACAO_WINE = "Prefiero el chocolate caliente, pero este no está mal.", -- Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "Una imitación casera.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "Es sólo refresco de piña.", -- Pineapple Soda (Oransi)
            ORANGESODA = "Nada especial, solo un refresco naranja.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "Es roja y efervescente, así que es buena.", -- Strawberry Soda (Welch's Strawberry)

            -- Collaborative Brewed Spirits

            AUROBOW = "Ni quemando una medusa cambia de colores así.", -- Shipwrecked Aurobow (Rainbow Jelly Wine)
            COCONUT_WINE =  "El alcohol es bueno, quememos la madera.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Prefiero la forma en que se esparcen los pétalos cuando arden.", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "¡Me gusta!", -- Vita-Hyphy Boom Berry Wine (explodes when set on fire)
            RICE_WINE = "De verdad hacen alcohol de las cosas más extrañas.", -- Vita-Hyphy Makgeolli
            WHEAT_BEER = "No quiero espuma en mi boca.", -- Hip of Food Wheat Beer
            PALE_BEER = "¿Porqué está azul?", -- Legion Pale Ale (Beer made with Monstrata Fruit)

            -- Distilled Spirits

            DISINFECTANT = "He intentado quemar esto antes, pero la llama es difícil de ver.", -- Disinfectant
            CORN_WHISKEY = "¡Bebamos bruscamente y emborrachémonos ligeramente!", -- Corn Whiskey
            LUMPY_VODKA = "Let's drink roughly and light our insides on fire!", -- Vodka
            TEQUILA = "Puedo tolerar el olor acre.", -- Tequila
            MADHU_RUM = "¡Beberé esto en vez de agua!", -- Rum
            BERRY_BRANDY = "Jeje... Me gusta.", -- Berry Brandy
            AREUHI = "El sabor es tan limpio que cuesta creer que esté hecho con leche.", -- Kumis Distilled Spirit Aruhi

            -- Exclusive Distilled Spirits for Walani

            BERRY_GIN = "Lo que realmente quisiera es prender fuego a este mundo podrido.", -- Gin
            GLOWBERRY_GIN = "Brillará y encenderá una llama en mi garganta.", -- Boom Berry Sapphire (explodes like a carrot)
            ABSINTHE = "¡Por favor, vean el incendio provocado como arte!", -- Absinthe
            TEA_LUMPY_VODKA = "Hey, esto es té de verdad.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Puedo oler las flores.", -- Rose-Scented Brandy
            KAHLUA = "Puedo tomar alcohol y café, jeje...", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "¿Hay nueces en el whisky?", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "¡Esto es realmente sabroso y dulce!", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Nunca había visto esto antes, pero se vé que vale la pena.", -- Rumchata (Rum mixed with horchata)

            -- Collaborative Distilled Spirits

            MOONWAY = "Si me emborracha, no me importa de qué esté hecho.", -- Shipwrecked Rainbow Jelly Distilled Spirit
            ARRACK = "Me gusta que tenga un suave aroma frutal.", -- Arrack (Coconut Wine)
            CHERRY_BLOOM_RUM = "Es bonito, debería bebérmelo todo y prenderle fuego.", -- Cherry Honey Wine Distilled Spirit Cherry Blossom Petal Floating
            RICE_SPIRITS = "Me gustan los licores fuertes como éste.", -- Cheongju (Clear Rice Wine)
            WHEAT_WHISKEY = "Beberlo sería tan bueno como prender fuego a un campo de trigo.", -- Wheat Whiskey
            PALE_WHISKEY = "Ahora hasta el whisky es azul.", -- Pale Malt Whiskey

            -- Exclusive Collaborative Distilled Spirits for Walani

            NUT_COCONUT_BRANDY = "Gobernaré este mar o lo veré reducido a cenizas a mi alrededor.", -- Coconut Brandy (Named Caribbean Brandy since I can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "Guau. Realmente me gusta esto.", -- Boom Berry Sapphire (explodes like a carrot)

            -- Pot Cooking

            DARK_RUINCOLATE = "¿Warly tenía muchos sentimientos reprimidos hacia mí?", -- Dark Chocolate
            WHITE_RUINCOLATE = "Mmm... dulce.", -- White Chocolate
            RUINCOLATE = "¡Hay que derretirlo bien y mezclarlo para más sabor!", -- Regular Chocolate
            RUIN_SCHOKAKOLA = "Brillará mejor si lo enciendes antes de usarlo. Espera, ¿es un chocolate?", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "No parece que vaya a arder, ¿debería utilizarlo como contenedor de leña en su lugar?", -- Empty Steel Bucket
                FULL = "Se ha llenado de agua de lluvia.", -- Clean rainwater is inside
                FULL_ICE = "Está sólidamente congelado.", -- Rainwater has frozen
                DIRTY = "¡Se ha llenado de agua sucia!", -- Rainwater has become dirty
                DIRTY_ICE = "¿Tal vez quemarlo lo arregle?", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "¿No es sólo leña con el interior ahuecado?", -- Empty Woodie's Wooden Bucket
                FULL = "Se ha llenado de agua de lluvia.", -- Clean rainwater is inside
                FULL_ICE = "Está sólidamente congelado.", -- Rainwater has frozen
                DIRTY = "¡Se ha llenado de agua sucia!", -- Rainwater has become dirty
                DIRTY_ICE = "¿Tal vez quemarlo lo arregle?", -- Dirty rainwater has frozen
            },

            BUCKET_DRIFTWOOD_EMPTY = 
            {
                EMPTY ="¿No sería genial si pusiera fuego en esto?", 
                FULL = "Se ha llenado de agua de lluvia.", -- Clean rainwater is inside
                FULL_ICE = "Está sólidamente congelado.", -- Rainwater has frozen
                DIRTY = "¡Se ha llenado de agua sucia!", -- Rainwater has become dirty
                DIRTY_ICE = "¿Tal vez quemarlo lo arregle?", -- Dirty rainwater has frozen
            },
            
            BUCKET_EMPTY =
            {
                EMPTY = "¡Sería divertido poner madera dentro y quemarlo todo!", -- Empty Wooden Bucket
                FULL = "Se ha llenado de agua de lluvia.", -- Clean rainwater is inside
                FULL_ICE = "Está sólidamente congelado.", -- Rainwater has frozen
                DIRTY = "¡Se ha llenado de agua sucia!", -- Rainwater has become dirty
                DIRTY_ICE = "¿Tal vez quemarlo lo arregle?", -- Dirty rainwater has frozen
            },

            DESALINATOR =
            {
                EMPTY = "Sería un gran espectáculo incendiarlo con el molino de viento.", -- Desalinator without water
                PURIFY_LONG = "Es aburrido sin fuego.", -- Still a long way to go until purification is complete
                PURIFY_SHORT = "La purificación está casi lista.", -- Purification is almost complete
                HASWATER = "Purificación completada.", -- Desalinator has clean water
                BURNT = "Pero las risas no faltaron, ¿Verdad?", -- Desalinator has burnt down
                HASSALT = "Hay que quitar la sal.", -- Desalinator has salt left
            },

            BARREL =
            {
                GENERIC = "¿Qué tal un barril de pólvora en lugar de un barril de agua??", -- Examining the water barrel
                BURNT = "El agua no es nada contra el fuego.", -- Water barrel has burnt down
            },

            BREWERY =
            {
                EMPTY = "No hay nada que puedas hacer sin fuego.", -- Examining the Brewery
                BURNT = "Hehe se fermentó intensamente.", -- Brewery has burnt down
                FERMENTING_LONG = "El fuego nutrirá cálidamente la levadura.", -- Still a long way to go until fermentation is complete
                FERMENTING_SHORT = "Date prisa, fuego, me está entrando sed.", -- Fermentation is almost complete
                DONE = "Debería haber una bebida con fuego ahí dentro.", -- Brewery contains a brewed drink
            },

            CAMPKETTLE_ITEM = "La usaré para destilar agua con fuego.", -- Examining the Camp Kettle (Item)
            CAMPKETTLE =
            {
                GENERIC = "Vacío.", -- Camp Kettle (in Fire Pit) is empty
                BOILING_LONG = "Estoy limpiando la suciedad. Crecí como una niña limpia.", -- Water is starting to boil
                BOILING_SHORT = "He eliminado casi todas las impurezas.", -- Water is almost boiled
                DONE = "Calentarlo con fuego ayudó, ¿Verdad?", -- Clean water is inside the Camp Kettle
                STOP = "Necesito fuego. ¡Más fuego!", -- No fire in Fire Pit, so dirty water isn't boiling
            },

            CAMPDESALINATOR_ITEM = "Voy a hacer un duelo entre el agua de mar y el fuego.", -- Examining the Camp Desalinator (Item)
            CAMPDESALINATOR =
            {
                GENERIC = "No hay contendientes para el duelo.", -- Camp Desalinator (in Fire Pit) has no water
                BOILING_LONG = "¡Vamos fuego!", -- Water is starting to boil
                BOILING_SHORT = "¡Ya casi!", -- Water is almost boiled
                DONE = "El ganador es siempre el fuego.", -- Clean water is inside the Camp Desalinator
                STOP = "¡Hey, hey! No tiene fuego.", -- No fire in Fire Pit, so saltwater isn't being purified
            },

            KETTLE =
            {
                EMPTY = "Toda el agua debe ser esterilizada por el fuego.", -- Empty Kettle
                BURNT = "Son agua no es nada", -- Kettle has burnt down
                BOILING_LONG = "El fuego está trabajando duro para mezclar los ingredientes.", -- Brewing has just started
                BOILING_SHORT ="El fuego ha extraído casi todos los ingredientes.", -- Brewing is almost done
                DONE = "Calentar con fuego puede incluso mejorar el agua, ¿sabes?", -- The drink is done brewing
                PURIFY_LONG = "Está trabajando duro.", -- Sterilization has just started
                PURIFY_SHORT = "¡Apúrate fuego!", -- Sterilization is almost done
                HASWATER = "Entonces, ¿qué debo hervir a continuación?", -- Kettle contains clean water
                MELT_LONG = "Está trabajando duro para derretirlo.", -- Melting the ice has just started
                MELT_SHORT = "Es imposible que el hielo venza al fuego.", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Es una lata vacía.", -- Examining the Portable Kettle (Item)
                EMPTY = "Es sólo una lata sin agua.", -- Empty Portable Kettle (placed)
                BOILING_LONG = "¡Prepáralo rápido!", -- Brewing has just started
                BOILING_SHORT = "¡Apúrate!", -- Brewing is almost done
                DONE = "Muy bien, bebámoslo.", -- The drink is done brewing
                PURIFY_LONG = "¡Hiérvelo rápido!", -- Sterilization has just started
                PURIFY_SHORT = "¡Apúrate fuego!", -- Sterilization is almost done
                HASWATER = "Entonces, ¿qué debo hervir ahora?", -- Portable Kettle contains clean water
                MELT_LONG = "¡Derrítelo rápido!", -- Melting the ice has just started
                MELT_SHORT = "¡Fuego, date prisa!", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Una máquina que usa el fuego eficientemente.", -- Examining the Distillers
                DISTILLTING_LONG = "Habría terminado más rápido si le hubiera puesto fuego.", -- Distillation still has a long way to go
                DISTILLING_SHORT = "Date prisa, quiero beber algo de licor.", -- Distillation is almost complete
                DONE = "¡Mío!", -- Distillers contain a drink
            },

            WELL_WATERPUMP = {
                HIGH_PRESSURE = "Sólo lo usaré cuando lo necesite.", -- Maximum pressure
                MIDDLE_PRESSURE = "Está debilitándose.", -- Pressure is medium
                LOW_PRESSURE = "Está por apagarse, eso seguro.", -- Almost no pressure
                RECHARG_PRESSURE = "¿Tal vez vuelva a funcionar si le pongo fuego?", -- Pressure is completely gone (can't use it until it's back to maximum)
            },

            WELL_SPRINKLER =
            {
                LOWFUEL = "¿Realmente tengo que suministrarle combustible?", -- Examining the Sprinkler with low fuel
                ON = "Hace un ruido muy molesto.", -- Sprinkler is active
                OFF = "No me molestes, por favor.", -- Examining the inactive Sprinkler
            },
        },
    }