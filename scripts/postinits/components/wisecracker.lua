-- bum: Child Safety: the "child" survivors can't drink alcohols.
AddComponentPostInit("wisecracker",function(self, inst)
    inst:ListenForEvent("oneat",function(inst, data)
        if data.food.components.perishable ~= nil and
            data.food.components.perishable:IsFresh() and
            inst:HasTag("masterchef") and
            data.food.prefab == "goopydrink" then
            inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_EAT", "PAINFUL"))
        end
    end)
    inst:ListenForEvent("drunkwalking",function(inst, data)
        inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_DRUNKING"))
    end)
end)

if GetModConfigData("enable_thirst") then
    AddComponentPostInit("wisecracker",function(self, inst)
        inst:ListenForEvent("thirstdelta",function(inst, data)
            if data.newpercent <= TUNING.THIRST_THRESH and data.oldpercent > TUNING.THIRST_THRESH then
                inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_THIRST"))
            end
        end)
    end)
end

