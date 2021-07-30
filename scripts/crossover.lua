local _G = GLOBAL
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local STRINGS = _G.STRINGS
local TUNING = _G.TUNING
local CUSTOM_RECIPETABS = _G.CUSTOM_RECIPETABS

-- ��� ��������� ��� ��������� ��������� ��� �� �������������� ��� ���� ����� ��� �������� ������.

-- ������ ���� ��� ������ ��� ����� ������� ��� �� �����:
-- ������ ������� �� a water mod �������������� �����.
-- �� ��������� ������, ����, �������(����� ������ �������) ����� ������ ����. 
-- ��� ������� ���� ��� � ������� �� ������ 50 ������ ����.
-- ��� ��������� �� ������� ���� � ������ ������� ������ 1 ���������.
-- � ����� ����� ������ ���� �� ������� ���� � ������� �� ������ 50 ������ ����
-- ���� � ������� ������ 50 ������ ���� �� �� ����� ����� ������� ���� ��������.

-- ������� ������� ������� ��������. ��� ��� ���� ���������� � ������� �� ��������� ��� �������.
TUNING.KETTLE_WATER = 10 -- ����� �������� ����
TUNING.KETTLE_TEA = 10 -- ����� ������� ���
TUNING.KETTLE_COFFE = 15 -- ����� ������� ����
TUNING.KETTLE_DRAGON = 25 -- ����� ������� ������� �� �����
TUNING.KETTLE_MONSTER = 19 -- ����� ������� ������� ������� � ������ �����.
TUNING.KETTLE_ABI = 38 -- ����� ������� ����������� �������

-- ������� �������������� ����� ��� ��� ���� �������.
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
