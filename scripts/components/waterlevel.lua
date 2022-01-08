--Sewing should be redone without using the waterlevel component... it's kind of weird.

local SourceModifierList = require("util/sourcemodifierlist")

local function onwatertype(self, watertype, old_watertype)
    if old_watertype ~= nil and old_watertype ~= self.secondarywatertype then
        self.inst:RemoveTag(old_watertype == WATERTYPE.USAGE and "needssewing" or (old_watertype.."waterlevel"))
    end
    if watertype == self.secondarywatertype then
        return
    elseif watertype == WATERTYPE.USAGE then
        if self.currentwater < self.maxwater and not self.no_sewing then
            self.inst:AddTag("needssewing")
        end
    elseif watertype ~= nil and self.accepting then
        self.inst:AddTag(watertype.."_waterlevel")
    end
end

local function onsecondarywatertype(self, watertype, old_watertype)
    if old_watertype ~= nil and old_watertype ~= self.watertype then
        self.inst:RemoveTag(old_watertype == WATERTYPE.USAGE and "needssewing" or (old_watertype.."_waterlevel"))
    end
    if watertype == self.watertype then
        return
    elseif watertype == WATERTYPE.USAGE then
        if self.currentwater < self.maxwater and not self.no_sewing then
            self.inst:AddTag("needssewing")
        end
    elseif watertype ~= nil and self.accepting then
        self.inst:AddTag(watertype.."_waterlevel")
    end
end

local function onno_sewing(self, no_sewing)
    if (self.watertype == WATERTYPE.USAGE or self.secondarywatertype == WATERTYPE.USAGE) and self.currentwater < self.maxwater then
        if no_sewing then
            self.inst:RemoveTag("needssewing")
        else
            self.inst:AddTag("needssewing")
        end
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

local function onmaxwater(self, maxwater)
    if (self.watertype == WATERTYPE.USAGE or self.secondarywatertype == WATERTYPE.USAGE) and not self.no_sewing then
        if self.currentwater < maxwater then
            self.inst:AddTag("needssewing")
        else
            self.inst:RemoveTag("needssewing")
        end
    end
end

local function oncurrentwater(self, currentwater)
    if currentwater <= 0 then
        self.inst:AddTag("waterdepleted")
    else
        self.inst:RemoveTag("waterdepleted")
    end
    onmaxwater(self, self.maxwater)
end

local Waterlevel = Class(function(self, inst)
    self.inst = inst
    self.consuming = false

    self.maxwater = 0
    self.currentwater = 0
    self.rate = 1
	self.rate_modifiers = SourceModifierList(self.inst)

    self.no_sewing = nil --V2C: HACK COLON RIGHT PARANTHESIS, I mean, what choice do I have if I don't want to break mods -_ -
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
    no_sewing = onno_sewing,
    maxwater = onmaxwater,
    currentwater = oncurrentwater,
})

function Waterlevel:SetWaterValue(name)
	self.watertype = name
end

function Waterlevel:OnRemoveFromEntity()
    self:StopConsuming()
    if self.watertype ~= nil then
        self.inst:RemoveTag(self.watertype == WATERTYPE.USAGE and "needssewing" or (self.watertype.."_waterlevel"))
    end
    if self.secondarywatertype ~= nil and self.secondarywatertype ~= self.watertype then
        self.inst:RemoveTag(self.secondarywatertype == WATERTYPE.USAGE and "needssewing" or (self.secondarywatertype.."_waterlevel"))
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
    return self.accepting and item and item.components.drinkvalue and (item.components.drinkvalue.watertype == self.watertype or item.components.drinkvalue.watertype == self.secondarywatertype)
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
            self.ontakewaterfn(self.inst, watervalue, item, doer)
        end
        self.inst:PushEvent("takewater", { watervalue = watervalue }, { item = item }, { doer = doer })
		
		local watervalue = 0
        if item.components.drinkvalue ~= nil then
            watervalue = item.components.drinkvalue.watervalue
            item.components.drinkvalue:Taken(self.inst)
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

return Waterlevel
