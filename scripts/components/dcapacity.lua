local Dcapacity = Class(function(self,inst)
	self.inst = inst

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

	inst:ListenForEvent("ms_becameghost",self.Reset_capacity)
	end,
	nil,
	nil
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

function Dcapacity:Start_Intoxication()
	self.capacity = self.capacity + 1

	if self.intoxication_task ~= nil then
		self.intoxication_task:Cancel()
		self.intoxication_task = nil
	end

	self.left_timer = GetTime() + self.timer

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
        capacity = self.capacity,
        dremainingtime = remainingtime > 0 and remainingtime or nil,
	}
end

function Dcapacity:OnLoad(data)
	self.capacity = data.capacity

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