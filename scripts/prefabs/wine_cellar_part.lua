require "prefabutil"

local assets = {
    Asset("ANIM", "anim/wine_cellar.zip"),
}

local prefabs = {
	"wagpunk_bits",
	"livinglog",
    "gears"
}

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.minisign_atlas = "minisign_dehy_items_swap"

    inst:AddTag("molebait")
    inst:AddTag("relic")

    inst.AnimState:SetBank("wine_cellar")
    inst.AnimState:SetBuild("wine_cellar")
    inst.AnimState:PlayAnimation("item")

	MakeInventoryFloatable(inst, "med", nil, 0.65)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")

    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.WINE_CELLAR_PART
    inst.components.tradable.rocktribute = 12


    MakeHauntableLaunchAndSmash(inst)

	return inst
end

return Prefab("wine_cellar_part", fn, assets, prefabs)