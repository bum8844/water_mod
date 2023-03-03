--MEMO:
--put water -> timer is done -> the water is purified

local function ondone(self, done)
    if done then
        self.inst:AddTag("boiling")
    else
        self.inst:RemoveTag("boiling")
    end
end

local Distiller = Class(function(self,inst)
	self.inst = inst

	self.done = false
	self.task = nil
	self.boiling_timer = nil
	end,
	nil,
	{done = ondone,}
)

local function doboil(inst, self)
	self.task = nil
	self.boiling_timer = nil

	if self.inst.components.container ~= nil then
		self.inst.components.container.canbeopened = true
	end
	if self.inst.components.water ~= nil then
		self.inst.components.water.available = true
	end
	if self.inst.components.watersource ~= nil then
		self.inst.components.watersource.available = true
	end
	if self.inst.components.waterlevel ~= nil then
		self.inst.components.waterlevel.accepting = true
		self.inst.components.waterlevel.watertype = WATERTYPE.CLEAN
	end

	if self.ondoneboiling ~= nil then
		self.ondoneboiling(inst)
	end

	self.done = true
end

function Distiller:isDone()
	return self.done
end

function Distiller:isBoiling()
	return self.done and self.boiling_timer ~= nil
end

local function startboil(inst, self)
	if self.task ~= nil then
   		self.task:Cancel()
	end
	if self.onstartboiling ~= nil then
		self.onstartboiling(inst)
	end
    self.task = self.inst:DoTaskInTime(self.boiling_timer,doboil,self)
end

function Distiller:startBoiling(watertimer)
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
	self.inst.components.waterlevel.accepting = false

	local timer = TUNING.BASE_COOK_TIME * TUNING.KETTLE_WATER * watertimer
	if self.firetime ~= nil then
		timer = math.max(0, self.firetime)
	end
	self.boiling_timer = GetTime() + timer

	if not self.inst._fire ~= nil then
		startboil(self.inst, self)
    else
    	if self.inst._fire.components.fueled:GetCurrentSection() > 0 then
			startboil(self.inst, self)
    	else
    		self:stopBoiling(0)
    	end
    end
end

function Distiller:stopBoiling(dt)
	if self.onstopboiling then
		self.onstopboiling(self.inst)
	end
	if dt ~= 0 then
		self.firetime = (self.boiling_timer - dt) - GetTime()
		dt = 0
	else
		self.firetime = self.boiling_timer ~= nil and self.boiling_timer - GetTime() or 0
	end
	self.boiling_timer = nil

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

local function loadpass(inst, data, self)
	self.task = self.inst:DoTaskInTime(data.boilingtime,doboil,self)
	if self.onstartboiling ~= nil then
		self.onstartboiling(self.inst)
	end
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

function Distiller:OnLoad(data)
    if data.waterlevel ~= 0 then
    	self.done = data.boilingdone or false
    	self.boiling_timer = nil
        if self.task ~= nil then
            self.task:Cancel()
            self.task = nil
        end
        if data.boilingtime ~= nil then
			self.boiling_timer = GetTime() + math.max(0, data.boilingtime)
			if self.done then
				doboil(self)
			elseif self.inst._fire ~= nil then
				if self.inst._fire.components.fueled:GetCurrentSection() > 0 then
					loadpass(self.inst, data, self)
				else
					self:stopBoiling(0)
				end
			else
    			loadpass(self.inst, data, self)
			end
		end
	end
end

local function updating(inst, dt, self)
    self.boiling_timer = self.boiling_timer - dt
    self.task = self.inst:DoTaskInTime(self.boiling_timer - GetTime(),doboil,self)
    dt = 0
end

function Distiller:LongUpdate(dt)
    if self:isBoiling() then
        if self.task ~= nil then
            self.task:Cancel()
        end
        if self.boiling_timer - dt > GetTime() then
        	if self.inst._fire ~= nil then
    			if self.inst._fire.components.fueled:GetCurrentSection() > 0 then
    				updating(self.inst, dt, self)
    			else
    				self:stopBoiling(dt)
    			end
        	else
            	updating(self.inst, dt, self)
        	end
        else
            dt = dt - self.boiling_timer + GetTime()
            doboil(self.inst, self)
        end
    end
end

return Distiller