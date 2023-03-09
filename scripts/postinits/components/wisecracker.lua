-- bum: Child Safety: the "child" survivors can't drink alcohols.
AddComponentPostInit("wisecracker",function(self, inst)
	inst:ListenForEvent("sleep_end", function(inst, data)
		inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_SLEEP_END"))
	end)
end)

if GetModConfigData("enable_thirst") then
    -- 스피치 추가해야함
AddComponentPostInit("wisecracker",function(self, inst)
    inst:ListenForEvent("thirstdelta",
        function(inst, data)
            if data.newpercent <= TUNING.THIRST_THRESH and data.oldpercent > TUNING.THIRST_THRESH then
                inst.components.talker:Say(GLOBAL.GetString(inst, "ANNOUNCE_THIRST"))
            end
        end)
end)
end
