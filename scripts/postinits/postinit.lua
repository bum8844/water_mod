local postinits =
{
	components =
	{
		"dryer",
		"eater",
		"edible",
		"foodmemory",
		"inventoryitem_replica",
		"inventoryitemmoisture",
		"moisture",
		"regrowthmanager",
		"wisecracker",
		"retrofitcavemap_anr",
		"retrofitforestmap_anr",
		"drawable",
		"farming_manager",
	},

	prefabs =
	{
		"antlion",
		"cookingrecipecard",
		"firepit",
		"player",
		"portablespicer",	
		"staff",	
		"warly",	
		"wateringcan",
		"wathgrithr",
		"wurt",
		"acorn",
		"mosquitosack",
		"wx78",
		"wx78_modules",
		"fruitfly",
		"preparedfoods",
		"oasislake",
		"sharkboi",
		"healingsalve_acidbuff",
		"winona",
	},

	screens = {
		"playerhud",
	},

	stategraphs =
	{
		"SGwilson",
		"SGwilson_client",
		"SGsharkboi",
	},

	widgets =
	{
		"itemtile",
		"upgrademodulesdisplay",
		"containerwidget",
	},

	utils =
	{
		"playersetting",
		"thirstvalue",
		"watertypes",
	},

	scripts = {
		"savefileupgrades",
		"popupmanager",
		"preparedfoods",
		"preparedfoods_warly",
		"cookbookdata",
		"techtree",
		"wx78_moduledefs",
		"messagebottletreasures",
	}
}

if GetModConfigData("enable_thirst") then

	local prefabs = {
		"armor_slurper",
		"hats",
		"slurper",
		"wickerbottom",
		"wintersfeastbuff",
		"woodie",
		"wortox",
	}

	local components = {
		"sleepingbag",
		"sleepingbaguser",
	}

	local widgets = {
		"bloodover_water",
		"healthbadge_water",
		"statusdisplays",
	}

	local redux_widgets = {
		"cookbookpage_crockpot",
	}

	for _, filename in pairs(redux_widgets) do
		modrequire("postinits/widgets/redux/"..filename)
	end

	for i, v in ipairs(prefabs) do
	    table.insert(postinits.prefabs, v)
	end

	for i, v in ipairs(components) do
	    table.insert(postinits.components, v)
	end

	for i, v in ipairs(widgets) do
		table.insert(postinits.widgets, v)
	end
end

for dir, v in pairs(postinits) do
	for _, filename in ipairs(v) do
		modrequire("postinits/"..dir.."/"..filename)
	end
end
