local _G = GLOBAL
local TECH = _G.TECH
local Ingredient = _G.Ingredient
local ACTIONS = _G.ACTIONS

ACTIONS.PULLMILK.fn = function(act)
    local milkable = act.target and act.target.components.milkableanimal or nil
    if act.invobject and milkable ~= nil then
        local item = act.invobject
        act.target.components.milkableanimal:Milk(act.doer)
        act.doer.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")

        local finiteuses = item.components.finiteuses:GetUses()
        local stacksize = ( finiteuses >= TUNING.BUCKET_LEVEL_PER_USE ) and TUNING.BUCKET_LEVEL_PER_USE*.5 or finiteuses *.5
        finiteuses = finiteuses - (stacksize*2)
        if finiteuses > 0 then
            item.components.finiteuses:SetUses(finiteuses)
        else
            item:Remove()
        end
        return true
    end
end

-- For sorting recipe.
-- Source: https://steamcommunity.com/sharedfiles/filedetails/?id=1467214795
local function SortRecipe(a, b, filter_name, offset)
    local filter = _G.CRAFTING_FILTERS[filter_name]
    if filter and filter.recipes then
        for sortvalue, product in ipairs(filter.recipes) do
            if product == a then
                table.remove(filter.recipes, sortvalue)
                break
            end
        end

        local target_position = #filter.recipes + 1
        for sortvalue, product in ipairs(filter.recipes) do
            if product == b then
                target_position = sortvalue + offset
                break
            end
        end

        table.insert(filter.recipes, target_position, a)
    end
end 
 
local function SortBefore(a, b, filter_name)
    SortRecipe(a, b, filter_name, 0)
end 

local function SortAfter(a, b, filter_name)
    SortRecipe(a, b, filter_name, 1)
end

local function ModAtlas()
  return "images/inventoryimages/hof_inventoryimages.xml"
end

RemoveRecipeFromFilter("kyno_bucket_empty","HYDRATION")
RemoveRecipeFromFilter("kyno_bucket_empty","TOOLS")
AddRecipeToFilter("kyno_bucket_empty","LOST")
AddRecipePostInit("kyno_bucket_empty",function(v) v.nounlock = true end)

local bucket = {
    "bucket_empty",
    "woodie_bucket_empty",
    "steel_bucket_empty"
}

for _, v in pairs(bucket) do
    AddPrefabPostInit(v,function(inst)
        inst:AddComponent("milker")
        inst:RemoveComponent("milkingtool")
    end)
end