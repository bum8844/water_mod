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

--Overriding existing actions
local cook_stroverride = ACTIONS.COOK.stroverridefn or function(act) return end
ACTIONS.COOK.stroverridefn = function(act)
    return act.target:HasTag("kettle") and STRINGS.ACTIONS.BOIL or act.target:HasTag("brewery") and STRINGS.ACTIONS.FERMENT or cook_stroverride(act)
end

local harvest_stroverride = ACTIONS.HARVEST.stroverridefn or function(act) return end
ACTIONS.HARVEST.stroverridefn = function(act)
    return act.target:HasTag("kettle") and STRINGS.ACTIONS.DRAIN or nil
end

local store_stroverride = ACTIONS.STORE.stroverridefn or function(act) return end
ACTIONS.STORE.stroverridefn = function(act)
    return act.target:HasTag("kettle") and STRINGS.ACTIONS.BOIL or act.target:HasTag("brewery") and STRINGS.ACTIONS.FERMENT or nil
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
        local success = _G.TheWorld.Map:IsOceanAtPoint(groundpt.x, 0, groundpt.z)
        if success then
            return filled.components.watertaker:Fill(nil, act.doer)
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

local MILKINGTOOL = AddAction("MILKINGTOOL", STRINGS.ACTIONS.MILKINGTOOL, function(act)
    if act.invobject.components.milkingtool:IsCharged(act.target) then
        return act.invobject.components.milkingtool:DoMilking(act.target, act.doer)
    else
        return act.invobject.components.milkingtool:NotReady(act.doer)
    end
end)
--MILKINGTOOL.priority = 2

local PURIFY = AddAction("PURIFY", STRINGS.ACTIONS.PURIFY, function(act)
    if act.invobject.components.purify:CanPurify(act.target) then
        return act.invobject.components.purify:DoPurify(act.target, act.doer)
    end
end)

local DRINKPLAYER = AddAction("DRINKPLAYER", STRINGS.ACTIONS.FEEDPLAYER, function(act)
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
                act.target.sg:GoToState("drink", { feed = food, feeder = act.doer })
                return true
            end
        else
            act.target:PushEvent("wonteatfood", { food = act.invobject })
            return true -- the action still "succeeded", there's just no result on this end
        end
    end
end)
DRINKPLAYER.priority = 4
DRINKPLAYER.rmb = true
DRINKPLAYER.canforce = true
DRINKPLAYER.rangecheckfn = DefaultRangeCheck

local DRINK = AddAction("DRINK", STRINGS.ACTIONS.DRINK, ACTIONS.EAT.fn)
DRINK.priority = 1
DRINK.mount_valid = true