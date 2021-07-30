--Я переписал все названия, и теперь они будут склоняться. Не будет "Подойти к колодец", или всего этого. Ниже написано как это работает
--Так же я поправил ошибки
_G=GLOBAL
local STRINGS = _G.STRINGS
local rec = STRINGS.RECIPE_DESC
local nm = STRINGS.NAMES
local gen = STRINGS.CHARACTERS.GENERIC.DESCRIBE
--Проверяем наличие русификатора.
mods=_G.rawget(_G,"mods")or(function()local m={}_G.rawset(_G,"mods",m)return m end)()
rus = mods.RussianLanguagePack or mods.UniversalTranslator
mk = rus and (rus.SelectedLanguage == "ru")
    and (rus.RegisterRussianName or rus.RegisterNameTranslation)
 
--Если русификатор обнаружен, то пользуемся шрифтами и средствами, которые он предоставляет.
if mk then
	--[[Функция регистрирует новое имя предмета со всеми данными, необходимыми для его корректного склонения.
		key - Ключ объекта. Например, MYITEM (из STRINGS.NAMES.MYITEM).
		val - Русский перевод названия объекта.
		gender - Пол объекта. Варианты: he, he2, she, it, plural, plural2. Род нужен для склонения префиксов жары и влажности.
			 "he" и "he2" - это мужской род, но не одно и то же, сравните: изучить влажный курган слизнепах (he),
			 но изучить влажного паука (he2). plural2 — одушевлённое во множественном числе (если слово, например, "Чайки",
			 то есть когда объект изначально получает название во множественном числе).
		walkto - Склонение при подстановке во фразу "Идти к" (кому? чему?). Задавайте слова с большой буквы.
		defaultaction - Подставляется ко всем действиям в игре, для которых не задано особое написание. Например "Осмотреть" (кого? что?).
		capitalized - Нужно ли писать имя с большой буквы. Маленькая буква в названии не станет большой.
				  Но если не указать true, то большая станет маленькой в фразах, где есть слово перед. Например: "Осмотреть лепестки".
		killaction - Используется только в DST во всех предметах, которые способны убить персонажа. В игре они могут появляться в сообщениях
			 типа "Был убит (кем? чем?)", то есть это творительный падеж.
		Вместо строковых значений пола можно использовать их номера: 1) he, 2) he2, 3) she, 4) it, 5) plural, 6) plural2.
		Вместо walkto, defaultaction и killaction можно использовать 0 или 1.
		0 означает пропуск параметра. То же, что не указать параметр вовсе. Значение не инициализируется. Используются значения из testname.
		1 означает "то же, что и базовая форма", т.е. val. Чтобы не дублировать одни и те же строки (val) можно просто указать единичку.
		
		Например: 
		mk("RESEARCHLAB2","Алхимический двигатель",1,"Алхимическому двигателю",1)
		Вместо пола указана 1, что означает "he".
		Вместо defaultaction указано 1, что означает повторение val, т.е. "Алхимический двигатель".
	]]
STRINGS.NAMES.DRINKS_TAB = "ВОДА"
STRINGS.TABS.DRINKS_TAB = "Вода"

TUNING.BEER_ONDRINK = "Я...что то себя плохо чуствую..."
TUNING.BEER_OFFDRINK = "Мне уже лучше!" --Не лутТше, а лучше
TUNING.POHMEL = "Какая гадость , но я чусвтю себя лучше!"
TUNING.STAR_BAKS = "Не старбакс но тоже сойдёт." --давай без сленга
TUNING.TEA_YAWN = ""
TUNING.RED_TEA_SPEEP = "Спааааттттьььь..."
STRINGS.TABS.DRINKS_TAB = "Вода"
--========имена========--
mk("WATERWELL","Колодец",1,"колодцу",1)
mk("HOLE","Странная яма",3,"странной яме","странную яму")
mk("HOLE2","Дыра",3,"дыре","дыру")
mk("BUCKET","Ведро",4)
mk("KETTLE","Чайник",1)
mk("KETTLE_PORT","Портотивный чайник",1)
mk("BUCKETFULL","Ведро воды",4,"Ведру воды",1)
mk("BUCKETICE","Ведро льда",4,"Ведру льда",1)
mk("WATERWELL_ITEM","Детали для колодца",5,"Деталям для колодца",1)
mk("WATERBARRLE","Бочка",3,"Бочке","Бочку")
mk("BEER_BARRLE","Пивная бочка",3,"Пивной Бочке","Пивную Бочку")
mk("CUP","Пустая чашка",3,"Пустой чашке","Пустую чашку")
mk("CUP_WATER","Чашка воды",3,"Чашке воды","Чашку воды")
mk("CUP_COFFE","Чашка кофе",3,"Чашке кофе","Чашку кофе")
mk("CUP_TEE","Чашка чая",3,"Чашке чая","Чашку чая")
mk("CUP_RED","Чашка чая из питахайи",3,"Чашке чая из питахайи","Чашку чая из питахайи")
mk("CUP_MONSTER","Чашка монстро-напитка",3,"Чашке монстро-напитка","Чашку монстро-напитка")
mk("CUP_SPIDER","Чашка паучьего сиропа",3,"Чашке паучьего сиропа","Чашку паучьего сиропа")
mk("CUP_BEER","Кружна пива",3,"Кружке пива","Кружку пива")
mk("CUP_ABI","Чашка призрачного напитка",3,"Чашке призрачного напитка","Чашку призрачного напитка")
mk("CUP_HIBISCUS","Чашка с каркоде",3,"Чашке с каркоде","Чашку с каркоде")
mk("CUP_STRANG","Странное варево",4,"Странному вареву",1)
mk("TEE_PLANT","Чайный куст",1,"Чайному кусту",1)
mk("TEE_TREE","Чайное дерево",4,"Чайному дереву",1)
mk("TEE_S","Чайная заварка",3,"Чайной заварке","Чайную заварку")
mk("TEE_M","Заварка монстра",3,"Заварке монстра","Заварку монстра")
mk("TEE_G","Призрачная заварка",3,"Призрачной заварке","Призрачную заварку")
mk("TEE_R","Заварка из питая",3,"Заварке из питая","Заварку из питая")
mk("TEE_R2","Каркоде заварка",3,"Каркоде заварке","Каркоде заварку")
mk("COFFE_BEANS","Кофейные бобы",5,"Кофейным бобам",1)
mk("COFFE_BEANS_RAW","Сырые кофейные бобы",5,"Сырым кофейным бобам",1)
mk("MR_BEEFALO","Мистр биффало",2,"Мистеру биффало","Мистера биффало")
mk("SHADOWWILSON","Теневая статуя",3,"Теневой статуе","Теневой статуе")
mk("DUG_TEE_TREE","Чайное дерево",4,"Чайному дереву",1)
mk("CUPSJOURNAL","Книга рецептов",3,"Книгу рецептов","Книге рецептов")
mk("WHEAT","Пшеница",3,"Пшенице","Пшеницу")
mk("CUTWHEAT","Пшеница",3,"Пшенице","Пшеницу")
mk("DUG_WHEAT","Пшеница",3,"Пшенице","Пшеницу")
mk("FLOUR","Мука",3,"Муке","Муку")
mk("BREAD","Хлеб",1,"Хлебу",1)
mk("BUN","Сладкая буочка",3,"Сладкой булочке","Сладкой булочке")
mk("WATER_MAHINE","Мини гидро станция",3,"Мини гидро станцие","Мини гидро станцию")
mk("ICE_MAHINE","Разморажеватель",3,"Разморажеватель","Разморажевателю")
mk("BUCKET_HELMET","Ведро-Шлем",1,"Ведро-Шлему",1)
mk("COFFEBUSH","Кофейный куст",1,"Кофейному кусту",1)
mk("DUG_COFFEBUSH","Кофейный куст",1,"Кофейному кусту",1)
mk("TEE","Чайные листья",5,"Чайным листьям",1)
mk("GRASS_BAG","Мешочек с травами",5,"Мешочку с травами",1)

mk("SODA1","Апельсиновая газировка",3,"Апельсиновой газировке","Апельсиовую газировку")
mk("SODA2","Виноградная газировка",3,"Виноградной газировке","Виноградную газировку")
mk("SODA3","Poopsee",3,"Poopsee","Poopsee")
mk("SODA4","Кола",3,"Коле","Колу")

--рецепты--
STRINGS.RECIPE_DESC.WATERWELL = "Очень глубокий колодец!"
STRINGS.RECIPE_DESC.HOLE = "Там что то есть! Может Раскопать её лопатой?"
STRINGS.RECIPE_DESC.HOLE2 = "На дне вода. Отличное место для колодца"
STRINGS.RECIPE_DESC.BUCKET = "И на голову одеть и воды набрать.!"
STRINGS.RECIPE_DESC.KETTLE = "Любишь чай?"
STRINGS.RECIPE_DESC.KETTLE_PORT = "Делай напитки где угодно!"
STRINGS.RECIPE_DESC.CUPSJOURNAL = "Книга рецептов для чайника, для чайников"
STRINGS.RECIPE_DESC.CUP_STRANG = "Поможет тебе протрезветь."
STRINGS.RECIPE_DESC.WATER_MAHINE = "Выкачивай воду прямо из земли!"
STRINGS.RECIPE_DESC.ICE_MAHINE = "Превращяет лёд в воду!"
STRINGS.RECIPE_DESC.BUCKET_HELMET = "Деревяная шляпа!"

STRINGS.RECIPE_DESC.FLOUR = "Испеки вкусный хлеб!"
STRINGS.RECIPE_DESC.COFFE_BEANS = "Чистая энергия! Но лучше сделать кофе"
STRINGS.RECIPE_DESC.TEE_S = "Завари себе немного вкуснейшего чая!"
STRINGS.RECIPE_DESC.TEE_M = "Стоит пить только монстрам."
STRINGS.RECIPE_DESC.TEE_G = "Если надоела жизнь."
STRINGS.RECIPE_DESC.TEE_R = "Завари и усни."
STRINGS.RECIPE_DESC.TEE_R2 = "Сладкий Индийский чай."
STRINGS.RECIPE_DESC.BEER_BARRLE = "Черезмерное употребление пива может бла бла бла"
STRINGS.RECIPE_DESC.WATERBARRLE = "Вместительный контейнер для воды!"
STRINGS.RECIPE_DESC.WATERWELL_ITEM = "Найди яму, и выкиь это туда!"
STRINGS.RECIPE_DESC.CUP = "Контейнер для жидкостей."
STRINGS.RECIPE_DESC.GRASS_BAG = "Мешок с новыми кустами."
--Осмотр
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BUCKET = "Наполни его, и оно станет менее пустым."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_STRANG = "Ужастно пахнет!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BUN = "С глазурью... Ведь это глазурь, верно?"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUPSJOURNAL = "Книга рецептов для чайника, для чайников"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WHEAT = "Напомниет мне о светлых волосах."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUTWHEAT = "Срезаные злаки."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_WHEAT = "Теперь это переносное пшено."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLOUR = "Мука для выпечки."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BREAD = "Хлеб всему голова."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KETTLE = "Люблю чай!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.KETTLE_PORT = "Я могу сложить его в рюкзак в любое время!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BUCKETFULL = "Теперь оно стало куда тяжелее"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BUCKETICE = "Замороженная вода в ведре!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WATERWELL_ITEM = "Я могу сделать из этого колодец, был бы только источник!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WATERBARRLE = "Бочка для воды? Оригинально, и полезно."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.BEER_BARRLE = "Будем варить!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP = "Пустая"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_WATER = "Обычная кипячёная вода."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_COFFE = "Бодрит!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_TEE = "Успакаивающий чай!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_RED = "От одного запаха в сон клонит"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_MONSTER = "Ужастно пахнет"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_SPIDER = "Сиропчик"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_BEER = "Оно тёмное или светлое?"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_HIBISCUS = "Сладкий индийский чай."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE_PLANT = "Можно приготовить чай"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE = "Пахнут ароматно."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE_S = "Какой прелестный цвет!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE_M = "Запах отвартительный"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE_G = "Венди понравиться."
STRINGS.CHARACTERS.WENDY.DESCRIBE.TEE_G = "Абигеил я иду!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE_R = "Хоть для чего то нужен этот бесполезный фрукт."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE_R2 = "Традиционный напиток Индии."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_ABI = "Венди понравиться."
STRINGS.CHARACTERS.WENDY.DESCRIBE.CUP_ABI = "Абигеил я иду!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEE_TREE = "Маленький зелёный друг!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.COFFE_BEANS = "Бодрит"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MR_BEEFALO = "Ты биффало?"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SHADOWWILSON = "Страшный"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_TEE_TREE = "Мёртвый зелёный друг."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HOLE2 = "Яма. Но как мне её использовать?"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WATERWELL = "Здесь вода такая вкусная!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.HOLE = "Очень грбокая"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WATER_MAHINE = "Нужно заправить его чем-нибудь."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.COFFEBUSH = "Выглядит странно. Похож на огонь!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.DUG_COFFEBUSH = "Я могу пересадить его!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.COFFE_BEANS_RAW = "Может попробывать пожарить их?"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.GRASS_BAG = "Я могу открыть его и получить новые вещи!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SODA1 = "Со вкусом апельсина."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SODA2 = "Со вкусом винограда"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SODA3 = "Странное название для напитка."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.SODA4 = "Жарким летом самое то!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.ICE_MAHINE = "Превращяет лёд в воду!"


STRINGS.NAMES.TEA_BERRY = "Заварка чая из ягод"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEA_BERRY = "Пахник вкусно."
STRINGS.RECIPE_DESC.TEA_BERRY = "Сладкий вруктовый чай."

STRINGS.NAMES.TEA_CARROT = "Заварка чая из моркови"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEA_CARROT = "Надеюсь это хотя бы полезно."
STRINGS.RECIPE_DESC.TEA_CARROT = "Чай для вегеторианцев?"

STRINGS.NAMES.TEA_CACTUS = "Заварка из цветка кактуса"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEA_CACTUS = "Я надеюсь он не будет острым как кактус."
STRINGS.RECIPE_DESC.TEA_CACTUS = "Раслабтесь и выпитей холного чая."

STRINGS.NAMES.TEA_BANANA = "Бананово-тропический чай"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEA_BANANA = "Думаю его стоит пить холодным."
STRINGS.RECIPE_DESC.TEA_BANANA = "Чай примеком из тропиков."

STRINGS.NAMES.TEA_HONEY = "Чайная заварка с мёдом"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.TEA_HONEY = "Мёд теперь не такой уж и безполезный."
STRINGS.RECIPE_DESC.TEA_HONEY = "Сделай свой чай не много слаще."

STRINGS.NAMES.CUP_BERRY = "Чашка ягодного чая"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_BERRY = "Пахнет вкусно."

STRINGS.NAMES.CUP_CARROT = "Чашка морковного чая"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_CARROT = "Это не выглядит приятным на вкус..."

STRINGS.NAMES.CUP_CACTUS = "Чашка чая из цветка кактуса"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_CACTUS = "Замечательный экзотический напиток."

STRINGS.NAMES.CUP_BANANA = "Чашка тропического чая"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_BANANA = "Прикрасный напиток для летней поры."

STRINGS.NAMES.CUP_HONEY = "Чашка чая с мёдом"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CUP_HONEY = "Сладкий, очень сладкий."

STRINGS.BUCKETRAIN = "Ведро дождевой воды"
STRINGS.BUCKETDIRTY = "Ведро грязной воды"
STRINGS.BUCKETOASIS = "Ведро воды из оазиса"
end

STRINGS.AW_DRINK = "Пить"

STRINGS.CUP_WATERDIRTY = "Чашка грязной воды"
STRINGS.CUP_WATERRAW = "Чашка сырой воды"

STRINGS.NAMES.CAMPKETTLE = "Походный чайник"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.CAMPKETTLE = "Он постоянно требует топливо."
STRINGS.RECIPE_DESC.CAMPKETTLE = "Твой чайник на первое время."