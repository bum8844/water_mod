local Widget = require "widgets/widget"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local Grid = require "widgets/grid"
local Spinner = require "widgets/spinner"

local TEMPLATES = require "widgets/redux/templates"
local TEMPLATES_WATER = require "widgets/redux/templates_water"

require("util")

local FILTER_ALL = "ALL"

local cooking = require("cooking")

local function ChackConstants(foodname)

	local ingredient_drinkable = FOODTYPEGROUP.INGREDIENT_DRINKABLE
	local iced = FOODTYPEGROUP.ICED
	local drinkable = FOODTYPEGROUP.DRINKABLE
	local drinkable_alcoho = FOODTYPEGROUP.DRINKABLE_ALCOHO
	local drinkable_holiday = FOODTYPEGROUP.DRINKABLE_HOLIDAY
	local drinkable_holiday_alcoho = FOODTYPEGROUP.DRINKABLE_HOLIDAY_ALCOHO

	local food_hydration = false

	for Hydration, v in pairs(ingredient_drinkable) do 
		for _, name in pairs(v) do
			if foodname == name then
				return TUNING["HYDRATION_"..Hydration]
			end
		end
	end

	for Hydration, v in pairs(iced) do 
		for _, name in pairs(v) do
			if foodname == name then
				return TUNING["HYDRATION_"..Hydration]
			end
		end
	end

	for Hydration, v in pairs(drinkable) do 
		for _, name in pairs(v) do
			if foodname == name then
				return TUNING["HYDRATION_"..Hydration]
			end
		end
	end

	for Hydration, v in pairs(drinkable_alcoho) do 
		for _, name in pairs(v) do
			if foodname == name then
				return TUNING["HYDRATION_"..Hydration]
			end
		end
	end

	for Hydration, v in pairs(drinkable_holiday) do 
		for _, name in pairs(v) do
			if foodname == name then
				return TUNING["HYDRATION_"..Hydration]
			end
		end
	end

	for Hydration, v in pairs(drinkable_holiday_alcoho) do 
		for _, name in pairs(v) do
			if foodname == name then
				return TUNING["HYDRATION_"..Hydration]
			end
		end
	end

	return false
end

local function Calchungerforthirst(data)
	return RoundBiasedUp(data.recipe_def.hunger * 2 ^ (math.abs(data.recipe_def.hunger / 300) - 1), 4) * 0.25
end

local CookbookPageCrockPot = require("widgets/redux/cookbookpage_crockpot")
local _PopulateRecipeDetailPanel = CookbookPageCrockPot.PopulateRecipeDetailPanel

local function MakeDetailsLine(details_root, x, y, scale, image_override)
	local value_title_line = details_root:AddChild(Image("images/quagmire_recipebook.xml", image_override or "quagmire_recipe_line.tex"))
	value_title_line:SetScale(scale, scale)
	value_title_line:SetPosition(x, y)
end

function CookbookPageCrockPot:PopulateRecipeDetailPanel(data, ...)
	local top = self.details_root.panel_height/2
	local left = -self.details_root.panel_width / 2

	local image_size = 110

	local name_font_size = 34
	local value_title_font_size = 18
	local value_body_font_size = 16

	local y = ((((( top - 11 ) - name_font_size/2 ) - name_font_size/2 - 4 ) - 30) - image_size/2 ) - image_size/2

	local old_data = _PopulateRecipeDetailPanel(self, data,  ...)

	if data.unlocked and data.has_eaten then
		local details_x = 60
		local details_y = y + 85
		local status_scale = 0.5

		local health = data.recipe_def.health ~= nil and math.floor(10*data.recipe_def.health)/10 or nil
		local hunger = data.recipe_def.hunger ~= nil and math.floor(10*data.recipe_def.hunger)/10 or nil
		local sanity = data.recipe_def.sanity ~= nil and math.floor(10*data.recipe_def.sanity)/10 or nil
		local thirst = data.recipe_def.thirst ~= nil and math.floor(10*data.recipe_def.thirst)/10 or 
		ChackConstants(data.recipe_def.name) and math.floor(10*ChackConstants(data.recipe_def.name))/10 or
		data.recipe_def.hunger and math.floor(10*Calchungerforthirst(data))/10  or nil

		self.health_status:SetPosition(details_x-60, details_y)
		self.health_status.status_value:SetString(health or STRINGS.UI.COOKBOOK.STAT_UNKNOWN)
		self.health_status:SetScale(status_scale)

		self.hunger_status:SetPosition(details_x-20, details_y)
		self.hunger_status.status_value:SetString(hunger or STRINGS.UI.COOKBOOK.STAT_UNKNOWN)
		self.hunger_status:SetScale(status_scale)

		self.thirst_status = old_data:AddChild(TEMPLATES_WATER.MakeUIStatusBadge((thirst ~= nil and thirst >= 0) and "thirst" or "thirst_bed"))
		self.thirst_status:SetPosition(details_x+20, details_y)
		self.thirst_status.status_value:SetString(thirst or STRINGS.UI.COOKBOOK.STAT_UNKNOWN)
		self.thirst_status:SetScale(status_scale)

		self.sanity_status:SetPosition(details_x+60, details_y)
		self.sanity_status.status_value:SetString(sanity or STRINGS.UI.COOKBOOK.STAT_UNKNOWN)
		self.sanity_status:SetScale(status_scale)
	end
	return old_data
end

function CookbookPageCrockPot:ApplySort(...)
	local sortby = GLOBAL.TheCookbook:GetFilter("sort")
	table.sort(self.filtered_recipes,
			sortby == "alphabetical"	and function(a, b) return a.unlocked and not b.unlocked or (a.unlocked and b.unlocked and a.name < b.name) end
		or	sortby == "health"			and function(a, b) return (a.unlocked and not b.unlocked) or (a.has_eaten and not b.has_eaten) or (a.has_eaten and ((a.recipe_def.health > b.recipe_def.health) or (a.recipe_def.health == b.recipe_def.health and a.name < b.name))) end
		or	sortby == "hunger"			and function(a, b) return (a.unlocked and not b.unlocked) or (a.has_eaten and not b.has_eaten) or (a.has_eaten and ((a.recipe_def.hunger > b.recipe_def.hunger) or (a.recipe_def.hunger == b.recipe_def.hunger and a.name < b.name))) end
		or	sortby == "thirst"			and function(a, b) return (a.unlocked and not b.unlocked) or (a.has_eaten and not b.has_eaten) or (a.has_eaten and ((a.recipe_def.thirst or ChackConstants(a.recipe_def.name) or Calchungerforthirst(a)) > (b.recipe_def.thirst or ChackConstants(b.recipe_def.name) or Calchungerforthirst(b)) or ((a.recipe_def.thirst or ChackConstants(a.recipe_def.name) or Calchungerforthirst(a)) == (b.recipe_def.thirst or ChackConstants(b.recipe_def.name) or Calchungerforthirst(b)) and a.name < b.name))) end
		or	sortby == "sanity"			and function(a, b) return (a.unlocked and not b.unlocked) or (a.has_eaten and not b.has_eaten) or (a.has_eaten and ((a.recipe_def.sanity > b.recipe_def.sanity) or (a.recipe_def.sanity == b.recipe_def.sanity and a.name < b.name))) end
		or	sortby == "sideeffects"		and function(a, b) return self:_sortfn_sideeffects(a, b) end
		or									function(a, b) return self:_sortfn_default(a, b) end
	)

    self.recipe_grid:SetItemsData(self.filtered_recipes)
	self:_DoFocusHookups()
end

function CookbookPageCrockPot:BuildSpinners(...)
	local root = Widget("spinner_root")

	local top = 50
	local left = 0 -- -width/2 + 5

	local sort_options = {
		{text = STRINGS.UI.COOKBOOK.SORT_DEFAULT,		data = "default"},
		{text = STRINGS.UI.COOKBOOK.SORT_ALPHABETICAL,	data = "alphabetical"},
		{text = STRINGS.UI.COOKBOOK.SORT_HEALTH,		data = "health"},
		{text = STRINGS.UI.COOKBOOK.SORT_HUNGER,		data = "hunger"},
		{text = STRINGS.UI.COOKBOOK.SORT_THIRST,		data = "thirst"},
		{text = STRINGS.UI.COOKBOOK.SORT_SANITY,		data = "sanity"},
		{text = STRINGS.UI.COOKBOOK.SORT_SIDE_EFFECTS,	data = "sideeffects"},
	}
	local function on_sort_fn( data )
		GLOBAL.TheCookbook:SetFilter("sort", data)
		self:ApplySort()
	end

	local filter_options = {
		{text = STRINGS.UI.COOKBOOK.FILTER_ALL,			data = FILTER_ALL},
		{text = STRINGS.UI.COOKBOOK.FILTER_MEAT,		data = FOODTYPE.MEAT},
		{text = STRINGS.UI.COOKBOOK.FILTER_VEGGIE,		data = FOODTYPE.VEGGIE},
		{text = STRINGS.UI.COOKBOOK.FILTER_OTHER,		data = "OTHER"},
		{text = STRINGS.UI.COOKBOOK.FILTER_SIDE_EFFECTS,data = "SIDEEFFECTS"},
		{text = STRINGS.UI.COOKBOOK.FILTER_INCOMPLETE  ,data = "INCOMPLETE"},
	}
	local function on_filter_fn( data )
		GLOBAL.TheCookbook:SetFilter("filter", data)
		self:ApplyFilters()
	end

	local width_label = 150
	local width_spinner = 150
	local height = 25

	local function MakeSpinner(labeltext, spinnerdata, onchanged_fn, initial_data)
		local spacing = 5
		local font = GLOBAL.HEADERFONT
		local font_size = 18

		local total_width = width_label + width_spinner + spacing
		local wdg = Widget("labelspinner")
		wdg.label = wdg:AddChild( Text(font, font_size, labeltext) )
		wdg.label:SetPosition( (-total_width/2)+(width_label/2), 0 )
		wdg.label:SetRegionSize( width_label, height )
		wdg.label:SetHAlign( GLOBAL.ANCHOR_RIGHT )
		wdg.label:SetColour(GLOBAL.UICOLOURS.BROWN_DARK)

		local lean = true
		wdg.spinner = wdg:AddChild(Spinner(spinnerdata, width_spinner, height, {font = font, size = font_size}, nil, "images/quagmire_recipebook.xml", nil, lean))
		wdg.spinner:SetTextColour(GLOBAL.UICOLOURS.BROWN_DARK)
		wdg.spinner:SetOnChangedFn(onchanged_fn)
		wdg.spinner:SetPosition((total_width/2)-(width_spinner/2), 0)
		wdg.spinner:SetSelected(initial_data)

		return wdg
	end

	GLOBAL.TheCookbook:SetFilter("sort", GLOBAL.TheCookbook:GetFilter("sort") or "default")
	GLOBAL.TheCookbook:SetFilter("filter", GLOBAL.TheCookbook:GetFilter("filter") or FILTER_ALL)

	local items = {}
	table.insert(items, MakeSpinner(STRINGS.UI.COOKBOOK.SORT_SPINNERLABEL, sort_options, on_sort_fn, GLOBAL.TheCookbook:GetFilter("sort")))
	table.insert(items, MakeSpinner(STRINGS.UI.COOKBOOK.FILTER_SPINNERLABEL, filter_options, on_filter_fn, GLOBAL.TheCookbook:GetFilter("filter")))

	self.spinners = {}
	for i, v in ipairs(items) do
		local w = root:AddChild(v)
		w:SetPosition(50, (#items - i + 1)*(height + 3))
		table.insert(self.spinners, w.spinner)
	end
	
	return root
end
