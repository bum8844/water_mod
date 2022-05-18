local assets =
{
	Asset("ANIM", "anim/purification_tablets.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
}

local function fn()

	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst:AddTag("tradable")

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("purification_tablets")
    inst.AnimState:SetBank("purification_tablets")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("purify_pile")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.TRINKETS[2]
    inst.components.tradable.rocktribute = math.ceil(inst.components.tradable.goldvalue / 3)

    inst:AddComponent("inspectable")

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("purify")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename = "purification_tablets"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("purification_tablets", fn, assets)