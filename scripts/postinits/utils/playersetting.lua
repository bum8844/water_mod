for _, v in pairs(TUNING.CHILDS) do
	AddPrefabPostInit(v, function(inst) inst:AddTag("childplayer") end)
end

for _,v  in pairs(TUNING.WATERBORNE_IMMUNES) do
	AddPrefabPostInit(v, function(inst) inst:AddTag("waterborne_immune") end)
end