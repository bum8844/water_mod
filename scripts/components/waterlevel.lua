--'waterlevel' is basically a modified version of 'fueled.'

local SourceModifierList = require("util/sourcemodifierlist")

local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil and old_watertype ~= self.secondarywatertype then
        self.inst:RemoveTag(old_watertype.."waterlevel")
    end
    if watertype == self.secondarywatertype then
        return
    elseif watertype ~= nil and self.accepting then
        self.inst:AddTag(watertype.."_waterlevel")
    end
end

local function onsecondarywatertype(self, watertype, old_watertype)
    if old_watertype ~= nil and old_watertype ~= self.watertype then
        self.inst:RemoveTag(old_watertype.."_waterlevel")
    end
    if watertype == self.watertype then
        return
    elseif watertype ~= nil and self.accepting then
        self.inst:AddTag(watertype.."_waterlevel")
    end
end

local function onaccepting(self, accepting)
    if self.watertype ~= nil and self.watertype ~= WATERTYPE.USAGE then
        if accepting then
            self.inst:AddTag(self.watertype.."_waterlevel")
        else
            self.inst:RemoveTag(self.watertype.."_waterlevel")
        end
    end
    if self.secondarywatertype ~= nil and self.secondarywatertype ~= self.watertype and self.secondarywatertype ~= WATERTYPE.USAGE then
        if accepting then
            self.inst:AddTag(self.secondarywatertype.."_waterlevel")
        else
            self.inst:RemoveTag(self.secondarywatertype.."_waterlevel")
        end
    end
end

--[[local function onmaxwater(self, maxwater)
    if self.watertype ~= nil and self.currentwater < maxwater then
        self.inst:AddTag(self.watertype.."_waterlevel")
    else
        self.inst:AddTag(self.watertype.."_waterlevel")
    end
end]]

local function oncurrentwater(self, currentwater)
    if currentwater <= 0 then
        self.inst:AddTag("waterdepleted")
    else
        self.inst:RemoveTag("waterdepleted")
    end
end

local Waterlevel = Class(function(self, inst)
    self.inst = inst
    self.consuming = false

    self.maxwater = 0
    self.currentwater = 0
    self.rate = 1 --positive rate = consume, negative = product
	self.rate_modifiers = SourceModifierList(self.inst)
    self.priority = {}

    self.accepting = false
    self.watertype = WATERTYPE.CLEAN
    self.secondarywatertype = nil
    self.sections = 1
    self.sectionfn = nil
    self.depleted = nil
end,
nil,
{
    watertype = onwatertype,
    secondarywatertype = onsecondarywatertype,
    accepting = onaccepting,
    --maxwater = onmaxwater,
    currentwater = oncurrentwater,
})

function Waterlevel:OnRemoveFromEntity()
    self:StopConsuming()
    if self.watertype ~= nil then
        self.inst:RemoveTag(self.watertype.."_waterlevel")
    end
    if self.secondarywatertype ~= nil and self.secondarywatertype ~= self.watertype then
        self.inst:RemoveTag(self.secondarywatertype.."_waterlevel")
    end
    self.inst:RemoveTag("waterdepleted")
end

function Waterlevel:MakeEmpty()
    if self.currentwater > 0 then
        self:DoDelta(-self.currentwater)
    end
end

function Waterlevel:OnSave()
    if self.currentwater ~= self.maxwater then
        return {waterlevel = self.currentwater}
    end
end

function Waterlevel:OnLoad(data)
    if data.waterlevel then
        self:InitializeWaterLevel(math.max(0, data.waterlevel))
    end
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

function Waterlevel:CanAcceptWaterItem(item)
    return self.accepting and item and item.components.water and (item.components.water.watertype == self.watertype or item.components.water.watertype == self.secondarywatertype)
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
    if self:CanAcceptWaterItem(item) then
        local oldsection = self:GetCurrentSection()

        self:DoDelta(item.components.waterlevel.watervalue, doer)

        if self.ontakewaterfn ~= nil then
            self.ontakewaterfn(self.inst, watervalue)
        end
        self.inst:PushEvent("takewater", { watervalue = watervalue }, { item = item }, { doer = doer })
		
		local watervalue = 0
        if item.components.water ~= nil then
            watervalue = item.components.water.watervalue
            item.components.water:Taken(self.inst)
        end
        item:Remove()

        return true
    end
end

function Waterlevel:GetDebugString()
    local section = self:GetCurrentSection()

    return string.format("%s %2.2f/%2.2f (-%2.2f) : section %d/%d %2.2f", self.consuming and "ON" or "OFF", self.currentwater, self.maxwater, self.rate * self.rate_modifiers:Get(), section, self.sections, self:GetSectionPercent())
end

function Waterlevel:AddThreshold(percent, fn)
    table.insert(self.thresholds, {percent=percent, fn=fn})
    --table.sort(self.thresholds, function(l,r) return l.percent < r.percent)
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

    local newsection = self:GetCurrentSection()
    if oldsection ~= newsection then
        if self.sectionfn then
	        self.sectionfn(newsection, oldsection, self.inst)
		end
        self.inst:PushEvent("onwaterlevelsectionchanged", { newsection = newsection, oldsection = oldsection })
    end
end

function Waterlevel:DoDelta(amount, doer)
    local oldsection = self:GetCurrentSection()

    self.currentwater = math.max(0, math.min(self.maxwater, self.currentwater + amount))

    local newsection = self:GetCurrentSection()

    if oldsection ~= newsection then
        if self.sectionfn then
            self.sectionfn(newsection, oldsection, self.inst, doer)
        end
        self.inst:PushEvent("onwaterdsectionchanged", { newsection = newsection, oldsection = oldsection, doer = doer })
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
        self:StopConsuing()
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

return Waterlevel
