if TUNING.CHILDS_SAFE then
	for _, v in pairs(TUNING.CHILDS) do
		AddPrefabPostInit(v, function(inst) inst.childplayer = true end)
	end
end

for _,v  in pairs(TUNING.WATERBORNE_IMMUNES) do
	AddPrefabPostInit(v, function(inst) inst.waterborne_immune = true end)
end

local cocktail_ingredient = {
	"ice",
	"spice_salt",
	"spice_sugar",
	"spice_garlic",
	"spice_chili",
	"mentha_spicata",
	"citroyuzu",
	"applepine",
	"berries",
	"berries_juicy",
}

for k, v in pairs(cocktail_ingredient) do
	AddPrefabPostInit(v, function(inst) inst:AddTag("cocktail_ingredient") end)
end