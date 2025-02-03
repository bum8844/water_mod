GLOBAL.require("map/terrain")

local MOD_LIST = {
    TE = GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1505270912"),
    IA = GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1467214795"),
    AC = GLOBAL.KnownModIndex:IsModEnabled("workshop-3322803908") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-3322803908"),
}

local biome_data = require("utils/water_biome")

local tea_tree_biome = biome_data.SetTeaTreeConfig(GetModConfigData("gen_tea_tree"), MOD_LIST)
local caffeinberry_biome = biome_data.SetCaffeinberryConfig(GetModConfigData("gen_caffeinberry"), MOD_LIST)
local ruincacao_tree_biome = biome_data.SetRuinCacaoConfig(GetModConfigData("gen_ruincacao_tree"), MOD_LIST)

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

AddThingtoWorldGeneration("tea_tree",tea_tree_biome)
AddThingtoWorldGeneration("caffeinberry",caffeinberry_biome)
AddThingtoWorldGeneration("ruincacao_tree",ruincacao_tree_biome) 

GLOBAL.terrain.filter.caffeinberry = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}
GLOBAL.terrain.filter.tea_tree = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}
GLOBAL.terrain.filter.ruincacao_tree = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}