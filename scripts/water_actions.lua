require "class"
require "bufferedaction"
require "debugtools"
require 'util'
require 'vecutil'
require ("components/embarker")
require ("actions")

local function IsDirty(pos)
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

local function IsClean(pos)
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

local function ExtraDropDist(doer, dest, bufferedaction)
    if dest ~= nil then
        local target_x, target_y, target_z = dest:GetPoint()

        local is_on_water = _G.TheWorld.Map:IsOceanTileAtPoint(target_x, 0, target_z) and not _G.TheWorld.Map:IsPassableAtPoint(target_x, 0, target_z)
        if is_on_water then
            return 1.75
        end
    end
    return 0
end

local function DefaultRangeCheck(doer, target)
    if target == nil then
        return
    end
    local target_x, target_y, target_z = target.Transform:GetWorldPosition()
    local doer_x, doer_y, doer_z = doer.Transform:GetWorldPosition()
    local dst = _G.distsq(target_x, target_z, doer_x, doer_z)
    return dst <= 16
end

local function ExtraPickupRange(doer, dest)
    if dest ~= nil then
        local target_x, target_y, target_z = dest:GetPoint()

        local is_on_water =  _G.TheWorld.Map:IsOceanTileAtPoint(target_x, 0, target_z) and not _G.TheWorld.Map:IsPassableAtPoint(target_x, 0, target_z)
        if is_on_water then
            return 0.75
        end
    end
    return 0
end

local store_stroverride = ACTIONS.STORE.stroverridefn or function(act) return end
ACTIONS.STORE.stroverridefn = function(act)
    return act.target:HasTag("kettle") and STRINGS.ACTIONS.BOIL or act.target:HasTag("brewery") and STRINGS.ACTIONS.FERMENT or act.target:HasTag("distillers") and STRINGS.ACTIONS.DISITLL
end

--Adding new actions
local GIVEWATER = AddAction("GIVEWATER", STRINGS.ACTIONS.GIVEWATER, function(act)
    if act.target.components.waterlevel:TakeWaterItem(act.invobject, act.doer) then
        return true
    end
end)
GIVEWATER.priority = 1

local TAKEWATER = AddAction("TAKEWATER", STRINGS.ACTIONS.FILL, function(act)
    local source, filled = nil, nil

    if act.target == nil then
        filled = act.invobject
    else
        if act.target:HasTag("watertaker") then
            filled = act.target
            source = act.invobject
        elseif act.target:HasTag("water") then
            filled = act.invobject
            source = act.target
        end
    end

    if filled == nil then
        return false
    elseif source ~= nil
        and source.components.water ~= nil
        and filled.prefab == source.components.water.returnprefab then
        return false
    end

    local groundpt = act:GetActionPoint()
    if groundpt ~= nil then
        local success = (_G.TheWorld.Map:IsOceanAtPoint(groundpt.x, 0, groundpt.z) or _G.TheWorld.Map:IsOceanTileAtPoint(groundpt.x, 0, groundpt.z))
        if success then
            local watertype = nil
            if IsDirty(groundpt) then
                watertype = WATERTYPE.DIRTY
            elseif IsClean(groundpt) then
                watertype =  WATERTYPE.CLEAN
            end
            return filled.components.watertaker:Fill(nil, act.doer, watertype)
        end
    end

    if filled ~= nil and filled:HasTag("watertaker") and filled.components.watertaker ~= nil then
        return filled.components.watertaker:Fill(source, act.doer)
    end
    return false
end)
TAKEWATER.priority = 2

local TAKEWATER_OCEAN = AddAction("TAKEWATER_OCEAN", STRINGS.ACTIONS.FILL, TAKEWATER.fn)
TAKEWATER_OCEAN.is_relative_to_platform = true
TAKEWATER_OCEAN.extra_arrive_dist = ExtraDropDist
TAKEWATER_OCEAN.priority = 1

local MILKINGTOOL = AddAction("MILKINGTOOL", STRINGS.ACTIONS.MILKINGTOOL, function(act)
    if act.invobject.components.milkingtool:IsCharged(act.target) then
        return act.invobject.components.milkingtool:DoMilking(act.target, act.doer)
    else
        return act.invobject.components.milkingtool:NotReady(act.doer)
    end
end)

MILKINGTOOL.priority = 2

local _FEEDPLAYER = ACTIONS.FEEDPLAYER.fn

ACTIONS.FEEDPLAYER.fn = function(act)
    if act.invobject:HasTag("drink") then
        if act.target ~= nil and 
            act.target:IsValid() and
            act.target.sg:HasStateTag("idle") and
            not (act.target.sg:HasStateTag("busy") or
                act.target.sg:HasStateTag("attacking") or
                act.target.sg:HasStateTag("sleeping") or
                act.target:HasTag("playerghost") or
                act.target:HasTag("wereplayer")) and
            act.target.components.eater ~= nil and
            act.invobject.components.edible ~= nil and
            act.target.components.eater:CanEat(act.invobject) and
            (TheNet:GetPVPEnabled() or
            (act.target:HasTag("strongstomach") and
                act.invobject:HasTag("monstermeat")) or
            (act.invobject:HasTag("spoiled") and act.target:HasTag("ignoresspoilage") and not
                (act.invobject:HasTag("badfood") or act.invobject:HasTag("unsafefood"))) or
            not (act.invobject:HasTag("badfood") or
                act.invobject:HasTag("unsafefood") or
                act.invobject:HasTag("spoiled"))) then
            if act.target.components.eater:PrefersToEat(act.invobject) then
                local food = act.invobject.components.inventoryitem:RemoveFromOwner()
                if food ~= nil then
                    act.target:AddChild(food)
                    food:RemoveFromScene()
                    food.components.inventoryitem:HibernateLivingItem()
                    food.persists = false
                    act.target.sg:GoToState(
                        food.components.edible.foodtype == FOODTYPE.MEAT and "drinkstew" or "drink",
                        { feed = food, feeder = act.doer }
                    )
                    return true
                end
            else
                act.target:PushEvent("wonteatfood", { food = act.invobject })
                return true -- the action still "succeeded", there's just no result on this end
            end
        end
    else
        return _FEEDPLAYER(act)
    end
end

--[[local DRINK = AddAction("DRINK", STRINGS.ACTIONS.DRINK, ACTIONS.EAT.fn)
DRINK.mount_valid = true
--bum:소숫점으로 해서 웜우드가 썩은 음료로도 치료 할 수 있개 되었습니다.
DRINK.priority = 0.5]]

local TURNON_TILEARRIVE = AddAction("TURNON_TILEARRIVE",STRINGS.ACTIONS.TURNON,function(act)
    local tar = act.target or act.invobject
    if tar and tar.components.machine and not tar.components.machine:IsOn() then
        tar.components.machine:TurnOn(tar)
        return true
    end
end)

local eat_stroverride = ACTIONS.EAT.stroverridefn or function(act) return end
ACTIONS.EAT.stroverridefn = function(act)
    return act.invobject:HasTag("drink") and STRINGS.ACTIONS.DRINK or nil
end

TURNON_TILEARRIVE.priority = 4
TURNON_TILEARRIVE.theme_music = "farming"

UPGRADE_TILEARRIVE = AddAction("UPGRADE_TILEARRIVE",STRINGS.ACTIONS.UPGRADE.GENERIC,function(act)
    if act.invobject and act.target and
        act.invobject.components.upgrader and
        act.invobject.components.upgrader:CanUpgrade(act.target, act.doer) and
        act.target.components.upgradeable then

        local can_upgrade, reason = act.target.components.upgradeable:CanUpgrade()
        if can_upgrade then
            return act.target.components.upgradeable:Upgrade(act.invobject, act.doer)
        end

        return false, reason
    end
end)

UPGRADE_TILEARRIVE.priority = 4
UPGRADE_TILEARRIVE.rmb = true
UPGRADE_TILEARRIVE.theme_music = "farming"

local HARVEST_ = ACTIONS.HARVEST.fn

ACTIONS.HARVEST.fn = function(act)
    if act.target.components.brewing ~= nil then
        return act.target.components.brewing:Harvest(act.doer)
    else
        return HARVEST_(act)
    end
end

BREWING = AddAction("BREWING",STRINGS.ACTIONS.BOIL,function(act)
        if act.target.components.brewing ~= nil then
            if act.target.components.brewing:IsCooking() then
                return true
            end
            local container = act.target.components.container
            if container ~= nil and container:IsOpenedByOthers(act.doer) then
                return false, "INUSE"
            elseif not act.target.components.brewing:CanCook() then
                return false
            end
            act.target.components.brewing:StartCooking(act.doer)
            return true
        end
    end)

BREWING.stroverridefn = function(act)
    return act.target ~= nil and 
        act.target:HasTag("brewery") and STRINGS.ACTIONS.FERMENT or 
        act.target:HasTag("distillers") and STRINGS.ACTIONS.DISITLL or nil
end
BREWING.mount_valid = true
BREWING.priority = 2

READBOILBOOK = AddAction("READBOILBOOK",STRINGS.ACTIONS.READ,function(act)
    local target = act.target or act.invobject
    if target ~= nil and act.doer ~= nil then
        if target.components.boilbook ~= nil then
            target.components.boilbook:Read(act.doer)
            return true
        end
    end
end)

READBOILBOOK.priority = 1
READBOILBOOK.mount_valid = true
READBOILBOOK.encumbered_valid = true
