local NEED_TAGS = { "pond" }
local range = TUNING.FIND_WATER_RANGE

local well_kit_assets = {
    Asset("ANIM", "anim/well.zip"),
}

local well_sprinkler_kit_assets = {
    --Asset("ANIM", "anim/well_sprinkler.zip"),
    --Asset("ANIM", "anim/well_sprinkler_placement.zip"),
    Asset("ANIM", "anim/sprinkler.zip"),
    Asset("ANIM", "anim/firefiht_placement.zip"),
}

local well_sprinkler_kit_prefabs = {
    "well_sprinkler",
}

local well_kit_prefabs = {
    "well",
}

local function OnEnableHelper(inst, enabled)
    if enabled then
        if inst.helper == nil then
            inst.helper = CreateEntity()

            --[[Non-networked entity]]
            inst.helper.entity:SetCanSleep(false)
            inst.helper.persists = false

            inst.helper.entity:AddTransform()
            inst.helper.entity:AddAnimState()

            inst.helper:AddTag("CLASSIFIED")
            inst.helper:AddTag("NOCLICK")
            inst.helper:AddTag("placer")

            inst.helper.Transform:SetScale(TUNING.SPRINKLER_PLACER_SCALE, TUNING.SPRINKLER_PLACER_SCALE, TUNING.SPRINKLER_PLACER_SCALE)

            inst.helper.AnimState:SetBank("firefighter_placement")
            inst.helper.AnimState:SetBuild("firefighter_placement")
            inst.helper.AnimState:PlayAnimation("idle")
            inst.helper.AnimState:SetLightOverride(1)
            inst.helper.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
            inst.helper.AnimState:SetLayer(LAYER_BACKGROUND)
            inst.helper.AnimState:SetSortOrder(1)
            inst.helper.AnimState:SetAddColour(0, .2, .5, 0)

            inst.helper.entity:SetParent(inst.entity)
        end
    elseif inst.helper ~= nil then
        inst.helper:Remove()
        inst.helper = nil
    end
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

    return best_point
end

local function PlaceTestFn(inst, pt, mouseover, deployer)
    return GetValidWaterPointNearby(inst, pt) ~= nil
end

local function MakeUpGrade_Kit(name, animname, masterfn, assets, prefabs, tags)

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("item")
    	inst.AnimState:SetBuild(animname)
        inst.AnimState:PlayAnimation("idle_ground")

        if tags ~= nil then
            for k, v in ipairs(tags) do
                inst:AddTag(v)
            end
        end

        if inst:HasTag("well_sprinkler_kit") then
            if not TheNet:IsDedicated() then
                inst:AddComponent("deployhelper")
                inst.components.deployhelper.onenablehelper = OnEnableHelper
            end

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
        sprinkler.AnimState:PushAnimation("idle_off", false)
        --sprinkler.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/place")
        inst:Remove()
        --PreventCharacterCollisionsWithPlacedObjects(pot)
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

    placer2.AnimState:SetBank("firefighter")
    placer2.AnimState:SetBuild("firefighter")
    placer2.AnimState:PlayAnimation("idle_off")
    placer2.AnimState:SetLightOverride(1)

    --[[placer2.AnimState:SetBank("well_sprinkler")
    placer2.AnimState:SetBuild("well_sprinkler")
    placer2.AnimState:PlayAnimation("idle_off")
    placer2.AnimState:SetLightOverride(1)]]

    placer2.entity:SetParent(inst.entity)

    inst.components.placer:LinkEntity(placer2)
end

return MakeUpGrade_Kit("well_kit", "well", nil, well_kit_assets, well_kit_prefabs),
MakeUpGrade_Kit("well_sprinkler_kit", "well", well_sprinkler_kit_fn, well_sprinkler_kit_assets, well_sprinkler_kit_prefabs,{"well_sprinkler_kit"}),
MakePlacer("well_sprinkler_kit_placer", "firefighter_placement", "firefighter_placement", "idle", true, nil, nil, TUNING.SPRINKLER_PLACER_SCALE, nil, nil, placer_postinit_fn)
--MakePlacer("well_sprinkler_kit_placer", "well_sprinkler_placement", "well_sprinkler_placement", "idle", true, nil, nil, TUNING.SPRINKLER_PLACER_SCALE, nil, nil, placer_postinit_fn)