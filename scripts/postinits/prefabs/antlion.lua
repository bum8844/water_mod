local function OnGivenItemWater(inst, giver, item, ...)
	if item.prefab == "water_clean_ice" or item.prefab == "water_dirty_ice" then
		inst:PushEvent("onacceptfighttribute", { tributer = giver, trigger = "freeze" })
	elseif inst.components.trader.onaccept_old ~= nil then
		return inst.components.trader.onaccept_old(inst, giver, item, ...)
	end
end

AddPrefabPostInit("antlion", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		inst:ListenForEvent("isfightingdirty", OnIsFightingDirty)

		return inst
	end
	if inst.components.trader ~= nil then
		if inst.components.trader.onaccept ~= nil and inst.components.trader.onaccept_old == nil then
			inst.components.trader.onaccept_old = inst.components.trader.onaccept
		end
		inst:DoTaskInTime(0, function()	
			inst.components.trader.onaccept = OnGivenItemWater
		end)
	end
end)
