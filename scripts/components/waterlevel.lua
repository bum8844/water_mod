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

local function setonlysamewater(self, onlysamewater)
    if onlysamewater then
        self.inst:AddTag("onlysamewater")
    else
        self.inst:RemoveTag("onlysamewater")
    end
end

local function onwatertype(self, watertype, old_watertype)
    if old_watertype then
        self.inst:RemoveTag("same_"..old_watertype)
    end
    if not watertype then
        self.inst:AddTag("nowater")
    else
        self.inst:RemoveTag("nowater")
        if self.onlysamewater then
            self.inst:AddTag("same_"..watertype)
        end
    end
    --self.inst.replica.waterlevel:SetWaterType(watertype or "")
end

local Waterlevel = Class(function(self, inst)
    self.inst = inst
    self.consuming = false
    self.isputoncetime = false
    self.noneboil = false
    self.onlysamewater = false

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
    onlysamewater = setonlysamewater,
    watertype = onwatertype,
})

function Waterlevel:OnRemoveFromEntity()
    self:StopConsuming()
    clearcanaccepts(self, self.canaccepts)
    self.inst:RemoveTag("accepting_water")
end

function Waterlevel:OnSave()
    if self.currentwater > 0 then
        return {waterlevel = self.currentwater, watertype = self.watertype, waterperish = self.waterperish}
    end
end

function Waterlevel:OnLoad(data)
    if data.waterperish then
        self.save_waterperish = true
    end
    self:SetWaterType(data.watertype)
    if data.waterlevel then
        self:InitializeWaterLevel(math.max(0, data.waterlevel)) 
    end
end

function Waterlevel:SetNoneBoil(bool)
    self.noneboil = bool
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

function Waterlevel:SetSections(num)
    self.sections = num
end

function Waterlevel:IsSame()
    return self.maxwater == self.sections
end

function Waterlevel:GetSection()
    return self:IsSame() and math.floor(self:GetPercent()* self.sections) or math.floor(self:GetPercent()* self.sections)+1
end

function Waterlevel:GetCurrentSection()
    return self:IsEmpty() and 0 or math.min(self:GetSection(), self.sections)
end

function Waterlevel:ChangeSection(amount)
    self:DoDelta(amount * self.maxwater / self.sections - 1)
end

function Waterlevel:SetTakeWaterFn(fn)
    self.ontakewaterfn = fn
end

function Waterlevel:UtilityCheck(boilier)
    local canaccepting = true
    local water = self.inst.components.water
    local watersource = self.inst.components.watersource
    local waterspoilage = self.inst.components.waterspoilage

    if self:GetWater() > 0 then
        if self:IsFull() or self.isputoncetime then
            canaccepting = false
        end
        self.accepting = canaccepting
        if water ~= nil then
            water.available = true
        end
        if watersource ~= nil then
            watersource.available = true
        end
    else
        self.accepting = canaccepting
        if water ~= nil then
            water.available = false
        end
        if watersource ~= nil then
            watersource.available = false
        end
        if waterspoilage ~= nil then
            waterspoilage:ResetWaterPerish()
        end
    end
    local sections = self:GetCurrentSection()
    if self.sectionfn then
        self.sectionfn(sections, sections, self.inst)
    end
    self.inst:PushEvent("onwaterlevelsectionchanged", { newsection = sections, oldsection = sections})
end

function Waterlevel:DoDiistiller(item, doer)
    if not self.inst.components.distiller then
        self:UtilityCheck(doer)
        return
    end

    local distiller = self.inst.components.distiller
    distiller.done = true

    local watervalue = self:GetWater()
    local isClane = self.watertype == WATERTYPE.CLEAN or self.watertype == WATERTYPE.MINERAL
    local isDirtyIce = self.watertype == WATERTYPE.DIRTY_ICE

    if not isClane or isDirtyIce then
        watervalue = isDirtyIce and watervalue * 2 or watervalue
        distiller.done = false
    elseif item.components.perishable then
        if item.components.perishable:IsStale() then
            watervalue = watervalue / 4
            distiller.done = false
        elseif item.components.perishable:IsSpoiled() then
            watervalue = watervalue / 2
            distiller.done = false
        end
    end

    if not distiller.done then
        if self.inst._fire == nil then
            distiller:startBoiling(watervalue)
        else
            watervalue = watervalue * 2
            distiller:startBoiling(watervalue, true)
        end

        local sections = self:GetCurrentSection()
        if self.sectionfn then
            self.sectionfn(sections, sections, self.inst)
        end

        self.inst:PushEvent("onwaterlevelsectionchanged", { newsection = sections, oldsection = sections })
    else
        self:UtilityCheck(doer)
    end
end

function Waterlevel:TakeWaterItem(item, doer)
    if self.onlysamewater then
        if self.currentwater > 0 and self.watertype ~= nil and self.watertype ~= item.components.water:GetWatertype() then
            return false
        elseif self.currentwater == 0 then
            self.watertype = nil
        end
    end

    if self.save_waterperish then
        self.waterperish = item.components.perishable:GetPercent()
    else
        self.waterperish = nil
    end

    local watervalue = item.components.water:GetWater()
    self:SetWaterType(item.components.water:GetWatertype())

    self.oldcurrentwater = self.currentwater

    if watervalue ~= nil then
        self:DoDelta(watervalue, doer)
    else
        self:SetPercent(1)
    end

    self:DoDiistiller(item, doer)

    if self.inst.components.waterspoilage and item.components.perishable then
        self.inst.components.waterspoilage:SetMaxFreshness(item.components.perishable.perishtime)
        self.inst.components.waterspoilage:Dilute(item.components.perishable.perishremainingtime)
    end

    local delta = self.currentwater - self.oldcurrentwater

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
