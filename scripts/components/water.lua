local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil then
        self.inst:RemoveTag(old_watertype.."_water")
    end
    if watertype ~= nil then
        self.inst:AddTag(watertype.."_water")
    end
end

local Water = Class(function(self, inst)
    self.inst = inst
    self.watervalue = 1
    self.watertype = nil
    self.ontaken = nil
    --self.returnprefab = nil
end,
nil,
{
    watertype = onwatertype,
})

function Water:SetWater(num)
    self.Water = num
end

function Water:SetWaterType(types)
	self.watertype = types
end

function Water:OnRemoveFromEntity()
    if self.watertype ~= nil then
        self.inst:RemoveTag(self.watertype.."_water")
    end
end

function Water:SetOnTakenFn(fn)
    self.ontaken = fn
end

function Water:Taken(taker, item)

    local item_watervalue = self.watervalue
    local refund = item_watervalue == TUNING.CUP_MAX_LEVEL and SpawnPrefab("cup") or item_watervalue == TUNING.BOTTLE_MAX_LEVEL and SpawnPrefab("messagebottleempty") or item_watervalue == TUNING.BUCKET_MAX_LEVEL and SpawnPrefab("bucket")

    if item.components.finiteuses ~= nil then
        local max = taker.components.waterlevel.maxwater
        local current = taker.components.waterlevel.oldcurrentwater
        if max ~= current then
            max = max - current
        end
        local uses = item.components.finiteuses:GetUses()
        uses = uses - max

        if uses > 0 then
            refund = SpawnPrefab(item.prefab)
            refund.components.finiteuses:SetUses(uses)
        end
    end

    local owner = item.components.inventoryitem ~= nil and item.components.inventoryitem:GetGrandOwner() or nil
    if owner ~= nil then
        local container = owner.components.inventory or owner.components.container
        local item_prefab = container:RemoveItem(item, false) or item
        item_prefab:Remove()
        container:GiveItem(refund, nil, owner:GetPosition())
    else
        refund.Transform:SetPosition(inst.Transform:GetWorldPosition())
        local item_prefab =
            inst.components.stackable ~= nil and
            inst.components.stackable:IsStack() and
            inst.components.stackable:Get() or
            inst
        item_prefab:Remove()
    end

    self.inst:PushEvent("Watertaken", {taker = taker})
    if self.ontaken then
        self.ontaken(self.inst, taker)
    end
end

return Water