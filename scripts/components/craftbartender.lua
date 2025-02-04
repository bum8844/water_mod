local CraftBartender = Class(function(self, inst)
    self.inst = inst
    self.shaker = nil
end,nil,nil)

function CraftBartender:SetShaker(item)
    self.shaker = item
end

function CraftBartender:StartShaking()
    if self.shaker and
       self.shaker.components.container ~= nil and
       self.shaker.components.container:IsFull() then
        local sg = self.inst:HasTag("expertchef") and "fest_shaker_shaking_pre" or "shaker_shaking_pre"
        self.shaker.components.cocktailmaker:DoShaking(true)
        self.shaker.components.container:Close()
        self.shaker.components.container.canbeopened = false
        self.inst.sg:GoToState(sg)
        return true
    end
end

function CraftBartender:CancelShaking()
    self.shaker.components.cocktailmaker:DoShaking(false)
    self.shaker.components.container.canbeopened = true
end

return CraftBartender