
local assets = {
    --Asset("ANIM", "anim/purification_tablets.zip")
}

local function fn()
	local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.minisign_atlas = "minisign_dehy_items_swap"

    	inst.AnimState:SetBuild("purification_tablets")
        inst.AnimState:SetBank("purification_tablets")
        inst.AnimState:PlayAnimation("idle")

        inst:AddTag("molebait")
        inst:AddTag("purify_item")

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("purify")

        inst:AddComponent("inspectable")

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    	inst:AddComponent("inventoryitem")

    	MakeHauntableLaunch(inst)

        MakeDynamicItemImage(inst, "swap", "purification_tablets")

	return inst
end

return Prefab("purification_tablets",fn,assets)