local assets =
{
	Asset("ANIM", "anim/well_sprinkler_fx.zip")
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

    inst:AddTag("FX")
    --inst:AddTag("waterspray")

    inst.Transform:SetScale(3,3,3)
	inst.AnimState:SetBank("well_sprinkler_fx")
	inst.AnimState:SetBuild("well_sprinkler_fx")
	inst.AnimState:PlayAnimation("spray_loop", true)
	inst.persists = false
	
	return inst
end

return Prefab("well_water_spray", fn, assets, prefabs)