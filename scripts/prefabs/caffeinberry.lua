require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/caffeinberry.zip"),
	Asset("ANIM", "anim/caffeinberry_diseased.zip"),
    Asset("ANIM", "anim/caffeinberry_bean.zip"),
    Asset("ANIM", "anim/water_spice.zip")
}

local prefabs =
{
	"caffeinberry_bean",
	"twigs",
	"dug_caffeinberry",
}

local prefabs_item =
{
	"dug_caffeinberry_placer"
}

--regrowth code
local function OnBurnt(inst)
    if not inst.planted then
        TheWorld:PushEvent("beginregrowth", inst)
    end
    DefaultBurntFn(inst)
end

local function makeemptyfn(inst)
    if inst.components.pickable then
        inst.AnimState:PlayAnimation("dead_to_idle")
        inst.AnimState:PushAnimation("idle")
    else
        inst.AnimState:PlayAnimation("idle")
    end
end

local function makebarrenfn(inst)
    if not POPULATING and inst.AnimState:IsCurrentAnimation("idle") then
        inst.AnimState:PlayAnimation(pickanim(inst).."_to_dead")
        inst.AnimState:PushAnimation("idle_dead")
    else
        inst.AnimState:PlayAnimation("idle_dead")
    end
end

local function pickanim(inst)
    if inst.components.pickable then
        if inst.components.pickable:CanBePicked() then
            local percent = 0
            if inst.components.pickable then
                percent = inst.components.pickable.cycles_left / inst.components.pickable.max_cycles
            end

            if percent >= .9 then
                return "caffeinberriesmost"
            elseif percent >= .33 then
                return "caffeinberriesmore"
            else
                return "caffeinberries"
            end
        else
            if inst.components.pickable:IsBarren() then
                return "idle_dead"
            end
        end
    end

    return "idle"
end

local function shake(inst)
    if inst.components.pickable and inst.components.pickable:CanBePicked() then
        inst.AnimState:PlayAnimation("shake_"..pickanim(inst))
    else
        inst.AnimState:PlayAnimation("shake_empty")
    end
    inst.AnimState:PushAnimation(pickanim(inst), false)
end

local function pickberries(inst)
    if inst.components.pickable then
        local old_percent = (inst.components.pickable.cycles_left+1) / inst.components.pickable.max_cycles

        if old_percent >= .9 then
            inst.AnimState:PushAnimation("caffeinberriesmost_picked")
        elseif old_percent >= .33 then
            inst.AnimState:PushAnimation("caffeinberriesmore_picked")
        else
            inst.AnimState:PushAnimation("caffeinberries_picked")
        end

        if inst.components.pickable:IsBarren() then
            inst.AnimState:PlayAnimation("idle_to_dead")
            inst.AnimState:PushAnimation("idle_dead")
        else
            inst.AnimState:PushAnimation("idle")
        end
    end 
end

local function onpickedfn(inst, picker)
    pickberries(inst)
end

local function makefullfn(inst)
    inst.AnimState:PlayAnimation("shake_empty")
    inst.AnimState:PushAnimation(pickanim(inst))
end

local function dig_up_common(inst, worker, numberries)
    if inst.components.pickable ~= nil and inst.components.lootdropper ~= nil then
        if inst.components.pickable:IsBarren() then
            inst.components.lootdropper:SpawnLootPrefab("twigs")
            inst.components.lootdropper:SpawnLootPrefab("twigs")
        else
            if inst.components.pickable:CanBePicked() then
                local pt = inst:GetPosition()
                pt.y = pt.y + (inst.components.pickable.dropheight or 0)
                for i = 1, numberries do
                    inst.components.lootdropper:SpawnLootPrefab(inst.components.pickable.product, pt)
                end
            end
            if not inst.planted then
                inst.components.lootdropper:SpawnLootPrefab("dug_caffeinberry")
            end
        end
    end
    inst:Remove()
end

local function dig_up_normal(inst, worker)
    dig_up_common(inst, worker, 1)
end

local function ontransplantfn(inst)
    inst.AnimState:PlayAnimation("idle_dead")
    inst.components.pickable:MakeBarren()
end

local function OnHaunt(inst)
    if math.random() <= TUNING.HAUNT_CHANCE_ALWAYS then
        shake(inst)
        inst.components.hauntable.hauntvalue = TUNING.HAUNT_COOLDOWN_TINY
        return true
    end
    return false
end

local function caffeinberry()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeSmallObstaclePhysics(inst, .1)
        
    inst:AddTag("bush")
    inst:AddTag("plant")
    inst:AddTag("renewable")
        
    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("caffeinberrybush.tex")

    inst.AnimState:SetBank("caffeinberry")
    inst.AnimState:SetBuild("caffeinberry")
    inst.AnimState:PlayAnimation("caffeinberrysmost", false)

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetTime(math.random() * inst.AnimState:GetCurrentAnimationLength())

    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/harvest_berries"
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.makeemptyfn = makeemptyfn
    inst.components.pickable.makebarrenfn = makebarrenfn
    inst.components.pickable.makefullfn = makefullfn
    inst.components.pickable.ontransplantfn = ontransplantfn
    inst.components.pickable:SetUp("caffeinberry_bean", TUNING.BERRY_REGROW_TIME*0.5)
    inst.components.pickable.max_cycles = TUNING.BERRYBUSH_CYCLES*2 + math.random(2)
    inst.components.pickable.cycles_left = inst.components.pickable.max_cycles

    MakeHauntableIgnite(inst)
    AddHauntableCustomReaction(inst, OnHaunt, false, false, true)

    inst:AddComponent("lootdropper")

    if not GetGameModeProperty("disable_transplanting") then
    inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.DIG)
        inst.components.workable:SetWorkLeft(1)
        inst.components.workable:SetOnFinishCallback(dig_up_normal)
    end    

    inst:AddComponent("inspectable")

    MakeSnowCovered(inst)
    
    return inst
end

local function on_deploy_fn(inst, position, deployer)
	local tree = SpawnPrefab("caffeinberry")
	if tree ~= nil then
		tree.Transform:SetPosition(position:Get())
		inst.components.stackable:Get():Remove()
		tree.components.pickable:OnTransplant()
		if deployer ~= nil and deployer.SoundEmitter ~= nil then
			deployer.SoundEmitter:PlaySound("dontstarve/common/plant")
		end
        inst.planted = true
	end
end

local function dug_caffeinberry()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("caffeinberry")
    inst.AnimState:SetBuild("caffeinberry")
    inst.AnimState:PlayAnimation("dropped")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst:AddTag("deployedplant")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("dug_caffeinberry")
	inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "caffeinberry_bush_dug"

    inst:AddComponent("tradable")

    inst:AddComponent("deployable")
    inst.components.deployable:SetDeployMode(DEPLOYMODE.PLANT)
    inst.components.deployable.ondeploy = on_deploy_fn

    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

local function caffeinberry_bean()
        local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("caffeinberry_bean")
    inst.AnimState:SetBuild("caffeinberry_bean")
    inst.AnimState:PlayAnimation("idle")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst:AddTag("deployedplant")

    inst.entity:SetPristine()

    inst:AddTag("cookable")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
    inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("bait")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("caffeinberry_bean")
    inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "caffeinberry_bean"

    inst:AddComponent("tradable")
    
    inst:AddComponent("cookable")
    inst.components.cookable.product = "caffeinberry_bean_cooked"

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

local function OnEatBeans(inst, eater)
    if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
        return
    elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
        eater.caffeinbuff_duration = 30
        eater.components.debuffable:AddDebuff("caffeinbuff", "caffeinbuff")
    else
        eater.components.locomotor:SetExternalSpeedMultiplier(eater, "caffeinbuff", TUNING.CAFFEIN_SPEED)
        eater:DoTaskInTime(30, function()
            eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "caffeinbuff")
        end)
    end
end

local function caffeinberry_bean_cooked()
        local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("caffeinberry_bean")
    inst.AnimState:SetBuild("caffeinberry_bean")
    inst.AnimState:PlayAnimation("cooked")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = TUNING.CALORIES_TINY
    inst.components.edible.sanityvalue = -TUNING.SANITY_TINY
    inst.components.edible.foodtype = FOODTYPE.VEGGIE
    inst.components.edible:SetOnEatenFn(OnEatBeans)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("caffeinberry_bean_cooked")
    inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "caffeinberry_bean_cooked"

    inst:AddComponent("tradable")

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

local function fn_spice()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("water_spice")
    inst.AnimState:SetBuild("water_spice")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("spice")
    inst:AddTag("watermod")

    MakeInventoryFloatable(inst, "med", nil, 0.85)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("spice_caffeinpepper")
    inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "spice_caffeinpepper"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("caffeinberry_bean_cooked", caffeinberry_bean_cooked, assets),
Prefab("caffeinberry_bean", caffeinberry_bean, assets, {"caffeinberry_bean_cooked"}),
Prefab("caffeinberry", caffeinberry, assets, prefabs),
Prefab("dug_caffeinberry",dug_caffeinberry, assets, prefabs_item),
MakePlacer("dug_caffeinberry_placer","caffeinberry","caffeinberry","caffeinberriesmost"),
Prefab("spice_caffeinpepper",fn_spice, assets)
