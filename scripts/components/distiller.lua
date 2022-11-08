--MEMO:
--put water -> timer is done -> the water is purified

local function ontimerdone(inst, data)
	if data ~= nil then
		if data.name == "refining" then
			local refiner = inst.components.refiner

			if refiner.onprocessdonefn ~= nil then
				refiner.onprocessdonefn(inst)
			end
		end
	end
end

local Distiller = Class(function(self, inst)
	self.inst = inst

	self.water_per_process = 10

	self.byproduct_per_process = 1

	self.max_byproduct = 6

	self.time_per_unit = 5
	self.current_refining_time = nil

	--self.onprocessdonefn = nil

	self.inst:ListenForEvent("timerdone", ontimerdone)
end, nil, nil)

function Refiner:Refresh()
	local waterlevel = self.inst.components.waterlevel.currentwater

	if self.inst.components.timer:TimerExists("refining") then
	end
end

return Distiller
