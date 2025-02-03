local function isopen(self, isopen)
	if isopen then
		self.inst:RemoveTag("trawler_lowered")
	else
		self.inst:AddTag("trawler_lowered")
	end
end

local DramaticContainer = Class(function(self, inst)
    self.inst = inst

	self.dramaticopenfn = nil
	self.dramaticclosefn = nil
	self.isopen = false

	end,
	nil,
	{isopen=isopen}
)

function DramaticContainer:DramaticOpen()
	if self.dramaticopenfn then
		self.dramaticopenfn(self.inst)
	else
		self.isopen = true
		if self.inst.components.container then
	       	self.inst.components.container.canbeopened = true
	    end
	end
end

function DramaticContainer:DramaticClose()
	if self.dramaticclosefn then
		self.dramaticclosefn(self.inst)
	else
		self.isopen = false
		if self.inst.components.container then
	       	self.inst.components.container.canbeopened = false
	       	self.inst.components.container:Close()
	    end
	end
end

function DramaticContainer:OnSave()
	return { isopen = self.isopen }
end

function DramaticContainer:OnLoad(data)
	if data and data.isopen then
		self:DramaticOpen()
	end
end

return DramaticContainer