AddPrefabPostInit("wortox",function(inst)
	if inst.components.eater ~= nil then
		inst.components.eater:SetThristAbsorption(.5)
	end
end)
