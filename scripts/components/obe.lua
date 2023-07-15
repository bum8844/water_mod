local function torevive(inst)
	if inst:HasTag("playerghost") then
    	TheNet:Announce(inst:GetDisplayName().."'s ghost effect ended. Respawning!")
    	inst:PushEvent("respawnfromghost", { source = inst })
    	inst:DoTaskInTime(1.5,function()
        	inst.components.health.currenthealth = inst.components.obe:GetHealth()
        	inst.components.hunger.current = inst.components.obe:GetHunger()
        	inst.components.sanity.current = inst.components.obe:GetSanity()
        	if inst.components.thirst ~= nil then
            	inst.components.thirst.current = inst.components.obe.inst.components.obe:GetThirst()
        	end
        	inst.components.obe.isdrinkdeath = false
    	end)
    else
    	inst.components.obe.isdrinkdeath = false
    end
end

local Obe = Class(function(self, inst)
    self.inst = inst
    self.tea_currenthealth = 0
    self.tea_currenthunger = 0
    self.tea_currentsanity = 0
    self.tea_currentthirst = 0
    self.isdrinkdeath = false
    self.deathtimer = TUNING.GHOST_TIME

    inst:ListenForEvent("timerdone", function(inst, data)
        if data.name == "obebuff_done" then
            torevive(inst)
        end
    end)
end) 

function Obe:SetHealth(health)
    self.tea_currenthealth = health or 0
end

function Obe:SetHunger(hunger)
	self.tea_currenthunger = hunger or 0
end

function Obe:SetSanity(sanity)
    self.tea_currentsanity = sanity or 0
end

function Obe:SetThirst(thirst)
	self.tea_currentthirst = thirst or 0
end

function Obe:DrinktoDeath()
	self.isdrinkdeath = true
	self.deathtimer = TUNING.GHOST_TIME

	self.inst.components.health:DoDelta(-1000000, nil, "death_by_tea")

	if not self.inst.components.timer:TimerExists("obebuff_done") then
		self.inst.components.timer:StartTimer("obebuff_done", self.deathtimer)
	else
		local current_duration = self.inst.components.timer:GetTimeLeft("obebuff_done")
		local new_duration = math.max(current_duration, self.deathtimer)
		self.inst.components.timer:StopTimer("obebuff_done")
		self.inst.components.timer:StartTimer("obebuff_done", self.deathtimer)
	end
end

function Obe:OnSave()
	return { 
		tea_health = self.tea_currenthealth,
		tea_hunger = self.tea_currenthunger,
		tea_sanity = self.tea_currentsanity,
		tea_thirst = self.tea_currentthirst,
		isdrinkdeath = self.isdrinkdeath,
	}
end

function Obe:OnLoad(data)
	self.tea_currenthealth = data.tea_health or 0
	self.tea_currenthunger = data.tea_hunger or 0
	self.tea_currentsanity = data.tea_sanity or 0
	self.tea_currentthirst = data.tea_thirst or 0
	self.isdrinkdeath = data.isdrinkdeath
end

function Obe:GetHealth()
    return self.tea_currenthealth
end

function Obe:GetHunger()
	return self.tea_currenthunger
end

function Obe:GetSanity()
    return self.tea_currentsanity
end

function Obe:GetThirst()
	return self.tea_currentthirst
end

return Obe