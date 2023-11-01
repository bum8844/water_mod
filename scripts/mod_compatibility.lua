for k,mod_id in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do 
	if mod_id == "workshop-2334209327" then
		modrequire("modcompats/hof_buckets")
		modrequire("modcompats/hof_berwbook")
	end
	if mod_id == "workshop-1505270912" then
		modrequire("modcompats/water_spicedfoods_mod_te")
	end
	if mod_id == "workshop-1467214795" then
		modrequire("modcompats/water_spicedfoods_mod_ia")
		modrequire("modcompats/init_ia")
		modrequire("modcompats/init_ia_prefab")
	end 
	if mod_id == "workshop-2039181790" then
		modrequire("modcompats/water_spicedfoods_mod_unc")
	end
	if mod_id == "workshop-1289779251" then 
		modrequire("modcompats/cherry_friendpits")
	end
end
