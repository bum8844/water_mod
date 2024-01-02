local UIAnim = require("widgets/uianim")
local Widget = require("widgets/widget")

local GetModuleDefinitionFromNetID = require("wx78_moduledefs").GetModuleDefinitionFromNetID
local UpgradeModulesDisplay = require("widgets/upgrademodulesdisplay")

UpgradeModulesDisplay._OnModuleAdded = UpgradeModulesDisplay.OnModuleAdded

function UpgradeModulesDisplay:OnModuleAdded(moduledefinition_index,...)
    local module_def = GetModuleDefinitionFromNetID(moduledefinition_index)
    if module_def == nil then
        return
    end

    if module_def.mod_module then
    	local modname = module_def.name
    	local modslots = module_def.slots
    	local buildswap = module_def.sawp_build

	    local new_chip = self.chip_objectpool[self.chip_poolindex]
	    self.chip_poolindex = self.chip_poolindex + 1

	    new_chip:GetAnimState():PlayAnimation((self.reversed and "plug_reverse") or "plug")
	    new_chip:GetAnimState():PushAnimation((self.reversed and "chip_idle_reverse") or "chip_idle")

	    new_chip:GetAnimState():OverrideSymbol("movespeed2_chip",buildswap,modname.."_chip")

	    new_chip._used_modslots = modslots

	    local slot_distance_from_bottom = self.slots_in_use + (modslots - 1) * 0.5
	    local y_pos = (slot_distance_from_bottom * 20) - 50
	    new_chip:SetPosition(0, y_pos)

	    new_chip:Show()

	    self.slots_in_use = self.slots_in_use + modslots
	else
		return self:_OnModuleAdded(moduledefinition_index, ...)
	end
end