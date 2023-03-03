local KnownModIndex = _G.KnownModIndex

if KnownModIndex:IsModEnabled("workshop-2334209327") or KnownModIndex:IsModForceEnabled("workshop-2334209327") then
    ACTIONS.UPGRADE.priority = 2
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

    --[[waterlevel = function(inst, doer, target, actions, right)
        if inst.compinst.replica.waterlevel:IsAccepting() and target:HasTag("water")
            and (target.replica.waterlevel == nil or target.replica.waterlevel:HasWater()) then
            table.insert(actions, ACTIONS.TAKEWATER)
        end
    end,]]

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
}

local POINT =
{
    watertaker = function(inst, doer, pos, actions, right, target)
        if inst:HasTag("watertaker") and _G.TheWorld.Map:IsOceanAtPoint(pos.x, 0 , pos.z) then
            table.insert(actions, ACTIONS.TAKEWATER_OCEAN)
        end
    end,
}

local SCENE =
{
    stewer = function(inst, doer, actions, right)
        if inst.replica.waterlevel ~= nil then
            if not inst.replica.waterlevel:HasWater() then
                for i, v in ipairs(actions) do
                    if v == ACTIONS.COOK then
                        table.remove(actions, i)
                        return
                    end
                end
            end
            for i, v in ipairs(actions) do
                if v == ACTIONS.HARVEST then
                    table.remove(actions, i)
                    return
                end
            end
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