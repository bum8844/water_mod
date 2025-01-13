--MEMO:
--put water -> timer is done -> the water is purified

local function ondone(self, done)
    if done then
        self.inst:RemoveTag("boiling")
    else
        self.inst:AddTag("boiling")
    end
end

local Distiller = Class(function(self,inst)
	self.inst = inst

	self.done = false
	self.task = nil
	self.boiling_timer = nil
	end,
	nil,
	{done = ondone}
)

local function control(inst, self)
	if self.inst.components.waterlevel ~= nil then
		if not self.inst.components.waterlevel:IsFull() and not self.inst.components.waterlevel.isputoncetime then
			self.inst.components.waterlevel.accepting = true
		end
	end
	if self.inst.components.container ~= nil then
		self.inst.components.container.canbeopened = true
	end
	if self.inst.components.water ~= nil then
		self.inst.components.water.available = true
	end
	if self.inst.components.watersource ~= nil then
		self.inst.components.watersource.available = true
	end

	if self.ondoneboiling ~= nil then
		self.ondoneboiling(inst)
	end
end

local function doboil(inst, self)
	self.task = nil
	self.boiling_timer = nil
	local waterlevel = self.inst.components.waterlevel

	if waterlevel ~= nil then
		local watertype = waterlevel.watertype
		self.inst.components.waterlevel.watertype = watertype == WATERTYPE.UNCLEAN_MINERAL and WATERTYPE.MINERAL or WATERTYPE.CLEAN
	end

	if self.inst.components.brewing == nil then
		control(inst, self)
	else
		if self.inst.components.brewing.product == nil then
			control(inst, self)
		end
	end

	self.done = true
end

local function setboiling_time(inst, self, watertimer)
	local timer = 1
	timer = TUNING.BASE_COOK_TIME * TUNING.KETTLE_WATER * watertimer
	self.boiling_timer = GetTime() + timer
	if self.onstartboiling ~= nil then
		self.onstartboiling(self.inst)
	end
	return timer
end

function Distiller:isDone()
	return self.done
end

function Distiller:GetTimeToBoil()
    return not self.done and self.boiling_timer ~= nil and self.boiling_timer - GetTime() or 0
end

function Distiller:isBoiling()
	return not self.done and self.boiling_timer ~= nil
end

function Distiller:startBoiling(watertimer, campkettle)

	local timer = 1

    if self.inst.components.container ~= nil then
    	self.inst.components.container:Close()
    	self.inst.components.container:DropEverything()
    	self.inst.components.container.canbeopened = false
    end
    if self.inst.components.water ~= nil then
    	self.inst.components.water.available = false
    end
	if self.inst.components.watersource ~= nil then
		self.inst.components.watersource.available = false
	end
	if self.inst.components.pickable ~= nil then
		self.inst.components.pickable.canbepicked = false
	end
	if self.inst.components.waterlevel ~= nil then
		self.inst.components.waterlevel.accepting = false
	end

	if self.task ~= nil then
		self.task:Cancel()
	end

	if campkettle then
		if self.firetime ~= nil and self.firetime > 0 then
			timer = self.firetime
			self.firetime = nil
			self.boiling_timer = GetTime() + timer
			if self.oncontinueboiling ~= nil then
				self.oncontinueboiling(self.inst)
			end
		elseif self.inst._fire.components.fueled:GetCurrentSection() > 0 then
			timer = setboiling_time(self.inst, self, watertimer)
		else
			timer = setboiling_time(self.inst, self, watertimer)
			self.firetime = timer
			self.boiling_timer = nil
			return
		end
	else
		timer = setboiling_time(self.inst, self, watertimer)
	end

    self.task = self.inst:DoTaskInTime(timer,doboil,self)
end

function Distiller:stopBoiling(dt, campkettle)
	if self.onstopboiling then
		self.onstopboiling(self.inst)
	end
	if dt > 0 then
		self.boiling_timer = (self.boiling_timer - dt) - GetTime()
		dt = 0
	elseif campkettle and self.boiling_timer then
		self.firetime = self.boiling_timer - GetTime()
		self.boiling_timer = nil
	else
		self.boiling_timer = nil
	end

    if self.task ~= nil then
        self.task:Cancel()
        self.task = nil
    end
end

function Distiller:OnSave()
    local remainingtime = self.boiling_timer ~= nil and self.boiling_timer - GetTime() or self.firetime or 0
	return{
        boilingdone = self.done,
        boilingtime = remainingtime > 0 and remainingtime or nil,
	}
end

local function cont(inst, self)
	if self.inst.components.container ~= nil then
		self.inst.components.container.canbeopened = false
	end
	if self.inst.components.water ~= nil then
		self.inst.components.water.available = false
	end
	if self.inst.components.watersource ~= nil then
		self.inst.components.watersource.available = false
	end
	if self.inst.components.waterlevel ~= nil then
		self.inst.components.waterlevel.accepting = false
	end
end

local function loadpass(inst, data, self)
	self.task = self.inst:DoTaskInTime(data.boilingtime,doboil,self)
	if self.oncontinueboiling ~= nil then
		self.oncontinueboiling(self.inst)
	end
	self.inst:DoTaskInTime(0,cont,self)
end

function Distiller:OnLoad(data)
    if self.task ~= nil then
        self.task:Cancel()
        self.task = nil
    end
    if data.boilingtime ~= nil then
    	self.done = data.boilingdone or false
    	self.boiling_timer = nil
        
		self.boiling_timer = GetTime() + math.max(0, data.boilingtime)
		if self.done then
			self.task = self.inst:DoTaskInTime(0,doboil,self)
		elseif self.inst._fire ~= nil then
			if self.inst._fire.components.fueled:GetCurrentSection() > 0 then
				loadpass(self.inst, data, self)
			else
				self:stopBoiling(0, true)
			end
		else
    		loadpass(self.inst, data, self)
		end
	else
		self.task = self.inst:DoTaskInTime(0,doboil,self)
	end
end

function Distiller:LongUpdate(dt)
    if self:isBoiling() then
        if self.task ~= nil then
            self.task:Cancel()
        end
        if self.inst._fire ~= nil and self.inst._fire.components.fueled:GetCurrentSection() > 0 then
        	self:stopBoiling(dt)
        elseif self.boiling_timer - dt > GetTime() then
            self.boiling_timer = self.boiling_timer - dt
            self.task = self.inst:DoTaskInTime(self.boiling_timer - GetTime(), doboil, self)
        else
            doboil(self.inst, self)
        end
    end
    dt = 0
end

return Distiller