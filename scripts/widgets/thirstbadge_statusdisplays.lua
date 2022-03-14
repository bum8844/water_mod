local function thirstbadge_statusdisplays(self)

	local _SetGhostMode = self.SetGhostMode

	local ThirstBadge = require "widgets/thirstbadge"
	self.waterstomach = self:AddChild(ThirstBadge(self.owner))
	self.owner.waterstomach = self.waterstomach
	self._custombadge = self.waterstomach 
		
	local AlwaysOnStatus = false
	for k,v in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do 
		local Mod = GLOBAL.KnownModIndex:GetModInfo(v).name
		if Mod == "Combined Status" then 
			AlwaysOnStatus = true
		end
	end

	if AlwaysOnStatus then
		self.waterstomach:SetPosition(62, -115)
	else
		self.waterstomach:SetPosition(-80, -40, 0)
	end

	local function OnSetPlayerWaterMode(self)
		self.watermodetask = nil
		if self.onthirstdelta == nil then
	        --[[self.onthirstdelta = function(owner, data) self:ThirstDelta(data) end
	        self.inst:ListenForEvent("thirstdelta", self.onthirstdelta, self.owner)
	        if self.owner.replica.thirst ~=nil then
	        	self:SetThirstPercent(self.owner.replica.thirst:GetPercent())
	        end]]
	    end
	end

	local function OnSetGhostWaterMode(self)
		self.watermodetask = nil
	    if self.onthirstdelta ~= nil then
	        --[[self.inst:RemoveEventCallback("thirstdelta", self.onthirstdelta, self.owner)
	        self.onthirstdelta = nil]]
		end
	end

	function self:SetGhostMode(ghostmode, ...)
		if ghostmode then
	        self.waterstomach:Hide()
	    else
	        self.waterstomach:Show()
	    end
	    if self.watermodetask ~= nil then
	        self.watermodetask:Cancel()
	    end
	    self.watermodetask = self.inst:DoStaticTaskInTime(0, ghostmode and OnSetGhostWaterMode or OnSetPlayerWaterMode, self)
	    local result = _SetGhostMode(self, ghostmode, ...)
	    return result
	end

	function self:SetThirstPercent(pct)
		if self.owner.replica.thirst ~=nil then
		    self.waterstomach:SetPercent(pct, self.owner.replica.thirst:Max())

		    if pct <= 0 then
		        self.waterstomach:StartWarning()
		    else
		        self.waterstomach:StopWarning()
		    end
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

	
	--[[
	_ShowStatusNumbers = self.ShowStatusNumbers
	_HideStatusNumbers = self.HideStatusNumbers
	_AddWereness = self.AddWereness
	_SetWereMode = self.SetWereMode]]

	--[[


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




end]]

