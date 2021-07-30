local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local RECIPETABS = GLOBAL.RECIPETABS
local Ingredient = GLOBAL.Ingredient
local FOODTYPE = GLOBAL.FOODTYPE
local TECH = GLOBAL.TECH
local TUNING = GLOBAL.TUNING
local TheSim = GLOBAL.TheSim
local Vector3 = GLOBAL.Vector3
local ACTIONS = GLOBAL.ACTIONS
local TheNet = GLOBAL.TheNet



local function widgetcreation()
local params={}
params.bear_barrel =
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = Vector3(0, 200, 0),
        side_align_tip = 160,
    },
	acceptsstacks = false,
    type = "chest",
}

for y = 2, 0, -1 do
    for x = 0, 1 do	
        table.insert(params.bear_barrel.widget.slotpos, Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end
--[[
function params.bear_barrel.itemtestfn(container, item, slot)
	if item:HasTag("berrel_valid") then
		return true
	end
	return false
end
--]]

	local containers = GLOBAL.require "containers"
	containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, params.bear_barrel.widget.slotpos ~= nil and #params.bear_barrel.widget.slotpos or 0)

	local old_widgetsetup = containers.widgetsetup
	function containers.widgetsetup(container, prefab, data, ...)
		local pref = prefab or container.inst.prefab
		local name = pref 
		
		if container.inst:HasTag("beer_barrel_container") then
			name = "bear_barrel"
		end

		if name == "bear_barrel" then
			local t = params[name]
			if t ~= nil then
				for k, v in pairs(t) do
					container[k] = v
				end
			container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
			end
		else
			return old_widgetsetup(container, prefab, data, ...)
		end
	end
end

widgetcreation()