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


local function onopen(inst)
    inst.AnimState:PlayAnimation("open")
    inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/LP","loop_gears")
    inst:DoTaskInTime(1,function(inst)
        inst.SoundEmitter:KillSound("loop_gears")
        inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
    end)
end

local function onclose(inst)
    inst.AnimState:PlayAnimation("close")
    inst.SoundEmitter:PlaySound("dontstarve/quagmire/common/safe/close")
    inst:DoTaskInTime(.2,function(inst)
        inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
    end)
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    inst.components.container:DropEverything()
    local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, 1, {"projectile"})
    local num = 0
    for k, v in pairs(ents) do
        if v.prefab == "gelblob_bottle" and not (num >= 2) then
            print("stack",v.components.stackable.stacksize)
            if not (v.components.stackable.stacksize > 1) then
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

local function onbuilt(inst)
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

    inst:AddTag("structure")

    inst.AnimState:SetBank("wine_cellar")
    inst.AnimState:SetBuild("wine_cellar")
    inst.AnimState:PlayAnimation("closed")

    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("wine_cellar")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst.components.container.skipclosesnd = true
    inst.components.container.skipopensnd = true

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

    return inst
end

return Prefab("wine_cellar", fn, assets, prefabs),
    MakePlacer("wine_cellar_placer", "wine_cellar", "wine_cellar", "closed")
