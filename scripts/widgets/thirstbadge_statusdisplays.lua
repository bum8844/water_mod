local function thirstbadge_statusdisplays(self)

	_SetGhostMode = self.SetGhostMode
	_ShowStatusNumbers = self.ShowStatusNumbers
	_HideStatusNumbers = self.HideStatusNumbers
	_AddWereness = self.AddWereness
	_SetWereMode = self.SetWereMode

	local ThirstBadge = require "widgets/thirstbadge"
	
    self.waterstomach = self:AddChild(self.owner.CreateThirstBadge ~= nil and self.owner.CreateThirstBadge(self.owner) or ThirstBadge(self.owner))
    self.waterstomach:SetPosition(-60, 20, 0)
    self.onthirstdelta = nil

	local function OnSetPlayerMode_Water(inst, self)
		if self.onthirstdelta == nil then
	        self.onthirstdelta = function(owner, data) self:thirstDelta(data) end
	        self.inst:ListenForEvent("thirstdelta", self.onthirstdelta, self.owner)
	        self:SetthirstPercent(self.owner.replica.thirst:GetPercent())
	    end
	end

	local function OnSetGhostMode_Water(inst, self)
	    if not self.isghostmode == not ghostmode then --force boolean
	        return
	    elseif ghostmode then
	        self.isghostmode = true
		    if self.onthirstdelta ~= nil then
		        self.inst:RemoveEventCallback("thirstdelta", self.onthirstdelta, self.owner)
		        self.onthirstdelta = nil
		    end
		end
	end

	function self.ShowStatusNumbers()
	    self.waterstomach.num:Show()
		local result = ShowStatusNumbers()
	    return result
	end

	function self.HideStatusNumbers()
		self.waterstomach.num:Hide()
		local result = _HideStatusNumbers()
	    return result
	end

	function self.AddWereness()
		if self.wereness == nil then
			self.wereness:SetPosition(self.waterstomach:GetPosition())
		end
		local result = _AddWereness()

		return result
	end

	function self.SetWereMode(weremode, nofx, ...)
	    if self.isghostmode or self.wereness == nil then
	        return
	    elseif weremode then
	        self.waterstomach:Hide()
	        self.wereness:SetPosition(self.waterstomach:GetPosition())
	    else
	        self.waterstomach:Show()
	    end
	    local result = _SetWereMode(self, weremode, nofx, ...)
	    return result
	end

	function self.SetGhostMode(ghostmode, ...)
		local old_isghostmode = self.isghostmode
		self.modetask_water = nil

	    if not self.isghostmode == not ghostmode then
	        return
	    elseif ghostmode then
        	self.isghostmode = true
	        self.waterstomach:Hide()
	    else
        	self.isghostmode = nil
	        self.waterstomach:Show()
	    end

	    if self.modetask_water ~= nil then
	        self.modetask_water:Cancel()
	    end

	    self.modetask_water = self.inst:DoStaticTaskInTime(0, ghostmode and OnSetGhostMode_Water or OnSetPlayerMode_Water, self)

	    self.isghostmode = old_isghostmode

	    local result = _SetGhostMode(self, ghostmode, ...)
	    return result
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
	                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/thirst_up")
	            elseif data.newpercent < data.oldpercent then
	                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/thirst_down")
	                self.waterstomach:PulseRed()
	            end
	        end
	    end
	end
end

AddClassPostConstruct("widgets/statusdisplays", thirstbadge_statusdisplays)