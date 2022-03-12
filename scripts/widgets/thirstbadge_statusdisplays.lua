local function thirstbadge_statusdisplays(self)
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
		self.waterstomach:SetPosition(-80, -40, 0)
	else
		self.waterstomach:SetPosition(-80, -40, 0)
	end
	--[[if AlwaysOnStatus and not self.owner:HasTag("bearded") then
		self.fatigue_sleep:SetPosition(-115, -15, 0)
	elseif AlwaysOnStatus and self.owner:HasTag("bearded") then
		self.fatigue_sleep:SetPosition(-165, 19, 0)	
	elseif not AlwaysOnStatus and self.owner:HasTag("bearded") then	
		self.fatigue_sleep:SetPosition(-165,19,0)
	end
		
	if not AlwaysOnStatus and not self.owner:HasTag("bearded") then	
    	self.waterstomach:SetPosition(-80, -40, 0)
	end]]

	local function OnSetPlayerMode(self)
		if self.onthirstdelta == nil then
	        self.onthirstdelta = function(owner, data) self:ThirstDelta(data) end
	        self.inst:ListenForEvent("thirstdelta", self.onthirstdelta, self.owner)
	        if self.owner.replica.thirst ~=nil then
	        	self:SetThirstPercent(self.owner.replica.thirst:GetPercent())
	        end
	    end
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

	OnSetPlayerMode(self)
end
AddClassPostConstruct("widgets/statusdisplays", thirstbadge_statusdisplays)

	
	--[[
	_ShowStatusNumbers = self.ShowStatusNumbers
	_HideStatusNumbers = self.HideStatusNumbers
	_AddWereness = self.AddWereness
	_SetWereMode = self.SetWereMode]]

	--[[

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




end]]

