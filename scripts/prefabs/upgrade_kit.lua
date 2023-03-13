local function MakeUpGrade_Kit(name, masterfn, tags)
    local assets =
    {
        Asset("ANIM", "anim/"..name..".zip"),
    }

    local prefabs =
    {
        "well_kit",
        "well_sprinkler_kit",
    }

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank(name)
    	inst.AnimState:SetBuild(name)
        inst.AnimState:PlayAnimation("idle")

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

        if masterfn ~= nil then
            masterfn(inst)
        end

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

return MakeUpGrade_Kit("well_kit"),
MakeUpGrade_Kit("well_sprinkler_kit")