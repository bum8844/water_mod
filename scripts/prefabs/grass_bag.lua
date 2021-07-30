local assets =
{
	Asset("ANIM", "anim/items_ground.zip"),
	
	Asset("IMAGE", "images/water_images.tex"),
	Asset("ATLAS", "images/water_images.xml")
}

local function OnUnwrapped(inst, pos, doer)
	local bag_fx = SpawnPrefab("grass_bag_fx")
	bag_fx.entity:SetParent(doer.entity)
	
	doer.SoundEmitter:PlaySound("dontstarve/common/together/packaged")
	doer.components.inventory:GiveItem(SpawnPrefab("dug_tee_tree"))
	doer.components.inventory:GiveItem(SpawnPrefab("dug_tee_tree"))
	doer.components.inventory:GiveItem(SpawnPrefab("dug_kyno_coffeebush"))
	doer.components.inventory:GiveItem(SpawnPrefab("dug_kyno_coffeebush"))
	doer.components.inventory:GiveItem(SpawnPrefab("dug_kyno_wildwheat"))
	doer.components.inventory:GiveItem(SpawnPrefab("dug_kyno_wildwheat"))
    inst:Remove()
	bag_fx:DoTaskInTime(0.7, function()
	bag_fx:Remove()
	end)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("items_ground")
    inst.AnimState:SetBank("items_ground")
    inst.AnimState:PlayAnimation("bag_idle")

    inst.entity:SetPristine()
	
	inst:AddTag("unwrappable")

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("unwrappable")
    inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)
	inst.components.unwrappable.canbeunwrapped = true
	
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("grass_bag")
    inst.components.inventoryitem.atlasname = "images/water_images.xml"

    return inst
end

local function fx()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBuild("items_ground")
    inst.AnimState:SetBank("items_ground")
    inst.AnimState:PlayAnimation("unwrap")

    inst.entity:SetPristine()


    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable")

    return inst
end

return Prefab("grass_bag", fn, assets),
Prefab("grass_bag_fx", fx, assets)