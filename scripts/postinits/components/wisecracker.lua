-- bum: Child Safety: the "child" survivors can't drink alcohols.
AddComponentPostInit("wisecracker",function(self, inst)
    inst:ListenForEvent("oneat",function(inst, data)
        if data.food.components.perishable ~= nil then
            if data.food.components.perishable:IsFresh() then
                local ismasterchef = inst:HasTag("masterchef")
                if ismasterchef and (data.food.prefab == "goopydrink" or data.food.prefab == "wetgoop") then
                    inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_EAT", "PAINFUL"))
                else
                    local count = inst.components.foodmemory ~= nil and inst.components.foodmemory:GetMemoryCount(data.food.prefab) or 0
                    if count > 0 then
                        inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_EAT", "SAME_OLD_"..tostring(math.min(5, count))))
                    elseif ismasterchef then
                        inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_EAT",
                            (data.food:HasTag("masterfood") and "TASTY") or
                            (data.food:HasTag("preparedfood") and "PREPARED") or
                            (data.food:HasTag("prepareddrink") and "PREPARED") or
                            (data.food.components.cookable ~= nil and "RAW") or
                            (data.food.components.perishable.perishtime == TUNING.PERISH_PRESERVED and "DRIED") or
                            "COOKED"
                            ))
                    end
                end
            end
        end
    end)
end)

if GetModConfigData("enable_thirst") then
    AddComponentPostInit("wisecracker",function(self, inst)
        inst:ListenForEvent("thirstdelta",function(inst, data)
            if data.newpercent <= TUNING.THIRST_THRESH and data.oldpercent > TUNING.THIRST_THRESH then
                inst.components.talker:Say(GLOBAL.GetString(inst, "ANNOUNCE_THIRST"))
            end
        end)
    end)
end

