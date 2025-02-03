require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/wine_cellar.zip"),
    Asset("ANIM", "anim/ui_wine_cellar_5x4.zip"),
}

local prefabs =
{
    "collapse_small",
}

local function SetOpen(inst)
    inst.components.preserver:SetPerishRateMultiplier(TUNING.WINE_CELLAR_PRESERVER_RATE)
    inst:RemoveTag("busy")
    inst.components.dramaticcontainer.isopen = true
    inst.components.container.canbeopened = true
    inst:RemoveEventCallback("animover",SetOpen)
end

local function SetClose(inst)
    inst.components.preserver:SetPerishRateMultiplier(TUNING.FISH_BOX_PRESERVER_RATE)
    inst:RemoveTag("busy")
    inst.components.dramaticcontainer.isopen = false
    inst:RemoveEventCallback("animover",SetClose)
end

local function onopen(inst)
    inst:AddTag("busy")
    inst.AnimState:PlayAnimation("open")
<<<<<<< HEAD
    inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/LP","loop_gears")
    inst:DoTaskInTime(1,function(inst)
        inst.SoundEmitter:KillSound("loop_gears")
        inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
    end)
=======
    inst.SoundEmitter:PlaySound("drink_fx/sfx/gear_up")
    --[[inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/LP","loop_gears")
    inst:DoTaskInTime(1,function(inst)
        inst.SoundEmitter:KillSound("loop_gears")
        inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
    end)]]
>>>>>>> Beta_1.2.8
    inst:ListenForEvent("animover",SetOpen)
end

local function onclose(inst)
    inst:AddTag("busy")
    inst.components.container.canbeopened = false
    inst.components.container:Close()
    inst.AnimState:PlayAnimation("close")
<<<<<<< HEAD
    inst.SoundEmitter:PlaySound("dontstarve/quagmire/common/safe/close")
    inst:DoTaskInTime(.2,function(inst)
        inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
    end)
=======
    inst.SoundEmitter:PlaySound("drink_fx/sfx/gear_down")
    --[[inst.SoundEmitter:PlaySound("dontstarve/quagmire/common/safe/close")
    inst:DoTaskInTime(.2,function(inst)
        inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
    end)]]
>>>>>>> Beta_1.2.8
    inst:ListenForEvent("animover",SetClose)
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    inst.components.container:DropEverything()
    local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, 2, {"projectile"})
    local num = 0
    for k, v in pairs(ents) do
        if v.prefab == "gelblob_bottle" and not (num >= 2) then
<<<<<<< HEAD
            print("stack",v.components.stackable.stacksize)
            if not (v.components.stackable.stacksize > 1) then
=======
            if not (v.components.stackable.stacksize > 1) and not v.components.inventoryitem:IsHeld() then
>>>>>>> Beta_1.2.8
                num = num + 1
                v.components.complexprojectile.onhitfn(v)
            end
        end
    end
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.components.container:DropEverything()
    inst.AnimState:PushAnimation("closed", false)
    inst.components.container:Close()
end

local function GiveOrDropItem(item, inventory, pos)
    if inventory ~= nil then
        inventory:GiveItem(item, nil, pos)
    else
        item.Transform:SetPosition(pos:Get())
        item.components.inventoryitem:OnDropped(true)
    end
end

local function onbuilt(inst, builder)
    local pos = builder.pos
    local inventory = builder.builder.components.inventory or builder.builder.components.container

    local bottle = SpawnPrefab("messagebottleempty")

    if bottle.components.stackable ~= nil then
        bottle.components.stackable:SetStackSize(4)

        GiveOrDropItem(bottle, inventory, pos)
    else
        GiveOrDropItem(bottle, inventory, pos)

        for i = 1, 3 do
            local addt_bottle = SpawnPrefab("messagebottleempty")
            GiveOrDropItem(addt_bottle, inventory, pos)
        end
    end

    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("closed", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/together/town_portal/craft")
    inst:DoTaskInTime(.7, function(inst) inst.SoundEmitter:PlaySound("wintersfeast2019/winters_feast/table/place")
        inst:DoTaskInTime(.8, function(inst) inst.SoundEmitter:PlaySound("dontstarve/creatures/together/stagehand/hit")
            inst:DoTaskInTime(.5, function(inst) inst.SoundEmitter:PlaySound("dontstarve/quagmire/common/safe/close")end)
        end)
    end) 
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("wine_cellar.png")

    MakeObstaclePhysics(inst, 1.2)

    inst:AddTag("structure")
    inst:AddTag("oceantrawler")

    inst.AnimState:SetBank("wine_cellar")
    inst.AnimState:SetBuild("wine_cellar")
    inst.AnimState:PlayAnimation("closed")

    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddTag("oceantrawler")
    inst:AddTag("trawler_lowered")

    inst:AddComponent("dramaticcontainer")
    inst.components.dramaticcontainer.dramaticopenfn = onopen
    inst.components.dramaticcontainer.dramaticclosefn = onclose

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("wine_cellar")
    --inst.components.container.onopenfn = onopen
    --inst.components.container.onclosefn = onclose
    inst.components.container.canbeopened = false

    inst:AddComponent("preserver")
    inst.components.preserver:SetPerishRateMultiplier(TUNING.FISH_BOX_PRESERVER_RATE)

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:ListenForEvent("onbuilt", onbuilt)

    AddHauntableDropItemOrWork(inst)

    MakeLargeBurnable(inst, nil, nil, true)
    MakeMediumPropagator(inst)

    return inst
end

return Prefab("wine_cellar", fn, assets, prefabs),
    MakePlacer("wine_cellar_placer", "wine_cellar", "wine_cellar", "closed")
