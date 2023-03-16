local well_kit_assets = {
    Asset("ANIM", "anim/well.zip"),
}

local well_sprinkler_kit assets = {
    Asset("ANIM", "anim/well_sprinkler.zip"),
}

local well_kit_prefabs = {
    "well_sprinkler",
}

local well_kit_prefabs = {
    "well",
}

local function MakeUpGrade_Kit(name, animname, assets, prefabs, tags)

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("item")
    	inst.AnimState:SetBuild(animname)
        inst.AnimState:PlayAnimation("idle_ground")

        if tags ~= nil then
            for k, v in ipairs(tags) do
                inst:AddTag(v)
            end
        end

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")

    	inst:AddComponent("inventoryitem")

        inst:AddComponent("upgrader")
        inst.components.upgrader.upgradetype = UPGRADETYPES.HOLE
        inst.components.upgrader.upgradevalue = 1

        MakeHauntableLaunchAndPerish(inst)

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

return MakeUpGrade_Kit("well_kit","well",well_kit_assets,well_kit_prefabs)--,
--MakeUpGrade_Kit("well_sprinkler_kit")