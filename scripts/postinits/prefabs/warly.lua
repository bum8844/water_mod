AddPrefabPostInit("warly",function(inst)
	if inst.components.eater ~= nil then
		inst.components.eater:SetPrefersEatingTag("prepareddrink")
		inst.components.eater:SetPrefersEatingTag("pre-prepareddrink")
	end
end)
