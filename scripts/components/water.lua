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
    --self.use_WaterManager = false
    --self.left_to_dirty = nil
    self.isitem = nil --Used for item check
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
    local watertype = self.watertype
    if self.use_WaterManager then
        if self.left_to_dirty > 0 then
            watertype = self.set_watertype
        else
            watertype = self.def_watertype
        end
    end
    return self.inst.components.waterlevel ~= nil and self.inst.components.waterlevel.watertype
        or watertype
end

function Water:SetWaterType(type)
    self.watertype = type
end


function Water:DoWaterManaging(num)
    self.left_to_dirty = num
end

function Water:SetWaterManager(num, type, def_type)
    self.use_WaterManager = true
    self.left_to_dirty = num or TUNING.DEFAULT_LEFT_TO_DIRTY
    self.def_watertype = def_type
    self.set_watertype = type
    self:SetWaterType(def_type)
end

function Water:SetOnTakenFn(fn)
    self.ontaken = fn
end

--Use taker.waterlevel.oldcurrentwater and currentwater
function Water:Taken(taker, delta)
    self.inst:PushEvent("watertaken", {taker = taker})
    if self.inst.components.waterlevel then
        self.inst.components.waterlevel:DoDelta(-delta)
    end
    if self.ontaken then
        self.ontaken(self.inst, taker, delta)
    end
    if self.use_WaterManager and self.left_to_dirty > 0 then
        self.left_to_dirty = self.left_to_dirty - 1
    end
end


function Water:OnSave()
    if self.use_WaterManager then
        return { 
                    watermanager = self.left_to_dirty,
                    def_watertype = self.def_watertype,
                    set_watertype = self.set_watertype,
                }
    end
end

function Water:OnLoad(data)
    if data.watermanager then
        self.use_WaterManager = true
        self.left_to_dirty = data.watermanager
        self.def_watertype = data.def_watertype
        self.set_watertype = data.set_watertype
        self:SetWaterType(data.def_watertype)
    end
end

return Water
