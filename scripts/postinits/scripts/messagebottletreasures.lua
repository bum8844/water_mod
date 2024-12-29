local treasure_templates = require("messagebottletreasures").treasure_templates

treasure_templates.sunkenchest.presets.brewer = {
	preset_weight = 2,

	guaranteed_loot =
	{
		boards = 3,
		livinglog = 3,
		rope = 3,
		goldnugget = 4,
		papyrus = 4,
		tentaclespots = 2,
		wine_cellar_part = {3, 5},
		messagebottleempty = {4, 6},
		cutstone = 10,
		cutstone = 2,
	},
	randomly_selected_loot =
	{
		{ cookingrecipecard = 1, wine_cellar_blueprint = 0.01 },
	},
}