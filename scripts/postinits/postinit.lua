local postinits =
{
	components =
	{
		"dryer",
		"eater",
		"edible",
		"inventoryitem_replica",
		"regrowthmanager",
		"wisecracker",
	},

	prefabs =
	{
		"wateringcan",
		"antlion",
		"fertilizer",
		"firepit",
		--"player",
		"ponds",
		"portablespicer",
		"wortox",
	},

	stategraphs =
	{
		"SGwilson",
		"SGwilson_client",
	},

	widgets =
	{
		"itemtile",
		--"statusdisplays",
	},

	utils =
	{
		"childplayer",
		"thirstvalue",
	},
}

if GetModConfigData("enable_thirst") then
	table.insert(postinits.components, "sleepingbag")
	table.insert(postinits.components, "sleepingbaguser")
	table.insert(postinits.prefabs, "player")
	table.insert(postinits.widgets, "statusdisplays")
	table.insert(postinits.widgets, "bloodover_water")
	table.insert(postinits.widgets, "healthbadge_water")
	table.insert(postinits.utils, "thirstvalue")
end

for dir, v in pairs(postinits) do
	for _, filename in ipairs(v) do
		modrequire("postinits/"..dir.."/"..filename)
	end
end
