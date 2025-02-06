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
		"wx78_modules",
		"fruitfly",
		"preparedfoods",
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
	},

	-- 목마름 표시 추가를 위한 postinit 테이블
	redux = {
	},
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

	local redux	 = {
		-- 스크랩북에서 음식재료와 준비된 음식 음료에 목마름 표시를 위해 작업해둔 코드를 불러오기 위한 작업폴더입니다
		-- 해당 코드 위치는 scripts/postinits/screens/redux 내부에 있습니다
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
	-- 각 postinit위치에 알 맞는 redux 폴더 내부에 있는 코드를 가져오기 위한 작업
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
