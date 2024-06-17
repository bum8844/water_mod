local food = {
	"ruincolate",
	"ruin_schokakola",
	"dark_ruincolate",
	"white_ruincolate",
}

for k, v in pairs(food) do
	AddPrefabPostInit(v,function(inst)
		inst:DoTaskInTime(0, function()	
			inst.minisign_atlas = "minisign_dehy_items_swap"
			if inst.inv_image_bg then
				inst.inv_image_bg.minisign_atlas = inst.minisign_atlas
			end
		end)
	end)
end