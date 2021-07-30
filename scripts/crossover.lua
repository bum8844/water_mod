local _G = GLOBAL
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local STRINGS = _G.STRINGS
local TUNING = _G.TUNING
local CUSTOM_RECIPETABS = _G.CUSTOM_RECIPETABS

-- Тут измененые для некоторых предметов что бы сбалансировать оба мода когда они работают вместе.

-- Списко того что делает мод когда включён мод на жажду:
-- Каждый напитка из a water mod востанавливает жажду.
-- Из деревяных кружек, Флыг, бутылок(далие просто бутылок) можно налить воду. 
-- При условии того что в бутылке не меньше 50 едениц воды.
-- При наливании из бутылки воды в чайник бутылка теряет 1 прочность.
-- В бочку можно налить воду из бытылок если в бутылке не меньше 50 единиц воды
-- Если в бутылке меньше 50 единиц воды то из бочки можно забрать воду бутылкой.

-- Тюнинги времяни готовки напиктов. Все они были умменьшины в отличии от оригинала для баланса.
TUNING.KETTLE_WATER = 10 -- Время кепяченя воды
TUNING.KETTLE_TEA = 10 -- Время готовки чая
TUNING.KETTLE_COFFE = 15 -- Время готовки кофе
TUNING.KETTLE_DRAGON = 25 -- Время готовки напитка из питая
TUNING.KETTLE_MONSTER = 19 -- Время готовки напитка монстра и сиропа паука.
TUNING.KETTLE_ABI = 38 -- Время готовки призрачного напитка

-- Сколько востанавливает жажды тот или иной напиток.
TUNING.DRINKCUP_ABI = 35
TUNING.DRINKCUP_WATER = 55
TUNING.DRINK_BERRY = 55
TUNING.DRINK_CARROT = 55
TUNING.DRINKCUP_TEA = 67
TUNING.DRINKCUP_HIBISCUS = 73
TUNING.DRINK_HONEY = 78
TUNING.DRINKCUP_MONSTER = 67
TUNING.DRINKCUP_BEER = 72
TUNING.DRINK_CACTUS = 84
TUNING.DRINKCUP_COFFE = 72
TUNING.DRINKCUP_DRAGON = 80
TUNING.DRINK_BANANA = 90
TUNING.DRINK_SODA = 125
