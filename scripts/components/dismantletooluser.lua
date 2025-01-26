local function docandismantle(self, set)
	self.inst.replica.dismantletooluser:SetCanDismantle(set)
end

DismantleToolUser = Class(function(self, inst)
    self.inst = inst
    self.candismantle = nil
end,nil,
{
	candismantle = docandismantle,
})

function DismantleToolUser:SetCandismantle(bool)
    self.docandismantle = bool
end

return DismantleToolUser