local assets =
{
    Asset("ANIM", "anim/tee_tree.zip"),
    Asset("ANIM", "anim/tee_tree_diseased_build.zip"),
    Asset("SOUND", "sound/common.fsb"),
}

local prefabs =
{
    "twigs",
    "dug_sapling",
    "disease_puff",
    "diseaseflies",
    "spoiled_food",
}

local function SpawnDiseasePuff(inst)
    SpawnPrefab("disease_puff").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function SetDiseaseBuild(inst)
    inst.AnimState:SetBuild("tee_tree_diseased_build")
end

local function ondiseasedfn(inst)
    inst.components.pickable:ChangeProduct("spoiled_food")
    if POPULATING then
        SetDiseaseBuild(inst)
    else
        if inst.components.pickable:CanBePicked() then
            inst.AnimState:PlayAnimation("shake")
            inst.AnimState:PushAnimation("idle", true)
        elseif inst.components.witherable ~= nil
            and inst.components.witherable:IsWithered()
            or inst.components.pickable:IsBarren() then
            inst.AnimState:PlayAnimation("shake_dead")
            inst.AnimState:PushAnimation("idle_dead", false)
        else
            inst.AnimState:PushAnimation("idle_empty", false)
        end
        inst:DoTaskInTime(6 * FRAMES, SpawnDiseasePuff)
        inst:DoTaskInTime(10 * FRAMES, SetDiseaseBuild)
    end
end

local function makediseaseable(inst)
    if inst.components.diseaseable == nil then
        inst:AddComponent("diseaseable")
        inst.components.diseaseable:SetDiseasedFn(ondiseasedfn)
    end
end

local function ontransplantfn(inst)
    inst.components.pickable:MakeEmpty()
    makediseaseable(inst)
    inst.components.diseaseable:RestartNearbySpread()
end

local function dig_up(inst, worker)
    if inst.components.pickable ~= nil and inst.components.lootdropper ~= nil then
        local withered = inst.components.witherable ~= nil and inst.components.witherable:IsWithered()
        local diseased = inst.components.diseaseable ~= nil and inst.components.diseaseable:IsDiseased()

        if diseased then
            SpawnDiseasePuff(inst)
        elseif inst.components.diseaseable ~= nil and inst.components.diseaseable:IsBecomingDiseased() then
            SpawnDiseasePuff(inst)
            if worker ~= nil then
                worker:PushEvent("digdiseasing")
            end
        end

        if inst.components.pickable:CanBePicked() then
            inst.components.lootdropper:SpawnLootPrefab(inst.components.pickable.product)
        end

        inst.components.lootdropper:SpawnLootPrefab(
            (withered or diseased) and
            "tee" or
            "dug_tee_tree"
        )
    end
    inst:Remove()
end

local function onpickedfn(inst, picker)
    inst.AnimState:PlayAnimation("picked")
    inst.AnimState:PushAnimation("idle_empty", true)
    if inst.components.diseaseable ~= nil then
        if inst.components.diseaseable:IsDiseased() then
            SpawnDiseasePuff(inst)
        elseif inst.components.diseaseable:IsBecomingDiseased() then
            SpawnDiseasePuff(inst)
            if picker ~= nil then
                picker:PushEvent("pickdiseasing")
            end
        end
    end
end

local function onregenfn(inst)
	inst.AnimState:PlayAnimation("grow")
    inst.AnimState:PushAnimation("idle", true)
end

local function makeemptyfn(inst)
    if not POPULATING and
        (   inst.components.witherable ~= nil and
            inst.components.witherable:IsWithered() or
            inst.AnimState:IsCurrentAnimation("dead")
        ) then
        inst.AnimState:PlayAnimation("dead_to_idle")
        inst.AnimState:PushAnimation("idle_empty", true)
    else
        inst.AnimState:PlayAnimation("idle_empty", true)
    end
end

local function makebarrenfn(inst, wasempty)
    if not POPULATING and
        (   inst.components.witherable ~= nil and
            inst.components.witherable:IsWithered()
        ) then
        inst.AnimState:PlayAnimation(wasempty and "empty_to_dead" or "full_to_dead")
        inst.AnimState:PushAnimation("dead", false)
    else
        inst.AnimState:PlayAnimation("dead")
    end
end

local function OnPreLoad(inst, data)
    if data ~= nil and (data.pickable ~= nil and data.pickable.transplanted or data.diseaseable ~= nil) then
        makediseaseable(inst)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.AnimState:SetRayTestOnBB(true)
    inst.AnimState:SetBank("tee_tree")
    inst.AnimState:SetBuild("tee_tree")
    inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 0.5)

    inst:AddTag("renewable")

    --witherable (from witherable component) added to pristine state for optimization
    inst:AddTag("witherable")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetTime(math.random() * 2)

    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"

    inst.components.pickable:SetUp("tee", TUNING.SAPLING_REGROW_TIME)
    inst.components.pickable.onregenfn = onregenfn
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.makeemptyfn = makeemptyfn
    inst.components.pickable.ontransplantfn = ontransplantfn
    inst.components.pickable.makebarrenfn = makebarrenfn

    inst:AddComponent("witherable")

    inst:AddComponent("inspectable")

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(dig_up)
    inst.components.workable:SetWorkLeft(1)

    MakeMediumBurnable(inst)
    MakeSmallPropagator(inst)
    MakeNoGrowInWinter(inst)
    MakeHauntableIgnite(inst)
    ---------------------

    inst.OnPreLoad = OnPreLoad
    inst.MakeDiseaseable = makediseaseable

    return inst
end

return Prefab("tee_tree", fn, assets, prefabs)
