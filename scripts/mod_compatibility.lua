for k,mod_id in ipairs(GLOBAL.KnownModIndex:GetModsToLoad()) do 
	if mod_id == "workshop-2334209327" then
		modrequire("modcompats/2334209327/hof_buckets")
		if GetModConfigData("enable_thirst") then
			modrequire("modcompats/2334209327/hof_berwbook")
		end
	end
	if mod_id == "workshop-1505270912" then
		modrequire("modcompats/1505270912/te_water_spicedfoods_mod")
	end
	if mod_id == "workshop-1467214795" then
		modrequire("modcompats/1467214795/ia_water_spicedfoods_mod")
		modrequire("modcompats/1467214795/ia_init")
		modrequire("modcompats/1467214795/ia_init_prefab")
	end 
	if mod_id == "workshop-2039181790" then
		modrequire("modcompats/2039181790/unc_water_spicedfoods_mod")
	end
	if mod_id == "workshop-1289779251" then 
		modrequire("modcompats/1289779251/cherry_friendpits")
	end
end
