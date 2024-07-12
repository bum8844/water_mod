local function onsettooltype(self, settooltype)
	if settooltype then
		if self.old_settooltype then
			self.inst:RemoveTag(self.old_settooltype)
		end
		self.inst:AddTag(settooltype)
		self.old_settooltype = settooltype
		if self.fn then
			self.fn(self.inst, settooltype)
		end
	end
end

local MachineTool = Class(function(self, inst)
	self.inst = inst
	self.fn = nil

	self.settooltype = nil
	self.old_settooltype = nil
end,
nil,
{
	settooltype = onsettooltype,
})

function MachineTool:SetToolType(name)
	self.settooltype = name
	return true
end

function MachineTool:OnSave()
	return { 
		settooltype = self.settooltype,
		old_settooltype = self.old_settooltype,
	}
end

function MachineTool:OnLoad(data)
	if data then
		self.old_settooltype = data.old_settooltype
		self.settooltype = data.settooltype
	end
end

return MachineTool