require "utils/water_brew_utils"

local drinks = {
    cocktail_bacardi = {
        test = function(boilier, names, tags) return names.madhu_rum and names.citroyuzu_juice and names.spice_sugar and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_bloody_mary = {
        test = function(boilier, names, tags) return names.tomato_juice and names.lumpy_vodka and names.spice_chili and names.spice_caffeinpepper end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_daiquiri = {
        test = function(boilier, names, tags) return names.madhu_rum and names.citroyuzu_juice and names.spice_sugar and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_derby = {
        test = function(boilier, names, tags) return names.berry_gin and names.citroyuzu_curacao and names.spice_sugar and names.mentha_spicata end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_mary_pickford = {
        test = function(boilier, names, tags) return names.madhu_rum and names.applepine_juice and names.wine and names.spice_sugar end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_monkey_gland = {
        test = function(boilier, names, tags) return names.berry_gin and names.absinthe and names.citroyuzu_juice and names.spice_sugar end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_old_fashioned = {
        test = function(boilier, names, tags) return names.lumpy_wine and names.corn_whiskey and names.citroyuzu_juice and names.spice_sugar end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_void_rose = {
        test = function(boilier, names, tags) return names.void_brandy and names.wine and names.spice_sugar and (names.berries or names.berries_juicy) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },

    cocktail_void_alaska = {
        test = function(boilier, names, tags) return names.void_gin and names.citroyuzu_wine and names.citroyuzu_curacao and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_fuse_bronx = {
        test = function(boilier, names, tags) return names.glowberry_gin and names.void_brandy and names.petals_berry_brandy and names.citroyuzu_juice end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_glow_casino = {
        test = function(boilier, names, tags) return names.glowberry_gin and names.wine and names.citroyuzu_juice and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_fuse_claridge = {
        test = function(boilier, names, tags) return names.glowberry_gin and names.void_brandy and names.petals_berry_brandy and names.citroyuzu_curacao end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_glow_clover_club = {
        test = function(boilier, names, tags) return names.glowberry_gin and names.citroyuzu_juice and names.fruitjuice and tags.egg end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_void_martini_dry = {
        test = function(boilier, names, tags) return names.void_gin and names.berry_brandy and names.citroyuzu_curacao and names.citroyuzu end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_glow_martini_sweet = {
        test = function(boilier, names, tags) return names.glowberry_gin and names.petals_berry_brandy and tags.frozen and (names.berries or names.berries_juicy) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},  
    },
    cocktail_glow_paradise = {
        test = function(boilier, names, tags) return names.glowberry_gin and names.wine and names.spice_sugar and (names.berries or names.berries_juicy) end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_fuse_parisian = {
        test = function(boilier, names, tags) return names.glowberry_gin and names.void_brandy and names.wine and tags.frozen end,
        health = 0,
        hunger = 0,
        sanity = 0,
        thirst = 0,
        perishtime = 0,
        tags = {"alcohol","spirits"},
    },
    cocktail_void_princeton = {
        test = function(boilier, names, tags) return names.void_gin and names.citroyuzu_curacao and names.wine and names.spice_sugar end,
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
    v.cooktime = .6

    if v.tags then
        table.insert(v.tags,"cocktail_drink")
    else
        v.tags = {"cocktail_drink"}
    end

    v.is_boilbook_recipes = true
    v.boilbook_category = "boston_shaker"
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
    --v.overridebuild = "cocktail_drinks"
    v.no_cookbook = true
    v.drinktype = v.drinktype or DRINKTYPY.GENERIC
end

return drinks