local function onactive(self, onactive)
	if onactive then
		self.inst:AddTag("drunk_immunity")
	else
		self.inst:RemoveTag("drunk_immunity")
	end
end

local Dcapacity = Class(function(self,inst)
	self.inst = inst

	self.nonedrunk = nil
	self.max_capacity = TUNING.MAX_CPACITY or 5
	self.capacity = 0
	self.capacity_half = math.ceil(self.max_capacity*.5)
	self.capacity_critical = math.ceil(self.max_capacity*.8)
	self.intoxication_task = nil
	self.timer = TUNING.CAPACITY_TIME or TUNING.TOTAL_DAY_TIME*.5
	self.left_timer = nil

	self.Reset_capacity = function()
		if self.intoxication_task ~= nil then
			self.intoxication_task:Cancel()
		end

		self.intoxication_task = nil
		self.left_timer = nil
		self.capacity = 0
	end

	self.SetCapacity_max = function()
		local max = self.max_capacity 
		if self.inst:HasTag("mightiness_wimpy") then
			max = max/2
		else
			max = TUNING.MAX_CPACITY or 5
		end
		self.max_capacity = max
	end

	inst:ListenForEvent("ms_becameghost",self.Reset_capacity)
	inst:ListenForEvent("mightiness_statechange",self.SetCapacity_max)
	end,
	nil,
	{
    	nonedrunk = onactive,
	}
)

local function Done_Intoxication(inst, self)
	self.intoxication_task = nil
	self.left_timer = nil
	self.capacity = 0
end

function Dcapacity:IsDrunk()
	return self.capacity > self.max_capacity
end

function Dcapacity:IsHalf()
	return self.capacity_half <= self.capacity
end

function Dcapacity:IsCritical()
	return self.capacity_critical <= self.capacity
end

function Dcapacity:IsIntoxication()
	return self.left_timer ~= nil
end

function Dcapacity:GetCapacity()
	return self.capacity
end

function Dcapacity:Start_Intoxication(num)
	local mult_time = 1

	self.capacity = self.capacity + num

	if self.intoxication_task ~= nil then
		self.intoxication_task:Cancel()
		self.intoxication_task = nil
	end

	if self.inst.components.skilltreeupdater then
		local skilltreeupdater = self.inst.components.skilltreeupdater
		local mightiness = self.inst.components.mightiness 
		if mightiness and skilltreeupdater:IsActivated("wolfgang_overbuff_5") and mightiness:GetCurrent() > mightiness:GetMax() then
			mult_time = 0.25
		elseif skilltreeupdater:IsActivated("wathgrithr_combat_defense") then
			mult_time = 0.5
		end
	elseif self.nonedrunk then
		if inst._activate_nonedrunk_module then
			mult_time = 0.125
		else
			mult_time = 0.6
		end
	end

	self.left_timer = GetTime() + (self.timer * mult_time)

	self.intoxication_task = self.inst:DoTaskInTime(self.timer,Done_Intoxication,self)
end

function Dcapacity:Remove_Capacity(num)
	local detox = num or 1
	self.capacity = self.capacity - num
end

function Dcapacity:Remove_Intoxication()
	if self.intoxication_task ~= nil then
		self.intoxication_task:Cancel()
		self.intoxication_task = nil
	end
	self.intoxication_task = self.inst:DoTaskInTime(0,Done_Intoxication,self)
end

function Dcapacity:OnSave()
	local remainingtime = self.left_timer ~= nil and self.left_timer - GetTime() or 0
	return{
		nonedrunk = self.nonedrunk,
		max_capacity = self.max_capacity,
        capacity = self.capacity,
        dremainingtime = remainingtime > 0 and remainingtime or nil,
	}
end

function Dcapacity:OnLoad(data)
	self.capacity = data.capacity

	if data.max_capacity then
		self.max_capacity = data.max_capacity
	end

	if data.nonedrunk then
		self.nonedrunk = data.nonedrunk
	end

    if self.intoxication_task ~= nil then
        self.intoxication_task:Cancel()
        self.intoxication_task = nil
    end
    if data.dremainingtime ~= nil then
    	self.left_timer = nil
		self.left_timer = GetTime() + math.max(0, data.dremainingtime)
		self.intoxication_task = self.inst:DoTaskInTime(data.dremainingtime,Done_Intoxication,self)
	else
		self.intoxication_task = self.inst:DoTaskInTime(0,Done_Intoxication,self)
	end
end

function Dcapacity:LongUpdate(dt)
    if self:IsIntoxication() then
        if self.intoxication_task ~= nil then
            self.intoxication_task:Cancel()
        end
		if self.left_timer - dt > GetTime() then
            self.left_timer = self.left_timer - dt
            self.intoxication_task = self.inst:DoTaskInTime(self.left_timer - GetTime(), Done_Intoxication, self)
        else
            Done_Intoxication(self.inst, self)
        end
    end
    dt = 0
end

return Dcapacity