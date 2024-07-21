
local PLANT_DEFS = require("prefabs/farm_plant_defs").PLANT_DEFS
local WEED_DEFS = require("prefabs/weed_defs").WEED_DEFS
local WEIGHTED_SEED_TABLE = require("prefabs/weed_defs").weighted_seed_table

local COMMON = TUNING.SEED_CHANCE_COMMON
local UNCOMMON = TUNING.SEED_CHANCE_UNCOMMON
local RARE = TUNING.SEED_CHANCE_RARE

-- Water Values the plant should drink.
local DRINK_LOW = TUNING.FARM_PLANT_DRINK_LOW
local DRINK_MED = TUNING.FARM_PLANT_DRINK_MED 
local DRINK_HIGH = TUNING.FARM_PLANT_DRINK_HIGH 

-- Nutrients Values the plant should use.
local NUTRIENT_LOW = TUNING.FARM_PLANT_CONSUME_NUTRIENT_LOW 
local NUTRIENT_MED = TUNING.FARM_PLANT_CONSUME_NUTRIENT_MED 
local NUTRIENT_HIGH = TUNING.FARM_PLANT_CONSUME_NUTRIENT_HIGH

local DAYS = TUNING.TOTAL_DAY_TIME

_G.setmetatable(env, {__index=function(t, k) return _G.rawget(_G, k) end})

--[[local old_GetInventoryItemAtlas = GetInventoryItemAtlas
_G.GetInventoryItemAtlas = function(name, ...)
    local mfpfi = resolvefilepath("images/inventoryimages/mfp_inventoryimages.xml")
    if TheSim:AtlasContains(mfpfi, name) then
        return mfpfi
    end
    return old_GetInventoryItemAtlas(name, ...)
end]]

_G.WATER_VEGGIES 	= {}
_G.WATER_FARM_PLANTS = {}

AddSimPostInit(function()
    if VEGGIES ~= nil then
        for k, v in pairs(WATER_VEGGIES) do
            VEGGIES[k] = v
        end
    end
end)

local function MakeVegStats(name,watertype,seedweight, hunger, health, perish_time, sanity, cooked_hunger, cooked_health, cooked_perish_time, cooked_sanity, float_settings, cooked_float_settings, dryable, secondary_foodtype, halloweenmoonmutable_settings, lure_data)
WATER_VEGGIES[name] =
    {
        watertype = watertype,
        health = health,
        hunger = hunger,
        cooked_health = cooked_health,
        cooked_hunger = cooked_hunger,
        seed_weight = seedweight,
        perishtime = perish_time,
        cooked_perishtime = cooked_perish_time,
        sanity = sanity,
        cooked_sanity = cooked_sanity,
        float_settings = float_settings,
        cooked_float_settings = cooked_float_settings,
        dryable = dryable,
        halloweenmoonmutable_settings = halloweenmoonmutable_settings,
        secondary_foodtype = secondary_foodtype,
        lure_data = lure_data,
    }
end

--[[MakeVegStats("pinenanas","fruit",UNCOMMON,
TUNING.CALORIES_SMALL,TUNING.HEALING_SMALL,TUNING.PERISH_FAST,TUNING.SANITY_TINY,
TUNING.CALORIES_SMALL,TUNING.HEALING_TINY,TUNING.PERISH_SUPERFAST,TUNING.SANITY_TINY*1.5,
{"med", 0.05, 0.8}, {"small", 0.1, nil})

MakeVegStats("papeda","fruit",UNCOMMON,
TUNING.CALORIES_TINY,TUNING.HEALING_SMALL,TUNING.PERISH_FAST,0,
TUNING.CALORIES_SMALL,TUNING.HEALING_MED,TUNING.PERISH_SUPERFAST,0,
{"med", 0.05, 0.8}, {"small", 0.1, nil})

local function MakeGrowTimes(germination_min, germination_max, full_grow_min, full_grow_max)
    local grow_time = {}
    grow_time.seed      = {germination_min, germination_max}
    grow_time.sprout    = {full_grow_min * 0.5, full_grow_max * 0.5}
    grow_time.small     = {full_grow_min * 0.3, full_grow_max * 0.3}
    grow_time.med       = {full_grow_min * 0.2, full_grow_max * 0.2}
    grow_time.full      = 4 * DAYS
    grow_time.oversized = 6 * DAYS
    grow_time.regrow    = {4 * DAYS, 5 * DAYS} -- min, max
    return grow_time
end]]

local function MakeGrowTimes_Weed(full_grow_min, full_grow_max, bolting)
    local grow_time = {}
    if bolting then
        grow_time.small     = {full_grow_min * 0.3, full_grow_max * 0.3}
        grow_time.med       = {full_grow_min * 0.3, full_grow_max * 0.3}
        grow_time.full      = {full_grow_min * 0.4, full_grow_max * 0.4}
    else
        grow_time.small     = {full_grow_min * 0.6, full_grow_max * 0.6}
        grow_time.med       = {full_grow_min * 0.4, full_grow_max * 0.4}
    end
    return grow_time
end

--[[ Pinenanas Plant.
PLANT_DEFS.pinenanas = {build = "farm_plant_pinenanas", bank = "farm_plant_pinenanas"}
PLANT_DEFS.pinenanas.prefab = "farm_plant_pinenanas"
PLANT_DEFS.pinenanas.product = "pinenanas"
PLANT_DEFS.pinenanas.product_oversized = "pinenanas_oversized" 
PLANT_DEFS.pinenanas.seed = "pinenanas_seeds"
PLANT_DEFS.pinenanas.loot_oversized_rot = {"spoiled_food", "spoiled_food", "spoiled_food", "pinenanas_seeds", "fruitfly", "fruitfly"}
PLANT_DEFS.pinenanas.family_min_count = TUNING.FARM_PLANT_SAME_FAMILY_MIN
PLANT_DEFS.pinenanas.family_check_dist = TUNING.FARM_PLANT_SAME_FAMILY_RADIUS
PLANT_DEFS.pinenanas.plant_type_tag = "farm_plant_pinenanas"
PLANT_DEFS.pinenanas.grow_time = MakeGrowTimes(12*TUNING.SEG_TIME, 16*TUNING.SEG_TIME, 4*DAYS, 7*DAYS) 
PLANT_DEFS.pinenanas.moisture = {drink_rate = DRINK_HIGH, min_percent = TUNING.FARM_PLANT_DROUGHT_TOLERANCE}
PLANT_DEFS.pinenanas.good_seasons = {autumn = true, spring = true, summer = true}
PLANT_DEFS.pinenanas.nutrient_consumption = {0, NUTRIENT_MED, NUTRIENT_MED}
PLANT_DEFS.pinenanas.nutrient_restoration = {NUTRIENT_LOW ,0 , 0}
PLANT_DEFS.pinenanas.max_killjoys_tolerance = TUNING.FARM_PLANT_KILLJOY_TOLERANCE
PLANT_DEFS.pinenanas.weight_data = { 462.37, 688.45, .93 }
PLANT_DEFS.pinenanas.pictureframeanim  = {anim = "emote_jumpcheer", time = 19*FRAMES}
PLANT_DEFS.pinenanas.sounds = PLANT_DEFS.tomato.sounds
PLANT_DEFS.pinenanas.plantregistrywidget = "widgets/redux/farmplantpage" 
PLANT_DEFS.pinenanas.plantregistrysummarywidget = "widgets/redux/farmplantsummarywidget" 
PLANT_DEFS.pinenanas.plantregistryinfo = { 
    {
        text = "seed",
        anim = "crop_seed",
        grow_anim = "grow_seed",
        learnseed = true,
        growing = true,
    },
    {
        text = "sprout",
        anim = "crop_sprout",
        grow_anim = "grow_sprout",
        growing = true,
    },
    {
        text = "small",
        anim = "crop_small",
        grow_anim = "grow_small",
        growing = true,
    },
    {
        text = "medium",
        anim = "crop_med",
        grow_anim = "grow_med",
        growing = true,
    },
    {
        text = "grown",
        anim = "crop_full",
        grow_anim = "grow_full",
        revealplantname = true,
        fullgrown = true,
    },
    {
        text = "oversized",
        anim = "crop_oversized",
        grow_anim = "grow_oversized",
        revealplantname = true,
        fullgrown = true,
        hidden = true,
    },
    {
        text = "rotting",
        anim = "crop_rot",
        grow_anim = "grow_rot",
        stagepriority = -100,
        is_rotten = true,
        hidden = true,
    },
    {
        text = "oversized_rotting",
        anim = "crop_rot_oversized",
        grow_anim = "grow_rot_oversized",
        stagepriority = -100,
        is_rotten = true,
        hidden = true,
    },
}

-- Papeda Plant.
PLANT_DEFS.papeda = {build = "farm_plant_papeda", bank = "farm_plant_papeda"}
PLANT_DEFS.papeda.prefab = "farm_plant_papeda"
PLANT_DEFS.papeda.product = "papeda"
PLANT_DEFS.papeda.product_oversized = "papeda_oversized" 
PLANT_DEFS.papeda.seed = "papeda_seeds"
PLANT_DEFS.papeda.loot_oversized_rot = {"spoiled_food", "spoiled_food", "spoiled_food", "papeda_seeds", "fruitfly", "fruitfly"}
PLANT_DEFS.papeda.family_min_count = TUNING.FARM_PLANT_SAME_FAMILY_MIN
PLANT_DEFS.papeda.family_check_dist = TUNING.FARM_PLANT_SAME_FAMILY_RADIUS
PLANT_DEFS.papeda.plant_type_tag = "farm_plant_pinenanas"
PLANT_DEFS.papeda.grow_time = MakeGrowTimes(12*TUNING.SEG_TIME, 16*TUNING.SEG_TIME, 4*DAYS, 7*DAYS) 
PLANT_DEFS.papeda.moisture = {drink_rate = DRINK_MED, min_percent = TUNING.FARM_PLANT_DROUGHT_TOLERANCE}
PLANT_DEFS.papeda.good_seasons = {autumn = true, winter = true, spring = true}
PLANT_DEFS.papeda.nutrient_consumption = {NUTRIENT_MED, 0, 0}
PLANT_DEFS.papeda.nutrient_restoration = {0, NUTRIENT_LOW, NUTRIENT_LOW}
PLANT_DEFS.papeda.max_killjoys_tolerance = TUNING.FARM_PLANT_KILLJOY_TOLERANCE
PLANT_DEFS.papeda.weight_data = { 404.38, 547.80, .48 }
PLANT_DEFS.papeda.pictureframeanim = {anim = "emoteXL_loop_dance8", time = 27*FRAMES}
PLANT_DEFS.papeda.sounds = PLANT_DEFS.potato.sounds
PLANT_DEFS.papeda.plantregistrywidget = "widgets/redux/farmplantpage" 
PLANT_DEFS.papeda.plantregistrysummarywidget = "widgets/redux/farmplantsummarywidget" 
PLANT_DEFS.papeda.plantregistryinfo = { 
    {
        text = "seed",
        anim = "crop_seed",
        grow_anim = "grow_seed",
        learnseed = true,
        growing = true,
    },
    {
        text = "sprout",
        anim = "crop_sprout",
        grow_anim = "grow_sprout",
        growing = true,
    },
    {
        text = "small",
        anim = "crop_small",
        grow_anim = "grow_small",
        growing = true,
    },
    {
        text = "medium",
        anim = "crop_med",
        grow_anim = "grow_med",
        growing = true,
    },
    {
        text = "grown",
        anim = "crop_full",
        grow_anim = "grow_full",
        revealplantname = true,
        fullgrown = true,
    },
    {
        text = "oversized",
        anim = "crop_oversized",
        grow_anim = "grow_oversized",
        revealplantname = true,
        fullgrown = true,
        hidden = true,
    },
    {
        text = "rotting",
        anim = "crop_rot",
        grow_anim = "grow_rot",
        stagepriority = -100,
        is_rotten = true,
        hidden = true,
    },
    {
        text = "oversized_rotting",
        anim = "crop_rot_oversized",
        grow_anim = "grow_rot_oversized",
        stagepriority = -100,
        is_rotten = true,
        hidden = true,
    },
}]]

-- Mentha Spicata Weed.

WEED_DEFS.weed_mentha_spicata = {build = "weed_mentha_spicata", bank = "weed_mentha_spicata"}
WEED_DEFS.weed_mentha_spicata.prefab = "weed_mentha_spicata"
WEED_DEFS.weed_mentha_spicata.sameweedtags = {"weed_mentha_spicata"}
WEED_DEFS.weed_mentha_spicata.stage_netvar = _G.net_tinybyte
WEED_DEFS.weed_mentha_spicata.grow_time = MakeGrowTimes_Weed(2 * DAYS, 3 * DAYS, false)
WEED_DEFS.weed_mentha_spicata.spread = {stage = "full",time_min = 3.0 * DAYS, time_var = 2.0 * DAYS, tilled_dist =  5, ground_dist = 1.5, ground_dist_var = 3, tooclose_dist = 1.5}
WEED_DEFS.weed_mentha_spicata.seed_weight = COMMON
WEED_DEFS.weed_mentha_spicata.product = "mentha_spicata"
WEED_DEFS.weed_mentha_spicata.nutrient_consumption = {NUTRIENT_LOW, NUTRIENT_LOW, NUTRIENT_LOW}
WEED_DEFS.weed_mentha_spicata.moisture = {drink_rate = DRINK_HIGH}
WEED_DEFS.weed_mentha_spicata.plantregistrywidget = "widgets/redux/weedplantpage"
WEED_DEFS.weed_mentha_spicata.plantregistryinfo = {
    {
        text = "small",
        anim = "crop_small",
        grow_anim = "seedless_to_small",
        growing = true,
    },
    {
        text = "medium",
        anim = "crop_med",
        grow_anim = "grow_med",
        growing = true,
    },
    {
        text = "grown",
        anim = "crop_full",
        grow_anim = "grow_full",
        revealplantname = true,
        fullgrown = true,
    },
    {
        text = "picked",
        anim = "crop_picked",
        grow_anim = "grow_picked",
        stagepriority = -100
    }
}

-- Custom Mentha Spicata Behaviours
-------------------------------------------------------------------------------
local WEED_MENTHA_SPICATA_RESPAWNER_TAG = {"weed_mentha_spicata_respawner", "CLASSIFIED"}
WEED_DEFS.weed_forgetmelots.ondigup = function(inst)
    local stage_data = inst.components.growable ~= nil and inst.components.growable:GetCurrentStageData()
    if stage_data and stage_data.name == "full" then
        local x, y, z = inst.Transform:GetWorldPosition()
        local num_respawners = #TheSim:FindEntities(x, y, z, 12, WEED_MENTHA_SPICATA_RESPAWNER_TAG)
        local chance = 1 - (num_respawners + 1) / 4
        if chance > 0 and math.random() < chance then
            SpawnPrefab("weed_mentha_spicata_respawner").Transform:SetPosition(x, y, z)
        end
    end
end

WEIGHTED_SEED_TABLE["weed_mentha_spicata"] = COMMON