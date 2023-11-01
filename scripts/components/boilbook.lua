local BoilBook = Class(function(self, inst)
	self.inst = inst

	self.inst:AddTag("boilbook")

	--self.onreadfn = nil
end)

function BoilBook:OnRemoveFromEntity()
    self.inst:RemoveTag("boilbook")
end

function BoilBook:Read(doer)
	if not CanEntitySeeTarget(doer, self.inst) then
		return false
	end

	if self.onreadfn then
		self.onreadfn(self.inst, doer)
	end
end

return BoilBook