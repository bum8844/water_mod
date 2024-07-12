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
  return "images/tea_inventoryitem.xml"
end

local NOHOF = true
local SWON = false

local modlist = require("utils/water_modlist")

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

if modlist.ia or modlist.te then
    -- OBSIDIAN
    AddRecipeToFilter("obsidianaxe","SECRETKNOWLEDGE")
    AddRecipeToFilter("obsidianmachete","SECRETKNOWLEDGE")
    AddRecipeToFilter("spear_obsidian","SECRETKNOWLEDGE")
    AddRecipeToFilter("volcanostaff","SECRETKNOWLEDGE")
    AddRecipeToFilter("armorobsidian","SECRETKNOWLEDGE")
    AddRecipeToFilter("obsidiancoconade","SECRETKNOWLEDGE")
    AddRecipeToFilter("wind_conch","SECRETKNOWLEDGE")
    AddRecipeToFilter("windstaff","SECRETKNOWLEDGE")
    AddRecipeToFilter("turf_ruinsbrick_glow_blueprint","SECRETKNOWLEDGE")
end

AddRecipe2("bucket_woodie_empty",{Ingredient("lucy",0),Ingredient("log",3)},TECH.NONE,{atlas = ModAtlas(), image = "bucket_woodie_empty.tex", builder_tag="woodcarver1", sg_state="carvewood_boards",  description="bucket_empty"},{"CHARACTER","HYDRATION","TOOLS"})
SortAfter("bucket_woodie_empty", "goldenpitchfork", "TOOLS")
SortAfter("bucket_woodie_empty","woodie_boards","CHARACTER")

AddRecipe2("bucket_driftwood_empty",{Ingredient("driftwood_log",2)},TECH.NONE,{atlas = ModAtlas(), image = "bucket_driftwood_empty.tex", description="bucket_empty"},{"HYDRATION","TOOLS"})
AddRecipe2("bucket_steel_empty",{Ingredient("steelwool",2),Ingredient("hammer",0)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "bucket_steel_empty.tex",  description="bucket_empty"},{"HYDRATION","TOOLS"})

if modlist.hof then
    AddRecipeToFilter("kyno_bucket_empty","HYDRATION")
    SortAfter("kyno_bucket_empty","bucket_woodie_empty","TOOLS")
    SortAfter("kyno_bucket_empty","bucket_woodie_empty","HYDRATION")
    SortAfter("bucket_driftwood_empty","kyno_bucket_empty","TOOLS")
    SortAfter("bucket_driftwood_empty","kyno_bucket_empty","HYDRATION")
else
    AddRecipePostInit("fertilizer",function(v) v.ingredients = {Ingredient("poop", 3), Ingredient("boneshard", 2), Ingredient("bucket_empty", 1, ModAtlas(), nil,"bucket_empty.tex")} end)
    AddRecipe2("bucket_empty",{Ingredient("log",4)},TECH.NONE,{atlas = ModAtlas(), image = "bucket_empty.tex"},{"HYDRATION","TOOLS"})
    SortAfter("bucket_empty","bucket_woodie_empty","TOOLS")
    SortAfter("bucket_empty","bucket_woodie_empty","HYDRATION")
    SortAfter("bucket_driftwood_empty","bucket_empty","TOOLS")
    SortAfter("bucket_driftwood_empty","bucket_empty","HYDRATION")
end

SortAfter("bucket_steel_empty","bucket_driftwood_empty","TOOLS")
SortAfter("bucket_steel_empty","bucket_driftwood_empty","HYDRATION")

AddRecipe2("spice_caffeinpepper",{Ingredient("caffeinberry_bean_cooked", 3, ModAtlas(), nil, "caffeinberry_bean_cooked.tex")},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "spice_caffeinpepper.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("spice_caffeinpepper", "spice_salt", "FOODPROCESSING")

AddRecipe2("spice_ruincolate_spread",{Ingredient("ruincacao_bean_cooked", 3, ModAtlas(), nil, "ruincacao_bean_cooked.tex")},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "spice_ruincolate_spread.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("spice_ruincolate_spread", "spice_caffeinpepper", "FOODPROCESSING")

AddRecipe2("additive_seed",{Ingredient("pinecone",1),Ingredient("pepper_seeds",1),Ingredient("garlic_seeds",1)},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_seed.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_seed", "spice_ruincolate_spread", "FOODPROCESSING")

AddRecipe2("additive_nut",{Ingredient("acorn_cooked",1),Ingredient("ruincacao_bean_cooked",1,ModAtlas(),nil,"ruincacao_bean_cooked.tex"),Ingredient("caffeinberry_bean_cooked", 1, ModAtlas(), nil, "caffeinberry_bean_cooked.tex")},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_nut.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_nut", "additive_seed", "FOODPROCESSING")

AddRecipe2("additive_dairy",{Ingredient("goatmilk",1),Ingredient("milkywhites",1),Ingredient("butter", 1)},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_dairy.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_dairy", "additive_seed", "FOODPROCESSING")

AddRecipe2("additive_petals",{Ingredient("petals",1),Ingredient("tealeaves",1,ModAtlas(),nil,"tealeaves.tex"),Ingredient("foliage", 1)},TECH.FOODPROCESSING_ONE,{atlas = ModAtlas(), builder_tag="professionalchef", numtogive=2, image = "additive_petals.tex" ,nounlock=true},{"FOODPROCESSING"})
SortAfter("additive_petals", "additive_seed", "FOODPROCESSING")

AddRecipe2("boilbook",{Ingredient("papyrus",1),Ingredient("tealeaves",1,ModAtlas(),nil,"tealeaves.tex")},TECH.SCIENCE_ONE,{atlas = ModAtlas(), image = "boilbook.tex"},{"COOKING","HYDRATION"})
SortAfter("boilbook","cookbook","COOKING")

AddRecipe2("campkettle_item",{Ingredient("twigs",2),Ingredient("log",2),Ingredient("cutgrass",2)},TECH.NONE,{atlas = ModAtlas(), image = "campkettle.tex"},{"COOKING","REFINE","HYDRATION"})
SortBefore("campkettle_item","cookpot","COOKING")

AddRecipe2("kettle",{Ingredient("twigs",6),Ingredient("rope",2),Ingredient("charcoal",2)},TECH.SCIENCE_ONE,{placer = "kettle_placer", atlas = ModAtlas(), image = "kettle.tex"},{"COOKING","HYDRATION"})
SortAfter("kettle","cookpot","COOKING")

AddRecipe2("portablekettle_item",{Ingredient("transistor",2),Ingredient("cutstone",4),Ingredient("charcoal",3)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "portablekettle_item.tex", builder_tag="masterchef"},{"CHARACTER","COOKING","HYDRATION"})
SortAfter("portablekettle_item","kettle","COOKING")

AddRecipe2("brewery",{Ingredient("boards",3),Ingredient("livinglog",3),Ingredient("rope",3),Ingredient("cutstone",6),Ingredient("goldnugget",4)},TECH.SCIENCE_TWO,{placer = "brewery_placer", atlas = ModAtlas(), image = "brewery.tex"},{"COOKING","HYDRATION"})
SortAfter("brewery","portablekettle_item","COOKING")

AddRecipe2("distillers",{Ingredient("dreadstone",8),Ingredient("nightmarefuel",4),Ingredient("transistor",4),Ingredient("redgem",1),Ingredient("bluegem",1)},TECH.SCIENCE_TWO,{placer = "distillers_placer",atlas = ModAtlas(), image = "distillers.tex"},{"COOKING","HYDRATION"})
SortAfter("distillers","brewery","COOKING")

AddRecipe2("campdesalinator_item",{Ingredient("flint",2),Ingredient("cutstone",1),Ingredient("minifan",2)},TECH.SCIENCE_ONE,{atlas = ModAtlas(), image = "campdesalinator.tex"},{"COOKING","REFINE","HYDRATION"})
SortAfter("campdesalinator_item","campkettle_item","COOKING")

AddRecipe2("desalinator",{Ingredient("boards",12),Ingredient("rope",6),Ingredient("rocks",6),Ingredient("nitre",6),Ingredient("charcoal",6)},TECH.SCIENCE_TWO,{placer = "desalinator_placer", atlas = ModAtlas(), image = "desalinator.tex", size = 32},{"CONTAINERS","COOKING","GARDENING","HYDRATION"})

AddRecipe2("barrel",{Ingredient("boards",2),Ingredient("rope",3),Ingredient("charcoal",3)},TECH.SCIENCE_ONE,{placer = "barrel_placer", atlas = ModAtlas(), image = "barrel.tex"},{"CONTAINERS","COOKING","GARDENING","HYDRATION"})
SortAfter("barrel","saltbox","CONTAINERS")
SortAfter("barrel","saltbox","COOKING")
SortAfter("barrel","premiumwateringcan","GARDENING")
SortAfter("desalinator","barrel","CONTAINERS")
SortAfter("desalinator","barrel","COOKING")
SortAfter("desalinator","barrel","GARDENING")

AddRecipe2("thermos_bottle",{Ingredient("steelwool",1),Ingredient("moonglass",2),Ingredient("goldnugget",2),Ingredient("bluegem",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "thermos_bottle.tex"},{"HYDRATION","STRUCTURES","CONTAINERS","COOKING"})
SortAfter("thermos_bottle","icebox","STRUCTURES")
SortAfter("thermos_bottle","icebox","CONTAINERS")
SortAfter("thermos_bottle","icebox","COOKING")

AddRecipe2("wine_cellar",{Ingredient("cutstone",2),Ingredient("transistor",1),Ingredient("gears",1),Ingredient("opalpreciousgem",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "wine_cellar.tex"},{"HYDRATION","STRUCTURES","CONTAINERS","COOKING"})
SortAfter("wine_cellar","thermos_bottle","STRUCTURES")
SortAfter("wine_cellar","thermos_bottle","CONTAINERS")
SortAfter("wine_cellar","thermos_bottle","COOKING")

AddRecipe2("well_drilling_item",{Ingredient("trinket_6",4),Ingredient("transistor",2),Ingredient("goldnugget",4),Ingredient("flint",4),Ingredient("steelwool",2)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_drilling_item.tex"},{"GARDENING","REFINE","HYDRATION"})
SortAfter("well_drilling_item","farm_plow_item","GARDENING")

AddRecipe2("well_burying_kit",{Ingredient("boards",4),Ingredient("hammer",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_burying_kit.tex"},{"GARDENING","REFINE","HYDRATION"})
SortAfter("well_burying_kit","well_waterpump_kit","GARDENING")

AddRecipe2("well_kit",{Ingredient("boards",2),Ingredient("cutstone",6),Ingredient("hammer",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_kit.tex"},{"GARDENING","REFINE","HYDRATION"})
SortAfter("well_kit","well_drilling_item","GARDENING")
SortAfter("well_kit","well_drilling_item","REFINE")

AddRecipe2("well_sprinkler_kit",{Ingredient("marble",4),Ingredient("moonglass",1),Ingredient("townportaltalisman",2),Ingredient("gears",1)},TECH.SCIENCE_TWO,{atlas = ModAtlas(), image = "well_sprinkler_kit.tex"},{"GARDENING","REFINE","HYDRATION"})
SortAfter("well_sprinkler_kit","well_kit","GARDENING")

AddRecipe2("well_winona_sprinkler_maker",{Ingredient("well_sprinkler_kit",1, ModAtlas(), nil, "well_sprinkler_kit.tex"),Ingredient("sewing_tape", 1),Ingredient("wagpunk_bits",2),Ingredient("transistor",2)},TECH.NONE,{placer="well_winona_sprinkler_placer", atlas = ModAtlas(), image = "well_winona_sprinkler.tex", nameoverride="well_winona_sprinkler_kit", description="well_winona_sprinkler_kit", builder_tag="basicengineer"},{"CHARACTER","GARDENING","REFINE","HYDRATION"})
SortAfter("well_winona_sprinkler_maker","well_sprinkler_kit","GARDENING")
SortAfter("well_winona_sprinkler_maker","winona_battery_high_kit","CHARACTER")

AddRecipe2("well_winona_sprinkler_kit",{Ingredient("well_sprinkler_kit",1, ModAtlas(), nil, "well_sprinkler_kit.tex"),Ingredient("sewing_tape", 1),Ingredient("wagpunk_bits",2),Ingredient("transistor",2)},TECH.NONE,{atlas = ModAtlas(), image = "well_winona_sprinkler_kit.tex", builder_tag="portableengineer"},{"CHARACTER","GARDENING","REFINE","HYDRATION"})
SortAfter("well_winona_sprinkler_kit","well_sprinkler_kit","GARDENING")
SortAfter("well_winona_sprinkler_kit","winona_battery_high_kit","CHARACTER")

AddRecipe2("well_waterpump",{Ingredient("security_pulse_cage_full",1),Ingredient("sewing_tape", 1),Ingredient("wagpunk_bits",4),Ingredient("transistor",1),Ingredient("cutstone",2)},TECH.NONE,{placer = "well_waterpump_placer" ,atlas = ModAtlas(), image = "well_waterpump.tex",description="well_waterpump_kit", builder_tag="basicengineer"},{"CHARACTER","GARDENING","REFINE","HYDRATION"})
SortAfter("well_waterpump","well_winona_sprinkler_kit","GARDENING")
SortAfter("well_waterpump","well_winona_sprinkler_kit","CHARACTER")

AddRecipe2("well_waterpump_kit",{Ingredient("security_pulse_cage_full",1),Ingredient("sewing_tape", 1),Ingredient("wagpunk_bits",4),Ingredient("transistor",1),Ingredient("cutstone",2)},TECH.NONE,{atlas = ModAtlas(), image = "well_waterpump_kit.tex", builder_tag="portableengineer"},{"CHARACTER","GARDENING","REFINE","HYDRATION"})
SortAfter("well_waterpump_kit","well_waterpump","GARDENING")
SortAfter("well_waterpump_kit","well_waterpump","CHARACTER")

AddRecipe2("steamdesalinator_maker",{Ingredient("well_waterpump_kit", 1, ModAtlas(), nil, "well_waterpump_kit.tex"),Ingredient("sewing_tape", 1),Ingredient("wagpunkbits_kit",1)},TECH.NONE,{placer="steamdesalinator_placer", min_spacing=1.5, testfn=function(pt) return TheWorld.Map:GetPlatformAtPoint(pt.x, 0, pt.z, -0.5) ~= nil or TheWorld.Map:IsDockAtPoint(pt.x, 0, pt.z) end, atlas = ModAtlas(), image = "steamdesalinator.tex",nameoverride="steamdesalinator_kit",description="steamdesalinator_kit", builder_tag="basicengineer"},{"CHARACTER","GARDENING","REFINE","HYDRATION"})
SortAfter("steamdesalinator_maker","well_waterpump_kit","GARDENING")
SortAfter("steamdesalinator_maker","well_waterpump_kit","CHARACTER")

AddRecipe2("steamdesalinator_kit",{Ingredient("well_waterpump_kit", 1, ModAtlas(), nil, "well_waterpump_kit.tex"),Ingredient("sewing_tape", 1),Ingredient("wagpunkbits_kit",1)},TECH.NONE,{atlas = ModAtlas(), image = "steamdesalinator_kit.tex",builder_tag="portableengineer"},{"CHARACTER","GARDENING","REFINE","HYDRATION"})
SortAfter("steamdesalinator_kit","well_waterpump_kit","GARDENING")
SortAfter("steamdesalinator_kit","well_waterpump_kit","CHARACTER")

AddRecipe2("wagpunkmachinetool",{Ingredient("wagpunkbits_kit",2),Ingredient("sewing_tape",1),Ingredient("wagpunk_bits",1)},TECH.NONE,{atlas = ModAtlas(), image = "wagpunkmachinetool.tex", builder_tag="portableengineer"},{"CHARACTER","REFINE","HYDRATION"})
SortAfter("wagpunkmachinetool","steamdesalinator_kit","CHARACTER")

AddRecipe2("wx78module_nonedrunk",{Ingredient("scandata",3),Ingredient("fruitflyfruit_dead",1),Ingredient("gears",2),Ingredient("wx78module_maxhunger1",1)},TECH.ROBOTMODULECRAFT_ONE,{atlas = ModAtlas(), image = "wx78module_nonedrunk.tex", builder_tag="upgrademoduleowner"},{"CHARACTER"})
SortAfter("wx78module_nonedrunk","wx78module_maxhunger1","CHARACTER")

--AddRecipe2("portable_shaker_machine_item")
--AddRecipe2("shaker_machine")

--

AddDeconstructRecipe("well", {Ingredient("boards",2),Ingredient("cutstone",6)})

AddDeconstructRecipe("well_buryingsite", {Ingredient("boards",4)})

AddDeconstructRecipe("well_sprinkler", {Ingredient("marble",4),Ingredient("moonglass",1),Ingredient("townportaltalisman",2),Ingredient("gears",1)})

AddDeconstructRecipe("well_winona_sprinkler", {Ingredient("marble",4),Ingredient("moonglass",1),Ingredient("townportaltalisman",2),Ingredient("gears",1),Ingredient("sewing_tape", 1),Ingredient("wagpunk_bits",2),Ingredient("transistor",2)})

AddDeconstructRecipe("steamdesalinator", {Ingredient("security_pulse_cage_full",1),Ingredient("sewing_tape", 2),Ingredient("wagpunk_bits",4),Ingredient("transistor",1),Ingredient("cutstone",2),Ingredient("wagpunkbits_kit",1)})

CONSTRUCTION_PLANS["well_buryingsite"] = {Ingredient("shovel",1),Ingredient("seeds",6),Ingredient("turf_desertdirt",4),Ingredient("turf_mud",4)}
