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
		"oasislake",
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
	},

	redux = {

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

	local redux	 = {
		screens = {
			"scrapbookdata",
			"scrapbookscreen",
		},
		widgets = {
			"cookbookpage_crockpot",
		},
	}

	for i, v in pairs(redux) do
		postinits.redux[i] = v
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
	if dir == "redux" then
		for duxdir, duxv in pairs(v) do
			for _, duxfile in ipairs(duxv) do
				modrequire("postinits/"..duxdir.."/redux/"..duxfile)
			end
		end
	else
		for _, filename in ipairs(v) do
			modrequire("postinits/"..dir.."/"..filename)
		end
	end
end
