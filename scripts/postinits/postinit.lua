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
	},

	prefabs =
	{
		"antlion",
		"cookingrecipecard",
		"firepit",
		"player",
		"portablespicer",	
		"staff",		
		"wateringcan",
		"acorn",
		"mosquitosack",
	},

	screens = {
		"playerhud",
	},

	stategraphs =
	{
		"SGwilson",
		"SGwilson_client",
	},

	widgets =
	{
		"itemtile",
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
	}
}

if GetModConfigData("enable_thirst") then

	local prefabs = {
		"hats",
		"wickerbottom",
		"wortox",
		"warly",
		"wortox",
		"woodie",
		"wurt",
		"wintersfeastbuff",
		"armor_slurper",
		"slurper",
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
