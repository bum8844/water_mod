local KnownModIndex = _G.KnownModIndex

if KnownModIndex:IsModEnabled("workshop-2334209327") or KnownModIndex:IsModForceEnabled("workshop-2334209327") then
    ACTIONS.UPGRADE.priority = 2
end

local function IsOceanWater(pos)
    local test = _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW_SHORE or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_MEDIUM or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_DEEP or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_CORAL or
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_CORAL_SHORE or
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHIPGRAVEYARD
    return test
end

local function IsMangroveWater(pos)
    local test = _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.MANGROVE_SHORE or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.MANGROVE 
    return test
end

local function IsWater(pos)
    local test = _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.RIVER_SHORE or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.RIVER 
    return test
end

local function IsNearOceanWater(pos)
    local test = (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.OCEAN_SHALLOW_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.OCEAN_SHALLOW_SHORE) or
        (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.OCEAN_SHALLOW or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.OCEAN_SHALLOW)
    return test
end

local function IsNearMangroveWater(pos)
    local test = (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.MANGROVE_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.MANGROVE_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.MANGROVE_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.MANGROVE_SHORE) or
        (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.MANGROVE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.MANGROVE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.MANGROVE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.MANGROVE)
    return test
end

local function IsNearWater(pos)
    local test = (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.RIVER_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.RIVER_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.RIVER_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.RIVER_SHORE) or
        (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.RIVER or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.RIVER or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.RIVER or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.RIVER)
    return test
end

local function evaluate_watertype(giver, taker)
    for k, v in pairs(WATERGROUP) do
        if taker:HasTag(v.name.."_waterlevel") then
            for i, v2 in ipairs(v.types) do
                if giver:HasTag("water_"..v2) then
                    return true
                end
            end
        end
    end

    for k, v in pairs(WATERTYPE) do
        if giver:HasTag("water_"..v) then
            if taker:HasTag(v.."_waterlevel") then
                return true
            end
        end
    end
end

local USEITEM = 
{
    milkingtool = function(inst, doer, target, actions)
        if target:HasTag("lightninggoat") then
            table.insert(actions, ACTIONS.MILKINGTOOL)
        end
    end,

    purify = function(inst, doer, target, actions)
        if inst:HasTag("purify_pill") or inst:HasTag("purify") then
            if target:HasTag("purify_pill") or target:HasTag("purify") then
                table.insert(actions, ACTIONS.PURIFY)
            end
        end
    end,

    water = function(inst, doer, target, actions, right)
        if inst:HasTag("water") then
            if target:HasTag("watertaker") and not inst:HasTag("drink") then
                table.insert(actions, ACTIONS.TAKEWATER)
            elseif target.replica.waterlevel ~= nil
                and target.replica.waterlevel:IsAccepting()
                and evaluate_watertype(inst, target) then
                table.insert(actions, ACTIONS.GIVEWATER)
            end
        end

        if inst.replica.waterlevel ~= nil
            and inst.replica.waterlevel:IsAccepting()
            and evaluate_watertype(target, inst) then
            table.insert(actions, ACTIONS.TAKEWATER)
        end
    end,

    watertaker = function(inst, doer, target, actions)
        if target:HasTag("water") and (target.replica.waterlevel == nil or target.replica.waterlevel:HasWater()) then
            if inst:HasTag("bucket_empty") then
                if not target:HasTag("drink") then
                    table.insert(actions, ACTIONS.TAKEWATER)
                end
            else
                table.insert(actions, ACTIONS.TAKEWATER)
            end
        end
    end,

    edible = function(inst, doer, target, actions, right)
        if inst:HasTag("drink") then
            for i, v in ipairs(actions) do
                if v == ACTIONS.FEEDPLAYER then
                    table.insert(actions, ACTIONS.DRINKPLAYER)
                    return
                end
            end
        end
    end,

    upgrader = function(inst, doer, target, actions)
        if inst:HasTag("tile_deploy") then
            for k,v in pairs(UPGRADETYPES) do
                if inst:HasTag(v.."_upgrader") and doer:HasTag(v.."_upgradeuser") and target:HasTag(v.."_upgradeable") then
                    table.insert(actions, ACTIONS.UPGRADE_TILEARRIVE)
                    return
                end
            end
        end
    end,

}

local POINT =
{
    watertaker = function(inst, doer, pos, actions, right, target)
        if KnownModIndex:IsModEnabled("workshop-1467214795") or KnownModIndex:IsModForceEnabled("workshop-1467214795") then
            local ispassable = _G.TheWorld.Map:IsPassableAtPoint(pos:Get())
            if inst:HasTag("watertaker") then
                if not ispassable and (_G.TheWorld.Map:IsOceanAtPoint(pos.x, 0, pos.z) or IsOceanWater(pos) or IsMangroveWater(pos) or IsWater(pos)) then
                    table.insert(actions, ACTIONS.TAKEWATER_OCEAN)
                elseif IsNearOceanWater(pos) or IsNearMangroveWater(pos) or IsNearWater(pos) then
                    table.insert(actions, ACTIONS.TAKEWATER_OCEAN)
                end
            end
        elseif inst:HasTag("watertaker") and _G.TheWorld.Map:IsOceanAtPoint(pos.x, 0, pos.z) then
            table.insert(actions, ACTIONS.TAKEWATER_OCEAN)
        end
    end,
}

local SCENE =
{
    machine = function(inst, doer, actions, right)
        if right and not inst:HasTag("cooldown") and
                not inst:HasTag("fueldepleted") and
                not (inst.replica.equippable ~= nil and
                not inst.replica.equippable:IsEquipped() and
                inst.replica.inventoryitem ~= nil and
                inst.replica.inventoryitem:IsHeld()) and
                inst:HasTag("forfarm") and
                (inst:HasTag("haspipe") or inst:HasTag("hashole")) then
            table.insert(actions, inst:HasTag("turnedon") and ACTIONS.TURNOFF or ACTIONS.TURNON_TILEARRIVE)
        end
    end,

    pickable = function(inst, doer, actions)
        if inst:HasTag("pickable") and inst:HasTag("cleanwaterproduction") and not inst:HasTag("intense") then
            table.insert(actions, ACTIONS.DRINK_HARVEST)
        end
    end,
}

for k, v in pairs(USEITEM) do
    AddComponentAction("USEITEM", k, v)
end

for k, v in pairs(POINT) do
    AddComponentAction("POINT", k, v)
end

for k, v in pairs(SCENE) do
    AddComponentAction("SCENE", k, v)
end