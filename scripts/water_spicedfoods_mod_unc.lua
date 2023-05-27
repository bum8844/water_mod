local cooking = require("cooking")

require("util")

require("tuning")

local foods_unc = {
    viperjam =
    {
        name = "viperjam",
        test = function(cooker, names, tags)
            return not tags.monster and not tags.inedible and UncompromisingFillers(tags)
                and names.viperfruit and names.giant_blueberry
        end,
        priority = 30,
        weight = 1,
        foodtype = "VEGGIE",
        health = 40,
        hunger = 37.5,
        oneat_desc = "Apparitions' aid",
        sanity = 15,
        perishtime = 10 * TUNING.PERISH_TWO_DAY,
        cooktime = 1.8,
    }
}

if TUNING.DSTU.ICECROCKBLOCKER then
    foods_unc.snowcone =
    {
        name = "snowcone",
        test = function(cooker, names, tags) return (names.ice and names.ice > 1) or (names.ice and names.twigs) end,
        priority = 0.5,
        weight = 0.5,
        foodtype = "VEGGIE",
        health = 3,
        hunger = 9.375,
        oneat_desc = "Slightly cools player",
        perishtime = 2 * TUNING.PERISH_TWO_DAY,
        sanity = 5,
        cooktime = 0.5,
    }
end

if TUNING.DSTU.NEWRECIPES then
    foods_unc.zaspberryparfait = {
        name = "zaspberryparfait",
        test = function(cooker, names, tags)
            return not tags.monster and not tags.inedible and UncompromisingFillers(tags)
                and names.zaspberry and tags.sweetener and tags.dairy
        end,
        priority = 30,
        weight = 1,
        foodtype = "GOODIES",
        health = 40,
        hunger = 37.5,
        oneat_desc = "Attackers are shocked",
        sanity = 15,
        perishtime = 2 * TUNING.PERISH_TWO_DAY,
        cooktime = 1.8,
    }
    foods_unc.hardshelltacos =
    {
        name = "hardshelltacos",
        test = function(cooker, names, tags) return names.scorpioncarapace and names.scorpioncarapace > 1 and tags.veggie end,
        priority = 30,
        weight = 1,
        foodtype = "MEAT",
        health = 20,
        hunger = 37.5,
        perishtime = 7.5 * TUNING.PERISH_TWO_DAY,
        sanity = 5,
        cooktime = 1,
    }
    foods_unc.californiaking =
    {
        name = "californiaking",
        test = function(cooker, names, tags)
            return (names.barnacle or names.barnacle_cooked) and
                (names.wobster_sheller_land) and (names.pepper or names.pepper_cooked) and tags.frozen
        end,
        priority = 30,
        weight = 30,
        foodtype = "MEAT",
        health = 3,
        hunger = 62.5,
        oneat_desc = "For the worthy",
        perishtime = 5 * TUNING.PERISH_TWO_DAY,
        sanity = -15,
        cooktime = 2,
    }
    foods_unc.purplesteamedhams =
    {
        name = "purplesteamedhams",
        test = function(cooker, names, tags) 
            return (names.foliage or names.forgetmelots) and tags.veggie and
                tags.veggie >= 1.5 and (names.meat or names.cookedmeat) and
                not (tags.monster or tags.inedible or names.smallmeat or names.cookedsmallmeat) 
        end,
        priority = 30,
        weight = 30,
        foodtype = "MEAT",
        health = 40,
        hunger = 37.5,
        perishtime = 3 * TUNING.PERISH_TWO_DAY,
        oneat_desc = "An unforgettable luncheon",
        sanity = 15,
        cooktime = 1,
    }
    foods_unc.greensteamedhams =
    {
        name = "greensteamedhams",
        test = function(cooker, names, tags) 
            return names.greenfoliage and tags.veggie and tags.veggie >= 1.5 and
                (names.meat or names.cookedmeat) and
                not (tags.monster or tags.inedible or names.smallmeat or names.cookedsmallmeat) 
        end,
        priority = 30,
        weight = 30,
        foodtype = "MEAT",
        health = 40,
        hunger = 37.5,
        perishtime = 3 * TUNING.PERISH_TWO_DAY,
        oneat_desc = "An unforgettable luncheon",
        sanity = 15,
        cooktime = 1,
    }
    foods_unc.simpsalad =
    {
        name = "simpsalad",
        test = function(cooker, names, tags)
            return tags.foliage and tags.foliage > 1 and
                not (tags.frozen and tags.frozen >= 1 and tags.sweetener and tags.sweetener >= 1)
        end,
        priority = 53,
        weight = 20,
        foodtype = "VEGGIE",
        health = 3,
        hunger = 4.9,
        perishtime = 2 * TUNING.PERISH_TWO_DAY,
        sanity = 5,
        cooktime = 0.4,
    }
    foods_unc.blueberrypancakes =
    {
        name = "blueberrypancakes",
        test = function(cooker, names, tags)
            return names.giant_blueberry and names.giant_blueberry >= 2 and tags.egg and
                tags.egg > 1
        end,
        priority = 20,
        weight = 30,
        foodtype = "VEGGIE",
        health = 5,
        hunger = 75,
        perishtime = 5 * TUNING.PERISH_TWO_DAY,
        sanity = 20,
        cooktime = 1.8,
    }
    foods_unc.beefalowings =
    {
        name = "beefalowings",
        test = function(cooker, names, tags)
            return tags.veggie and names.horn and
                (
                (names.batwing and names.batwing > 1) or (names.batwing_cooked and names.batwing_cooked > 1) or
                (names.batwing and names.batwing_cooked))
        end,
        priority = 20,
        weight = 30,
        foodtype = "MEAT",
        health = 30,
        hunger = 62.5,
        perishtime = 5 * TUNING.PERISH_TWO_DAY,
        oneat_desc = "Ignore knockback",
        sanity = 30,
        cooktime = 2.4,
    }
    foods_unc.snotroast =
    {
        name = "snotroast",
        test = function(cooker, names, tags)
            return (names.trunk_summer or names.trunk_winter or names.trunk_cooked) and
                (names.carrot or names.carrot_cooked) and (names.potato or names.potato_cooked) and
                (names.onion or names.onion_cooked)
        end,
        priority = 30,
        weight = 1,
        foodtype = "MEAT",
        health = 3,
        hunger = 150,
        oneat_desc = "Extremely filling",
        sanity = 5,
        perishtime = 10 * TUNING.PERISH_TWO_DAY,
        cooktime = 1.8,
    }
    foods_unc.theatercorn =
    {
        name = "theatercorn",
        test = function(cooker, names, tags)
            return (
                (names.corn_cooked and names.corn_cooked >= 2) or (names.corn and names.corn >= 2) or
                (names.corn and names.corn_cooked)) and (names.butter)
        end,
        priority = 30,
        weight = 1,
        foodtype = "VEGGIE",
        health = 3,
        hunger = 37.5,
        oneat_desc = "Great with some amusement",
        sanity = 0,
        perishtime = 10 * TUNING.PERISH_TWO_DAY,
        cooktime = 1.8,
        stacksize = 3,
    }
    foods_unc.stuffed_peeper_poppers =
    {
        name = "stuffed_peeper_poppers",
        test = function(cooker, names, tags)
            return (names.milkywhites) and (tags.monster and tags.monster >= 2) and
                (names.durian or names_durian_cooked) and not tags.inedible
        end,
        priority = 52,
        weight = 1,
        foodtype = "MEAT",
        health = -3,
        hunger = 37.5,
        oneat_desc = "A sight to behold",
        sanity = -15,
        perishtime = 4 * TUNING.PERISH_TWO_DAY,
        cooktime = 1.8,
    }
    foods_unc.um_deviled_eggs =
    {
        name = "um_deviled_eggs",
        test = function(cooker, names, tags) return tags.monster and tags.monster >= 2 and tags.egg and not tags.meat end,
        --test = function(cooker, names, tags) return tags.egg and tags.monster and tags.monster >= tags.egg and (not tags.meat) end,

        priority = 52,
        weight = 1,
        foodtype = "MEAT",
        secondaryfoodtype = "MONSTER",
        health = -TUNING.HEALING_MED,
        hunger = TUNING.CALORIES_LARGE,
        perishtime = TUNING.PERISH_FAST,
        sanity = -TUNING.SANITY_MEDLARGE,
        oneat_desc = "Sinner side up",
        cooktime = .5,
        tags = { "monstermeat" },
        floater = { "med", nil, 0.58 },
    }
    if TUNING.DSTU.RICE then
        foods_unc.seafoodpaella = {
            name = "seafoodpaella",
            test = function(cooker, names, tags)
                return UncompromisingFillers(tags) and tags.rice and tags.veggie and
                    tags.veggie >= 2 and (names.wobster_sheller_land or tags.fish and tags.fish >= 2)
            end,
            priority = 30,
            weight = 1,
            foodtype = "MEAT",
            health = 5,
            hunger = 75,
            oneat_desc = "Significantly clears sinuses",
            perishtime = 5 * TUNING.PERISH_TWO_DAY,
            sanity = 50,
            cooktime = 1,
        }
        foods_unc.liceloaf = {
            name = "liceloaf",
            test = function(cooker, names, tags)
                return (tags.rice and tags.rice >= 2) and UncompromisingFillers(tags) and
                    not (tags.insectoid and tags.insectoid >= 1) and not tags.inedible
            end,
            priority = 30,
            weight = 1,
            foodtype = "VEGGIE",
            health = 0,
            hunger = 62.5,
            oneat_desc = "Somewhat clears sinuses",
            perishtime = 15 * TUNING.PERISH_TWO_DAY,
            sanity = 0,
            cooktime = 1.2,
        }
    end
end



for name, recipe in pairs(foods_unc) do
    recipe.name = name
    recipe.weight = recipe.weight or 1
    recipe.priority = recipe.priority or 0
    --recipe.cookbook_atlas = "images/ia_cookbook.xml"
    recipe.cookbook_category = "cookpot"

    env.AddCookerRecipe("cookpot", recipe)
    env.AddCookerRecipe("portablecookpot", recipe)
    env.AddCookerRecipe("archive_cookpot", recipe)
    env.AddCookerRecipe("xiuyuan_cookpot", recipe)

    --[[if recipe.card_def then
        GLOBAL.AddRecipeCard("cookpot", recipe)
    end]]
end

--[[why not support Vanilla spied? ... damm it Unc....
GLOBAL.GenerateSpicedFoods(foods_unc)
local unc_spiced = {}
local new_spicedfoods = require("spicedfoods")

for k,v in pairs(new_spicedfoods) do
    unc_spiced[k] = v
end
for k,v in pairs(unc_spiced) do
    --new_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end]]

local spiced_waterfoods = GLOBAL.shallowcopy(require("water_spicedfoods_mod"))
GLOBAL.GenerateSpicedFoods_Water_mod(foods_unc)
local unc_water_spiced = {}
local new_water_spicedfoods = require("water_spicedfoods_mod")

for k,v in pairs(new_water_spicedfoods) do
    if not new_water_spicedfoods[k] then
        unc_water_spiced[k] = v
    end
end
for k,v in pairs(unc_water_spiced) do
    new_water_spicedfoods[k] = nil --do not let the game make the prefabs
    env.AddCookerRecipe("portablespicer", v)
end
return water_spicedfoods_mod