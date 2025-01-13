GLOBAL.setfenv(1, GLOBAL)

local function GetItemState(count)
    return count >= 5 and "_bottle" or ""
end

SetRetrofitSetting = function(name, value)
    local configs = KnownModIndex:LoadModConfigurationOptions("workshop-3004639365", false)
    if configs ~= nil then
        for i, v in ipairs(configs) do
            if v.name == name then
                v.saved = value
            end
        end
    end
    KnownModIndex:SaveConfigurationOptions(function() end, "workshop-3004639365", configs, false)
end

MakeDynamicCupImage = function(inst, symbol, build, use_bg)
    local function ChangeCupImage(inst, data)
        if data ~= nil then
            local new_state = GetItemState(data.stacksize)
            local cur_state = GetItemState(data.oldstacksize)
            if new_state ~= cur_state then
                inst.minisign_atlas = "minisign_dehy_drinks"..new_state.."_swap"
                inst.AnimState:OverrideSymbol(symbol, build..new_state, inst.prefab)
                if inst.components.inventoryitem.imagename ~= inst.prefab..new_state then
                    inst.components.inventoryitem:ChangeImageName(inst.prefab..new_state)
                end
            end
        end
    end

    inst:ListenForEvent("stacksizechange", ChangeCupImage)
end

Water_BurntStructureFn = function(inst)
    DefaultBurntStructureFn(inst)
    if inst.components.waterlevel ~= nil then
        inst:RemoveComponent("waterlevel")
    end
    if inst.components.water ~= nil then
        inst:RemoveComponent("water")
    end
    if inst.components.waterspoilage ~= nil then
        inst:RemoveComponent("waterspoilage")
    end
end

--Useful if you packed your images into one single atlas file by Atlas Image Packer
RegisterInvItemAtlas = function(atlasname, imagename)
    RegisterInventoryItemAtlas(atlasname, imagename)
    RegisterInventoryItemAtlas(_G.resolvefilepath(atlasname), _G.hash(imagename))
end

RegisterItemAtlasFile = function(fname)
    local atlas = _G.io.lines(_G.resolvefilepath(fname))
    for line in atlas do
        local _, _, image = line:find("<Element name=\"(.+)\" u1")
        if image ~= nil then
            RegisterInvItemAtlas(fname, image)
        end
    end
end

GameDifficultyControl = function(GameOption)
    local Difficulty = TUNING.DIFFICULTY
    if not Difficulty then
        return false
    end

    local dtalbe = {
        ["R"] = {
            enable_waterborne = 0,
            enable_temp_to_dry = 1,
            thirst_max = 200,
            thirst_decrease_speed = .4,
            temp_to_dry = .75,
            max_capacity = 20,
            left_to_dirty = 3,
        },
        ["S"] = {
            enable_waterborne = 1,
            enable_temp_to_dry = 1,
            thirst_max = 150,
            thirst_decrease_speed = .6,
            temp_to_dry = 1,
            max_capacity = 5, 
            left_to_dirty = 0,
        },
    }

    return dtalbe[Difficulty][GameOption]
end

--when an item 'inst' is used, the 'refund' will be given.
--[[local function result(inst, refund, container, x, y, z, dontremove)
    refund.Transform:SetPosition(x, y, z)

    if container ~= nil then
        container:GiveItem(refund)
    end

    if not dontremove then
        if inst.components.stackable ~= nil and inst.components.stackable:IsStack() then
            inst.components.stackable:Get():Remove()
        else
            inst:Remove()
        end
    end
end

function RefundItem(inst, refund, dontremove, isforzen)
    if type(refund) == "string" then
        refund = SpawnPrefab(refund)
    end

    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local x, y, z = inst.Transform:GetWorldPosition()

    if not isforzen then
        result(inst, refund, container, x, y, z, dontremove)
    else
        if inst.components.stackable ~= nil and inst.components.stackable:IsStack() then
            refund.components.stackable:SetStackSize(inst.components.stackable:StackSize())
        end
        result(inst, refund, container, x, y, z, true)
        inst:Remove()
    end
end

function IsOceanWater(pos)
    local test = _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW_SHORE or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHALLOW or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_MEDIUM or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_DEEP or 
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_CORAL or
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_CORAL_SHORE or
    _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z) == _G.WORLD_TILES.OCEAN_SHIPGRAVEYARD
    return test
end

function IsNearOceanWater(pos)
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

function IsNearMangroveWater(pos)
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

function IsNearWater(pos)
    local test = (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.RIVER_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.RIVER_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.RIVER_SHORE or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.RIVER_SHORE) or
        (_G.TheWorld.Map:GetTileAtPoint(pos.x-2.5, 0, pos.z) == _G.WORLD_TILES.RIVER or
         _G.TheWorld.Map:GetTileAtPoint(pos.x+2.5, 0, pos.z) == _G.WORLD_TILES.RIVER or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z-2.5) == _G.WORLD_TILES.RIVER or
         _G.TheWorld.Map:GetTileAtPoint(pos.x, 0, pos.z+2.5) == _G.WORLD_TILES.RIVER)
    return test
end]]