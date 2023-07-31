for k,v in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do 
	local Mod = GLOBAL.KnownModIndex:GetModInfo(v).name
	if Mod == "Heap of Foods" then -- workshop-2334209327
		modrequire("modcompats/hof_buckets")
	end
	if Mod == " Tropical Experience Return of Them" or Mod == " 他们的回归" then -- workshop-1505270912
		modrequire("modcompats/water_spicedfoods_mod_te")
	end
	if Mod == "Island Adventures - Shipwrecked" or Mod == "岛屿冒险" then -- workshop-1467214795
		modrequire("modcompats/water_spicedfoods_mod_ia")
	end 
	if Mod == "󰀕 Uncompromising Mode" then -- workshop-2039181790
		modrequire("modcompats/water_spicedfoods_mod_unc")
	end
end
