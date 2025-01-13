
local assets = {}

local function fn()
	local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.minisign_atlas = "minisign_dehy_items_swap"

    	inst.AnimState:SetBuild("purification_pills")
        inst.AnimState:SetBank("purification_pills")
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

    	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    	MakeSmallPropagator(inst)

    	MakeHauntableLaunch(inst)

	return inst
end

return Prefab("purification_pills",fn,assets)