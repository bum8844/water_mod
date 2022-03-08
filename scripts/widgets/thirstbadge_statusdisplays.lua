local ThirstBadge      = require "widgets/thirstbadge"

local function thirstbadge_statusdisplays(self)

	_SetGhostMode = self.SetGhostMode

    self.waterstomach = self:AddChild(self.owner.CreateThirstBadge ~= nil and self.owner.CreateThirstBadge(self.owner) or ThirstBadge(self.owner))
    self.waterstomach:SetPosition(-60, 20, 0)
    self.onthirstdelta = nil

	local function OnSetPlayerMode_Water(self)
		if self.onthirstdelta == nil then
	        self.onthirstdelta = function(owner, data) self:thirstDelta(data) end
	        self.inst:ListenForEvent("thirstdelta", self.onthirstdelta, self.owner)
	        self:SetthirstPercent(self.owner.replica.thirst:GetPercent())
	    end
	end

	local function OnSetGhostMode_Water(self)
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

	function self.SetGhostMode(ghostmode, ...)
	    if not self.isghostmode == not ghostmode then --force boolean
	        return
	    elseif ghostmode then
	        self.waterstomach:Hide()
	    else
	        self.waterstomach:Show()
	    end
	    local result = _SetGhostMode(ghostmode, ...)
	    self.modetask = self.inst:DoStaticTaskInTime(0, ghostmode and OnSetGhostMode_Water or OnSetPlayerMode_Water, self)
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