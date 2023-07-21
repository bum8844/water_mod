--'waterlevel' is basically a modified version of 'fueled'.
-- also, the waterelevel is like dynamic 'water'.

local SourceModifierList = require("util/sourcemodifierlist")

local function clearcanaccepts(self, canaccepts)
    for i, v in ipairs(canaccepts) do
        self.inst:RemoveTag((type(v) == "table" and v.name or v).."_waterlevel")
    end
end

local function oncanaccepts(self, canaccepts, old_canaccepts)
    if old_canaccepts ~= nil then
        clearcanaccepts(self, old_canaccepts)
    end
    if canaccepts ~= nil then
        for i, v in ipairs(canaccepts) do
            self.inst:AddTag((type(v) == "table" and v.name or v).."_waterlevel")
        end
    end
end

local function onaccepting(self, accepting)
    self.inst.replica.waterlevel:SetAccepting(accepting)
end

local function oncurrentwater(self, currentwater)
    self.inst.replica.waterlevel:SetIsDepleted(self:IsEmpty())
end

--[[local function onwatertype(self, watertype)
    self.inst.replica.waterlevel:SetWaterType(watertype or "")
end]]

local Waterlevel = Class(function(self, inst)
    self.inst = inst
    self.consuming = false

    self.maxwater = 0
    self.currentwater = 0
    self.oldcurrentwater = 0

    self.rate = 1 --positive rate = consume, negative = product
	self.rate_modifiers = SourceModifierList(self.inst)

    self.accepting = true
    self.canaccepts = { WATERGROUP.OMNI }
    self.watertype = nil
    self.sections = 1
    self.sectionfn = nil
    --self.period = nil
    --self.firstperiod = nil
    --self.firstperiodfull = nil
    --self.firstperioddt = nil
    --self.bonusmult = 1
    self.depleted = nil
    self.onfullfn = nil
end,
nil,
{
    canaccepts = oncanaccepts,
    accepting = onaccepting,
    currentwater = oncurrentwater,
    --watertype = onwatertype,
})

function Waterlevel:OnRemoveFromEntity()
    self:StopConsuming()
    clearcanaccepts(self, self.canaccepts)
    self.inst:RemoveTag("accepting_water")
end

function Waterlevel:OnSave()
    if self.currentwater > 0 then
        return {waterlevel = self.currentwater, watertype = self.watertype}
    end
end

function Waterlevel:OnLoad(data)
    self:SetWaterType(data.watertype)
    if data.waterlevel then
        self:InitializeWaterLevel(math.max(0, data.waterlevel)) 
    end
end

function Waterlevel:MakeEmpty()
    if self.currentwater > 0 then
        self:DoDelta(-self.currentwater)
    end
end

function Waterlevel:GetWater()
    return self.currentwater
end

function Waterlevel:SetCanAccepts(canaccepts)
    self.canaccepts = canaccepts
end

function Waterlevel:SetWaterType(type)
    if type ~= self.watertype then
        self.watertype = type
        self.inst:PushEvent("watertypechange", {watertype = self.watertype})
    end
end

function Waterlevel:SetSectionCallback(fn)
    self.sectionfn = fn
end

function Waterlevel:SetDepletedFn(fn)
    self.depleted = fn
end

function Waterlevel:SetOnFullFn(fn)
    self.onfullfn = fn
end

function Waterlevel:IsEmpty()
    return self.currentwater <= 0
end

function Waterlevel:IsFull()
    return self.currentwater >= self.maxwater
end

function Waterlevel:IsSame()
    return self.maxwater == self.sections
end

function Waterlevel:SetSections(num)
    self.sections = num
end

function Waterlevel:GetCurrentSection()
    return self:IsEmpty() and 0 or self:IsSame() and math.min( math.ceil(self:GetPercent()* self.sections), self.sections) or math.min( math.ceil(self:GetPercent()* self.sections)+1, self.sections)
end

function Waterlevel:ChangeSection(amount)
    self:DoDelta(amount * self.maxwater / self.sections - 1)
end

function Waterlevel:SetTakeWaterFn(fn)
    self.ontakewaterfn = fn
end

function Waterlevel:UtilityCheck(boilier)
    if self:GetWater() ~= 0 then
        if self:IsFull() then
            self.accepting = false
        else
            self.accepting = true
        end
        if self.inst.components.water ~= nil then
            self.inst.components.water.available = true
        end
        if self.inst.components.watersource ~= nil then
            self.inst.components.watersource.available = true
        end
    else
        self.accepting = true
        if self.inst.components.water ~= nil then
            self.inst.components.water.available = false
        end
        if self.inst.components.watersource ~= nil then
            self.inst.components.watersource.available = false
        end
    end
    local sections = self:GetCurrentSection()
    if self.sectionfn then
        self.sectionfn(sections, sections, self.inst)
    end
    self.inst:PushEvent("onwaterlevelsectionchanged", { newsection = sections, oldsection = sections})
end

function Waterlevel:DoDiistiller(item, doer)
    if self.inst.components.distiller then

        local watervalue = self:GetWater()

        if self.watertype ~= WATERTYPE.CLEAN then
            if self.watertype == WATERTYPE.DIRTY_ICE then
                watervalue = watervalue * 2
            end
            self.inst.components.distiller.done = false
        elseif item.components.perishable ~= nil then
            if item.components.perishable:IsStale() then
                watervalue = watervalue / 4
                self.inst.components.distiller.done = false
            elseif item.components.perishable:IsSpoiled() then
                watervalue = watervalue / 2
                self.inst.components.distiller.done = false
            else
                self.inst.components.distiller.done = true
            end
        else
            self.inst.components.distiller.done = true
        end

        if not self.inst.components.distiller.done then
            if self.inst._fire == nil then
                self.inst.components.distiller:startBoiling(watervalue)
            else
                watervalue = watervalue * 2
                self.inst.components.distiller:startBoiling(watervalue, true)
            end
            local sections = self:GetCurrentSection()
            if self.sectionfn then
                self.sectionfn(sections, sections, self.inst)
            end
            self.inst:PushEvent("onwaterlevelsectionchanged", { newsection = sections, oldsection = sections})
        else
            self:UtilityCheck(doer)
        end
    else
        self:UtilityCheck(doer)
    end
end

function Waterlevel:TakeWaterItem(item, doer)
    local campkettle = nil
    local watervalue = item.components.water:GetWater()
    self:SetWaterType(item.components.water:GetWatertype())

    self.oldcurrenwater = self.currentwater

    if watervalue ~= nil then
        self:DoDelta(watervalue, doer)
    else
        self:SetPercent(1)
    end

    self:DoDiistiller(item, doer)

    if self.inst.components.waterstorage then
        self.inst.components.waterstorage:SetWaterPerish(item.components.perishable.perishremainingtime)
    end

    local delta = self.currentwater - self.oldcurrenwater

    item.components.water:Taken(self.inst, delta)

    if self.ontakewaterfn ~= nil then
        self.ontakewaterfn(self.inst)
    end

    self.inst:PushEvent("takewater", { watervalue = delta, watertype = self.watertype })

    return true
end

function Waterlevel:GetDebugString()
    local section = self:GetCurrentSection()

    return string.format("%s %2.2f/%2.2f (-%2.2f) : section %d/%d %2.2f", self.consuming and "ON" or "OFF", self.currentwater, self.maxwater, self.rate * self.rate_modifiers:Get(), section, self.sections, self:GetSectionPercent())
end

function Waterlevel:GetSectionPercent()
    local section = self:GetCurrentSection()
    return (self:GetPercent() - (section - 1)/self.sections) / (1/self.sections)
end

function Waterlevel:GetPercent()
    return self.maxwater > 0 and math.max(0, math.min(1, self.currentwater / self.maxwater)) or 0
end

function Waterlevel:SetPercent(amount)
    local target = (self.maxwater * amount)
    self:DoDelta(target - self.currentwater)
end

function Waterlevel:InitializeWaterLevel(waterlevel)
    local oldsection = self:GetCurrentSection()
    if self.maxwater < waterlevel then
        self.maxwater = waterlevel
    end
    self.currentwater = waterlevel
    self:DoDelta(0) --forcing percentusedchange event callback

    local newsection = self:GetCurrentSection()
    if oldsection ~= newsection then
        if self.sectionfn then
	        self.sectionfn(newsection, oldsection, self.inst)
		end
        self.inst:PushEvent("onwaterlevelsectionchanged", { newsection = newsection, oldsection = oldsection})
    end
end

function Waterlevel:DoDelta(amount, doer)
    local oldsection = self:GetCurrentSection()

    self.currentwater = math.clamp(self.currentwater + amount, 0, self.maxwater)

    local newsection = self:GetCurrentSection()

    if oldsection ~= newsection then
        if self.sectionfn then
            self.sectionfn(newsection, oldsection, self.inst)
        end
        self.inst:PushEvent("onwaterlevelsectionchanged", { newsection = newsection, oldsection = oldsection})
    end
    self:UtilityCheck(self.inst)

    self.inst:PushEvent("percentusedchange", { percent = self:GetPercent() })
end

function Waterlevel:TestType(item, testvalues)
    local water = item ~= nil and item.components.waterlevel or item.components.water
    if water then
        for i, v in ipairs(testvalues) do
            if type(v) == "table" then
                for i2, v2 in ipairs(v.types) do
                    if item:HasTag("water_"..v2) then
                        return true
                    end
                end
            elseif item:HasTag("water_"..v) then
                return true
            end
        end
    end
end

function Waterlevel:CanAccept(item)
    local item_watertype = item.components.waterlevel.watertype or item.components.water.watertype
    local self_watertype = self.watertype-- or self.inst.components.water.watertype

    if item_watertype == nil or item_watertype ~= self_watertype then
        return false
    end
    return self.accepting and item ~= nil and self:TestType(item, self.canaccepts)
end

return Waterlevel
