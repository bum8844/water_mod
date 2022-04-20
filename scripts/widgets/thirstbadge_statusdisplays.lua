local ThirstBadge = require "widgets/thirstbadge"

local function OnSetPlayerMode(inst, self)
	self.watertask = nil

    if self.onthirstdelta == nil then
        self.onthirstdelta = function(owner, data) self:ThirstDelta(data) end
        self.inst:ListenForEvent("thirstdelta", self.onthirstdelta, self.owner)
        self:SetThirstPercent(self.owner.replica.thirst:GetPercent())
    end
end

local function OnSetGhostMode(inst, self)
	self.watertask = nil

    if self.onthirstdelta ~= nil then
        self.inst:RemoveEventCallback("thirstdelta", self.onthirstdelta, self.owner)
        self.onthirstdelta = nil
    end
end

local function thirstbadge_statusdisplays(self)
	self._SetGhostMode = self.SetGhostMode
	self._ShowStatusNumbers = self.ShowStatusNumbers
	self._HideStatusNumbers = self.HideStatusNumbers

	self.waterstomach = self:AddChild(self.owner.CreateThirstBadge ~= nil and self.owner.CreateThirstBadge(self.owner) or ThirstBadge(self.owner))
	self.waterstomach:SetPosition(-80, -40, 0)
	self.onthirstdelta = nil

	self.watertask = nil

	--force update
	self.inst:DoStaticTaskInTime(0, function(inst)
		if self.isghostmode then
			OnSetGhostMode(self.inst, self)
		else
			OnSetPlayerMode(self.inst, self)
		end
	end,
	self)

	function self:SetGhostMode(ghostmode)
	    self:_SetGhostMode(ghostmode)
	    if not self.isghostmode == not ghostmode then
	    	return
	  	elseif ghostmode then
	        self.waterstomach:Hide()

	        self.waterstomach:StopWarning()
	    else
	        self.waterstomach:Show()
	    end

	  	if self.watertask ~= nil then
	  		self.watertask:Cancel()
	  	end
	  	self.watertask = self.inst:DoStaticTaskInTime(0, ghostmode and OnSetGhostMode or OnSetPlayerMode)
	end

	function self:SetThirstPercent(pct)
		self.waterstomach:SetPercent(pct, self.owner.replica.thirst:Max())

	    if pct <= 0 then
	        self.waterstomach:StartWarning()
	    else
	        self.waterstomach:StopWarning()
	    end
	end
	
	function self:ThirstDelta(data)
	    self:SetThirstPercent(data.newpercent)
	    if self.waterstomach ~= nil and self.waterstomach.ThirstDelta then
	        self.waterstomach:ThirstDelta(data)
	    else
	        if not data.overtime then
	            if data.newpercent > data.oldpercent then
	                self.waterstomach:PulseGreen()
	                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/hunger_up")
	            elseif data.newpercent < data.oldpercent then
	                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/hunger_down")
	                self.waterstomach:PulseRed()
	            end
	        end
	    end
	end

	function self:ShowStatusNumbers()
		_ShowStatusNumbers(self)
		self.waterstomach.num:Show()
	end

	function self:HideStatusNumbers()
		_HideStatusNumbers(self)
		self.waterstomach.num:Hide()
	end

	self:SetGhostMode(self.isghostmode)
end

AddClassPostConstruct("widgets/statusdisplays", thirstbadge_statusdisplays)
