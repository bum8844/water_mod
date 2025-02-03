local modlist = require("utils/water_modlist")

local function CheckMods(table1, table2)
    for i, v in pairs(table2) do
        table.insert(table1, i)
    end
    return table1
end

local function GetTeaTreeBiome()

	local tea_tree_biome = {
		"BGForest",
		"BGDeepForest",
		"DeepForest",
		"Forest",
		"BGCrappyForest",
		"CrappyDeepForest",
		"CrappyForest",
		"SpiderForest",
	}

    local tea_tree_biome_te = {
        "BG_cultivated_base",
        "cultivated_base_1",
        "cultivated_base_2",
        "piko_land",
        "JungleClearing",
        "JungleDenseVery",
        "JungleFrogSanctuary",
        "JungleSappy",
        "JungleSkeleton",
        "JungleSparse",
        "JungleDenseMed",
        "JungleDenseMedHome",
        "JungleFlower",
        "JungleMonkeyHell",
        "JungleEyeplant",
        "JungleGrassy",
        "JungleEvilFlowers",
    }

    local tea_tree_biome_ia = {
        "JungleClearing",
        "JungleDenseVery",
        "JungleFrogSanctuary",
        "JungleSappy",
        "JungleSkeleton",
        "JungleSparse",
        "JungleDenseMed",
        "JungleDenseMedHome",
        "JungleFlower",
        "JungleMonkeyHell",
        "JungleEyeplant",
        "JungleGrassy",
        "JungleEvilFlowers",
    }

    local tea_tree_biome_ac = {
        "BG_cultivated_base",
        "cultivated_base_1",
        "cultivated_base_2",
        "piko_land",
    }

    if modlist.te then
    	tea_tree_biome = CheckMods(tea_tree_biome, tea_tree_biome_te)
    end

    if modlist.ia then
    	tea_tree_biome = CheckMods(tea_tree_biome, tea_tree_biome_ia)
    end

    if modlist.ac then
        tea_tree_biome = CheckMods(tea_tree_biome, tea_tree_biome_ac)
    end

	return tea_tree_biome
end

local function GetCaffeinBerryBiome()

	local caffeinberry_biome = {
		"MoonIsland_Forest",
		"MoonIsland_IslandShard",
		"MoonIsland_Mine",
		"MoonIsland_Baths",
		"MoonIsland_Meadows",
	}

    local caffeinberry_biome_te = {
        "deeprainforest_gas",
        "deeprainforest_gas_set",
        "deeprainforest_gas_flytrap_grove",
        "deeprainforest_gas_flytrap_grove_set",
        "NoOxMeadow",
        "MeadowOxBoon",
        "MeadowCarroty",
        "MeadowSpider",
        "MeadowMandrake",
        "MeadowRocky",
    }

    local caffeinberry_biome_ia = {
        "NoOxMeadow",
        "MeadowOxBoon",
        "MeadowCarroty",
        "MeadowSpider",
        "MeadowMandrake",
        "MeadowRocky",
    }

    local caffeinberry_biome_ac = {
        "deeprainforest_gas",
        "deeprainforest_gas_flytrap_grove",
    }

    if modlist.te then
    	caffeinberry_biome = CheckMods(caffeinberry_biome, caffeinberry_biome_te)
    end

    if modlist.ia then
    	caffeinberry_biome = CheckMods(caffeinberry_biome, caffeinberry_biome_ia)
    end

    if modlist.ac then
        caffeinberry_biome = CheckMods(caffeinberry_biome, caffeinberry_biome_ac)
    end        

	return caffeinberry_biome
end

local function GetRuinCacaoTreeBiome()

	local ruincacao_tree_biome = {
        "Vacant",
        "CaveJungle",
        "RuinedCityEntrance",
        "RuinedGuarden",
        "LabyrinthEntrance",
	}

    local ruincacao_tree_biome_ia = {
        "VolcanoAsh",
        "VolcanoNoise",
        "VolcanoCage",
    }

    local ruincacao_tree_biome_te = {
        "VolcanoAsh",
        "VolcanoNoise",
        "VolcanoCage",
        "BG_deeprainforest_base",
        "deeprainforest_fireflygrove",
        "deeprainforest_flytrap_grove",
        "deeprainforest_mandrakeman",
    }

    local ruincacao_tree_biome_ac = {
        "BG_deeprainforest_base",
        "deeprainforest_fireflygrove",
        "deeprainforest_flytrap_grove",
        "deeprainforest_mandrakeman",
    }

    if modlist.te then
    	ruincacao_tree_biome = CheckMods(ruincacao_tree_biome, ruincacao_tree_biome_te)
    end

    if modlist.ia then
    	ruincacao_tree_biome = CheckMods(ruincacao_tree_biome, ruincacao_tree_biome_ia)
    end

    if modlist.ac then
        ruincacao_tree_biome = CheckMods(ruincacao_tree_biome, ruincacao_tree_biome_ac)
    end

	return ruincacao_tree_biome
end


return { GetTeaTreeBiome = GetTeaTreeBiome, GetCaffeinBerryBiome = GetCaffeinBerryBiome, GetRuinCacaoTreeBiome = GetRuinCacaoTreeBiome }