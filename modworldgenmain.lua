GLOBAL.require("map/terrain")

--[[
Короче, я понял, почему у нас ничего не работало. Клей месяца два назад обновили генерацию мира, и modworldgen нужно было переписать. Пример вот:
if GLOBAL.terrain.rooms.DeepDeciduous then
GLOBAL.terrain.rooms.DeepDeciduous.contents.distributeprefabs.berryblue = .06
end
]]
--кусты кофе
--[[
if GLOBAL.terrain.rooms.BGBadlands then
	GLOBAL.terrain.rooms.BGBadlands.contents.distributeprefabs.coffebush = 0.2
end
if GLOBAL.terrain.rooms.Lightning then
	GLOBAL.terrain.rooms.Lightning.contents.distributeprefabs.coffebush = 0.1
end
if GLOBAL.terrain.rooms.Badlands then
	GLOBAL.terrain.rooms.Badlands.contents.distributeprefabs.coffebush = 0.3
end
if GLOBAL.terrain.rooms.HoundyBadlands then
	GLOBAL.terrain.rooms.HoundyBadlands.contents.distributeprefabs.coffebush = 0.1
end
if GLOBAL.terrain.rooms.BuzzardyBadlands then
	GLOBAL.terrain.rooms.BuzzardyBadlands.contents.distributeprefabs.coffebush = 0.1
end
--Ямы
if GLOBAL.terrain.rooms.BGForest then
	GLOBAL.terrain.rooms.BGForest.contents.distributeprefabs.hole = 0.015
end
if GLOBAL.terrain.rooms.BGCrappyFore then
	GLOBAL.terrain.rooms.BGForest.contents.distributeprefabs.hole = 0.015
end
if GLOBAL.terrain.rooms.BGDirt then
	GLOBAL.terrain.rooms.BGDirt.contents.distributeprefabs.hole = 0.015
end
--Чайные кусты
--]]

--Upper text is not used
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


local gen_tea=GetModConfigData("gen_tea")
local gen_holes=GetModConfigData("gen_holes")

AddThingtoWorldGeneration("tee_tree",{BGForest=gen_tea,BGCrappyFores=gen_tea})

AddThingtoWorldGeneration("hole",{BGForest=gen_holes,BGCrappyFores=gen_holes})

GLOBAL.terrain.filter.tee_tree = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}
GLOBAL.terrain.filter.hole = {GLOBAL.GROUND.ROAD, GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER}