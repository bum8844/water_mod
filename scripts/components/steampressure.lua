local function isdepleted (self, depleted)
	if depleted then
		self.inst:AddTag("recharg_pressure")
	else
		self.inst:RemoveTag("recharg_pressure")
	end
end

local function isfullpressure (self, isfullpressure)
	if isfullpressure then
		self.inst:AddTag("fullpressure")
	else
		self.inst:RemoveTag("fullpressure")
	end
end

local SteamPressure = Class(function(self, inst)
    self.inst = inst

	self.maxpressure = 1
	self.pressuresection = 1
	self.curpressure = 1

	self.pressuresectionfn = nil
	self.depletedfn = nil
	self.chargingdonefn = nil
	self.ontakewaterfn = nil

	self.delayed = TUNING.TOTAL_DAY_TIME*.5 -- 240
	self.left_time = nil
	self.delay_left_time = nil

	self.pressuretask = nil
	self.depletedtask = nil
	self.depleted = false
	self.fullpressure = false

end,nil,{
	depleted = isdepleted,
	fullpressure = isfullpressure,
})

local function waitpressure(inst, self)
    self.pressuretask = nil
    self:GetPressure()
end

local function waitfullpressure(inst, self)
	self.depletedtask = nil
	self.depleted = false
	self.fullpressure = true
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

function SteamPressure:SetTakeWaterFn(fn)
	self.ontakewaterfn = fn
end

function SteamPressure:SetPressure(num)
	self.maxpressure = num
	self.curpressure = math.ceil(num*.5)
end

function SteamPressure:GetPressure()
	local time = self:IsDepleted() and self.delayed*.01 or (self.delayed*.25)*.01
	self.delay_left_time = time + GetTime()

	local oldsection = self:GetPressureSection()
	self.curpressure = self.curpressure + 1

	print("증기 얻음 :"..self.curpressure)

	if self.curpressure >= self.maxpressure then
		self.curpressure = self.maxpressure
		self.fullpressure = true
		if self.chargingdonefn then
			self.chargingdonefn(self.inst)
		end
		return true
	end
		
	local newsection = self:GetPressureSection()

	if oldsection ~= newsection then
	    if self.pressuresectionfn then
			self.pressuresectionfn(newsection, oldsection, self.inst)
		end
	end
	if self.pressuretask then
		self.pressuretask:Cancel()
		self.pressuretask = nil
	end
	self.pressuretask = self.inst:DoTaskInTime(time,waitpressure,self)
end

function SteamPressure:StopGetPressure()
	if self.pressuretask then
		self.pressuretask:Cancel()
		self.pressuretask = nil
	end
end

function SteamPressure:LostPressure()
	local oldsection = self:GetPressureSection()
	self.curpressure = self.curpressure - 1

	self.fullpressure = false

	local newsection = self:GetPressureSection()

	print("증기 빠짐 :"..self.curpressure)

    if oldsection ~= newsection then
        if self.pressuresectionfn then
	        self.pressuresectionfn(newsection, oldsection, self.inst)
		end
	end

 	if self.curpressure <= 0 then
 		self.depleted = true
 		if self.depletedtask then
 			self.depletedtask:Cancel()
 			self.depletedtask = nil
 		end
 		self.left_time = self.delayed + GetTime()
 		if self.depletedfn then
 			self.depletedfn(self.inst)
 		end
 		self.depletedtask = self.inst:DoTaskInTime(self.delayed, waitfullpressure, self)
 	else
 		if self.ontakewaterfn then
 			self.ontakewaterfn(self.inst)
 		end
 	end
end

function SteamPressure:IsDepleted()
	return self.depleted
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

function SteamPressure:IsLowPressure()
	return self.curpressure / self.maxpressure <= .3
end

function SteamPressure:IsHighPressure()
	return self.curpressure / self.maxpressure >= .7
end

function SteamPressure:GetPressurePercent()
    return self.maxpressure > 0 and math.max(0, math.min(1, self.curpressure / self.maxpressure)) or 0
end

function SteamPressure:GetPressureSection()
    return self:IsEmptyPressure() and 0 or self:IsSamePressure() and math.min( math.ceil(self:GetPressurePercent()*self.pressuresection), self.pressuresection) or math.min( math.ceil(self:GetPressurePercent()*self.pressuresection)+1, self.pressuresection)
end

function SteamPressure:OnSave()
	local remainingtime = self.left_time ~= nil and self.left_time - GetTime() or 0
	local remainingdelaytime = self.delay_left_time ~= nil and self.delay_left_time - GetTime() or 0
	return{
		depleted = self.depleted,
		remainingtime = remainingtime > 0 and remainingtime or nil,
		remainingdelaytime = remainingdelaytime > 0 and remainingdelaytime or nil,
		pressure = self.curpressure,
	}
end

function SteamPressure:OnLoad(data)
	if data ~= nil then
		self.curpressure = data.pressure
		if self.curpressure >= self.maxpressure then
			self.curpressure = self.maxpressure
			self.fullpressure = true
			if self.chargingdonefn then
				self.chargingdonefn(self.inst)
			end
			return true
		end
		if data.depleted then
			self.depleted = true
			if self.depletedtask then
				self.depletedtask:Cancel()
				self.depletedtask = nil
			end
			self.left_time = data.remainingtime + GetTime()
	 		if self.depletedfn then
	 			self.depletedfn(self.inst)
	 		end
			self.depletedtask = self.inst:DoTaskInTime(data.remainingtime, waitfullpressure, self)
		end
		local time = data.depleted and self.delayed*.01 or (self.delayed*.25)*.01
		if data.remainingdelaytime then
			time = data.remainingdelaytime
		end
		self.delay_left_time = time + GetTime()
		if self.pressuretask then
			self.pressuretask:Cancel()
			self.pressuretask = nil
		end
		self.pressuretask = self.inst:DoTaskInTime(time, waitpressure, self)
	end
end


function SteamPressure:LongUpdate(dt)
	if self.pressuretask then
		self.pressuretask:Cancel()
	        if self.delay_left_time - dt > GetTime() then
	            self.delay_left_time = self.delay_left_time - dt
	            self.pressuretask = self.inst:DoTaskInTime(self.delay_left_time - GetTime(), waitpressure, self)
	        else
	            waitpressure(self.inst, self)
	        end
		end
		if self.depletedtask then
			self.depletedtask:Cancel()
			if self.left_time - dt > GetTime() then
				self.left_time = self.left_time - dt
				self.depletedtask = self.inst:DoTaskInTime(self.left_time - GetTime(), waitfullpressure, self)
			else
			waitfullpressure(self.inst, self)
		end
	end
	dt = 0
end

return SteamPressure