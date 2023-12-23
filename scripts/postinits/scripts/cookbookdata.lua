local brewing = require("boilling")
local CookbookData = require("cookbookdata")

local _IsValidEntry = CookbookData.IsValidEntry
CookbookData.IsValidEntry = function(self, product)
    local ret = false
    if _IsValidEntry ~= nil then ret = _IsValidEntry(self, product) end
    
    for brewer, recipes in pairs(brewing.boilbook_recipes) do
        if recipes[product] ~= nil then
            return true
        end
    end

    return ret
end