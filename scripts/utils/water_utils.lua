--when an item 'inst' is used, the 'refund' will be given. (similar mechanism with fillable:Fill)
function RefundItem(inst, refund, dontremove)
    if type(refund) == "string" then
        refund = SpawnPrefab(refund)
    end
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    if owner ~= nil then
        local container = owner.components.inventory or owner.components.container
        if not dontremove then
            local item_prefab = container:RemoveItem(inst, false) or inst
            item_prefab:Remove()
        end
        if refund ~= nil then
        	container:GiveItem(refund, nil, owner:GetPosition())
        end
    else
    	if refund ~= nil then
        	refund.Transform:SetPosition(inst.Transform:GetWorldPosition())
        end
        if not dontremove then
            local item_prefab =
                inst.components.stackable ~= nil and
                inst.components.stackable:IsStack() and
                inst.components.stackable:Get() or
                inst
            item_prefab:Remove()
        end
    end
end

local function GetItemState(count)
        return count >= 20 and "_bottle" or
                ""
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
