require("tuning")
local modlist = require("utils/water_modlist")

local water_spicedfoods = {}

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

local function oneaten_ruincolate_spread(inst, eater)
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
    SPICE_RUINCOLATE_SPREAD = { oneatenfn = oneaten_ruincolate_spread, prefabs = { "caffeinbuff" } },
}

function GenerateSpicedFoods_Water(foods)
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
            newdata.name = foodname..spicename
            newdata.floater = {"med", nil, {0.85, 0.7, 0.85}}
            --newdata.official = true
            newdata.cookbook_category = fooddata.cookbook_category ~= nil and ("spiced_"..fooddata.cookbook_category) or nil
            water_spicedfoods[newdata.name] = newdata

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

if modlist.water_modlist.legion then
    GenerateSpicedFoods_Water(require("preparedfoods_legion"))
end

if modlist.water_modlist.gyul then
    GenerateSpicedFoods_Water(require("gyul_foodrecipes"))
end

if modlist.water_modlist.mfp then
    GenerateSpicedFoods_Water(require("mfp_foodrecipes"))
end

if modlist.water_modlist.unc then
    GenerateSpicedFoods_Water(require("um_preparedfoods"))
end

if modlist.water_modlist.cf then
    GenerateSpicedFoods_Water(require("cherry_preparedfoods"))
    GenerateSpicedFoods_Water(require("cherry_preparedfoods_warly"))
    GenerateSpicedFoods_Water(require("cherry_preparedfoods_wirly"))
end

GenerateSpicedFoods_Water(require("preparedfoods"))
GenerateSpicedFoods_Water(require("preparedfoods_warly"))

return water_spicedfoods

