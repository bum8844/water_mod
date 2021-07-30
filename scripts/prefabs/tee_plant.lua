local assets =
{
	Asset("ANIM", "anim/tee.zip"),
	Asset("IMAGE", "images/inventoryimages/tee.tex"),
	Asset("ATLAS", "images/inventoryimages/tee.xml")
}
local prefabs =
{

}

local function onpickedfn(inst, picker)
    if picker and picker.components.sanity then
        picker.components.sanity:DoDelta(TUNING.SANITY_TINY)
    end
    TheWorld:PushEvent("beginregrowth", inst)
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/pickup_plants"
    inst.components.pickable:SetUp("tee", 10)
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.quickpick = true
    inst.components.pickable.wildfirestarter = true


    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("tee_plant", fn, assets)
