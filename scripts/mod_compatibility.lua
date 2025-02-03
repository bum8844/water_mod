local modlist = require("utils/water_modlist").active_mod_compatibility

if modlist.hof then
	modrequire("modcompats/2334209327/hof_buckets")
	if GetModConfigData("enable_thirst") then
		modrequire("modcompats/2334209327/hof_berwbook")
	end
end
if modlist.te then
	modrequire("modcompats/1505270912/te_water_spicedfoods_mod")
	modrequire("modcompats/1505270912/te_minisign_patch")
end
if modlist.ta then
	modrequire("modcompats/2986194136/ta_water_spicedfoods_mod")
	modrequire("modcompats/2986194136/ta_minisign_patch")
end
if modlist.ia then
	modrequire("modcompats/1467214795/ia_water_spicedfoods_mod")
	modrequire("modcompats/1467214795/ia_init")
	modrequire("modcompats/1467214795/ia_init_prefab")
end
if modlist.ac then
	modrequire("modcompats/3322803908/ac_init")
	modrequire("modcompats/3322803908/pig_shop_def_patch")
	modrequire("modcompats/3322803908/water_spicedfoods_mod")
end
if modlist.ac or modlist.te or modlist.ta then
	modrequire("modcompats/pigcity_recipes_patch")
end
if modlist.ia or modlist.te or modlist.ta then
	modrequire("modcompats/obsidian_recipes_patch")
end
if modlist.cf then 
	modrequire("modcompats/1289779251/cherry_friendpits")
end
if modlist.fwd then
	modrequire("modcompats/3054476656/fwd_water_spicedfoods_mod")
end
if modlist.ef then
	modrequire("modcompats/2938233879/emberfavor")
end
