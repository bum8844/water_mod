require "utils/water_brew_utils"

local drinks = {
    cocktail_boilermaker = {
        test = function(boilier, names, tags) return true end,
        priority = -2,
        health = -TUNING.HEALING_SMALL,
        hunger = TUNING.SPOILED_HUNGER,
        sanity = TUNING.SANITY_POISON,
        thirst = TUNING.HYDRATION_POISON,
        tags = {"alcohol","spirits","cocktail_drink"},
        OnPutInInventory = function(inst, owner) if owner ~= nil and owner:IsValid() then owner:PushEvent("learncookbookstats", inst.food_basename or inst.prefab) end end,
        oneatenfn = function(inst, eater)
            boilermaker(inst, eater)
        end,
    },
    cocktail_adonis = {
        test = function(boilier, names, tags) return names.noblewine and names.berry_brandy and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_affinity = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.petals_berry_brandy and names.berry_brandy and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_alexande = {
        test = function(boilier, names, tags) return names.berry_gin and names.ruincacao_cream_liqueur and tags.egg and (tags.dairy or tags.milk) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_angel_face = {
        test = function(boilier, names, tags) return names.berry_gin and names.petals_berry_brandy and names.berry_brandy end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_bamboo = {
        test = function(boilier, names, tags) return names.noblewine and names.petals_berry_brandy and names.berry_brandy and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_bentley = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.wine and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_between_the_sheets = {
        test = function(boilier, names, tags) return names.sparklingwine and names.madhu_rum and names.citroyuzu_curacao and names.citroyuzu_juice end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_block_and_fall = {
        test = function(boilier, names, tags) return names.sparklingwine and names.lumpy_vodka and names.petals_berry_brandy and names.absinthe end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_bobby_burns = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.petals_berry_brandy and names.tea_lumpy_vodka and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_bombay = {
        test = function(boilier, names, tags) return names.berry_brandy and names.petals_berry_brandy and names.absinthe and names.citroyuzu_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_brooklyn = {
        test = function(boilier, names, tags) return names.nut_corn_whiskey and names.berry_brandy and names.wine and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_caruso = {
        test = function(boilier, names, tags) return names.berry_gin and names.berry_brandy and names.mentha_spicata_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_czarina = {
        test = function(boilier, names, tags) return names.lumpy_vodka and names.petals_berry_brandy and names.berry_brandy and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_diki_diki = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.madhu_rum and names.pomegranate_juice end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_duchess = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.berry_brandy and names.absinthe and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_est_india = {
        test = function(boilier, names, tags) return names.berry_brandy and names.citroyuzu_curacao and names.wine and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_gibson = {
        test = function(boilier, names, tags) return names.lumpy_vodka and names.berry_brandy and names.onion end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_gin_and_it = {
        test = function(boilier, names, tags) return names.berry_gin and names.berry_brandy and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_grand_slam = {
        test = function(boilier, names, tags) return names.petals_berry_brandy and names.berry_brandy and names.fruitjuice end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_grasshopper = {
        test = function(boilier, names, tags) return names.mentha_spicata_curacao and names.ruincacao_cream_liqueur and (tags.dairy or tags.milk) and (names.tea_seed or names.acorn) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_manhattan = {
        test = function(boilier, names, tags) return names.nut_corn_whiskey and names.petals_berry_brandy and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_mikado = {
        test = function(boilier, names, tags) return names.berry_brandy and names.citroyuzu_curacao and names.wine and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_negroni = {
        test = function(boilier, names, tags) return names.berry_gin and names.citroyuzu_wine and names.petals_berry_brandy and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_old_pal = {
        test = function(boilier, names, tags) return names.berry_gin and names.citroyuzu_wine and names.petals_berry_brandy and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_orange_blossom = {
        test = function(boilier, names, tags) return names.berry_gin and names.petals_berry_brandy and names.citroyuzu_juice and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_oriental = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.berry_brandy and names.citroyuzu_curacao and names.citroyuzu_juice end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_planters = {
        test = function(boilier, names, tags) return names.madhu_rum and names.citroyuzu_juice and names.limonsoda and names.lumpy_wine end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_rob_roy = {
        test = function(boilier, names, tags) return names.corn_whiskey and names.lumpy_wine and names.petals_berry_brandy and (names.berries or names.berries_juicy)  end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_sidecar = {
        test = function(boilier, names, tags) return names.sparklingwine and names.citroyuzu_curacao and names.citroyuzu_juice and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_stinger = {
        test = function(boilier, names, tags) return names.sparklingwine and names.mentha_spicata_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_white_lady = {
        test = function(boilier, names, tags) return names.berry_gin and names.citroyuzu_curacao and names.citroyuzu_juice and tags.egg end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
    cocktail_za_za = {
        test = function(boilier, names, tags) return names.berry_gin and names.lumpy_wine and names.berry_brandy end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        tags = {"alcohol","spirits","cocktail_drink"},
    },
}

local modlist = require("utils/water_modlist").active_mod_compatibility

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC

    v.is_boilbook_recipes = true
    v.boilbook_category = "cocktail_maker"
    --v.cookbook_atlas = "images/cookbookimages/cocktail_cookbookimage_drinks.xml"
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