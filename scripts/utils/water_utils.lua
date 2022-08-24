--when an item 'inst' is used, the 'refund' will be given.
function RefundItem(inst, refund, dontremove)
    if type(refund) == "string" then
        refund = SpawnPrefab(refund)
    end
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local x, y, z = inst.Transform:GetWorldPosition()

    refund.Transform:SetPosition(x, y, z)

    if container ~= nil then
        container:GiveItem(refund)
    end

    if not dontremove then
        if inst.components.stackable ~= nil and inst.components.stackable:IsStack() then
            inst.components.stackable:Get():Remove()
        else
            inst:Remove()
        end
    end
end

local function GetItemState(count)
    return count >= 20 and "_bottle" or ""
end

function MakeDynamicCupImage(inst, symbol, build, use_bg)
    local function ChangeCupImage(inst, data)
        if data ~= nil then
            local new_state = GetItemState(data.stacksize)
            local cur_state = GetItemState(data.oldstacksize)
            if new_state ~= cur_state then
                inst.AnimState:OverrideSymbol(symbol, build..new_state, inst.prefab)
                if inst.components.inventoryitem.imagename ~= inst.prefab..new_state then
                    inst.components.inventoryitem:ChangeImageName(inst.prefab..new_state)
                end
            end
        end
    end

    inst:ListenForEvent("stacksizechange", ChangeCupImage)
end
