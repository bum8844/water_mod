local function onsettooltype(self, settooltype)
	if settooltype then
		self.inst:AddTag(settooltype)
	end
end

local MachineTool = Class(function(self, inst)
	self.inst = inst

	self.settooltype = nil
end,
nil,{
	settooltype = onsettooltype,
})

function MachineTool:SetToolType(name)
	self.settooltype = name
end

return MachineTool