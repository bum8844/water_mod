GLOBAL.require("map/terrain")

local function mymathclamp(num, min, max)
    return num <= min and min or (num >= max and max or num)
end
local function myround(num, idp)
    return GLOBAL.tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

local function AddThingtoWorldGeneration(prefab,roomincrease)
    local Increase = 0
    for roomstr,add in pairs(roomincrease) do
        Increase = add/100
        if Increase > 0 and Increase <= 0.2 then
            local oldpercent = 0
            local oldsum = 0
            local prefabvalue = 0
            AddRoomPreInit(roomstr, -- if the room does not exist, it is added... so in case we want to support mod rooms, we shoudl call all active rooms first, and test if this room is active at the momentё
                function(room)
                    if room.contents then
                        oldpercent = room.contents.distributepercent or 0
                        if not room.contents.distributeprefabs or oldpercent==0 then
                            room.contents.distributeprefabs = {}
                            prefabvalue = 1 -- here this value does not matter, cause it is the only one
                            room.contents.distributeprefabs[prefab] = (room.contents.distributeprefabs[prefab] and room.contents.distributeprefabs[prefab] + prefabvalue) or prefabvalue
                            room.contents.distributepercent = Increase
                        else
                            oldsum = 0
                            for distprefab,number in pairs(room.contents.distributeprefabs) do
                                if type(number)=="table" then -- eg: smallmammal = {weight = 0.025, prefabs = {"rabbithole", "molehill"}},
                                    -- print("number ist eine table bei: "..tostring(distprefab).." in room: "..tostring(roomstr))
                                    for k,v in pairs(number) do
                                        -- print("k: "..tostring(k).." v: "..tostring(v))
                                        if type(v)=="number" and k=="weight" then
                                            oldsum = oldsum + v
                                        end
                                    end
                                elseif type(number)=="number" then
                                    oldsum = oldsum + number
                                end
                            end
                            room.contents.distributepercent = mymathclamp(oldpercent + Increase,0,1)
                            prefabvalue = myround((oldsum * (room.contents.distributepercent / oldpercent)) - oldsum,8)
                            room.contents.distributeprefabs[prefab] = (room.contents.distributeprefabs[prefab] and room.contents.distributeprefabs[prefab] + prefabvalue) or prefabvalue
                        end
                        -- print("Increaser Debug: "..roomstr..": added "..prefab..". oldpercent: "..oldpercent..", oldsum: "..oldsum..", newpercent: "..room.contents.distributepercent..", prefabvalue: "..prefabvalue..", newvalue: "..room.contents.distributeprefabs[prefab])
                    end
                end
            )
            print("Increaser: Add "..tostring(myround(Increase*100,2)).."% "..prefab.." to room: "..roomstr)
        elseif Increase > 0.2 then
            print("Increaser: Value of Increase is too high for "..prefab..", reduce it!")
        end
    end
end


local gen_tea_tree=GetModConfigData("gen_tea_tree")
local gen_caffeinberry=GetModConfigData("gen_caffeinberry")

if GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1467214795") then
    AddThingtoWorldGeneration("tea_tree",{BGForest=gen_tea_tree,BGDeepForest=gen_tea_tree,DeepForest=gen_tea_tree,Forest=gen_tea_tree,BGCrappyForest=gen_tea_tree,CrappyDeepForest=gen_tea_tree,CrappyForest=gen_tea_tree,SpiderForest=gen_tea_tree,JungleClearing=gen_tea_tree,JungleDenseVery=gen_tea_tree,JungleFrogSanctuary=gen_tea_tree,JungleSappy=gen_tea_tree,JungleSkeleton=gen_tea_tree,JungleSparse=gen_tea_tree,JungleDenseMed=gen_tea_tree,JungleDenseMedHome=gen_tea_tree,JungleFlower=gen_tea_tree,JungleMonkeyHell=gen_tea_tree,JungleEyeplant=gen_tea_tree,JungleGrassy=gen_tea_tree,JungleEvilFlowers=gen_tea_tree})
    AddThingtoWorldGeneration("caffeinberry",{MoonIsland_Forest=gen_caffeinberry,MoonIsland_IslandShard=gen_caffeinberry,MoonIsland_Mine=gen_caffeinberry,MoonIsland_Baths=gen_caffeinberry,MoonIsland_Meadows=gen_caffeinberry,NoOxMeadow=gen_caffeinberry,MeadowOxBoon=gen_caffeinberry,MeadowCarroty=gen_caffeinberry,MeadowSpider=gen_caffeinberry,MeadowMandrake=gen_caffeinberry,MeadowRocky=gen_caffeinberry})
elseif GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1505270912") then
    AddThingtoWorldGeneration("tea_tree",{BGForest=gen_tea_tree,BGDeepForest=gen_tea_tree,DeepForest=gen_tea_tree,Forest=gen_tea_tree,BGCrappyForest=gen_tea_tree,CrappyDeepForest=gen_tea_tree,CrappyForest=gen_tea_tree,SpiderForest=gen_tea_tree,BG_deeprainforest_base=gen_tea_tree,deeprainforest_fireflygrove=gen_tea_tree,deeprainforest_flytrap_grove=gen_tea_tree,deeprainforest_mandrakeman=gen_tea_tree,JungleClearing=gen_tea_tree,JungleDenseVery=gen_tea_tree,JungleFrogSanctuary=gen_tea_tree,JungleSappy=gen_tea_tree,JungleSkeleton=gen_tea_tree,JungleSparse=gen_tea_tree,JungleDenseMed=gen_tea_tree,JungleDenseMedHome=gen_tea_tree,JungleFlower=gen_tea_tree,JungleMonkeyHell=gen_tea_tree,JungleEyeplant=gen_tea_tree,JungleGrassy=gen_tea_tree,JungleEvilFlowers=gen_tea_tree})
    AddThingtoWorldGeneration("caffeinberry",{MoonIsland_Forest=gen_caffeinberry,MoonIsland_IslandShard=gen_caffeinberry,MoonIsland_Mine=gen_caffeinberry,MoonIsland_Baths=gen_caffeinberry,MoonIsland_Meadows=gen_caffeinberry,deeprainforest_gas=gen_caffeinberry,deeprainforest_gas_set=gen_caffeinberry,deeprainforest_gas_flytrap_grove=gen_caffeinberry,deeprainforest_gas_flytrap_grove_set=gen_caffeinberry,NoOxMeadow=gen_caffeinberry,MeadowOxBoon=gen_caffeinberry,MeadowCarroty=gen_caffeinberry,MeadowSpider=gen_caffeinberry,MeadowMandrake=gen_caffeinberry,MeadowRocky=gen_caffeinberry})
else
    AddThingtoWorldGeneration("tea_tree",{BGForest=gen_tea_tree,BGDeepForest=gen_tea_tree,DeepForest=gen_tea_tree,Forest=gen_tea_tree,BGCrappyForest=gen_tea_tree,CrappyDeepForest=gen_tea_tree,CrappyForest=gen_tea_tree,SpiderForest=gen_tea_tree})
    AddThingtoWorldGeneration("caffeinberry",{MoonIsland_Forest=gen_caffeinberry,MoonIsland_IslandShard=gen_caffeinberry,MoonIsland_Mine=gen_caffeinberry,MoonIsland_Baths=gen_caffeinberry,MoonIsland_Meadows=gen_caffeinberry})
end 

GLOBAL.terrain.filter.caffeinberry = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}
GLOBAL.terrain.filter.tea_tree = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}