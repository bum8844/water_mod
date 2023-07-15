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

    wateringtool = function(inst, doer, target, actions)
        if target:HasTag("well") and not (doer.replica.rider ~= nil and doer.replica.rider:IsRiding()) then
            table.insert(actions, ACTIONS.GIVE)
        end
    end,

    water = function(inst, doer, target, actions, right)
        if inst:HasTag("water") then
            if target:HasTag("watertaker") and not inst:HasTag("farm_water") then
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
                if not target:HasTag("farm_water") then
                    table.insert(actions, ACTIONS.TAKEWATER)
                end
            else
                table.insert(actions, ACTIONS.TAKEWATER)
            end
        end
    end,

    edible = function(inst, doer, target, actions, right)
        if target:HasTag("player") then
            if inst:HasTag("drink") or inst:HasTag("prepareddrink") or inst:HasTag("pre-prepareddrink") then
                table.insert(actions, ACTIONS.FEEDPLAYER)
                return
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
        if inst:HasTag("watertaker") and _G.TheWorld.Map:IsOceanAtPoint(pos.x, 0, pos.z) then
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

    brewing = function(inst, doer, actions, right)
        if not inst:HasTag("burnt") and
            not (doer.replica.rider ~= nil and doer.replica.rider:IsRiding()) then
            if inst:HasTag("donecooking") then
                table.insert(actions, ACTIONS.HARVEST)
            elseif right and (
                (   
                    inst:HasTag("readybrewing") and
                    --(not inst:HasTag("professionalcookware") or doer:HasTag("professionalchef")) and
                    (not inst:HasTag("mastercookware") or doer:HasTag("masterchef"))
                ) or
                (   inst.replica.container ~= nil and
                    inst.replica.container:IsOpenedBy(doer) and
                    inst.replica.container:IsFull() and
                    inst.replica.waterlevel:HasWater()
                )
            ) then
                table.insert(actions, ACTIONS.BREWING)
            end
        end
    end,
}

local INVENTORY = {
    edible = function(inst, doer, actions, right)
        if inst:HasTag("prepareddrink") or inst:HasTag("pre-prepareddrink") or inst:HasTag("def_water") then
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