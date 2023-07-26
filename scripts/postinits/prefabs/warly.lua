AddPrefabPostInit("warly",function(inst)
	if inst.components.eater ~= nil then
		inst.components.eater:SetThristAbsorption(1.5)
	end
end)
