local assets =
{
    Asset("ANIM", "anim/caffeinberry_bean.zip"),
}

local prefabs = {
	"caffeinberry_bean_cooked",
}

local function caffeinberry_bean()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("caffeinberry_bean")
    inst.AnimState:SetBuild("caffeinberry_bean")
    inst.AnimState:PlayAnimation("idle")

    MakeInventoryPhysics(inst)

    MakeInventoryFloatable(inst, "small", nil, 0.4)

    inst:AddTag("deployedplant")

    inst.entity:SetPristine()

    inst:AddTag("cookable")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("edible")
    inst.components.edible.healthvalue = TUNING.HEALING_TINY
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("bait")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable.onperishreplacement = "spoiled_food"
    inst.components.perishable:StartPerishing()

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("tea_seed")
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
    inst.components.edible.healthvalue = TUNING.HEALING_SMALL
    inst.components.edible.hungervalue = TUNING.CALORIES_SMALL
    inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = FOODTYPE.VEGGIE

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_TWO_DAY)
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

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunchAndPerish(inst)

    return inst
end

return Prefab("caffeinberry_bean",caffeinberry_bean,assets,prefabs),
Prefab("caffeinberry_bean_cooked",caffeinberry_bean_cooked,assets)