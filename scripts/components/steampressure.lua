local SteamPressure = Class(function(inst, self)
	self.inst = inst

	self.maxpressure = 100
	self.pressuresection = self.maxpressure
	self.curpressure = math.ceil(self.maxpressure/2)

	self.pressuresectionfn = nil
	self.depletedfn = nil
	self.chargingdonefn = nil

	self.delayed = TUNING.TOTAL_DAY_TIME*.5
	self.left_time = 0

	self.pressuretask = nil
	self.depletedtask = nil
	self.isdepleted = false

end,nil,nil)

local function waitpressure(inst, self)
    self.pressuretask = nil
    self:GetPressure()
end

local function waitfullpressure(inst, self)
	self.depletedtask = nil
	self.isdepleted = false
	if self.chargingdonefn then
		self.chargingdonefn(self.inst)
	end
end

function SteamPressure:SetDepletedFn(fn)
	self.depletedfn = fn
end

function SteamPressure:SetChargingDoneFn(fn)
	self.chargingdonefn = fn
end

function SteamPressure:SetPressureSectionFn(fn)
	self.pressuresectionfn = fn
end

function SteamPressure:GetPressure()
	local oldsection = self:GetPressureSection()
	self.curpressure = self.curpressure + 1

	if self.curpressure >= self.maxpressure then
		self.curpressure = self.maxpressure
	end
		
	local newsection = self:GetPressureSection()

	if oldsection ~= newsection then
	    if self.pressuresectionfn then
			self.pressuresectionfn(newsection, oldsection, self.inst)
		end
	end

	self.pressuretask = self.inst:DoTaskInTime(1,waitpressure,self)
end

function SteamPressure:LostPressure()

	local oldsection = self:GetPressureSection()
	self.curpressure = self.curpressure - 1
	local newsection = self:GetPressureSection()

    if oldsection ~= newsection then
        if self.pressuresectionfn then
	        self.pressuresectionfn(newsection, oldsection, self.inst)
		end
	end

 	if self.curpressure <= 0 then
 		self.isdepleted = true
 		if self.depletedtask then
 			self.depletedtask:Cancel()
 			self.depletedtask = nil
 		end
 		self.left_time = GetTime() + self.delayed
 		if self.depletedfn then
 			self.depletedfn(self.inst)
 		end
 		self.depletedtask = self.inst:DoTaskInTime(self.delayed, waitfullpressure, self)
 	end
end

function SteamPressure:IsEmptyPressure()
    return self.curpressure <= 0
end

function SteamPressure:IsSamePressure()
    return self.maxpressure == self.pressuresection
end

function SteamPressure:SetPressureSections(num)
    self.pressuresection = num
end

function SteamPressure:GetPressurePercent()
    return self.curpressure > 0 and math.max(0, math.min(1, self.curpressure / self.maxpressure)) or 0
end

function SteamPressure:GetPressureSection()
    return IsEmptyPressure() and 0 or IsSamePressure() and math.min( math.ceil(GetPressurePercent()*self.pressuresection), self.pressuresection) or math.min( math.ceil(GetPressurePercent()*self.pressuresection)+1, self.pressuresection)
end

function SteamPressure:OnSave()
	local remainingtime = self.left_time ~= nil and self.left_time - GetTime() or 0
	return {
		depleted = self.isdepleted,
		remainingtime = remainingtime > 0 and remainingtime or nil,
		pressure = self.curpressure,
	}
end

function SteamPressure:OnLoad(data)
	if data ~= nil then
		self.curpressure = data.pressure
		if self.curpressure >= self.maxpressure then
			self.curpressure = self.maxpressure
		end
		if data.depleted then
			self.depleted = true
			if self.depletedtask then
				self.depletedtask:Cancel()
				self.depletedtask = nil
			end
			self.left_time = GetTime() + data.remainingtime
	 		if self.depletedfn then
	 			self.depletedfn(self.inst)
	 		end
			self.depletedtask = self.inst:DoTaskInTime(data.remainingtime, waitfullpressure, self)
		end
		if self.pressuretask then
			self.pressuretask:Cancel()
			self.pressuretask = nil
		end
		self.pressuretask = self.inst:DoTaskInTime(1,waitpressure,self)
	end
end

return SteamPressure