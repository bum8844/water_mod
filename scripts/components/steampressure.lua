local SteamPressure = Class(function(inst, self)
	self.inst = inst

	self.maxpressure = 100
	self.curpressure = math.ceil(self.maxpressure/2)

	self.delayed = TUNING.TOTAL_DAY_TIME*.5

	self.pressuretask = nil
	self.isdepleted = false

end,nil,nil)

function SteamPressure:LostPressure()
 	self.curpressure = self.curpressure - 1
end 

function SteamPressure:OnLoad(data)
	if data ~= nil then
	end
end

return SteamPressure