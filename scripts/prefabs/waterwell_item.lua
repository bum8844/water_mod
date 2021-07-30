local assets =
{
	Asset("ANIM", "anim/waterwell_item.zip"),
	Asset("IMAGE", "images/inventoryimages/waterwell_item.tex"),
	Asset("ATLAS", "images/inventoryimages/waterwell_item.xml")
}
local prefabs =
{

}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("waterwell_item")
    inst.AnimState:SetBank("waterwell_item")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("waterwell_item")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/waterwell_item.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("waterwell_item", fn, assets)
