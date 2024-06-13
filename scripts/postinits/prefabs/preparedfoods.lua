local food = {
	"ruincolate",
	"ruin_schokakola",
	"dark_ruincolate",
	"white_ruincolate",
}

for k, v in pairs(food) do
	AddPrefabPostInit(v,function(inst)
		inst:DoTaskInTime(0, function()	
			inst.water_swap_type = true
		end)
	end)
end