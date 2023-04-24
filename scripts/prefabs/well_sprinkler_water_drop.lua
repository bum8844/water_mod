local assets =
{
	Asset("ANIM", "anim/well_sprinkler_water_drop.zip"),
}

local function fn()
    local inst = CreateEntity()

    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")

    inst.entity:SetCanSleep(false)
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBuild("well_sprinkler_water_drop")
    inst.AnimState:SetBank("well_sprinkler_water_drop")
	inst.AnimState:PushAnimation("idle")

    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

return Prefab("well_sprinkler_water_drop", fn, assets)