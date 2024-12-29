local modlist = require("utils/water_modlist").active_mod_compatibility

if modlist.hof then
	modrequire("modinit/2334209327/buckets")
	if GetModConfigData("enable_thirst") then
		modrequire("modinit/2334209327/berwbook")
	end
end
if modlist.te then
	modrequire("modinit/1505270912/water_spicedfoods_mod")
	modrequire("modinit/1505270912/minisign")
end
if modlist.ta then
	modrequire("modinit/2986194136/water_spicedfoods_mod")
	modrequire("modinit/2986194136/minisign")
end
if modlist.ia then
	modrequire("modinit/1467214795/water_spicedfoods_mod")
	modrequire("modinit/1467214795/init")
	modrequire("modinit/1467214795/init_prefab")
end
if modlist.ac then
	modrequire("modinit/3322803908/init")
	modrequire("modinit/3322803908/pig_shop_def")
	modrequire("modinit/3322803908/shop_buyer")
	modrequire("modinit/3322803908/pigman_city")
	modrequire("modinit/3322803908/deco_ruins_fountain")
	modrequire("modinit/3322803908/water_spicedfoods_mod")
end
if modlist.ac or modlist.te or modlist.ta then
	modrequire("modinit/pigcity_recipes")
end
if modlist.ia or modlist.te or modlist.ta then
	modrequire("modinit/obsidian_recipes")
end
if modlist.cf then 
	modrequire("modinit/1289779251/cherry_friendpits")
end
if modlist.fwd then
	modrequire("modinit/3054476656/water_spicedfoods_mod")
end
if modlist.ef then
	modrequire("modinit/2938233879/emberfavor")
end
