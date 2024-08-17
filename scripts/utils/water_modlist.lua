local water_modlist = {
	["workshop-2334209327"] = "hof",
	["workshop-2762334054"] = "mfp",
	["workshop-1505270912"] = "te",
	["workshop-2986194136"] = "ta",
	["workshop-1467214795"] = "ia",
	["workshop-1392778117"] = "legion",
	["workshop-2039181790"] = "umc",
	["workshop-1289779251"] = "cf",
	["workshop-3047220901"] = "cf", -- test cf mod
	["workshop-3054476656"] = "fwd",
	["workshop-2748801553"] = "gyul",
	["workshop-381565292"] = "w101",
	["workshop-436654027"] = "bm",
	["workshop-1277605967"] = "bm",
	["workshop-1935156140"] = "bm",
	["workshop-2431867642"] = "bm",
	["workshop-376333686"] = "cs",
	["workshop-2938233879"] = "ef",
	["workshop-2189004162"] = "it",
	["workshop-666155465"] = "sm",
}

local active_mod_compatibility = {}

local infodata

for k,mod_id in ipairs(KnownModIndex:GetModsToLoad()) do
	for list, code in pairs(water_modlist) do
		if mod_id == list then
			active_mod_compatibility[code] = true
			if code == "cs" then
				infodata = ModManager:GetMod(mod_id).modinfo
			end
		end
	end
end

return {water_modlist = water_modlist, active_mod_compatibility = active_mod_compatibility, infodata = infodata}