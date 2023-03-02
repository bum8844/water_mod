local FERTILIZER_DEFS = require("prefabs/fertilizer_nutrient_defs").FERTILIZER_DEFS
local sort_order = require("prefabs/fertilizer_nutrient_defs").SORTED_FERTILIZERS

local WATER_FERTILIZER_DEFS = {}

WATER_FERTILIZER_DEFS.spoiled_drink = {nutrients = TUNING.SPOILED_DRINK_NUTRIENTS}

local water_sort_order =
{
	spoiled_drink = "spoiled_drink",
}

for fertilizer, data in pairs(WATER_FERTILIZER_DEFS) do
    if data.inventoryimage == nil then
        data.inventoryimage = fertilizer..".tex"
    end

    if data.name == nil then
        data.name = string.upper(fertilizer)
    end

    if data.uses == nil then
        data.uses  = 1
    end

    if fertilizer and data then
        FERTILIZER_DEFS[fertilizer] = data
        local sort_data = water_sort_order[fertilizer]
        if sort_data and type(sort_data) == "string" then
            for i, name in ipairs(sort_order) do
                if name == sort_data then
                    table.insert(sort_order, i + 1, fertilizer)
                    break
                end
            end
        elseif sort_data and type(sort_data) == "number" then
            table.insert(sort_order, sort_data, fertilizer)
        else
            table.insert(sort_order, fertilizer)
        end
    end
end