require("tuning")
local modlist = require("utils/water_modlist")

local water_spicedfoods_mod = {}

local function oneaten_caffeinpepper(inst, eater)
    if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
        return
    elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
        eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME
        eater.components.debuffable:AddDebuff("caffeinbuff", "caffeinbuff")
    else
        eater.components.locomotor:SetExternalSpeedMultiplier(eater, "caffeinbuff", TUNING.CAFFEIN_SPEED)
        eater:DoTaskInTime(TUNING.CAFFEIN_TIME, function()
            eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "caffeinbuff")
        end)
    end
end

local SPICES =
{
    SPICE_CAFFEINPEPPER = { oneatenfn = oneaten_caffeinpepper, prefabs = { "caffeinbuff" } },
}

function GenerateSpicedFoods_Water_mod(foods)
    for foodname, fooddata in pairs(foods) do
        for spicenameupper, spicedata in pairs(SPICES) do
            local newdata = _G.shallowcopy(fooddata)
            local spicename = string.lower(spicenameupper)
            if foodname == "wetgoop" then
                newdata.test = function(cooker, names, tags) return names[spicename] end
                newdata.priority = -10
            else
                newdata.test = function(cooker, names, tags) return names[foodname] and names[spicename] end
                newdata.priority = 100
            end
            newdata.cooktime = .12
            newdata.stacksize = nil
            newdata.spice = spicenameupper
            newdata.basename = foodname
            newdata.overimg = fooddata.basename
            newdata.tetype = fooddata.tetype
            newdata.name = foodname.."_spice_caffeinpepper"
            newdata.floater = {"med", nil, {0.85, 0.7, 0.85}}
            newdata.official = true
            newdata.cookbook_category = fooddata.cookbook_category ~= nil and ("spiced_"..fooddata.cookbook_category) or nil
            water_spicedfoods_mod[newdata.name] = newdata

            if newdata.temperature == nil then
                --Add permanent "heat" to regular food
                newdata.temperature = TUNING.HOT_FOOD_BONUS_TEMP
                newdata.temperatureduration = TUNING.FOOD_TEMP_LONG
                newdata.nochill = true
            elseif newdata.temperature > 0 then
                --Upgarde "hot" food to permanent heat
                newdata.temperatureduration = math.max(newdata.temperatureduration, TUNING.FOOD_TEMP_LONG)
                newdata.nochill = true
            end

            --[[if fooddata.platetype then
                newdata.platetype = fooddata.platetype
            end]]

            if spicedata.prefabs ~= nil then
                --make a copy (via ArrayUnion) if there are dependencies from the original food
                newdata.prefabs = newdata.prefabs ~= nil and _G.ArrayUnion(newdata.prefabs, spicedata.prefabs) or spicedata.prefabs
            end

            if spicedata.oneatenfn ~= nil then
                if newdata.oneatenfn ~= nil then
                    local oneatenfn_old = newdata.oneatenfn
                    newdata.oneatenfn = function(inst, eater)
                        spicedata.oneatenfn(inst, eater)
                        oneatenfn_old(inst, eater)
                    end
                else
                    newdata.oneatenfn = spicedata.oneatenfn
                end
            end
        end
    end
end


if modlist.bm then
    GenerateSpicedFoods_Water_mod(require("bm_foodrecipes"))
end

if modlist.w101 then
    GenerateSpicedFoods_Water_mod(require("W101_menu"))
    GenerateSpicedFoods_Water_mod(require("W101_shunted"))
    GenerateSpicedFoods_Water_mod(require("W101_frozen"))
    GenerateSpicedFoods_Water_mod(require("W101_mushrooms"))
end

if modlist.hof then
     GenerateSpicedFoods_Water_mod(require("hof_foodrecipes"))
     GenerateSpicedFoods_Water_mod(require("hof_foodrecipes_warly"))
end

return water_spicedfoods_mod

