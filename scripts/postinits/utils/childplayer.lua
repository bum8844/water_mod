if GetModConfigData("child_safety") then
	for _, v in pairs(TUNING.CHILDS) do
		AddPrefabPostInit(v, function(inst) inst:AddTag("childplayer") end)
	end
end
