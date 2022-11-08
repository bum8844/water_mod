local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil then
        self.inst:RemoveTag("water_"..old_watertype)
    end
    if watertype ~= nil then
        self.inst:AddTag("water_"..watertype)
    end
end

local function onavailable(self, available)
    if available then
        if not self.inst:HasTag("water") then
            self.inst:AddTag("water")
        end
    else
        if self.inst:HasTag("water") then
            self.inst:RemoveTag("water")
        end
    end
end

local Water = Class(function(self, inst)
    self.inst = inst
    self.watervalue = nil --overriding amount of water.
    self.watertype = nil --WATERTYPE.GENERIC
    self.ontaken = nil
    self.available = true
    --self.returnprefab = nil --Used for item check
end,
nil,
{
    watertype = onwatertype,
    available = onavailable,
})

function Water:OnRemoveFromEntity()
    if self.watertype ~= nil then
        self.inst:RemoveTag("water_"..self.watertype)
    end
end

function Water:GetWater()
    if self.inst.components.waterlevel ~= nil then
        return self.inst.components.waterlevel.currentwater
    end
    local stacksize = self.inst.components.stackable ~= nil and self.inst.components.stackable:StackSize() or 1
    return self.watervalue ~= nil and self.watervalue * stacksize or nil
end

function Water:GetWatertype()
    return self.inst.components.waterlevel ~= nil and self.inst.components.waterlevel.watertype
        or self.watertype
end

function Water:SetWaterType(watertype)
    self.watertype = watertype
end

function Water:SetOnTakenFn(fn)
    self.ontaken = fn
end

--Use taker.waterlevel.oldcurrentwater and currentwater
function Water:Taken(taker, delta)
    self.inst:PushEvent("watertaken", {taker = taker})
    if self.ontaken then
        self.ontaken(self.inst, taker, delta)
    end
end

return Water
