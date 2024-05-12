local ENV = env
GLOBAL.setfenv(1, GLOBAL)

local KETTLE_TAGS = {"brewing"}
local KETTLE_CANT_TAGS = {"burnt", "spicer", "stewer", "INLIMBO"}

local OldEmberFavor_StartCooking = EmberFavor_StartCooking
function EmberFavor_StartCooking(self, doer, ...)
	local defaultmult, pots = OldEmberFavor_StartCooking(self, doer, ...)
	
	if doer then
		if doer.emberfavoured then
			self.cooktimemult = defaultmult * TUNING.EMBERFAVOR_COOKMULT
			EmberFavor_SetLook(self, true)
		else
			local x, y, z = self.inst.Transform:GetWorldPosition()
			local ents = TheSim:FindEntities(x, y, z, TUNING.EMBERFAVOR_POTRANGE, KETTLE_TAGS, KETTLE_CANT_TAGS)
			
			for i, v in ipairs(ents) do
				if v.components.brewing and (v == self.inst or v.components.brewing:IsCooking()) then
					table.insert(pots, v)
				end
			end
		end
	end
	
	return defaultmult, pots
end

local EmberEventManager = require("components/embereventmanager")

local OldStopEvent = EmberEventManager.StopEvent
function EmberEventManager:StopEvent(player, lost, ...)
	for i, pot in ipairs(self.pots) do
		if pot.components.brewing then
			EmberFavor_SetLook(pot.components.brewing, false, true, not lost)
		end
	end
	
	return OldStopEvent(self, player, lost, ...)
end

local OldStartEvent = EmberEventManager.StartEvent
function EmberEventManager:StartEvent(pots, ...)
	local test = OldStartEvent(self, pots, ...)
	
	for i, pot in ipairs(pots) do
		if pot.components.brewing then
			EmberFavor_SetLook(pot.components.brewing, true, true)
		end
	end
	
	return test
end

-----------------------

local Brewing = require("components/brewing")

local OldStartCooking = Brewing.StartCooking
function Brewing:StartCooking(doer, ...)
	local defaultmult, pots = EmberFavor_StartCooking(self, doer)
	
	OldStartCooking(self, doer, ...)
	self.cooktimemult = defaultmult
	
	EmberFavor_StartEvent(self, pots)
end

local OldHarvest = Brewing.Harvest
function Brewing:Harvest(harvester, ...)
	if self.emberfavored then
		EmberFavor_SetLook(self, false)
	end
	
	return OldHarvest(self, harvester, ...)
end

ENV.AddPrefabPostInit("portablekettle", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return
	end
	
	if inst.components.brewing then
		inst.components.brewing.emberfavorsymbol = "wood"
	end
end)