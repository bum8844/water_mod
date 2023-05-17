local function TumbleweedPostinit(inst)
	local function OnInitBoilligCard(inst)
		if math.random() < TUNING.RECIPCARF_CHANCE then
			table.insert(inst.loot, "boillingrecipcard")
			table.insert(inst.lootaggro, false)
		end
		if math.random() < TUNING.RECIPCARF_CHANCE then
			table.insert(inst.loot, "fermentingrecipcard")
			table.insert(inst.lootaggro, false)
		end
	end
	
	if not _G.TheWorld.ismastersim then
        return inst
    end
	
	inst:DoTaskInTime(0, OnInitBoilligCard)
end

AddPrefabPostInit("tumbleweed", TumbleweedPostinit)