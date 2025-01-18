local KnownModIndex = _G.KnownModIndex
local UpvalueHacker = require("utils/upvaluehacker")
local COMPONENT_ACTIONS = UpvalueHacker.GetUpvalue(EntityScript.CollectActions, "COMPONENT_ACTIONS")

local _USEITEM = COMPONENT_ACTIONS.USEITEM
local _USEITEMupgrader = _USEITEM.upgrader
function _USEITEM.upgrader(inst, doer, target, actions,...)
    if inst:HasTag("tile_deploy") then
        if not doer:HasTag("handyperson") and inst:HasTag("engineering") then
            return
        end
        for k,v in pairs(UPGRADETYPES) do
            if inst:HasTag(v.."_upgrader") and doer:HasTag(v.."_upgradeuser") and target:HasTag(v.."_upgradeable") then
                table.insert(actions, ACTIONS.UPGRADE_TILEARRIVE)
                return
            end
        end
    elseif not doer:HasTag("handyperson") and inst:HasTag("engineering") then
        return
    else
        _USEITEMupgrader(inst, doer, target, actions,...)
    end
end

if KnownModIndex:IsModEnabled("workshop-2334209327") or KnownModIndex:IsModForceEnabled("workshop-2334209327") then
    ACTIONS.UPGRADE.priority = 2
end

local MAX_PHYSICS_RADIUS = 4
local VIRTUALOCEAN_HASTAGS = {"virtualocean"}
local VIRTUALOCEAN_CANTTAGS = {"INLIMBO"}
local function find_icefishing_hole(x, y, z, r)
    local ents = _G.TheSim:FindEntities(x, y, z, r or MAX_PHYSICS_RADIUS, VIRTUALOCEAN_HASTAGS, VIRTUALOCEAN_CANTTAGS)
    for _, ent in ipairs(ents) do
        if ent.Physics ~= nil then
            local radius = ent.Physics:GetRadius()
            local ex, ey, ez = ent.Transform:GetWorldPosition()
            local dx, dz = ex - x, ez - z
            if dx * dx + dz * dz <= (radius * radius)*1.75 then
                return true
            end
        end
    end

    return nil
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

local function check_type(giver, taker, tagname)
    for k, v in pairs(WATERTYPE) do
        if giver:HasTag("water_"..v) then
            if taker:HasTag(tagname.."_"..v) then
                return true
            end
        end
    end
end

local function evaluate_case(giver, taker)
    if taker:HasTag("checksludge") then
        return check_type(giver,taker,"sludge")
    elseif taker:HasTag("onlysamewater") then
        if taker:HasTag("nowater") then
            return true
        end
        return check_type(giver,taker,"same")
    else
        return true
    end
end

local function evaluate_access(giver, taker)
    local waterlevel = giver.replica.waterlevel or taker.replica.waterlevel
    if not waterlevel then
        return true
    elseif waterlevel:IsBlockBucket() then
        if not giver:HasTag("bucket_empty") and not taker:HasTag("bucket_empty") then
            return true
        end
    else
        return true
    end
end

local USEITEM = 
{
    milkingtool = function(inst, doer, target, actions)
        if target:HasTag("lightninggoat") then
            table.insert(actions, ACTIONS.MILKINGTOOL)
        end
    end,

    wateringtool = function(inst, doer, target, actions)
        if target:HasTag("well") and not (doer.replica.rider ~= nil and doer.replica.rider:IsRiding()) then
            table.insert(actions, ACTIONS.GIVE)
        end
    end,

    water = function(inst, doer, target, actions, right)
        if inst:HasTag("water") then
            if target:HasTag("watertaker") and not inst:HasTag("farm_water") and not inst:HasTag("notwatersource") then
                table.insert(actions, ACTIONS.TAKEWATER)
            elseif target.replica.waterlevel ~= nil
                and target.replica.waterlevel:IsAccepting()
                and evaluate_watertype(inst, target)
                and evaluate_case(inst, target) then
                table.insert(actions, ACTIONS.GIVEWATER)
            end
        elseif inst.replica.waterlevel ~= nil
            and inst.replica.waterlevel:IsAccepting()
            and evaluate_watertype(target, inst) 
            and evaluate_access(target, inst) then
            table.insert(actions, ACTIONS.TAKEWATER)
        end
    end,

    watertaker = function(inst, doer, target, actions)
        if target:HasTag("water") and (target.replica.waterlevel == nil or target.replica.waterlevel:HasWater()) then
            if target:HasTag("farm_water") or target:HasTag("notwatersource") then
                return
            end
            if not evaluate_access(inst, target) then
                return
            end
            table.insert(actions, ACTIONS.TAKEWATER)
        end
    end,

    purify = function(inst, doer, target, actions)
        if target:HasTag("can_purify") and inst:HasTag("purify_item") then
            table.insert(actions, ACTIONS.PURIFY)
        end
    end,

    machinetool = function(inst, doer, target, actions)
        if doer:HasTag("portableengineer") then
            if target:HasTag("needmachtool") and inst:HasTag("machinetool") then
                table.insert(actions, ACTIONS.MACHINETOOL)
            elseif target:HasTag("dismantleable") and inst:HasTag("dismantletool") then
                table.insert(actions, ACTIONS.MACHINETOOL)
            end
        end
    end,
}

local POINT =
{
    watertaker = function(inst, doer, pos, actions, right, target)
        if inst:HasTag("watertaker") and (_G.TheWorld.Map:IsOceanAtPoint(pos.x, 0, pos.z) or _G.FindVirtualOceanEntity(pos.x, 0, pos.z) ~= nil) then
            table.insert(actions, ACTIONS.TAKEWATER_OCEAN)
        end
    end,
}

local SCENE =
{
    dismantleable = function(inst, doer, actions, right)
        if not inst:HasTag("engineering") or doer:HasTag("portableengineer") then
            table.insert(actions, ACTIONS.DISASSEMBLE)
        end
    end,
    wateringmachine = function(inst, doer, actions, right)
        if right and not inst:HasTag("cooldown") and
            not inst:HasTag("fueldepleted") then
            local inventoryitem = inst.replica.inventoryitem
            local held = inventoryitem ~= nil and inventoryitem:IsHeld()
            if inst:HasTag("groundonlymachine") and (held or (inst.components.floater ~= nil and inst.components.floater:IsFloating())) then
                return
            elseif held then
                local equippable = inst.replica.equippable
                if equippable ~= nil and not equippable:IsEquipped() then
                    return
                end
            elseif inst:HasTag("well_waterpump") then 
                if inst:HasTag("fullpressure") or inst:HasTag("recharg_pressure") then
                    return
                end
            elseif not inst:HasTag("haspipe") and not inst:HasTag("hashole") and not inst:HasTag("bigpond_haspipe") then
                return
            end
            table.insert(actions, inst:HasTag("turnedon") and ACTIONS.TURNOFF or inst:HasTag("well_waterpump") and ACTIONS.TURNON or ACTIONS.TURNON_TILEARRIVE)
        end
    end,

    brewing = function(inst, doer, actions, right)
        if not inst:HasTag("burnt") and
            not (doer.replica.rider ~= nil and doer.replica.rider:IsRiding()) then
            if inst:HasTag("donecooking") then
                table.insert(actions, ACTIONS.HARVEST)
            elseif right and (
                (   
                    (inst:HasTag("readybrewing") or inst:HasTag("readydistill")) and
                    --(not inst:HasTag("professionalcookware") or doer:HasTag("professionalchef")) and
                    (not inst:HasTag("mastercookware") or doer:HasTag("masterchef"))
                ) or (
                    inst.replica.container ~= nil and
                    inst.replica.container:IsFull() and 
                    inst.replica.waterlevel:HasWater() and 
                    inst.replica.container:IsOpenedBy(doer)
                ) or (
                    inst.replica.distill ~= nil and
                    inst.replica.distill:IsFull()
                )
            ) then
                table.insert(actions, ACTIONS.BREWING)
            end
        end
    end,

    machinetool = function(inst, doer, actions, right)
        table.insert(actions, ACTIONS.MACHINETOOL)
    end,

    dramaticcontainer = function(inst, doer, actions, right)
        if not inst:HasTag("fire") and not inst:HasTag("burnt") and not inst:HasTag("busy") then
            if right then
                if inst:HasTag("trawler_lowered") then
                    table.insert(actions, ACTIONS.DRAMATIC_RAISE)
                else
                    table.insert(actions, ACTIONS.DRAMATIC_LOWER)
                end
            end
        end
    end,
}

local INVENTORY = {
    watertaker = function(inst, doer, actions)
        if doer.components.playercontroller ~= nil then
            local pos = inst:GetPosition()
            local isVirtualOceanEntity = find_icefishing_hole(pos.x, 0, pos.z)
            if inst:HasTag("watertaker") and (_G.TheWorld.Map:IsOceanTileAtPoint(pos.x, 0, pos.z) or isVirtualOceanEntity ~= nil) then
                table.insert(actions, ACTIONS.TAKEWATER_OCEAN)
            end
        end
    end,

    machinetool = function(inst, doer, actions, right)
        table.insert(actions, ACTIONS.MACHINETOOL)
    end,

    --[[edible = function(inst, doer, actions, right)
        if inst:HasTag("drink") or inst:HasTag("def_water") then
            if (right or inst.replica.equippable == nil) and
                not (doer.replica.inventory:GetActiveItem() == inst and
                    doer.replica.rider ~= nil and
                    doer.replica.rider:IsRiding()) then
                for k, v in pairs(FOODGROUP) do
                    if doer:HasTag(v.name.."_eater") then
                        for i, v2 in ipairs(v.types) do
                            if inst:HasTag("edible_"..v2) then
                                table.insert(actions, ACTIONS.DRINK)
                                return
                            end
                        end
                    end
                end
                for k, v in pairs(FOODTYPE) do
                    if inst:HasTag("edible_"..v) and doer:HasTag(v.."_eater") then
                        table.insert(actions, ACTIONS.DRINK)
                        return
                    end
                end
            end
        end
    end,]]

    boilbook = function(inst, doer, actions, right)
        table.insert(actions, ACTIONS.READBOILBOOK)
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

for k, v in pairs(INVENTORY) do
    AddComponentAction("INVENTORY", k, v)
end