require("screens/boilbookpopupscreen")

local assets =
{
    Asset("ANIM", "anim/boilbook.zip"),
}

local function OnReadBook(inst, doer)
	doer:ShowPopUp(POPUPS.BOILBOOK, true)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst.AnimState:SetBank("boilbook")
    inst.AnimState:SetBuild("boilbook")
    inst.AnimState:PlayAnimation("idle")

	inst.Transform:SetScale(1.2, 1.2, 1.2)

    MakeInventoryFloatable(inst, "med", nil, 0.75)

	-- for simplebook component
	inst:AddTag("boilbook")
    inst:AddTag("bookcabinet_item")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -----------------------------------

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")

	inst:AddComponent("boilbook")
	inst.components.boilbook.onreadfn = OnReadBook

    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.MED_FUEL

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("boilbook", fn, assets, prefabs)

