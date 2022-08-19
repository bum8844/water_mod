--'waterlevel' is basically a modified version of 'fueled'.
--We couldn't use fuel directly because ACTIONS.ADDFUEL removes the fuel item from the owner during the work.

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
    if accepting then
        self.inst:AddTag("accepting_water")
    else
        self.inst:RemoveTag("accepting_water")
    end
end

local function oncurrentwater(self, currentwater)
    if currentwater <= 0 then
        self.inst.replica.waterlevel:SetIsDepleted(true)
    else
        self.inst.replica.waterlevel:SetIsDepleted(false)
    end
end

local Waterlevel = Class(function(self, inst)
    self.inst = inst
    self.consuming = false

    self.maxwater = 0
    self.currentwater = 0
    self.oldcurrentwater = 0
    self.rate = 1 --positive rate = consume, negative = product
	self.rate_modifiers = SourceModifierList(self.inst)

    self.accepting = false
    self.canaccepts = { WATERGROUP.OMNI }
    self.watertype = nil
    self.sections = 1
    self.sectionfn = nil
    self.period = 1
    --self.firstperiod = nil
    --self.firstperiodfull = nil
    --self.firstperioddt = nil
    self.bonusmult = 1
    self.depleted = nil
end,
nil,
{
    canaccepts = oncanaccepts,
    accepting = onaccepting,
    currentwater = oncurrentwater,
})

function Waterlevel:OnRemoveFromEntity()
    self:StopConsuming()
    clearcanaccepts(self, self.canaccepts)
    self.inst:RemoveTag("waterdepleted")
    self.inst:RemoveTag("accepting_waterlevel")
end

function Waterlevel:OnSave()
    if self.currentwater > 0 then
        return {waterlevel = self.currentwater, watertype = self.watertype}
    end
end

function Waterlevel:OnLoad(data)
    self.watertype = data.watertype
    if data.waterlevel then
        self:InitializeWaterLevel(math.max(0, data.waterlevel)) 
    end
end

function Waterlevel:MakeEmpty()
    if self.currentwater > 0 then
        self:DoDelta(-self.currentwater)
    end
end

function Waterlevel:SetCanAccepts(canaccepts)
    self.canaccepts = canaccepts
end

function Waterlevel:SetWaterType(type)
    self.watertype = type
end

function Waterlevel:SetSectionCallback(fn)
    self.sectionfn = fn
end

function Waterlevel:SetDepletedFn(fn)
    self.depleted = fn
end

function Waterlevel:IsEmpty()
    return self.currentwater <= 0
end

function Waterlevel:SetSections(num)
    self.sections = num
end

function Waterlevel:GetCurrentSection()
    return self:IsEmpty() and 0 or math.min( math.floor(self:GetPercent()* self.sections)+1, self.sections)
end

function Waterlevel:ChangeSection(amount)
    self:DoDelta(amount * self.maxwater / self.sections - 1)
end

function Waterlevel:SetTakeWaterFn(fn)
    self.ontakewaterfn = fn
end

function Waterlevel:TakeWaterItem(item, doer)
    if not item:HasTag("water_empty") then
        self.watertype = item.components.water.watertype
    end

    local oldsection = self:GetCurrentSection()
    self.oldcurrenwater = self.currentwater

    local water = item.components.water:Watervalue()
    if water ~= nil then
        self:DoDelta(water, doer)
    else
        self:SetPercent(1)
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

function Waterlevel:SetFirstPeriod(firstperiod, firstperiodfull)
    self.firstperiod = firstperiod
    self.firstperiodfull = firstperiodfull --optional
end

local function OnDoUpdate(inst, self, period)
    self:DoUpdate(period)
end

function Waterlevel:StartConsuming()
    self.consuming = true
    if self.task == nil then
        self.task = self.inst:DoPeriodicTask(self.period, OnDoUpdate, nil, self, self.period)
        if self.firstperiod ~= nil then
            self.firstperioddt = self.currentwater >= self.maxwater and self.firstperiodfull or self.firstperiod
            self.inst:StartWallUpdatingComponent(self)
        end
    end
end

function Waterlevel:OnWallUpdate(dt)
    if TheNet:IsServerPaused() then return end

    dt = self.firstperioddt
    self.firstperioddt = nil
    self.inst:StopWallUpdatingComponent(self)
    self:DoUpdate(dt)
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
        --self.inst:PushEvent("refresh")
        if self.currentwater <= 0 and self.depleted then
            self.depleted(self.inst)
        end
    end

    self.inst:PushEvent("percentusedchange", { percent = self:GetPercent() })
end

function Waterlevel:DoUpdate(dt)
    if self.consuming ~= nil then
        self:DoDelta(-dt * self.rate * self.rate_modifiers:Get())
    end

    if self:IsEmpty() then
        self:StopConsuming()
    end

    if self.updatefn ~= nil then
        self.updatefn(self.inst)
    end
end

function Waterlevel:StopConsuming()
    self.consuming = false
    if self.task ~= nil then
        self.task:Cancel()
        self.task = nil
    end
    if self.firstperioddt ~= nil then
        self.firstperioddt = nil
        self.inst:StopWallUpdatingComponent(self)
    end
end

Waterlevel.LongUpdate = Waterlevel.DoUpdate

function Waterlevel:TestType(item, testvalues)
    if item ~= nil and item.components.water ~= nil then
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
    local canaccept, reason
    if self.watertype ~= nil and self.watertype ~= item.components.water.watertype then
        return false
    end
    return self.accepting and item ~= nil and self:TestType(item, self.canaccepts)
end

return Waterlevel
