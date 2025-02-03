local pigman = {
	"pigman_professor",
	"pigman_collector",
	"pigman_professor_shopkeep",
	"pigman_collector_shopkeep",
}

local function ShouldAcceptItem(inst, item)
	if item.prefab == "wine_cellar_part" and
	 ((inst.prefab == "pigman_professor" or inst.prefab == "pigman_professor_shopkeep") or
	 (inst.prefab == "pigman_collector_shopkeep" or inst.prefab == "pigman_collector")) then
		return true
	end
	return inst.components.trader._test(inst, item)
end

local function OnGetItemFromPlayer(inst, giver, item)
	if (inst.prefab == "pigman_professor" or inst.prefab == "pigman_professor_shopkeep") and item.prefab == "wine_cellar_part" then
        local econ = TheWorld.components.economy
        local econprefab = inst.econprefab or inst.prefab
        local desc = econ:GetTradeItemDesc(econprefab)
        if giver.components.inventory then
            inst:SayLine(inst:GetSpeechType("CITY_PIG_TALK_GIVE_REWARD"), 1, {line = desc})
            local rwd = SpawnPrefab("wine_cellar_blueprint")
			giver.components.inventory:GiveItem(rwd, nil, inst:GetPosition())
			item:Remove()
 		end
		
	else
		return inst.components.trader._onaccept(inst, giver, item)
	end
end

for k, v in pairs(pigman) do
	AddPrefabPostInit(v,function(inst)
		if inst.components.trader then
			inst.components.trader._test = inst.components.trader.test
			inst.components.trader._onaccept = inst.components.trader.onaccept
	        inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	        inst.components.trader.onaccept = OnGetItemFromPlayer
		end
	end)
end