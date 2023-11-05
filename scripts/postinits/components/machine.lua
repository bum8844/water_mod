AddComponentPostInit("machine", function(self)
	local _CanInteract = self.CanInteract
	
	function self:CanInteract(...)
		if self.waterpumpfn then
			print("1번 작동")
			return self.waterpumpfn(...)
		else
			print("2번 작동")
			return _CanInteract(...)
		end
	end
end)
