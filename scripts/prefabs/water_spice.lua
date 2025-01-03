local function MakeWater_Spice(name)
    local assets =
    {
        Asset("ANIM", "anim/water_spice.zip")
    }

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.minisign_atlas = "minisign_dehy_items_swap"
        
        inst.AnimState:SetBank("water_spice")
        inst.AnimState:SetBuild("water_spice")
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("spice_swap","water_spice",name)

        inst:AddTag("spice")
        inst:AddTag("watermod")
        inst:AddTag("cocktail_ingredients")

        MakeInventoryFloatable(inst, "med", nil, 0.85)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
        inst.replica.inventoryitem:SetImage(name)
        inst.components.inventoryitem.atlasname = "images/inventoryitems/tea_inventoryitem.xml"
        inst.components.inventoryitem.imagename = name

        MakeHauntableLaunch(inst)

        return inst
    end

    return Prefab(name, fn, assets)
end

return MakeWater_Spice("spice_caffeinpepper"),
MakeWater_Spice("spice_ruincolate_spread")