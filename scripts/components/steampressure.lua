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
	if self.meterfn then
    	self.meterfn(self.inst)
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
	self.meterfn = nil

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

function SteamPressure:IsDepleted()
	return self.depleted
end

function SteamPressure:IsEmptyPressure()
    return self.curpressure <= 0
end

function SteamPressure:SetPressureSections(num)
    self.pressuresection = num
end

function SteamPressure:IsSame()
    return self.maxpressure == self.pressuresection
end

function SteamPressure:GetSection()
    return self:IsSame() and math.floor(self:GetPressurePercent()* self.pressuresection) or math.floor(self:GetPressurePercent()* self.pressuresection)+1
end

function SteamPressure:GetPressureSection()
    return self:IsEmptyPressure() and 0 or math.min(self:GetSection(), self.pressuresection)
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

function SteamPressure:GetPressure()
    local time = self:IsDepleted() and self.delayed * 0.01 or (self.delayed * 0.25) * 0.01
    self.delay_left_time = time + GetTime()

    local oldsection = self:GetPressureSection()
    self.curpressure = self.curpressure + 1

    if self.meterfn then
    	self.meterfn(self.inst)
    end

    if self.curpressure >= self.maxpressure then
        self.curpressure = self.maxpressure
        self.fullpressure = true
        if self.chargingdonefn then
            self.chargingdonefn(self.inst)
        end
        return true
    end

    local newsection = self:GetPressureSection()

    if oldsection ~= newsection and self.pressuresectionfn then
        self.pressuresectionfn(newsection, oldsection, self.inst)
    end

    if self.pressuretask then
        self.pressuretask:Cancel()
    end

    self.pressuretask = self.inst:DoTaskInTime(time, waitpressure, self)
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

    if self.meterfn then
    	self.meterfn(self.inst)
    end

    local newsection = self:GetPressureSection()

    if oldsection ~= newsection and self.pressuresectionfn then
        self.pressuresectionfn(newsection, oldsection, self.inst)
    end

    if self.curpressure <= 0 then
        self.depleted = true

        if self.depletedtask then
            self.depletedtask:Cancel()
            self.depletedtask = nil
        end

        self.depletedtask = self.inst:DoTaskInTime(self.delayed, waitfullpressure, self)

        if self.depletedfn then
            self.depletedfn(self.inst)
        end
    else
        if self.ontakewaterfn then
            self.ontakewaterfn(self.inst)
        end
    end
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
    	local oldsection = self:GetPressureSection(self)
        self.curpressure = data.pressure

        if self.curpressure >= self.maxpressure then
            self.curpressure = self.maxpressure
            self.fullpressure = true

            local newsection = self:GetPressureSection(self)

            if self.chargingdonefn then
                self.chargingdonefn(self.inst)
            end

		    if oldsection ~= newsection and self.pressuresectionfn then
		        self.pressuresectionfn(newsection, oldsection, self.inst)
		    end

            return true
        end

        if data.depleted then
            self.depleted = true

            if self.depletedtask then
                self.depletedtask:Cancel()
                self.depletedtask = nil
            end

            self.depletedtask = self.inst:DoTaskInTime(data.remainingtime, waitfullpressure, self)

            if self.depletedfn then
                self.depletedfn(self.inst)
            end
        end

        local time = data.depleted and self.delayed * 0.01 or (self.delayed * 0.25) * 0.01

        if data.remainingdelaytime then
            time = data.remainingdelaytime
        end

        self.delay_left_time = time + GetTime()

        if self.pressuretask then
            self.pressuretask:Cancel()
        end

        self.pressuretask = self.inst:DoTaskInTime(time, waitpressure, self)

        local newsection = self:GetPressureSection(self)
		if oldsection ~= newsection and self.pressuresectionfn then
		    self.pressuresectionfn(newsection, oldsection, self.inst)
		end

        if self.meterfn then
        	self.meterfn(self.inst)
        end
    end
end

function SteamPressure:LongUpdate(dt)
	if self.pressuretask then
		local oldsection = self:GetPressureSection()
		self.pressuretask:Cancel()
		self.pressuretask = nil
		self.curpressure = self.maxpressure
		if self.depletedtask then
			self.depletedtask:Cancel()
			self.depletedtask = nil
			self.depleted = false
			self.fullpressure = true
			if self.chargingdonefn then
				self.chargingdonefn(self.inst)
			end
		end
		local newsection = self:GetPressureSection()
		if self.meterfn then
    		self.meterfn(self.inst)
    	end
		if oldsection ~= newsection and self.pressuresectionfn then
		    self.pressuresectionfn(newsection, oldsection, self.inst)
		end
	end
	dt = 0
end

return SteamPressure