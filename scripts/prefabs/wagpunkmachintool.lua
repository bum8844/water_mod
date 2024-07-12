local asset = {
	Asset("ANIM", "anim/wagpunkmachinetool.zip"),
}

local function changeanim(inst, type)
	inst.AnimState:PlayAnimation("change_to_"..type)
	inst.AnimState:PushAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","wagpunkmachinetool","wagpunk"..type)
	inst.components.inventoryitem:ChangeImageName("wagpunk"..type)
end

local function fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddSoundEmitter()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("wagpunkmachinetool")
    inst.AnimState:SetBuild("wagpunkmachinetool")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:OverrideSymbol("swap","wagpunkmachinetool","wagpunkmachinetool")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")

	inst:AddComponent("machinetool")
	inst.components.machinetool.fn = changeanim
	inst.components.machinetool:SetToolType("machinetool")

	return inst
end
return Prefab("wagpunkmachinetool",fn,asset)