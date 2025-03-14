local NEED_TAGS = { "sprinkler_water" }
local range = TUNING.FIND_WATER_RANGE

local assets = {
    well_kit = {
        Asset("ANIM", "anim/well.zip"),
    },
    well_sprinkler_kit = {
        Asset("ANIM", "anim/well_sprinkler.zip"),
        Asset("ANIM", "anim/well_sprinkler_placement.zip"),
    },
    well_waterpump_kit = {
        Asset("ANIM", "anim/well_waterpump.zip"),
        Asset("ANIM", "anim/well_waterpump_meter.zip"),
    },
    well_burying_kit = {
        Asset("ANIM", "anim/well_burying_kit.zip"),
    },
}

local prefabs = {
    well_kit = {
        "well",
    },
    well_sprinkler_kit = {
        "well_sprinkler",
    },
    well_waterpump_kit = {
        "well_waterpump",
    },
    well_burying_kit = {
        "hole",
    },
}

local function IsValidSprinklerTile(tile)
    return not TileGroupManager:IsOceanTile(tile) and (tile ~= WORLD_TILES.INVALID) and (tile ~= WORLD_TILES.IMPASSABLE)
end

local function GetValidWaterPointNearby(inst, pt)
    local best_point = nil
    local min_sq_dist = 999999999999
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, range, NEED_TAGS)
    for i, v in ipairs(ents) do
        local ex, ey, ez = v.Transform:GetWorldPosition()
        if TheWorld.Map:IsAboveGroundAtPoint(pt.x, pt.y, pt.z, false) then
            local cur_point = Vector3(ex, 0, ez)
            local cur_sq_dist = cur_point:DistSq(pt)
            if cur_sq_dist < min_sq_dist then
                min_sq_dist = cur_sq_dist
                best_point = cur_point
            end
        end
    end

    if not best_point then
        local range = 20
        local cx, cy = TheWorld.Map:GetTileCoordsAtPoint(pt.x, 0, pt.z)
        local center_tile = TheWorld.Map:GetTile(cx, cy)
        for x = pt.x - range, pt.x + range, 1 do
            for z = pt.z - range, pt.z + range, 1 do
                local tile = TheWorld.Map:GetTileAtPoint(x, 0, z)

                if IsValidSprinklerTile(center_tile) and tile == WORLD_TILES.LILYPOND then
                    local cur_point = Vector3(x, 0, z)
                    local cur_sq_dist = cur_point:DistSq(pt)

                    if cur_sq_dist < min_sq_dist then
                        min_sq_dist = cur_sq_dist
                        best_point = cur_point
                    end
                end
            end
        end
    end

    return best_point
end

local function PlaceTestFn(inst, pt, mouseover, deployer)
    return GetValidWaterPointNearby(inst, pt) ~= nil
end

local function MakeUpGrade_Kit(name, animname, playanim, masterfn, assets, prefabs, tags)

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.minisign_atlas = "minisign_dehy_items_swap"
        inst.minisign_prefab_name = true

    	inst.AnimState:SetBuild(animname)
        inst.AnimState:SetBank("item")
        inst.AnimState:PlayAnimation(playanim)

        if tags ~= nil then
            for k, v in ipairs(tags) do
                inst:AddTag(v)
            end
        end

        if inst:HasTag("well_sprinkler_kit") then
            inst._custom_candeploy_fn = PlaceTestFn
        end

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")

    	inst:AddComponent("inventoryitem")

        inst:AddComponent("upgrader")
        inst.components.upgrader.upgradetype = UPGRADETYPES.HOLE
        inst.components.upgrader.upgradevalue = 1

        MakeHauntableLaunchAndPerish(inst)

        if masterfn ~= nil then
            masterfn(inst)
        end

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

local function ondeploy(inst, pt, deployer)
    local sprinkler = SpawnPrefab("well_sprinkler")
    if sprinkler ~= nil then
        sprinkler.Physics:SetCollides(false)
        sprinkler.Physics:Teleport(pt.x, 0, pt.z)
        sprinkler.Physics:SetCollides(true)
        sprinkler.AnimState:PlayAnimation("place")
        sprinkler.AnimState:PushAnimation("idle_off")
        sprinkler.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl2_place")
        inst:Remove()
    end
end

local function well_sprinkler_kit_fn(inst)
    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst.components.deployable.ondeploy = ondeploy
end

local function placer_postinit_fn(inst)
    --Show the flingo placer on top of the flingo range ground placer

    local placer2 = CreateEntity()

    --[[Non-networked entity]]
    placer2.entity:SetCanSleep(false)
    placer2.persists = false

    placer2.entity:AddTransform()
    placer2.entity:AddAnimState()

    placer2:AddTag("CLASSIFIED")
    placer2:AddTag("NOCLICK")
    placer2:AddTag("placer")

    local s = 1 / TUNING.SPRINKLER_PLACER_SCALE
    placer2.Transform:SetScale(s, s, s)

    placer2.AnimState:SetBank("well_sprinkler")
    placer2.AnimState:SetBuild("well_sprinkler")
    placer2.AnimState:PlayAnimation("idle_off")
    placer2.AnimState:SetLightOverride(1)

    placer2.entity:SetParent(inst.entity)

    inst.components.placer:LinkEntity(placer2)
end
 
return MakeUpGrade_Kit("well_kit", "well", "idle_well_kit", nil, assets.well_kit, prefabs.well_kit),
MakeUpGrade_Kit("well_burying_kit", "well_burying_kit", "idle_burying_kit", nil, assets.well_burying_kit, prefabs.well_burying_kit,{"burying"}),
MakeUpGrade_Kit("well_waterpump_kit", "well_waterpump", "idle_waterpump_kit", nil, assets.well_waterpump_kit,prefabs.well_waterpump_kit),
MakeUpGrade_Kit("well_sprinkler_kit", "well_sprinkler", "idle_sprinkler_kit", well_sprinkler_kit_fn, assets.well_sprinkler_kit,prefabs.well_sprinkler_kit,{"well_sprinkler_kit","tile_deploy"}),
MakePlacer("well_sprinkler_kit_placer", "well_sprinkler_placement", "well_sprinkler_placement", "idle", true, nil, nil, TUNING.SPRINKLER_PLACER_SCALE, nil, nil, placer_postinit_fn)