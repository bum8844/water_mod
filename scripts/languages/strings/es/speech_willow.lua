return {
    ACTIONFAIL =
    {
        GIVE =
        {
            WELL_NOTEMPTY = "First, clear what's already there.", -- Trying to give a bucket to a well that already has water
            WELL_BUSY = "I don't like wells taking their sweet time!", -- Trying to give a bucket to a well that's in the process of filling
        }
    },

        ANNOUNCE_DRUNK = "Jajaja... me siento genial...",
        ANNOUNCE_DRUNK_END = "Yuck... ya estoy sobria.", -- Sobering up after being drunk
        ANNOUNCE_DRUNK_IMMUNITY = "", -- Temporary, specific to Wigfrid
        ANNOUNCE_NOTCHARGE = "Oh dios, parece que no estás cargada.", -- Trying to milk the Volt Goat with an uncharged bucket
        ANNOUNCE_NOTHIRSTSLEEP = "Quiero dormir, pero tengo mucha sed.", -- Trying to sleep at night while thirsty
        ANNOUNCE_NOTHIRSTSIESTA = "Quiero descansar, pero tengo mucha sed.", -- Trying to nap during the day while thirsty
        ANNOUNCE_SLEEP_END = "Muy bien, hora de beber otra cosa.", -- Waking up from sleep and fully sober
        ANNOUNCE_THIRST = "¿Porqué mi garganta no es a prueba de fuego también?", -- Becoming very thirsty

        ANNOUNCE_DCAPACITY_CRITICAL = "Oh, ¡Siento que estoy flotando!", -- Right before getting tipsy
        ANNOUNCE_DCAPACITY_HALF = "No puedo ver las llamas, ¡Pero me siento calurosa!", -- Getting tipsy

        ANNOUNCE_CAFFINE_BUFF_START = "Siento como si pudiera quemar todo.", -- Starting the caffeine buff
        ANNOUNCE_CAFFINE_BUFF_STOP = "Bueno, dejémoslo para mañana.", -- Ending the caffeine buff

        ANNOUNCE_CURE_WATERBORNE = "Eso fue extremadamente horrible.", -- Curing a waterborne illness with an item

        DESCRIBE =
        {
            BOILBOOK = "Parece que no es nada divertido.",

            WATER_CLEAN_ICE = "Está muy frío.", -- Clean ice water
            WATER_DIRTY_ICE = "Se vez muy feo.", -- Dirty ice water

            SPICE_CAFFEINPEPPER = "¿Me pregunto si me hará estornudar?", -- Caffeinpepper spice

            WELL_KIT = "¿Tengo que construir todo esto yo sola?", -- Well kit
            WELL_SPRINKLER_KIT = "¿Qué? ¿Tengo que instalarlo?", -- Sprinkler kit
            WELL_WATERPUMP_KIT = "No soy buena con las máquinas.", -- Steam water pump kit
            WELL_BURYING_KIT = "El sonido del agua me molesta.", -- Burying kit for the well
            WELL_DRILLING = "¿Haría menos ruido si le prendo fuego?", -- Drilling hole with drill
            WELL_DRILLING_ITEM = "¿Le puedo prender fuego?", -- Drill item
            HOLE = "Definitivamente no caeré ahí.", -- Well hole
            WELL = "Si hay un pozo, hay una fogata, ¿Verdad?", -- Well

            WX78MODULE_NONEDRUNK = "Oye Wx, ¿Cuando vas a instalarte un lanzallamas?", -- 78전용 묘듈

            -- Water-based plants

            TEA_TREE = "¿Eres bueno para quemarte?", -- Tea tree
            DUG_TEA_TREE = "¿Porqué estás así? ¿No tienes tierra?", -- Dug tea tree
            TEA_SEED = "Hola, semilla de árbol.", -- Tea tree seed
            TEA_SEED_COOKED = "¿Podemos cocinar árboles ahora?", -- Cooked tea tree seed
            TEA_SEED_SAPLING = "Pronto te convertirás en un árbol.", -- Tea tree sapling
            TEALEAVES = "Apuesto a que olerían mejor si las quemo.", -- Tea leaves
            TEALEAVES_DRIED = "Se ven perfectas para hacer carbón.", -- Dried tea leaves

            CAFFEINBERRY = "Té-veré con la luz de la luna.", -- Caffeinberry bush
            DUG_CAFFEINBERRY = "¿Que debería hacer contigo?", -- Dug Caffeinberry bush
            CAFFEINBERRY_BEAN = "También te tendré que poner en la fogata, ¿Verdad?", -- Raw caffeinbean
            CAFFEINBERRY_BEAN_COOKED = "Ah, huele fragante.", -- Roasted caffeinbean

            RUINCACAO_TREE = "Parece que el fuego te a-rruinó.", -- Ruincacao tree
            DUG_RUINCACAO_TREE = "¿No hay tierra cerca?", -- Dug Ruincacao tree
            RUINCACAO_SEED = "Ya floreciste, ¿Verdad?", -- Ruincacao seed item
            RUINCACAO_SEED_SAPLING = "Estás creciendo muy bien.", -- Ruincacao sapling
            RUINCACAO = "Hmm, humoso.", -- Unbroken Ruincacao pod
            RUINCACAO_BEAN = "Al final, todos necesitamos la ayuda del fuego, ¿Eh?", -- Broken Ruincacao pod
            RUINCACAO_BEAN_COOKED = "Mmm, huele bien.", -- Roasted Ruincacao pod

            -- Distilling additives

            ADDITIVE_SEED = "Estas semillas me aburren.", -- Seed herbs for liqueurs (anise, juniperberry, pentagon)
            ADDITIVE_PETALS = "Reuniste los que se queman bien.", -- Herb, tea, and flower petal additives for liqueurs
            ADDITIVE_NUT = "Probablemente sepa mejor cuando se queme.", -- Nut, coconut, coffee bean, and cacao bean additives for liqueurs
            ADDITIVE_DAIRY = "¿Porqué usar leche en el alcohol?", -- Dairy additives for liqueurs

            -- Drinks

            WATER_CLEAN = "Debería beberla toda.", -- Clean water
            WATER_DIRTY = "No, gracias.", -- Dirty water
            WATER_SALTY = "¿Porqué hay tanta agua en el mundo?", -- Saltwater

            GOOPYDRINK = "Estaría mejor en el fuego.", -- Failed drink (similar to boiling)

            -- Kettle drinks

            FRUITJUICE = "Prefiero las frutas como son.", -- Mixed fruit juice
            BERRIES_JUICE = "Las preparé con un buen color.", -- Berry juice
            POMEGRANATE_JUICE = "Es rojo, así que debe saber bien.", -- Pomegranate juice
            BANANA_JUICE = "¿Le quitaron antes la cáscara?", -- Banana juice
            FIG_JUICE = "Probablemente son menos apetitosos en el agua.", -- Fig juice
            DRAGONJUICE = "¿Porqué hay frutas del fuego en el agua?", -- Dragon fruit juice
            GLOWBERRYJUICE = "Es raro que el agua brille.", -- Glowberry juice
            WATERMELON_JUICE = "Hay tanta agua dentro que parece un río.'", -- Watermelon juice

            VEGGIE_TEA = "No, no quiero.", -- Vegetable juice
            CARROT_TEA = "Ugh, ¿Son zanahorias hervidas?", -- Carrot tea
            CACTUS_TEA = "Es bastante acuoso.", -- Cactus tea
            TOMATO_JUICE = "Al menos no me llenaré las manos de algo pegajoso.", -- Tomato juice
            LUMPY_TEA = "Preferiría comerlo tostado.", -- Root tea
            SEAWEED_SHAKE = "Ahora está peor.", -- Seaweed shake

            GREENTEA = "Es sólo agua con hojas dentro.", -- Green leaf tea
            BLACKTEA = "No puedes simplemente hacer agua con lo que quieras, ¿Sabes?", -- Black tea
            BLACKTEA_ICED = "¿Porqué con hielo?", -- Iced black tea
            FUER = "¿No son todos los tés así?", -- Fire tea, leaf tea, fern tea
            MIXFLOWER = "Al menos el agua huele mejor así.", -- Mixed flower petal tea
            HIBISCUSTEA = "Sabe raro, pero está bien.", -- Hibiscus tea
            CACTUSFLOWER_TEA = "Es otro té de flores.", -- Cactus flower tea
            LOTUSTEA = "Deberías estar satisfecho de volver a ser agua.", -- Lotus tea
            SUSHIBISCUS = "¿En qué mesa debería poner esto?", -- Sushi tea
            MOON_BLOSSOM_TEA = "Es bastante impresionante.", -- Moon blossom tea

            CAFFEINBERRY_JUICE = "De repente, me siento motivada.", -- Black coffee
            TOFFEE_LATTE = "Las nueces son crujientes.", -- Toffee nut latte
            RUINCHA_LATTE = "Es amargo y dulce a la vez.", -- Mocha latte (coffee + chocolate)

            HOTRUINCOLATE = "El chocolate caliente sabe mejor si está caliente.", -- Hot chocolate
            RUINCOLATE_SMOOTHIE = "Si está frío, sabe menos dulce.", -- Chocolate smoothie (cold)
            RUINXOCOLATL = "Está llena de la esencia del fuego, me gusta bastante.", -- Chocolatl (spicy)
            TEA_RUINCOLATE_LATTE = "¿Porque molimos hojas en el chocolate?", -- Tea latte (matcha)

            MULLED = "Ah, parece que encendí un calentador en mi estómago.", -- Baangso
            BUTTERBEER = "¿Debería mezclarlo con el fuego?", -- Butterbeer (from the Harry Potter series)

            -- Collaboration Potable

            COCONUT_JUICE = "Si parece una bebida ahora.", -- Shipwrecked Coconut Juice
            RAINBOW_SHAKE = "Extrañamente colorido.", -- Shipwrecked Rainbow Jelly Shake
            QUARTZ_SHAKE = "Una combinación de agua con pescado llevaba al límite.", -- Shipwrecked Clownfish Shake
            CHERRY_ROSEBERRIES_TEA = "Claro, huele fragante.", -- Cherry Forest Rosehip Tea
            CHERRY_HONEY_TEA = "Al menos se ve bonito.", -- Cherry Forest Cherry Blossom Honey Tea
            SWEET_RICE_DRINK = "Prefiero la versión tostada.", -- Vita-Hyphy Sikhye
            PINEANANAS_JUICE = "Es bueno para beber, pero hará que tu lengua se escalde.", -- Legion Pineapple Juice
            ORANGE_JUICE = "Después de beberlo, debería cepillar mis dientes.", -- More Food Pack Orange Juice
            STRAWBERRY_SMOOTHIE = "Ha sido mezclado hasta tener un rojo bonito.", -- More Food Pack Strawberry Smoothie
            STRAWBERRY_MILK_SMOOTHIE = "A veces, las cosas frías no están tan mal.", -- More Food Pack Strawberry Milk Smoothie

            -- Distillery Drinks

            SPOILED_DRINK = "Ni siquiera puedo usarlo como combustible.", -- Spoiled Drink

            -- Sodas

            SODA = "Agua burbujeante.", -- Soda Water
            FRUITSODA = "De todas las bebidas, esta es la más sabrosa.", -- Fruit Soda
            LEMONLIMESODA = "Dicen que deberías beber esto caliente.", -- Lemon Lime Soda (superior to Fruit Soda)
            COLA = "Puedo encontrar cola en todos lados.", -- Cola
            COLAQUANTUM = "Esto es totalmente anormal.", -- Cola Quantum
            LUMPY_BEER = "El peor refresco.", -- Root Beer (not alcoholic)

            -- Brewed Spirits

            CORN_BEER = "Algo que bebería un hombre viejo.", -- Corn Beer
            MADHU = "Lo hice con miel, pero no es tan dulce.", -- Madhu (Honey Wine)
            WINE = "Si lo guardas en una barrica, tendrá un olor aún mejor.", -- Wine (regular berry fermentation)
            NOBLEWINE = "Pasa muy bien.", -- Noble Wine (roasted berry fermentation)
            SPARKLINGWINE = "Agítalo, y hará ¡BAM!", -- Sparkling Wine
            GLOWBERRYWINE = "Brilla incluso sin fuego.", -- Glow Berry Wine
            KUMIS = "Sabe agrio y fuerte.", -- Kumis, fermented mare's milk
            LUMPY_WINE = "Probablemente sepa a tierra.", -- Soju (fermented roots)
            PULQUE = "Ugh, Es pegajoso y agrio.", -- Pulque (Agave Wine)
            RUINCACAO_WINE = "El chocolate caliente sabe mejor cuando hace calor, pero esto también está bien.", -- Cacao Wine

            -- Collaborative Sodas

            CHERRY_DOCTOR_COLA = "Una imitación casera.", -- Cherry Forest Dr. Pepper (Dr. Cherry)
            PINEANANASSODA = "Es sólo refresco de piña.", -- Pineapple Soda (Oransi)
            ORANGESODA = "Nada especial, solo un refresco naranja.", -- Orange Soda (Fanta)
            STRAWBERRYSODA = "Es rojo y burbujea, así que estará bueno, ¿Verdad?", -- Strawberry Soda (Welch's Strawberry)

            -- Collaborative Brewed Spirits

            AUROBOW = "Incluso si prendes fuego, no obtendrás colores como éstos.", -- Shipwrecked Aurobow (Rainbow Jelly Wine)
            COCONUT_WINE = "El alcohol está bien, pero la madera puede ser quemada.", -- Shipwrecked Coconut Wine
            CHERRY_BLOOM_MADHU = "Prefiero la forma en que se dispersa cuando está en llamas.", -- Cherry Forest Cherry Blossom Honey Wine
            GIANT_BLUEBERRY_WINE = "¡Me gusta!", -- Vita-Hyphy Boom Berry Wine (explodes when set on fire)
            RICE_WINE = "Supongo que puedes hacer alcohol con cosas raras.", -- Vita-Hyphy Makgeolli
            WHEAT_BEER = "No quiero espuma en mi boca.", -- Hip of Food Wheat Beer
            PALE_BEER = "¿Porqué está azul?", -- Legion Pale Ale (Beer made with Monstrata Fruit)

            -- Distilled Spirits

            DISINFECTANT = "Intenté quemarlo, pero no hace tanto fuego.", -- Disinfectant
            CORN_WHISKEY = "¡Bebamos bruscamente y emborrachémonos ligeramente!", -- Corn Whiskey
            LUMPY_VODKA = "Let's drink roughly and light our insides on fire!", -- Vodka
            TEQUILA = "Puedo tolerar el olor fuerte.", -- Tequila
            MADHU_RUM = "¿Quiero beber esto en vez de agua?", -- Rum
            BERRY_BRANDY = "Jeje... Me gusta.", -- Berry Brandy
            AREUHI = "No parece que esté hecho con leche para nada.", -- Kumis Distilled Spirit Aruhi

            -- Exclusive Distilled Spirits for Walani

            BERRY_GIN = "Lo que realmente quisiera es prender fuego a este mundo podrido.", -- Gin
            GLOWBERRY_GIN = "Wow. Me gusta mucho.", -- Boom Berry Sapphire (explodes like a carrot)
            ABSINTHE = "Viendo la piromanía como arte, ¿Eh?", -- Absinthe
            TEA_LUMPY_VODKA = "Hey, esto es té de verdad.", -- Green Tea Liqueur
            PETALS_BERRY_BRANDY = "Puedo oler las flores.", -- Rose-Scented Brandy
            KAHLUA = "Puedo tomar alcohol y café, jeje...", -- Coffee Liqueur Kahlua
            NUT_CORN_WHISKEY = "¿Hay nueces en el whisky?", -- Nut Whiskey
            RUINCACAO_CREAM_LIQUEUR = "¡Sabe muy bien!", -- Baileys Cacao Cream Liqueur
            RUMCHATA = "Nunca había visto esto antes, pero se vé que vale la pena.", -- Rumchata (Rum mixed with horchata)

            -- Collaborative Distilled Spirits

            MOONWAY = "Bebe lo que sea siempre que te haga emborracharte, ¿Cierto?", -- Shipwrecked Rainbow Jelly Distilled Spirit
            ARRACK = "Me gusta que tenga un suave aroma frutal.", -- Arrack (Coconut Wine)
            CHERRY_BLOOM_RUM = "Es bonito, pero debería beberlo y quemar todo.", -- Cherry Honey Wine Distilled Spirit Cherry Blossom Petal Floating
            RICE_SPIRITS = "Me gustan los licores fuertes como éste.", -- Cheongju (Clear Rice Wine)
            WHEAT_WHISKEY = "Beberlo sería tan bueno como prender fuego a un campo de trigo.", -- Wheat Whiskey
            PALE_WHISKEY = "Este whisky también esta hecho con fuego.", -- Pale Malt Whiskey

            -- Exclusive Collaborative Distilled Spirits for Walani

            NUT_COCONUT_BRANDY = "Si no puedo conquistar los mares, lo convertiré todo en cenizas.", -- Coconut Brandy (Named Caribbean Brandy since I can't make Caribbean Rum)
            GIANT_BLUEBERRY_GIN = "Wow. Me gusta mucho.", -- Boom Berry Sapphire (explodes like a carrot)

            -- Pot Cooking

            DARK_RUINCOLATE = "Realmente está bueno, Warly.", -- Dark Chocolate
            WHITE_RUINCOLATE = "Mmm... dulce.", -- White Chocolate
            RUINCOLATE = "¡Hay que derretirlo bien y mezclarlo para más sabor!", -- Regular Chocolate
            RUIN_SCHOKAKOLA = "Se prenderá bien si lo enciendes. Bueno, es chocolate.", -- Schokakola

            BUCKET_STEEL_EMPTY =
            {
                EMPTY = "No parece que tenga agua. ¿Servirá de combustible?", -- Empty Steel Bucket
                FULL = "Se ha llenado de agua de lluvia.", -- Clean rainwater is inside
                FULL_ICE = "Está sólidamente congelado.", -- Rainwater has frozen
                DIRTY = "¡Se ha llenado de agua sucia!", -- Rainwater has become dirty
                DIRTY_ICE = "¿Tal vez quemarlo lo arregle?", -- Dirty rainwater has frozen
            },

            BUCKET_WOODIE_EMPTY =
            {
                EMPTY = "¿Es de madera?", -- Empty Woodie's Wooden Bucket
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
                BURNT = "Fue intensamente fermentado por seguro.", -- Brewery has burnt down
                FERMENTING_LONG = "Está fermentando muy bien con ayuda del fuego.", -- Still a long way to go until fermentation is complete
                FERMENTING_SHORT = "Estará listo pronto.", -- Fermentation is almost complete
                DONE = "Debería haber una bebida con fuego ahí dentro.", -- Brewery contains a brewed drink
            },

            CAMPKETTLE_ITEM = "La usaré para destilar agua con fuego.", -- Examining the Camp Kettle (Item)
            CAMPKETTLE =
            {
                GENERIC = "Vacío.", -- Camp Kettle (in Fire Pit) is empty
                BOILING_LONG = "Está quitando las impurezas. Me criaron como una niña limpia.", -- Water is starting to boil
                BOILING_SHORT = "Apúrate!", -- Water is almost boiled
                DONE = "Calentarlo con fuego ayudó, ¿Verdad?", -- Clean water is inside the Camp Kettle
                STOP = "Necesito fuego. ¡Más fuego!", -- No fire in Fire Pit, so dirty water isn't boiling
            },

            CAMPDESALINATOR_ITEM = "Voy a hacer un duelo entre el agua de mar y el fuego.", -- Examining the Camp Desalinator (Item)
            CAMPDESALINATOR =
            {
                GENERIC = "No hay contendientes para el duelo.", -- Camp Desalinator (in Fire Pit) has no water
                BOILING_LONG = "¡Vamos fuego!", -- Water is starting to boil
                BOILING_SHORT = "¡Ya casi!", -- Water is almost boiled
                DONE = "El fuego siempre gana.", -- Clean water is inside the Camp Desalinator
                STOP = "¡Hey, hey! No tiene fuego.", -- No fire in Fire Pit, so saltwater isn't being purified
            },

            KETTLE =
            {
                EMPTY = "Debes esterilizar el agua con el fuego.", -- Empty Kettle
                BURNT = "Sin agua, no es nada.", -- Kettle has burnt down
                BOILING_LONG = "El fuego está trabajando duro para mezclar los ingredientes.", -- Brewing has just started
                BOILING_SHORT = "¡Apúrate!", -- Brewing is almost done
                DONE = "Calentarlo con fuego siempre mejora las cosas, ¿Verdad?", -- The drink is done brewing
                PURIFY_LONG = "Está trabajando duro.", -- Sterilization has just started
                PURIFY_SHORT = "¡Apúrate fuego!", -- Sterilization is almost done
                HASWATER = "¿Que debería preparar ahora?", -- Kettle contains clean water
                MELT_LONG = "Está trabajando duro para derretirlo.", -- Melting the ice has just started
                MELT_SHORT = "¡Rápido!", -- Ice is almost melted
            },

            PORTABLEKETTLE_ITEM =
            {
                GENERIC = "Es una lata vacía.", -- Examining the Portable Kettle (Item)
                EMPTY = "Es sólo una lata sin agua.", -- Empty Portable Kettle (placed)
                BOILING_LONG = "¡Hiérvelo rápido!", -- Brewing has just started
                BOILING_SHORT = "¡Apúrate!", -- Brewing is almost done
                DONE = "Muy bien, bebámoslo.", -- The drink is done brewing
                PURIFY_LONG = "¡Hiérvelo rápido!", -- Sterilization has just started
                PURIFY_SHORT = "¡Apúrate fuego!", -- Sterilization is almost done
                HASWATER = "¿Qué debería preparar ahora?", -- Portable Kettle contains clean water
                MELT_LONG = "¡Derrítelo rápido!", -- Melting the ice has just started
                MELT_SHORT = "¡Ya casi!", -- Ice is almost melted
            },

            DISTILLERS =
            {
                EMPTY = "Una máquina que usa el fuego eficientemente.", -- Examining the Distillers
                DISTILLTING_LONG = "Habría terminado más rápido si le hubiera puesto fuego.", -- Distillation still has a long way to go
                DISTILLING_SHORT = "Apúrate, quiero beber.", -- Distillation is almost complete
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
                LOWFUEL = "Debería ponerle combustible", -- Examining the Sprinkler with low fuel
                ON = "Hace un ruido muy molesto.", -- Sprinkler is active
                OFF = "No me molestes.", -- Examining the inactive Sprinkler
            },
        },
    }