local Wx78_OverCharged = Class(function(self, inst)
	self.inst = inst

	self.overchargedtask = nil
	self.adjusttask = nil
	self.overcharged_timer = 0
end)

local function OnDone(inst, self)
	self:StopOverCharge()
end

local function Adjust(inst, self)
	self.adjusttask = nil
	local timer = self.overcharged_timer - GetTime() 
	inst:PushEvent("adjustovercharge",{timer = timer})
	self.adjusttask = self.inst:DoTaskInTime(1,Adjust,self)
end

function Wx78_OverCharged:IsTask()
	return self.overchargedtask
end

function Wx78_OverCharged:StartOverCharge(time)
	local timer = time or 1.5*TUNING.TOTAL_DAY_TIME

	if self.overcharged_timer > 0 then
		local old_timer = self.overcharged_timer - GetTime()
		timer = math.min(timer,old_timer)
	end

	self.overcharged_timer = timer + GetTime()

	self.inst:PushEvent("startovercharge",{timer = timer})
	self.overchargedtask = self.inst:DoTaskInTime(timer,OnDone,self)
end

function Wx78_OverCharged:DoAdjust()
	self.adjusttask = self.inst:DoTaskInTime(1,Adjust,self)
end

function Wx78_OverCharged:StopOverCharge()
	if self.overchargedtask then
		self.overchargedtask:Cancel()
	end
	if self.adjusttask then
		self.adjusttask:Cancel()
	end

	self.overchargedtask = nil
	self.adjusttask = nil

	self.overcharged_timer = 0
	self.inst:PushEvent("stopovercharge")
end

function Wx78_OverCharged:OnSave()
    local remainingtime = self.overcharged_timer ~= nil and self.overcharged_timer - GetTime() or 0
	return{
        remainingtime = remainingtime,
	}
end

function Wx78_OverCharged:OnLoad(data)
	local remainingtime = data and data.remainingtime and data.remainingtime or 0

	if remainingtime then
		self:StartOverCharge(remainingtime)
	end
end

function Wx78_OverCharged:LongUpdate(dt)
	if self:IsTask() then
		self.overchargedtask:Cancel()
		self.overchargedtask = nil

		if self.adjusttask then
			self.adjusttask:Cancel()
		end
		self.adjusttask = nil

		if self.overcharged_timer - dt > GetTime() then
			local timer = self.overcharged_timer - dt
			self.overchargedtask = self.inst:DoTaskInTime(timer - GetTime(),OnDone,self)
			self.adjusttask = self.inst:DoTaskInTime(1,Adjust,self)
		else
			self:StopOverCharge()
		end
	end
end

return Wx78_OverCharged