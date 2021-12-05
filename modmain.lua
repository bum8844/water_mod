local _G = GLOBAL
local RECIPETABS = _G.RECIPETABS
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local STRINGS = _G.STRINGS
local TUNING = _G.TUNING
local CUSTOM_RECIPETABS = _G.CUSTOM_RECIPETABS


PrefabFiles =
{
 "bucket",
 "bucketfull",
 "bucketice",
 "cup",
 "preparedrink",
 "barrle",
 "brewery",
 "campkettle",
 "kettle",
 "portable_kettle",
 "desalinator",
 "well_drilling",
 "tea_tree",
 "tea_seed",
}

Assets = {
    Asset("ATLAS", "images/tea_inventoryitem.xml"),--Тут типо изображения,в переменной АТLАS, нам нужен файл .xml
    Asset("IMAGE", "images/tea_inventoryitem.tex"),-- А в переменной IMAGE - .tex
	Asset("ATLAS", "images/tea_minimap.xml"),
    Asset("IMAGE", "images/tea_minimap.tex"),
	Asset("ATLAS", "images/watertab.xml"),
    Asset("IMAGE", "images/watertab.tex"),
	Asset("SOUNDPACKAGE", "sound/fil_drink.fev"),	
    Asset("SOUND", "sound/fil_drink.fsb"),
	Asset("ANIM", "anim/swap_cup.zip" ),
	Asset("ANIM", "anim/fili_thirst_bage.zip" ),
}

STRINGS.NAMES.DRINKS_TAB = "WATER"
STRINGS.TABS.DRINKS_TAB = "Water"
GLOBAL.RECIPETABS['DRINKS_TAB'] = {str = "DRINKS_TAB", sort=3, icon_atlas = "images/watertab.xml", icon = "watertab.tex"}

modimport("scripts/recipes.lua")
modimport("scripts/strings.lua")

AddMinimapAtlas("images/tea_minimap.xml")

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

--[[for k, v in pairs(require("preparedrink")) do
	AddCookerRecipe("kettle", v)
end]]--

--[[for k, v in pairs(require("prepareagedrink")) do
	AddCookerRecipe("brewery", v)
end]]--

--[[AddIngredientValues("foliage", {decoration=1, inedible=1})
AddIngredientValues("petals", {decoration=1, inedible=1})
AddIngredientValues("succulent_picked", {decoration=1, inedible=1})
AddIngredientValues("tealeaves", {decoration=1, inedible=1})
AddIngredientValues("beefalo_milk", {milk=1, dairy=1})
AddIngredientValues("moon_tree_blossom", {decoration=1, inedible=1})
AddIngredientValues("firenettles", {decoration=1, inedible=1})
AddIngredientValues("tillweeds", {decoration=1, inedible=1})]]--
