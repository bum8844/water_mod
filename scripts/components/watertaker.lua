local Watertaker = Class(function(self, inst)
	self.inst = inst
	self.capacity = 100
end)

function Watertaker:Fill(source)
	local amount = self.capacity
	local filledprefab = nil
	if source ~= nil and source.components.waterlevel ~= nil then
		if source.waterlevel.currentwater < self.capacity then
			amount = source.waterlevel.waterlevel.currentwater
		end
		source.waterlevel:DoDelta(self.capacity)
	end
