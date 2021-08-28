--Local'ы. Чтоб было меньше писанины
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local STRINGS = _G.STRINGS
local TUNING = _G.TUNING
local CUSTOM_RECIPETABS = _G.CUSTOM_RECIPETABS
--Ставить tuning надо перед префабами.

PrefabFiles = --Здесь у нас префабы
{
	"waterwell",
	"bucket",
	"bucketfull",
	"bucketice",
	"waterbarrle",
	"hole2",
	"hole",
	"waterwell_item",
	"kettles",
	"tea",
	"tee_plant",
	"tee_tree",
	"dug_tee_tree",
	"water_mahine",
	--"bucket_helmet",
	"cups",
	"grass_bag",
	"mr_beefalo",
	"ice_mahine",
}

if not GLOBAL.KnownModIndex:IsModEnabled("workshop-1113732066") and not GLOBAL.KnownModIndex:IsModForceEnabled("workshop-367546858") then
    table.insert(PrefabFiles, "beer_barrle")
end

-- Assets = {
    -- Asset("ATLAS", "images/inventoryimages/waterwell.xml"),--Тут типо изображения,в переменной АТLАS, нам нужен файл .xml
    -- Asset("IMAGE", "images/inventoryimages/waterwell.tex"),-- А в переменной IMAGE - .tex
	
	-- Asset("ATLAS", "images/inventoryimages/tee.xml"),
    -- Asset("IMAGE", "images/inventoryimages/tee.tex"),
	
	-- Asset("ATLAS", "images/inventoryimages/water_mahine.xml"),
    -- Asset("IMAGE", "images/inventoryimages/water_mahine.tex"),
	
	-- Asset("ATLAS", "images/inventoryimages/ice_mahine.xml"),
    -- Asset("IMAGE", "images/inventoryimages/ice_mahine.tex"),
	
	-- Asset("ATLAS", "images/inventoryimages/beer_barrle.xml"),
    -- Asset("IMAGE", "images/inventoryimages/beer_barrle.tex"),
	
	-- Asset("ATLAS", "images/inventoryimages/campkettle.xml"),
    -- Asset("IMAGE", "images/inventoryimages/campkettle.tex"),
	
	-- Asset("ATLAS", "images/water_images.xml"),
    -- Asset("IMAGE", "images/water_images.tex"),
	
	-- Asset("SOUNDPACKAGE", "sound/fil_drink.fev"),	
    -- Asset("SOUND", "sound/fil_drink.fsb"),
	-- Asset("ANIM", "anim/swap_cup.zip" ),
	-- Asset("ANIM", "anim/fili_thirst_bage.zip" ),
-- }

--local drinkstab = AddRecipeTab("Water", 979, "images/watertab.xml", "watertab.tex", nil)
STRINGS.NAMES.DRINKS_TAB = "WATER"
STRINGS.TABS.DRINKS_TAB = "Water"
GLOBAL.RECIPETABS['DRINKS_TAB'] = {str = "DRINKS_TAB", sort=3, icon = "watertab.tex", icon_atlas = "images/watertab.xml"}

modimport("scripts/recipes.lua")
modimport("scripts/strings.lua") -- Подгружаем англиский текст в любом случаии
modimport("scripts/preparedrink.lua")
modimport("scripts/prepareagedrink.lua")
modimport("scripts/watertuning.lua")

-- Принудительный выбор языка, тут всё просто
-- Если 1 т.е Русский задём Русский язык
if language_cfg == 1 then
    modimport("scripts/rus_strings.lua")
end
-- Если 3 т.е Китайский задём Китайский язык
if language_cfg == 3 then
    modimport("scripts/strings_chi.lua")
end
-- Если у нас конфиге 0 т.е авто то мы проверяем подписки.
-- Если подписаны на Китайский
if language_cfg == 0 and (GLOBAL.KnownModIndex:IsModEnabled("workshop-367546858") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-367546858")) then
    modimport("scripts/strings_chi.lua")
end
-- Если подписаны на Русский
if language_cfg == 0 and (GLOBAL.KnownModIndex:IsModEnabled("workshop-354836336") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-354836336")) 
or (GLOBAL.KnownModIndex:IsModEnabled("workshop-1240565842") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1240565842")) then
    modimport("scripts/rus_strings.lua")
end

AddMinimapAtlas("images/water_images.xml")-- А здесь иконка на мини карт


--GLOBAL.ACTIONS.FILL.fn = function(act)
    --return act.target ~= nil
        --and act.invobject ~= nil
        --and act.invobject.components.fillable ~= nil
        --and act.target:HasTag("watersource")
        --and act.invobject.components.fillable:Fill(act.target.prefab, act.doer)
--end

if not GLOBAL.KnownModIndex:IsModEnabled("workshop-908071894") and not GLOBAL.KnownModIndex:IsModForceEnabled("workshop-908071894") then
    if TUNING.AW_THIRST == 1 then
        modimport("aw_status.lua")
		TUNING.WATERCROSSOVER = 0
    end
else
    TUNING.WATERCROSSOVER = 1
    modimport("scripts/crossover.lua")
end

modimport("aw_widgets.lua")

local function AddToBerryGroup(inst)
    inst:AddTag("barrel_berries_group")
end

--AddPrefabPostInit("berries", AddToBerryGroup)
--AddPrefabPostInit("berries_juicy", AddToBerryGroup)

local Container = GLOBAL.require "components/container"

function Container:HasWithTag(tag, amount)
    local num_found = 0
    for k,v in pairs(self.slots) do
        if v and v:HasTag(tag) then
            if v.components.stackable ~= nil then
                num_found = num_found + v.components.stackable:StackSize()
            else
                num_found = num_found + 1
            end
        end
    end
    return num_found >= amount, num_found
end

modimport("scripts/drink_action.lua")

local function BackBucket(inst)
    local owner = inst.components.inventoryitem.owner
	if owner and owner.components.inventory then
		owner.components.inventory:GiveItem(GLOBAL.SpawnPrefab("bucket"))
	end
    inst:Remove()
end

AddPrefabPostInit("fertilizer", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	inst:DoTaskInTime(0, function()	
        inst.components.finiteuses:SetOnFinished(BackBucket)
	end)
end)

local cleansource =
{
	"oasislake",
	"hotspring"
}

local function CleanWater(inst)
	inst:AddTag("cleanwater")
end

for _, v in pairs(cleansource) do
	AddPrefabPostInit(v, CleanWater)
end

for k, v in pairs(require("preparedrink")) do
	AddCookerRecipe("kettle", v)
end

for k, v in pairs(require("prepareagedrink")) do
	AddCookerRecipe("beer_barrle", v)
end

AddIngredientValues("foliage", {decoration=1, inedible=1})
AddIngredientValues("petals", {decoration=1, inedible=1})
AddIngredientValues("succulent_picked", {decoration=1, inedible=1})
AddIngredientValues("tealeaves", {decoration=1, inedible=1})
AddIngredientValues("beefalo_milk", {milk=1, dairy=1})
AddIngredientValues("moon_tree_blossom", {decoration=1, inedible=1})
AddIngredientValues("firenettles", {decoration=1, inedible=1})
AddIngredientValues("tillweeds", {decoration=1, inedible=1})
