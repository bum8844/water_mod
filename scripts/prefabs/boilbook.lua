require("screens/boilbookbasicpopupscreen")
require("screens/boilbookadvancedpopupscreen")

local function OnReadBook_Basic(inst, doer)
    doer:ShowPopUp(POPUPS.BOILBOOK_BASIC, true)
end

local function OnReadBook_Advanced(inst, doer)
    doer:ShowPopUp(POPUPS.BOILBOOK_ADVANCED, true)
end

local function MakeBoilBook(name, onreadbookfn)
    local assets =
    {
        Asset("ANIM", "anim/boilbook.zip"),
    }

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.minisign_atlas = "minisign_dehy_items_swap"

        inst.AnimState:SetBank("boilbook")
        inst.AnimState:SetBuild("boilbook")
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("book_swap","boilbook",name.."_item")

        inst.Transform:SetScale(1.2, 1.2, 1.2)

        MakeInventoryFloatable(inst, "med", nil, 0.75)

        -- for simplebook component
        inst:AddTag(name)
        inst:AddTag("bookcabinet_item")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        -----------------------------------

        inst:AddComponent("inspectable")

        inst:AddComponent("inventoryitem")

        inst:AddComponent("boilbook")
        inst.components.boilbook.onreadfn = onreadbookfn

        MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
        MakeSmallPropagator(inst)

        inst:AddComponent("fuel")
        inst.components.fuel.fuelvalue = TUNING.MED_FUEL

        MakeHauntableLaunch(inst)

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

return MakeBoilBook("boilbook_basic",OnReadBook_Basic),
MakeBoilBook("boilbook_advanced",OnReadBook_Advanced)
