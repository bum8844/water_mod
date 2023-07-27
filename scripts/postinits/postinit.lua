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
	},

	prefabs =
	{
		"antlion",
		"cookingrecipecard",
		"firepit",
		"mound",
		"oasislake",
		"player",
		"portablespicer",	
		"staff",	
		"warly",	
		"wateringcan",	
		"woodie",	
		"wurt",
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
}

if GetModConfigData("enable_thirst") then
	table.insert(postinits.prefabs, "hats")
	table.insert(postinits.prefabs, "wickerbottom")
	table.insert(postinits.prefabs, "wortox")

	table.insert(postinits.components, "sleepingbag")
	table.insert(postinits.components, "sleepingbaguser")
	
	table.insert(postinits.widgets, "bloodover_water")
	table.insert(postinits.widgets, "healthbadge_water")
	table.insert(postinits.widgets, "statusdisplays")
end

for dir, v in pairs(postinits) do
	for _, filename in ipairs(v) do
		modrequire("postinits/"..dir.."/"..filename)
	end
end
