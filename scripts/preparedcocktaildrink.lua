require "utils/water_brew_utils"

local drinks = {
    cocktail_boilermaker = {
        test = function(boilier, names, tags) return IsAlcoholDrink(names, tags) and not IsVeggieDrink(names, tags) and not IsFruitDrink(names, tags) end,
        health = -TUNING.HEALING_SMALL,
        hunger = TUNING.SPOILED_HUNGER,
        sanity = TUNING.SANITY_POISON,
        thirst = TUNING.HYDRATION_POISON,
        perishtime = 0,
        tags = {"alcohol","spirits"},
        OnPutInInventory = function(inst, owner) if owner ~= nil and owner:IsValid() then owner:PushEvent("learncookbookstats", inst.food_basename or inst.prefab) end end,
        oneatenfn = function(inst, eater)
            boilermaker(inst, eater)
        end,
    },
    cocktail_oriental_medicine = {
        test = function(boilier, names, tags) return IsVeggieDrink(names, tags) and not IsAlcoholDrink(names, tags) and not IsFruitDrink(names, tags) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {}, 
    },
    cocktail_fruit_paantsch = {
        test = function(boilier, names, tags) return IsFruitDrink(names, tags) and not IsVeggieDrink(names, tags) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {},
    },
    cocktail_adonis = {
        test = function(boilier, names, tags) return names.noblewine and names.berry_brandy and names.citroyuzu and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_affinity = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.petals_berry_brandy and names.berry_brandy and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_alexande = {
        test = function(boilier, names, tags) return names.berry_gin and names.ruincacao_cream_liqueur and tags.egg and (tags.dairy or tags.milk) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_angel_face = {
        test = function(boilier, names, tags) return names.berry_gin and names.petals_berry_brandy and names.berry_brandy and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_bamboo = {
        test = function(boilier, names, tags) return names.noblewine and names.petals_berry_brandy and names.berry_brandy and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_bentley = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.wine and names.citroyuzu_curacao and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_between_the_sheets = {
        test = function(boilier, names, tags) return names.sparklingwine and names.madhu_rum and names.citroyuzu_curacao and names.citroyuzu_juice end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_block_and_fall = {
        test = function(boilier, names, tags) return names.sparklingwine and names.lumpy_vodka and names.petals_berry_brandy and names.absinthe end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_bobby_burns = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.petals_berry_brandy and names.tea_lumpy_vodka and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_bombay = {
        test = function(boilier, names, tags) return names.berry_brandy and names.petals_berry_brandy and names.absinthe and names.citroyuzu_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_brooklyn = {
        test = function(boilier, names, tags) return names.nut_corn_whiskey and names.berry_brandy and names.wine and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_caruso = {
        test = function(boilier, names, tags) return names.berry_gin and names.berry_brandy and names.mentha_spicata_curacao and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_czarina = {
        test = function(boilier, names, tags) return names.lumpy_vodka and names.petals_berry_brandy and names.berry_brandy and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_diki_diki = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.madhu_rum and names.pomegranate_juice and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_duchess = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.berry_brandy and names.absinthe and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_est_india = {
        test = function(boilier, names, tags) return names.berry_brandy and names.citroyuzu_curacao and names.wine and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_gibson = {
        test = function(boilier, names, tags) return names.lumpy_vodka and names.berry_brandy and names.onion and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_gin_and_it = {
        test = function(boilier, names, tags) return names.berry_gin and names.berry_brandy and names.citroyuzu_curacao and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_grand_slam = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.berry_brandy and names.fruitjuice and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_grasshopper = {
        test = function(boilier, names, tags) return names.mentha_spicata_curacao and names.ruincacao_cream_liqueur and (tags.dairy or tags.milk) and (names.tea_seed or names.acorn) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_manhattan = {
        test = function(boilier, names, tags) return names.nut_corn_whiskey and names.petals_berry_brandy and names.lumpy_wine and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_mikado = {
        test = function(boilier, names, tags) return names.berry_brandy and names.citroyuzu_curacao and names.wine and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_negroni = {
        test = function(boilier, names, tags) return names.berry_gin and names.citroyuzu_wine and names.petals_berry_brandy and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_old_pal = {
        test = function(boilier, names, tags) return names.berry_gin and names.citroyuzu_wine and names.petals_berry_brandy and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_orange_blossom = {
        test = function(boilier, names, tags) return names.berry_gin and names.petals_berry_brandy and names.citroyuzu_juice and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_oriental = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.berry_brandy and names.citroyuzu_curacao and names.citroyuzu_juice end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_planters = {
        test = function(boilier, names, tags) return names.madhu_rum and names.citroyuzu_juice and names.limonsoda and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_rob_roy = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.lumpy_wine and names.petals_berry_brandy and (names.berries or names.berries_juicy) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_sidecar = {
        test = function(boilier, names, tags) return names.sparklingwine and names.citroyuzu_curacao and names.citroyuzu_juice and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_stinger = {
        test = function(boilier, names, tags) return names.sparklingwine and names.mentha_spicata_curacao and tags.frozen and tags.frozen >= 1 end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_white_lady = {
        test = function(boilier, names, tags) return names.berry_gin and names.citroyuzu_curacao and names.citroyuzu_juice and tags.egg end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_za_za = {
        test = function(boilier, names, tags) return names.berry_gin and names.lumpy_wine and names.berry_brandy and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
}

local modlist = require("utils/water_modlist").active_mod_compatibility

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC
    v.cooktime = 1.2

    if v.tags then
        table.insert(v.tags,"cocktail_drink")
    else
        v.tags = {"cocktail_drink"}
    end

    v.is_boilbook_recipes = true
    v.boilbook_category = "cobbler_shaker"
    --v.cookbook_atlas = "images/cookbookimages/cocktail_cookbookimage_cocktales.xml"
    if v.tags then
        table.insert(v.tags,"cocktail_drink")
    else
        v.tags = {"cocktail_drink"}
    end
    v.cookbook_tex = k..".tex"
    if modlist.legion and _G.CONFIGS_LEGION.BETTERCOOKBOOK then
    	v.cook_need = nil
    	v.cook_cant = nil
    	v.recipe_count = 4
		local cookbookui_legion = require "modinit/1392778117/cookbookui_legion"
		v.custom_cookbook_details_fn = function(data, self, top, left)
			local root = cookbookui_legion(data, self, top, left)
			return root
		end
    end
    v.is_boilbook_recipes = true
    v.no_cookbook = true
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC
end

return drinks