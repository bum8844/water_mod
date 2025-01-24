local _G = GLOBAL
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local CONSTRUCTION_PLANS =_G.CONSTRUCTION_PLANS

-- For sorting recipe.
-- Source: https://steamcommunity.com/sharedfiles/filedetails/?id=1467214795
local function SortRecipe(a, b, filter_name, offset)
    local filter = _G.CRAFTING_FILTERS[filter_name]
    if filter and filter.recipes then
        for sortvalue, product in ipairs(filter.recipes) do
            if product == a then
                table.remove(filter.recipes, sortvalue)
                break
            end
        end

        local target_position = #filter.recipes + 1
        for sortvalue, product in ipairs(filter.recipes) do
            if product == b then
                target_position = sortvalue + offset
                break
            end
        end

        table.insert(filter.recipes, target_position, a)
    end
end 
 
local function SortBefore(a, b, filter_name)
    SortRecipe(a, b, filter_name, 0)
end 

local function SortAfter(a, b, filter_name)
    SortRecipe(a, b, filter_name, 1)
end

local function ModAtlas()
    return "images/inventoryitems/tea_inventoryitem.xml"
end

local function Drink_ModAtlas()
    return "images/inventoryitems/tea_inventoryitem_drinks.xml"
end

AddRecipeFilter({name = "HYDRATION", atlas = ModAtlas, image = "hydration.tex", custom_pos=nil, recipes=nil,},nil)
AddRecipeFilter({name = "SECRETKNOWLEDGE", atlas = ModAtlas, image = "secretknowledge.tex", custom_pos=nil, recipes=nil,},nil)

AddRecipeToFilter("refined_dust","HYDRATION")

-- CELESTIAL
AddRecipeToFilter("moonrockidol","SECRETKNOWLEDGE")
AddRecipeToFilter("multiplayer_portal_moonrock_constr_plans","SECRETKNOWLEDGE")
AddRecipeToFilter("lunar_forge_kit","SECRETKNOWLEDGE")
AddRecipeToFilter("moonglassaxe","SECRETKNOWLEDGE")
AddRecipeToFilter("glasscutter","SECRETKNOWLEDGE")
AddRecipeToFilter("turf_meteor","SECRETKNOWLEDGE")
AddRecipeToFilter("turf_fungus_moon","SECRETKNOWLEDGE")
AddRecipeToFilter("bathbomb","SECRETKNOWLEDGE")
AddRecipeToFilter("chesspiece_moon_sketch","SECRETKNOWLEDGE")
AddRecipeToFilter("chesspiece_butterfly_sketch","SECRETKNOWLEDGE")

-- ANCIENT
AddRecipeToFilter("thulecite","SECRETKNOWLEDGE")
AddRecipeToFilter("wall_ruins_item","SECRETKNOWLEDGE")
AddRecipeToFilter("nightmare_timepiece","SECRETKNOWLEDGE")
AddRecipeToFilter("orangeamulet","SECRETKNOWLEDGE")
AddRecipeToFilter("greenamulet","SECRETKNOWLEDGE")
AddRecipeToFilter("yellowamulet","SECRETKNOWLEDGE")
AddRecipeToFilter("orangestaff","SECRETKNOWLEDGE")
AddRecipeToFilter("greenstaff","SECRETKNOWLEDGE")
AddRecipeToFilter("yellowstaff","SECRETKNOWLEDGE")
AddRecipeToFilter("multitool_axe_pickaxe","SECRETKNOWLEDGE")
AddRecipeToFilter("nutrientsgoggleshat","SECRETKNOWLEDGE")
AddRecipeToFilter("ruinshat","SECRETKNOWLEDGE")
AddRecipeToFilter("armorruins","SECRETKNOWLEDGE")
AddRecipeToFilter("ruins_bat","SECRETKNOWLEDGE")
AddRecipeToFilter("eyeturret_item","SECRETKNOWLEDGE")
AddRecipeToFilter("shadow_forge_kit","SECRETKNOWLEDGE")
AddRecipeToFilter("blueprint_craftingset_ruins_builder","SECRETKNOWLEDGE")
AddRecipeToFilter("blueprint_craftingset_ruinsglow_builder","SECRETKNOWLEDGE")

AddRecipe2("bucket_woodie_empty",{Ingredient("lucy",0),Ingredient("log",1)},TECH.NONE,{atlas = ModAtlas(), image = "bucket_woodie_empty.tex", builder_tag="woodcarver1", sg_state="carvewood_boards",  description="bucket_empty"},{"CHARACTER","HYDRATION","TOOLS"})
SortAfter("bucket_woodie_empty", "goldenpitchfork", "TOOLS")
SortAfter("bucket_woodie_empty","woodie_boards","CHARACTER")

AddRecipe2("bucket_steel_empty",{Ingredient("steelwool",1),Ingredient("hammer",0)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "bucket_steel_empty.tex",  description="bucket_empty"},{"HYDRATION","TOOLS"})

AddRecipePostInit("fertilizer",function(v) v.ingredients = {Ingredient("poop", 3), Ingredient("boneshard", 2), Ingredient("log",2), Ingredient("bucket_empty", 1, ModAtlas(), nil,"bucket_empty.tex")} end)
AddRecipe2("bucket_empty",{Ingredient("log",2)},TECH.NONE,{atlas = ModAtlas(), image = "bucket_empty.tex"},{"HYDRATION","TOOLS"})
SortAfter("bucket_empty","bucket_woodie_empty","TOOLS")

AddRecipe2("bucket_driftwood_empty",{Ingredient("driftwood_log",2)},TECH.NONE,{atlas = ModAtlas(), image = "bucket_driftwood_empty.tex"},{"HYDRATION","TOOLS"})
SortAfter("bucket_driftwood_empty","bucket_empty","TOOLS")
SortAfter("bucket_steel_empty","bucket_driftwood_empty","TOOLS")

AddRecipe2("spice_caffeinpepper",{Ingredient("caffeinberry_bean_cooked", 3, ModAtlas(), nil, "caffeinberry_bean_cooked.tex")},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "spice_caffeinpepper.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("spice_caffeinpepper", "spice_salt", "FOODPROCESSING")

AddRecipe2("spice_ruincolate_spread",{Ingredient("ruincacao_bean_cooked", 3, ModAtlas(), nil, "ruincacao_bean_cooked.tex")},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "spice_ruincolate_spread.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("spice_ruincolate_spread", "spice_caffeinpepper", "FOODPROCESSING")

AddRecipe2("additive_seed",{Ingredient("pinecone",1),Ingredient("pepper_seeds",1),Ingredient("garlic_seeds",1)},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_seed.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_seed", "spice_caffeinpepper", "FOODPROCESSING")

AddRecipe2("additive_nut",{Ingredient("acorn_cooked",1),Ingredient("ruincacao_bean_cooked",1,ModAtlas(),nil,"ruincacao_bean_cooked.tex"),Ingredient("caffeinberry_bean_cooked", 1, ModAtlas(), nil, "caffeinberry_bean_cooked.tex")},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_nut.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_nut", "additive_seed", "FOODPROCESSING")

AddRecipe2("additive_dairy",{Ingredient("goatmilk",1),Ingredient("milkywhites",1),Ingredient("butter", 1)},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_dairy.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_dairy", "additive_seed", "FOODPROCESSING")

AddRecipe2("additive_petals",{Ingredient("petals",1),Ingredient("tealeaves",1,ModAtlas(),nil,"tealeaves.tex"),Ingredient("foliage", 1)},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_petals.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_petals", "additive_seed", "FOODPROCESSING")

AddRecipe2("boilbook_basic",{Ingredient("papyrus",1),Ingredient("tealeaves",1,ModAtlas(),nil,"tealeaves.tex")},TECH.SCIENCE_ONE,{atlas = ModAtlas(), image = "boilbook_basic.tex"},{"COOKING","HYDRATION"})
SortAfter("boilbook_basic","cookbook","COOKING")

AddRecipe2("boilbook_advanced",{Ingredient("boilbook_basic",1,ModAtlas(),nil,"boilbook_basic.tex"),Ingredient("papyrus",2),Ingredient("featherpencil", 1)},TECH.SCIENCE_ONE,{atlas = ModAtlas(), image = "boilbook_advanced.tex"},{"COOKING","HYDRATION"})
SortAfter("boilbook_advanced","boilbook_basic","COOKING")

AddRecipe2("campkettle_item",{Ingredient("twigs",2),Ingredient("log",2),Ingredient("cutgrass",2)},TECH.NONE,{atlas = ModAtlas(), image = "campkettle.tex"},{"COOKING","REFINE","HYDRATION","STRUCTURES"})
SortBefore("campkettle_item","cookpot","COOKING")
SortBefore("campkettle_item","transistor","REFINE")

AddRecipe2("kettle",{Ingredient("twigs",3),Ingredient("cutstone",2),Ingredient("charcoal",2)},TECH.SCIENCE_ONE,{placer = "kettle_placer", atlas = ModAtlas(), image = "kettle.tex"},{"COOKING","HYDRATION","STRUCTURES"})
SortAfter("kettle","cookpot","COOKING")
SortAfter("kettle","cookpot","STRUCTURES")

AddRecipe2("portablekettle_item",{Ingredient("transistor",2),Ingredient("log",2),Ingredient("cutstone",2),Ingredient("charcoal",3)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "portablekettle_item.tex"},{"COOKING","HYDRATION"})
SortAfter("portablekettle_item","kettle","COOKING")

AddRecipe2("purification_tablets",{Ingredient("nitre",2),Ingredient("ash",5),Ingredient("charcoal",10),Ingredient("water_clean",5,Drink_ModAtlas(),nil,"water_clean_bottle.tex")},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "purification_tablets_bottle.tex", numtogive=3},{"COOKING","HYDRATION","REFINE"})
SortAfter("purification_tablets","kettle","COOKING")
SortAfter("purification_tablets","campkettle_item","REFINE")

AddRecipe2("tea_pot",{Ingredient("twigs",3),Ingredient("flint",2),Ingredient("rope",2),Ingredient("charcoal",2)},TECH.SCIENCE_ONE,{placer = "tea_pot_placer", atlas = ModAtlas(), image = "tea_pot.tex"},{"COOKING","HYDRATION","STRUCTURES"})
SortAfter("tea_pot","purification_tablets","COOKING")
SortAfter("tea_pot","purification_tablets","STRUCTURES")

AddRecipe2("portable_tea_pot_item",{Ingredient("transistor",1),Ingredient("cutstone",2),Ingredient("charcoal",3)},TECH.NONE,{atlas = ModAtlas(), image = "portable_tea_pot_item.tex", builder_tag="professionalchef"},{"COOKING","HYDRATION","CHARACTER"})
SortAfter("portable_tea_pot_item","tea_pot","COOKING")

AddRecipe2("brewery",{Ingredient("boards",3),Ingredient("livinglog",3),Ingredient("rope",3),Ingredient("cutstone",6),Ingredient("goldnugget",4)},TECH.SCIENCE_TWO,{placer = "brewery_placer", atlas = ModAtlas(), image = "brewery.tex"},{"COOKING","HYDRATION","STRUCTURES"})
SortAfter("brewery","portablekettle_item","COOKING")
SortAfter("brewery","kettle","STRUCTURES")

AddRecipe2("distillers",{Ingredient("dreadstone",8),Ingredient("nightmarefuel",4),Ingredient("transistor",4),Ingredient("redgem",1),Ingredient("bluegem",1)},TECH.SCIENCE_TWO,{placer = "distillers_placer",atlas = ModAtlas(), image = "distillers.tex"},{"COOKING","HYDRATION","STRUCTURES"})
SortAfter("distillers","brewery","COOKING")

AddRecipe2("bottle_pouch_small",{Ingredient("papyrus",2),Ingredient("tentaclespots",2)},TECH.SCIENCE_ONE,{atlas = ModAtlas(), image = "bottle_pouch_small.tex"},{"COOKING","CONTAINERS","HYDRATION"})
AddRecipe2("bottle_pouch_big",{Ingredient("bottle_pouch_small",2,ModAtlas(),nil,"bottle_pouch_small.tex"),Ingredient("alterguardianhatshard",1),Ingredient("rope",2),Ingredient("bearger_fur",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "bottle_pouch_big.tex"},{"COOKING","CONTAINERS","HYDRATION"})
AddRecipe2("thermos_bottle_small",{Ingredient("opalpreciousgem",1),Ingredient("moonglass",5),Ingredient("rope",3),Ingredient("goldnugget",10),Ingredient("messagebottleempty",2)},TECH.SCIENCE_ONE,{atlas = ModAtlas(), image = "thermos_bottle_small.tex"},{"COOKING","CONTAINERS","HYDRATION"})
AddRecipe2("thermos_bottle_big",{Ingredient("thermos_bottle_small",1,ModAtlas(),nil,"thermos_bottle_small.tex"),Ingredient("alterguardianhatshard",1),Ingredient("purebrilliance",2)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "thermos_bottle_big.tex"},{"COOKING","CONTAINERS","HYDRATION"})

AddRecipe2("wine_cellar",{Ingredient("wine_cellar_part",3),Ingredient("gelblob_bottle",4),Ingredient("cutstone",6)},TECH.LOST,{placer = "wine_cellar_placer",atlas = ModAtlas(), image="wine_cellar.tex", testfn=function(pt) return not TheWorld.Map:GetPlatformAtPoint(pt.x, 0, pt.z, -0.5) ~= nil and not TheWorld.Map:IsDockAtPoint(pt.x, 0, pt.z) end},{"COOKING","HYDRATION","CONTAINERS","STRUCTURES"})
SortAfter("wine_cellar","icebox","COOKING")
SortAfter("wine_cellar","icebox","CONTAINERS")
SortAfter("wine_cellar","icebox","STRUCTURES")

SortAfter("bottle_pouch_small","wine_cellar","COOKING")
SortAfter("bottle_pouch_small","wine_cellar","CONTAINERS")
SortAfter("bottle_pouch_big","bottle_pouch_small","COOKING")
SortAfter("bottle_pouch_big","bottle_pouch_small","CONTAINERS")
SortAfter("thermos_bottle_small","bottle_pouch_big","COOKING")
SortAfter("thermos_bottle_small","bottle_pouch_big","CONTAINERS")
SortAfter("thermos_bottle_big","thermos_bottle_small","COOKING")
SortAfter("thermos_bottle_big","thermos_bottle_small","CONTAINERS")

AddRecipe2("campdesalinator_item",{Ingredient("flint",2),Ingredient("cutstone",1),Ingredient("minifan",2)},TECH.SCIENCE_ONE,{atlas = ModAtlas(), image = "campdesalinator.tex"},{"COOKING","REFINE","HYDRATION","STRUCTURES"})
SortAfter("campdesalinator_item","campkettle_item","COOKING")
SortAfter("campdesalinator_item","purification_tablets","REFINE")

AddRecipe2("desalinator",{Ingredient("boards",12),Ingredient("rope",6),Ingredient("rocks",6),Ingredient("nitre",6),Ingredient("charcoal",6)},TECH.SCIENCE_TWO,{placer = "desalinator_placer", atlas = ModAtlas(), image = "desalinator.tex", size = 32},{"CONTAINERS","COOKING","GARDENING","HYDRATION","STRUCTURES"})

AddRecipe2("barrel",{Ingredient("boards",2),Ingredient("rope",3),Ingredient("charcoal",3)},TECH.SCIENCE_ONE,{placer = "barrel_placer", atlas = ModAtlas(), image = "barrel.tex"},{"CONTAINERS","COOKING","GARDENING","HYDRATION","STRUCTURES"})
SortAfter("barrel","saltbox","CONTAINERS")
SortAfter("barrel","saltbox","STRUCTURES")
SortAfter("barrel","saltbox","COOKING")
SortAfter("barrel","premiumwateringcan","GARDENING")

SortAfter("desalinator","barrel","STRUCTURES")
SortAfter("desalinator","barrel","CONTAINERS")
SortAfter("desalinator","barrel","COOKING")
SortAfter("desalinator","barrel","GARDENING")

AddRecipe2("well_drilling_item",{Ingredient("trinket_6",4),Ingredient("transistor",2),Ingredient("goldnugget",4),Ingredient("flint",4),Ingredient("steelwool",2)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_drilling_item.tex"},{"GARDENING","REFINE","HYDRATION"})
SortAfter("well_drilling_item","farm_plow_item","GARDENING")

AddRecipe2("well_kit",{Ingredient("boards",2),Ingredient("cutstone",6),Ingredient("hammer",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_kit.tex"},{"GARDENING","REFINE","HYDRATION","STRUCTURES"})
SortAfter("well_kit","well_drilling_item","GARDENING")
SortAfter("well_kit","well_drilling_item","REFINE")
SortAfter("well_kit","","STRUCTURES")

AddRecipe2("well_sprinkler_kit",{Ingredient("marble",4),Ingredient("moonglass",1),Ingredient("townportaltalisman",2),Ingredient("gears",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_sprinkler_kit.tex"},{"GARDENING","REFINE","HYDRATION","STRUCTURES"})
SortAfter("well_sprinkler_kit","well_kit","GARDENING")
SortAfter("well_sprinkler_kit","well_kit","REFINE")
SortAfter("well_sprinkler_kit","well_kit","STRUCTURES")

AddRecipe2("well_waterpump_kit",{Ingredient("security_pulse_cage_full",1),Ingredient("wagpunk_bits",4),Ingredient("transistor",1),Ingredient("cutstone",2)},TECH.NONE,{atlas = ModAtlas(), image = "well_waterpump_kit.tex"},{"GARDENING","REFINE","HYDRATION","STRUCTURES"})
SortAfter("well_waterpump_kit","well_sprinkler_kit","GARDENING")
SortAfter("well_waterpump_kit","well_sprinkler_kit","REFINE")
SortAfter("well_waterpump_kit","well_sprinkler_kit","STRUCTURES")

AddRecipe2("well_burying_kit",{Ingredient("boards",4),Ingredient("hammer",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_burying_kit.tex"},{"GARDENING","REFINE","HYDRATION"})
SortAfter("well_burying_kit","well_waterpump_kit","GARDENING")
SortAfter("well_burying_kit","well_waterpump_kit","REFINE")

AddRecipe2("wx78module_nonedrunk",{Ingredient("scandata",3),Ingredient("fruitflyfruit_dead",1),Ingredient("gears",2),Ingredient("wx78module_maxhunger1",1)},TECH.ROBOTMODULECRAFT_ONE,{atlas = ModAtlas(), image = "wx78module_nonedrunk.tex", builder_tag="upgrademoduleowner"},{"CHARACTER"})
SortAfter("wx78module_nonedrunk","wx78module_maxhunger1","CHARACTER")

AddRecipe2("wx78module_acid_drying",{Ingredient("scandata",3),Ingredient("shroom_skin",1),Ingredient("water_acid",3,Drink_ModAtlas(),nil,"water_acid.tex")},TECH.ROBOTMODULECRAFT_ONE,{atlas = ModAtlas(), image = "wx78module_nonedrunk.tex", builder_tag="upgrademoduleowner"},{"CHARACTER"})
SortAfter("wx78module_acid_drying","wx78module_nonedrunk","CHARACTER")

AddRecipe2("acid_battery",{Ingredient("water_acid",2,Drink_ModAtlas(),nil,"water_acid.tex"),Ingredient("goldnugget",1),Ingredient("sewing_tape",2)},TECH.NONE,{atlas = ModAtlas(), image = "acid_battery.tex", builder_tag="handyperson"},{"CHARACTER","REFINE"})

AddRecipe2("melt_nitre",{Ingredient("goldnugget",3),Ingredient("water_acid",2,Drink_ModAtlas(),nil,"water_acid.tex")},TECH.SCIENCE_TWO,{product="nitre",image="nitre.tex",numtogive=2,description="melt_nitre"},{"REFINE"})

AddRecipe2("transmute_water_salty",{Ingredient("water_acid",3,Drink_ModAtlas(),nil,"water_acid.tex"),Ingredient("purification_tablets",1,ModAtlas(),nil,"purification_tablets.tex")},TECH.NONE,{product="water_salty" ,atlas = Drink_ModAtlas(), image = "water_salty.tex", numtogive = 2, builder_tag="wilson_alchemy_1", description="transmute_water_salty" },{"CHARACTER","REFINE"})
AddRecipe2("transmute_water_acid",{Ingredient("water_salty",3,Drink_ModAtlas(),nil,"water_acid.tex"),Ingredient("purification_tablets",1,ModAtlas(),nil,"purification_tablets.tex")},TECH.NONE,{product="water_acid" ,atlas = Drink_ModAtlas(), image = "water_acid.tex", numtogive = 2, builder_tag="wilson_alchemy_1", description="transmute_water_acid" },{"CHARACTER","REFINE"})

AddDeconstructRecipe("well", {Ingredient("boards",2),Ingredient("cutstone",6)})

AddDeconstructRecipe("well_buryingsite", {Ingredient("boards",4)})

AddDeconstructRecipe("well_sprinkler", {Ingredient("marble",4),Ingredient("moonglass",1),Ingredient("townportaltalisman",2),Ingredient("gears",1)})

AddDeconstructRecipe("wine_cellar_part", {Ingredient("wagpunk_bits",3),Ingredient("livinglog",3),Ingredient("gears",1)})

AddDeconstructRecipe("portable_tea_pot", {Ingredient("transistor",2),Ingredient("cutstone",4),Ingredient("charcoal",3)})

CONSTRUCTION_PLANS["well_buryingsite"] = {Ingredient("shovel",1),Ingredient("seeds",6),Ingredient("turf_desertdirt",4),Ingredient("turf_mud",4)}
