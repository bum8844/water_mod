
local DrinkValue = Class(function(self, inst)
    self.inst = inst
	self.levelvalue = 0
end,
nil,
{
})

function DrinkValue:SetVelue(num)
	self.levelvalue = num
end

return DrinkValue