local assets =
{
    Asset("ANIM", "anim/fruitflyfruit.zip"),
    Asset("INV_IMAGE", "fruitflyfruit_dead"),
}

local prefabs = {
}

local function getstatus(inst)
    return "DEAD"
end

local function fn()

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("fruitflyfruit")
    inst.AnimState:SetBuild("fruitflyfruit")
    inst.AnimState:PlayAnimation("idle_dead")

    inst:AddTag("nonpotatable")
    inst:AddTag("irreplaceable")

    MakeInventoryFloatable(inst, "med", nil, 0.7)

    inst.entity:SetPristine()

    inst:SetPrefabNameOverride("fruitflyfruit")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst:AddTag("show_spoilage")
    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:ChangeImageName("fruitflyfruit_dead")

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)

    MakeHauntableLaunch(inst)

    return inst

end

return Prefab("fruitflyfruit_dead", fn, assets, prefabs)