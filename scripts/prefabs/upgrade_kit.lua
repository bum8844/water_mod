local NEED_TAGS = { "sprinkler_water" }
local range = TUNING.FIND_WATER_RANGE

local assets = {
    well_kit = {
        Asset("ANIM", "anim/well.zip"),
    },
    well_sprinkler_kit = {
        Asset("ANIM", "anim/well_sprinkler.zip"),
        Asset("ANIM", "anim/well_sprinkler_placement.zip"),
        Asset("ANIM", "anim/winona_battery_placement.zip"),
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

local function ondeploy_w(inst, pt, deployer)
    local sprinkler = SpawnPrefab("well_winona_sprinkler")
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

local function waterpump_OnSave(inst, data)
    if inst._steampressure then
        data.steampressure = inst._steampressure
    end
end
local function waterpump_OnLoad(inst, data)
    if data and data.steampressure then
        inst._steampressure = data.steampressure
    end
end

local function well_waterpump_kit_fn(inst)
    inst.OnSave = waterpump_OnSave
    inst.OnLoad = waterpump_OnLoad
end

local function well_sprinkler_kit_fn(inst)
    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst.components.deployable.ondeploy = ondeploy
end

local function well_winona_sprinkler_kit_fn(inst)
    inst:AddComponent("deployable")
    inst.components.deployable.restrictedtag = "handyperson"
    inst.components.deployable:SetDeployMode(DEPLOYMODE.CUSTOM)
    inst.components.deployable.ondeploy = ondeploy_w

    inst.OnSave = winona_sprinkler_OnSave
    inst.OnLoad = winona_sprinkler_OnLoad
end

local PLACER_SCALE = 0.6

local function CreatePlacerBatteryRing()
    local inst = CreateEntity()

    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")
    inst:AddTag("placer")

    inst.AnimState:SetBank("winona_battery_placement")
    inst.AnimState:SetBuild("winona_battery_placement")
    inst.AnimState:PlayAnimation("idle_small")
    inst.AnimState:SetLightOverride(1)
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(1)
    inst.AnimState:SetScale(PLACER_SCALE, PLACER_SCALE)

    return inst
end

local function CreatePlacerSprinkler()
    local inst = CreateEntity()

    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")
    inst:AddTag("placer")

    local s = 1 / TUNING.SPRINKLER_PLACER_SCALE
    inst.Transform:SetScale(s, s, s)

    inst.AnimState:SetBank("well_sprinkler")
    inst.AnimState:SetBuild("well_sprinkler")
    inst.AnimState:PlayAnimation("idle_off")
    inst.AnimState:SetLightOverride(1)

    return inst
end

local function placer_postinit_fn(inst)
    --Show the flingo placer on top of the flingo range ground placer
    local placer2 = CreatePlacerSprinkler()
    placer2.entity:SetParent(inst.entity)
    inst.components.placer:LinkEntity(placer2)
end

local function placer_postinit_fn_w(inst)
    --Show the spotlight placer on top of the spotlight range ground placer
    --Also add the small battery range indicator

    local placer2 = CreatePlacerBatteryRing()
    placer2.entity:SetParent(inst.entity)
    inst.components.placer:LinkEntity(placer2)

    placer2 = CreatePlacerSprinkler()
    placer2.entity:SetParent(inst.entity)
    inst.components.placer:LinkEntity(placer2)

    --inst.AnimState:SetScale(PLACER_SCALE, PLACER_SCALE)

    inst.deployhelper_key = "winona_battery_engineering"
end
 
return MakeUpGrade_Kit("well_kit", "well", "idle_well_kit", nil, assets.well_kit, prefabs.well_kit),
MakeUpGrade_Kit("well_burying_kit", "well_burying_kit", "idle_burying_kit", nil, assets.well_burying_kit, prefabs.well_burying_kit,{"burying"}),
MakeUpGrade_Kit("well_waterpump_kit", "well_waterpump", "idle_waterpump_kit", well_waterpump_kit_fn, assets.well_waterpump_kit,prefabs.well_waterpump_kit,{"engineering"}),
MakeUpGrade_Kit("well_sprinkler_kit", "well_sprinkler", "idle_sprinkler_kit", well_sprinkler_kit_fn, assets.well_sprinkler_kit,prefabs.well_sprinkler_kit,{"well_sprinkler_kit","tile_deploy","deploykititem"}),
MakeUpGrade_Kit("well_winona_sprinkler_kit", "well_sprinkler", "idle_sprinkler_kit", well_winona_sprinkler_kit_fn, assets.well_sprinkler_kit,prefabs.well_sprinkler_kit,{"well_sprinkler_kit","tile_deploy","deploykititem","engineering"}),
MakePlacer("well_winona_sprinkler_kit_placer", "well_sprinkler_placement", "well_sprinkler_placement", "idle", true, nil, nil, TUNING.SPRINKLER_PLACER_SCALE, nil, nil, placer_postinit_fn_w),
MakePlacer("well_sprinkler_kit_placer", "well_sprinkler_placement", "well_sprinkler_placement", "idle", true, nil, nil, TUNING.SPRINKLER_PLACER_SCALE, nil, nil, placer_postinit_fn)