require("actions")

local function IsDirty(pos)
    local test = _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.MANGROVE_SHORE or
     _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.MANGROVE
    return test
end

local function IsClean(pos)
    local test = _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.RIVER_SHORE or 
     _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.RIVER 
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
        local success = (_G.TheWorld.Map:IsOceanAtPoint(groundpt.x, 0, groundpt.z))
        if success then
            local watertype = nil
            if IsDirty(groundpt) then
                watertype = WATERTYPE.DIRTY
            elseif IsClean(groundpt) then
                watertype =  WATERTYPE.CLEAN
            end
            print(watertype)
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

local TURNON_TILEARRIVE = AddAction("TURNON_TILEARRIVE",STRINGS.ACTIONS.TURNON,function(act)
    local tar = act.target or act.invobject
    if tar and tar.components.machine and not tar.components.machine:IsOn() then
        tar.components.machine:TurnOn(tar)
        return true
    end
end)

ACTIONS.TURNON.priority = 1
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

DRINK_HARVEST = AddAction("DRINK_HARVEST",STRINGS.ACTIONS.HARVEST,function(act)
    if act.target.components.brewing ~= nil then
        return act.target.components.brewing:Harvest(act.doer)  
    elseif act.target ~= nil and act.target.components.pickable ~= nil then
        act.target.components.pickable:Pick(act.doer)
        return true
    end
end)

ACTIONS.PICK.priority = 1
DRINK_HARVEST.priority = 2
DRINK_HARVEST.canforce = true 
DRINK_HARVEST.rangecheckfn = DefaultRangeCheck
DRINK_HARVEST.extra_arrive_dist = ExtraPickupRange
DRINK_HARVEST.mount_valid = true

BREWING = AddAction("BREWING",STRINGS.ACTIONS.BOIL,function(act)
        if act.target.components.cooker ~= nil then
            local cook_pos = act.target:GetPosition()
            local ingredient = act.doer.components.inventory:RemoveItem(act.invobject)

            --V2C: position usually matters for listeners of "killed" event
            ingredient.Transform:SetPosition(cook_pos:Get())

            if not act.target.components.cooker:CanCook(ingredient, act.doer) then
                act.doer.components.inventory:GiveItem(ingredient, nil, cook_pos)
                return false
            end

            if ingredient.components.health ~= nil then
                act.doer:PushEvent("murdered", { victim = ingredient, stackmult = 1 }) -- NOTES(JBK): Cooking something alive.
                if ingredient.components.combat ~= nil then
                    act.doer:PushEvent("killed", { victim = ingredient })
                end
            end

            local product = act.target.components.cooker:CookItem(ingredient, act.doer)
            if product ~= nil then
                act.doer.components.inventory:GiveItem(product, nil, cook_pos)
                return true
            elseif ingredient:IsValid() then
                act.doer.components.inventory:GiveItem(ingredient, nil, cook_pos)
            end
            return false
        elseif act.target.components.brewing ~= nil then
            if act.target.components.brewing:IsCooking() then
                --Already cooking
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
        elseif act.target.components.cookable ~= nil
            and act.invobject ~= nil
            and act.invobject.components.cooker ~= nil then

            local cook_pos = act.target:GetPosition()

            --Intentional use of 3D dist check for birds.
            if act.doer:GetPosition():Dist(cook_pos) > 2 then
                return false, "TOOFAR"
            end

            local owner = act.target.components.inventoryitem:GetGrandOwner()
            local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
            local stacked = act.target.components.stackable ~= nil and act.target.components.stackable:IsStack()
            local ingredient = stacked and act.target.components.stackable:Get() or act.target

            if ingredient ~= act.target then
                --V2C: position usually matters for listeners of "killed" event
                ingredient.Transform:SetPosition(cook_pos:Get())
            end

            if not act.invobject.components.cooker:CanCook(ingredient, act.doer) then
                if container ~= nil then
                    container:GiveItem(ingredient, nil, cook_pos)
                elseif stacked and ingredient ~= act.target then
                    act.target.components.stackable:SetStackSize(act.target.components.stackable:StackSize() + 1)
                    ingredient:Remove()
                end
                return false
            end

            if ingredient.components.health ~= nil and ingredient.components.combat ~= nil then
                act.doer:PushEvent("killed", { victim = ingredient })
            end

            local product = act.invobject.components.cooker:CookItem(ingredient, act.doer)
            if product ~= nil then
                if container ~= nil then
                    container:GiveItem(product, nil, cook_pos)
                else
                    product.Transform:SetPosition(cook_pos:Get())
                    if stacked and product.Physics ~= nil then
                        local angle = math.random() * 2 * PI
                        local speed = math.random() * 2
                        product.Physics:SetVel(speed * math.cos(angle), GetRandomWithVariance(8, 4), speed * math.sin(angle))
                    end
                end
                return true
            elseif ingredient:IsValid() then
                if container ~= nil then
                    container:GiveItem(ingredient, nil, cook_pos)
                elseif stacked and ingredient ~= act.target then
                    act.target.components.stackable:SetStackSize(act.target.components.stackable:StackSize() + 1)
                    ingredient:Remove()
                end
            end
            return false
        end
    end)

BREWING.stroverridefn = function(act)
    return act.target ~= nil and act.target:HasTag("brewery") and STRINGS.ACTIONS.FERMENT or nil
end
BREWING.mount_valid = true
BREWING.priority = 2