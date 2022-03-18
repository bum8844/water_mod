local function thirstbadge_statusdisplays(self)

	local _SetGhostMode = self.SetGhostMode

	local ThirstBadge = require "widgets/thirstbadge"
	self.waterstomach = self:AddChild(self.owner.CreateThirstBadge ~= nil and self.owner.CreateThirstBadge(self.owner) or ThirstBadge(self.owner))
	self.watermodetask = nil

	local AlwaysOnStatus = false
	local Musha_Mod = false
	for k,v in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do 
		local Mod = GLOBAL.KnownModIndex:GetModInfo(v).name
		if Mod == "Combined Status" then 
			AlwaysOnStatus = true
		end
		if Mod == "[DST]Musha" then
			Musha_Mod = true
		end
	end

	if AlwaysOnStatus then
		self.waterstomach:SetPosition(62, -115)
	elseif Musha_Mod and self.owner:HasTag("musha") then
		self.waterstomach:SetPosition(0, -105, 0)
	else
		self.waterstomach:SetPosition(-80, -40, 0)
	end

	self.onthirstdelta = nil

	local function OnSetPlayerWaterMode(inst, self)
		self.watermodetask = nil
	    if self.onthirstdelta == nil then
	        self.onthirstdelta = function(owner, data) self:ThirstDelta(data) end
	        self.inst:ListenForEvent("thirstdelta", self.onthirstdelta, self.owner)
	        self:SetThirstPercent(self.owner.replica.thirst:GetPercent())
	    end
	end

	local function OnSetGhostWaterMode(inst, self)
		self.watermodetask = nil
	    if self.onthirstdelta ~= nil then
	        self.inst:RemoveEventCallback("thirstdelta", self.onthirstdelta, self.owner)
	        self.onthirstdelta = nil
	    end
	end

	function self:SetGhostMode(ghostmode, ...)
	    local result = _SetGhostMode(self, ghostmode, ...)
		if ghostmode then
	        self.waterstomach:Hide()
	    else
	        self.waterstomach:Show()
	    end
	    if self.watermodetask ~= nil then
	        self.watermodetask:Cancel()
	    end
	    self.watermodetask = self.inst:DoStaticTaskInTime(0, ghostmode and OnSetGhostWaterMode or OnSetPlayerWaterMode, self)
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
	                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/hunger_up")
	            elseif data.newpercent < data.oldpercent then
	                TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/hunger_down")
	                self.waterstomach:PulseRed()
	            end
	        end
	    end
	end

end
AddClassPostConstruct("widgets/statusdisplays", thirstbadge_statusdisplays)


local function Addupdate(self)

	local _OnUpdate = self.OnUpdate

	function self:OnUpdate(dt)
		if (self.owner.replica.thirst ~= nil and self.owner.replica.thirst:IsStarving()) then
			if _G.TheNet:IsServerPaused() then return end
			local anim = "arrow_loop_decrease_most"
		    if self.arrowdir ~= anim then
		        self.arrowdir = anim
		        self.sanityarrow:GetAnimState():PlayAnimation(anim, true)
		    end
		else
			local result = _OnUpdate(self, dt)
			return result
		end
	end
end
AddClassPostConstruct("widgets/healthbadge", Addupdate)

local function AddUpdateState(self)
	local _UpdateState = self.UpdateState

	function self:UpdateState()
		if (self.owner.replica.thirst ~= nil and self.owner.replica.thirst:IsStarving()) then
			if _G.TheNet:IsServerPaused() then return end
			self:TurnOn()
		else
			local result = _UpdateState(self)
			return result
		end
	end
end

AddClassPostConstruct("widgets/bloodover", AddUpdateState)
