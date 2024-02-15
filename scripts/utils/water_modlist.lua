local water_modlist = {
	hof = false,
	mfp = false,
	te = false,
	ia = false,
	legion = false,
	unc = false,
	cf = false,
	fwd = false,
	gyul = false,
	w101 = false,
	bm = false,
	cs = false,
}

for k,mod_id in ipairs(KnownModIndex:GetModsToLoad()) do
	if mod_id == "workshop-2334209327" then
		water_modlist.hof = true
	end
	if mod_id == "workshop-2762334054" or mod_id == "workshop-2762334054" then
		water_modlist.mfp = true
	end
	if mod_id == "workshop-1505270912" then
		water_modlist.te = true
	end
	if mod_id == "workshop-1467214795" then
		water_modlist.ia = true
	end
	if mod_id == "workshop-1392778117" then
		water_modlist.legion = true
	end
	if mod_id == "workshop-436654027" or mod_id == "workshop-1277605967" or mod_id == "workshop-2431867642" or mod_id == "workshop-1935156140" then
		water_modlist.bm = true
	end
	if mod_id == "workshop-1289779251" then
		water_modlist.cf = true
	end
	if mod_id == "workshop-2748801553" then
		water_modlist.gyul = true
	end
	if mod_id == "workshop-381565292" then
		water_modlist.w101 = true
	end
	if mod_id == "workshop-3054476656" then
		water_modlist.fwd = true
	end
	if mod_id == "workshop-2039181790" then
		water_modlist.unc = true
	end 
end

return {water_modlist = water_modlist}