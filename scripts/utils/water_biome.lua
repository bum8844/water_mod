-- bum:아니 이걸 할려고 뭔 삽질을.....
local function CheckMods(table1, table2)
    for i, v in pairs(table2) do
        table1[i] = v
    end
    return table1
end

local function SetRuinCacaoConfig(var, list)
    local gen_ruincacao_tree = var

    local ruincacao_tree_biome = {
        RuinedCityEntrance=gen_ruincacao_tree,
        RuinedGuarden=gen_ruincacao_tree,
        LabyrinthEntrance=gen_ruincacao_tree,
    }

    local ruincacao_tree_biome_ia = {
        VolcanoAsh=gen_ruincacao_tree,
        VolcanoNoise=gen_ruincacao_tree,
        VolcanoCage=gen_ruincacao_tree,
    }

    local ruincacao_tree_biome_te = {
        VolcanoAsh=gen_ruincacao_tree,
        VolcanoNoise=gen_ruincacao_tree,
        VolcanoCage=gen_ruincacao_tree,
        BG_deeprainforest_base=gen_tea_tree,
        deeprainforest_fireflygrove=gen_tea_tree,
        deeprainforest_flytrap_grove=gen_tea_tree,
        deeprainforest_mandrakeman=gen_tea_tree,
    }

    if list.TE then
        ruincacao_tree_biome = CheckMods(tea_tree_biome, tea_tree_biome_te)
    end
    if list.IA then
        ruincacao_tree_biome = CheckMods(tea_tree_biome, tea_tree_biome_ia)
    end

    return ruincacao_tree_biome
end

local function SetCaffeinberryConfig(var, list)

    local gen_caffeinberry = var

    local caffeinberry_biome = {
        MoonIsland_Forest=gen_caffeinberry,
        MoonIsland_IslandShard=gen_caffeinberry,
        MoonIsland_Mine=gen_caffeinberry,
        MoonIsland_Baths=gen_caffeinberry,
        MoonIsland_Meadows=gen_caffeinberry,
    }

    local caffeinberry_biome_te = {
        deeprainforest_gas=gen_caffeinberry,
        deeprainforest_gas_set=gen_caffeinberry,
        deeprainforest_gas_flytrap_grove=gen_caffeinberry,
        deeprainforest_gas_flytrap_grove_set=gen_caffeinberry,
        NoOxMeadow=gen_caffeinberry,
        MeadowOxBoon=gen_caffeinberry,
        MeadowCarroty=gen_caffeinberry,
        MeadowSpider=gen_caffeinberry,
        MeadowMandrake=gen_caffeinberry,
        MeadowRocky=gen_caffeinberry,
    }

    local caffeinberry_biome_ia = {
        NoOxMeadow=gen_caffeinberry,
        MeadowOxBoon=gen_caffeinberry,
        MeadowCarroty=gen_caffeinberry,
        MeadowSpider=gen_caffeinberry,
        MeadowMandrake=gen_caffeinberry,
        MeadowRocky=gen_caffeinberry,
    }

    if list.TE then
        caffeinberry_biome = CheckMods(caffeinberry_biome, caffeinberry_biome_te)
    end
    if list.IA then
        caffeinberry_biome = CheckMods(caffeinberry_biome, caffeinberry_biome_ia)
    end

    return caffeinberry_biome
end

local function SetTeaTreeConfig(var, list)

    local gen_tea_tree = var

    local tea_tree_biome = {
        BGForest=gen_tea_tree,
        BGDeepForest=gen_tea_tree,
        DeepForest=gen_tea_tree,
        Forest=gen_tea_tree,
        BGCrappyForest=gen_tea_tree,
        CrappyDeepForest=gen_tea_tree,
        CrappyForest=gen_tea_tree,
        SpiderForest=gen_tea_tree,
    }

    local tea_tree_biome_te = {
        BG_cultivated_base=gen_tea_tree,
        cultivated_base_1=gen_tea_tree,
        cultivated_base_2=gen_tea_tree,
        piko_land=gen_tea_tree,
        JungleClearing=gen_tea_tree,
        JungleDenseVery=gen_tea_tree,
        JungleFrogSanctuary=gen_tea_tree,
        JungleSappy=gen_tea_tree,
        JungleSkeleton=gen_tea_tree,
        JungleSparse=gen_tea_tree,
        JungleDenseMed=gen_tea_tree,
        JungleDenseMedHome=gen_tea_tree,
        JungleFlower=gen_tea_tree,
        JungleMonkeyHell=gen_tea_tree,
        JungleEyeplant=gen_tea_tree,
        JungleGrassy=gen_tea_tree,
        JungleEvilFlowers=gen_tea_tree,
    }

    local tea_tree_biome_ia = {
        JungleClearing=gen_tea_tree,
        JungleDenseVery=gen_tea_tree,
        JungleFrogSanctuary=gen_tea_tree,
        JungleSappy=gen_tea_tree,
        JungleSkeleton=gen_tea_tree,
        JungleSparse=gen_tea_tree,
        JungleDenseMed=gen_tea_tree,
        JungleDenseMedHome=gen_tea_tree,
        JungleFlower=gen_tea_tree,
        JungleMonkeyHell=gen_tea_tree,
        JungleEyeplant=gen_tea_tree,
        JungleGrassy=gen_tea_tree,
        JungleEvilFlowers=gen_tea_tree
    }

    if list.TE then
        tea_tree_biome = CheckMods(tea_tree_biome, tea_tree_biome_te)
    end
    if list.IA then
        tea_tree_biome = CheckMods(tea_tree_biome, tea_tree_biome_ia)
    end

    return tea_tree_biome
end

return { SetTeaTreeConfig = SetTeaTreeConfig, SetCaffeinberryConfig = SetCaffeinberryConfig, SetRuinCacaoConfig = SetRuinCacaoConfig }