if TUNING.CHILDS_SAFE then
	for _, v in pairs(TUNING.CHILDS) do
		AddPrefabPostInit(v, function(inst) inst.childplayer = true end)
	end
end

for _,v  in pairs(TUNING.WATERBORNE_IMMUNES) do
	AddPrefabPostInit(v, function(inst) inst.waterborne_immune = true end)
end