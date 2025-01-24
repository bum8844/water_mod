local assets = {
    Asset("ANIM","anim/warkawater.zip"),
}

local prefabs = {
    "warkawater_item",
}

local function StartCollecting(inst)
    inst.components.watercollection:StartCollect()
end

local function SetTemperature(inst)
    local isfrozen = inst.components.watercollection:IsFrozen()

    local temp = isfrozen and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP
    local curtemp = inst.components.watercollection:GetWater() ~= nil and math.min(TheWorld.state.temperature, temp) or TheWorld.state.temperature

    inst.components.temperature.current = curtemp

    if isfrozen then
        inst.components.temperature.maxtemp = TUNING.WATER_FROZEN_INITTEMP
        inst.components.temperature.mintemp = TUNING.MIN_ENTITY_TEMP
    else
        inst.components.temperature.maxtemp = TUNING.WATER_MAXTEMP
        inst.components.temperature.mintemp = TUNING.WATER_MINTEMP
    end
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE
end

local function SetToFrozed(inst, data)
    if inst.components.watercollection:IsFull() then
        local cur_temp = inst.components.temperature:GetCurrent()
        local min_temp = inst.components.temperature.mintemp
        local max_temp = inst.components.temperature.maxtemp
        if inst.components.watercollection:IsFrozen() then
            if cur_temp >= max_temp then
                inst.components.watercollection:SetFrozed(false)
            end
        elseif cur_temp <= min_temp then
            inst.components.watercollection:SetFrozed(true)
        end
    end
end

local function getstatus(inst)
    return 
end

local function ChangeToItem(inst)
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end

    local item = SpawnPrefab("warkawater_item")
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    item.AnimState:PlayAnimation("collapse")
    item.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
end

local function OnDismantle(inst, doer)
    ChangeToItem(inst)
    inst:Remove()
    --[[if inst.components.waterlevel:GetPercent() <= 0 then
        ChangeToItem(inst)
        inst:Remove()
    else
        doer.components.talker:Say(GetString(doer,"ACTIONFAIL",{"DISMANTLE","NOTEMPTY"}))
    end]]
end

local function OnBurnt(inst)
    DefaultBurntStructureFn(inst)
    RemovePhysicsColliders(inst)
    SpawnPrefab("ash").Transform:SetPosition(inst.Transform:GetWorldPosition())
    if inst.components.workable ~= nil then
        inst:RemoveComponent("workable")
    end
    if inst.components.portablestructure ~= nil then
        inst:RemoveComponent("portablestructure")
    end
    inst.components.waterlevel.accepting = false
    inst.components.water.available = false
    inst.components.waterlevel:SetPercent(0)
    local amount = math.ceil(inst.components.wateryprotection.addwetness * MOISTURE_ON_BURNT_MULTIPLIER)
    if amount > 0 then
        local x, y, z = inst.Transform:GetWorldPosition()
        TheWorld.components.farming_manager:AddSoilMoistureAtPoint(x, 0, z, amount)
    end
    inst.persists = false
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:ListenForEvent("animover", ErodeAway)
    inst.AnimState:PlayAnimation("burnt_collapse")
end

local function GetWet(inst)
    if not inst:HasTag("burnt") then
        if inst.components.waterlevel:GetPercent() > 0 then
            SpawnPrefab("waterballoon_splash").Transform:SetPosition(inst.Transform:GetWorldPosition())
            inst.SoundEmitter:KillSound("destroy")
            inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
            inst.components.wateryprotection:SpreadProtection(inst)
        end
    end
end

local function onpercentusedchange(inst, data)
    inst.components.wateryprotection.addwetness = data.percent * 0.3
end

local function onhammered(inst)--, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end

    if inst:HasTag("burnt") then
        inst.components.lootdropper:SpawnLootPrefab("ash")
        local fx = SpawnPrefab("collapse_small")
        fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
        fx:SetMaterial("metal")
    else
        GetWet(inst)
        ChangeToItem(inst)
    end
end

local function onhit(inst)--, worker)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation("idle", false)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst:SetPhysicsRadiusOverride(.5)
    MakeObstaclePhysics(inst, inst.physicsradiusoverride)

    inst:SetPrefabNameOverride("warkawater_item")

    inst:AddTag("structure")

    inst.AnimState:SetBank("warkawater")
    inst.AnimState:SetBuild("warkawater")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

    inst:AddComponent("watercollection")

    inst:AddComponent("inspectable")
    --inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("wateryprotection")
    inst.components.wateryprotection.extinguishheatpercent = TUNING.WATER_BARREL_EXTINGUISH_HEAT_PERCENT
    inst.components.wateryprotection.temperaturereduction = TUNING.WATER_BARREL_TEMP_REDUCTION
    inst.components.wateryprotection.witherprotectiontime = TUNING.WATER_BARREL_PROTECTION_TIME
    inst.components.wateryprotection.addwetness = 0 -- 물의 양에 따라 변형
    inst.components.wateryprotection.protection_dist = TUNING.WATER_BARREL_DIST

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:ListenForEvent("percentusedchange", onpercentusedchange)

    MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    StartCollecting(inst)

    inst:WatchWorldState("issummer")
    inst:WatchWorldState("isautumn")
    inst:WatchWorldState("iswinter")
    inst:WatchWorldState("isspring")

    inst:ListenForEvent("set_temperature",SetTemperature)
    inst:ListenForEvent("temperaturedelta", SetToFrozed)

    return inst
end

local function ondeploy(inst, pt, deployer)
    local pot = SpawnPrefab("warkawater")
    if pot ~= nil then
        pot.Physics:SetCollides(false)
        pot.Physics:Teleport(pt.x, 0, pt.z)
        pot.Physics:SetCollides(true)
        pot.AnimState:PlayAnimation("place")
        pot.AnimState:PushAnimation("idle", false)
        pot.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/place")
        inst:Remove()
        PreventCharacterCollisionsWithPlacedObjects(pot)
    end
end

local function fn_item()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.minisign_atlas = "minisign_dehy_items_swap"
    inst.minisign_prefab_name = true

    inst.AnimState:SetBank("warkawater")
    inst.AnimState:SetBuild("warkawater")
    inst.AnimState:PlayAnimation("idle_ground")

    inst:AddTag("portableitem")

    MakeInventoryFloatable(inst, "med", 0.1, 0.8)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("warkawater_item")
    inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "warkawater_item"

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
    --inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
    --inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.NONE)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    MakeMediumBurnable(inst)
    MakeSmallPropagator(inst)

    return inst
end

return Prefab("warkawater",fn,assets,prefabs),
Prefab("warkawater_item",fn_item,assets),
MakePlacer("warkawater_item_placer","warkawater","warkawater","idle")
