local AccountItemFrame = require "widgets/redux/accountitemframe"
local Grid = require "widgets/grid"
local Image = require "widgets/image"
local ImageButton = require "widgets/imagebutton"
local Menu = require "widgets/menu"
local NineSlice = require "widgets/nineslice"
local NumericSpinner = require "widgets/numericspinner"
local Spinner = require "widgets/spinner"
local Text = require "widgets/text"
local TextEdit = require "widgets/textedit"
local TrueScrollList = require "widgets/truescrolllist"
local UIAnim = require "widgets/uianim"
local Button = require "widgets/button"
local Widget = require "widgets/widget"

require("constants")
--require("skinsutils")
require("stringutil")

local TEMPLATES_WATER = {}

TEMPLATES_WATER.old = require("widgets/templates")

-- for making static health/hunger/sanity for using in the lobby
function TEMPLATES_WATER.MakeUIStatusBadge(_status_name, c)
	local status = Widget(_status_name.."_status")

	status.status_icon = status:AddChild(Image())
	status.status_icon:SetTexture("images/tea_ui.xml", "status_".._status_name..".tex")
	status.status_icon:SetScale(.55)

	status.status_image = status:AddChild(Image("images/global_redux.xml", "value_gold.tex"))
	status.status_image:SetScale(.66)
	status.status_image:SetPosition(0, -33)

	status.status_value = status:AddChild(Text(HEADERFONT, 20, "", UICOLOURS.BLACK))
	status.status_value:SetPosition(0, -34)

	status.ChangeCharacter = function(self, character)
		local status_name = TUNING.CHARACTER_DETAILS_OVERRIDE[character.."_".._status_name] or _status_name

		status.status_icon:SetTexture("images/tea_ui.xml", "status_"..status_name..".tex")

		local v = tostring(TUNING[string.upper(character.."_"..status_name)] or STRINGS.CHARACTER_DETAILS.STAT_UNKNOW)
		status.status_value:SetString(v)
	end

	if c ~= nil then
		status:ChangeCharacter(c)
	end

	return status
end

return TEMPLATES_WATER
