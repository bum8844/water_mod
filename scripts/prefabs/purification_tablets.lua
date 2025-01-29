
local assets = {
    Asset("ANIM", "anim/purification_tablets.zip")
}

local function OnStackSizeChanged(inst, data)
    if data ~= nil then
        if inst.components.perishable ~= nil and data.stacksize >= 5 then
            inst.components.perishable:SetLocalMultiplier(0.25)
        else
            inst.components.perishable:SetLocalMultiplier(1)
        end
    end
end

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
        inst.AnimState:OverrideSymbol("swap","purification_tablets","purification_tablets")

        inst:AddTag("molebait")
        inst:AddTag("purify_item")
        inst:AddTag("icebox_valid")

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("purify")

        inst:AddComponent("inspectable")

        inst:AddComponent("perishable")
        inst.components.perishable.onperishreplacement = "wetgoop"
        inst.components.perishable:SetPerishTime(TUNING.PERISH_TWO_DAY)
        inst.components.perishable:StartPerishing()

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM

    	inst:AddComponent("inventoryitem")

    	MakeHauntableLaunch(inst)

        MakeDynamicItemImage(inst, "swap", "purification_tablets", nil, 3)

        inst:ListenForEvent("stacksizechange", OnStackSizeChanged)

	return inst
end

return Prefab("purification_tablets",fn,assets)