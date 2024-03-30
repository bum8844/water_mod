local modlist = require("utils/water_modlist").active_mod_compatibility

if modlist.hof then
	modrequire("modcompats/2334209327/hof_buckets")
	if GetModConfigData("enable_thirst") then
		modrequire("modcompats/2334209327/hof_berwbook")
	end
end
if modlist.te then
	modrequire("modcompats/1505270912/te_water_spicedfoods_mod")
end
if modlist.ia then
	modrequire("modcompats/1467214795/ia_water_spicedfoods_mod")
	modrequire("modcompats/1467214795/ia_init")
	modrequire("modcompats/1467214795/ia_init_prefab")
end 
if modlist.cf then 
	modrequire("modcompats/1289779251/cherry_friendpits")
end
if modlist.fwd then
	modrequire("modcompats/3054476656/fwd_water_spicedfoods_mod")
end

