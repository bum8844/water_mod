-- bum: Child Safety: the "child" survivors can't drink alcohols.
AddComponentPostInit("wisecracker",function(self, inst)
	inst:ListenForEvent("sleep_end", function(inst, data)
		inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_SLEEP_END"))
	end)
end)
