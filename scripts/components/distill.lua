local function oncheckready(self, isfull)
    if isfull then
        self.inst:AddTag("readydistill")
    else
        self.inst:RemoveTag("readydistill")
    end
end

local function onopencheckready(self, data)
    self.inst.replica.distill:SetIsFull(data)
end

local Distill = Class(function(self, inst)
    self.inst = inst
    self.require_stack = 4
    self.isfull = false
    self.isfull_open = false

    inst:ListenForEvent("itemget",function() self:CheckReady() end)
    inst:ListenForEvent("onclose",function() self:CheckReady() end)

    inst:ListenForEvent("itemlose",function() self:CheckReady() end)
    inst:ListenForEvent("onopen",function() self:CheckReady() end)

    inst:ListenForEvent("stacksizechange",function() self:CheckReady() end)
end,
nil,
{
    isfull = oncheckready,
    isfull_open = onopencheckready,
})

function Distill:SetRequireStack(num)
    self.require_stack = num
end

function Distill:CheckReady()
    local container = self.inst.components.container
    if container then
        local item = container.slots[1]
        if item then
            local current_stack = item and item.components.stackable and item.components.stackable:StackSize() or 0
            if not container:IsOpen() and current_stack >= self.require_stack then
                self.isfull = true
                self.isfull_open = false
            elseif current_stack >= self.require_stack then
                self.isfull = false
                self.isfull_open = true
            else
                self.isfull = false
                self.isfull_open = false 
            end
        else
            self.isfull = false
            self.isfull_open = false 
        end
    end
end

return Distill