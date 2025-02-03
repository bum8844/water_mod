local function OnGivenItemWater(inst, giver, item, ...)
	if item.prefab == "water_clean_ice" or item.prefab == "water_dirty_ice" then
		inst:PushEvent("onacceptfighttribute", { tributer = giver, trigger = "freeze" })
	elseif inst.components.trader.dehy_onaccept ~= nil then
		return inst.components.trader.dehy_onaccept(inst, giver, item, ...)
	end
end

AddPrefabPostInit("antlion", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		inst:ListenForEvent("isfightingdirty", OnIsFightingDirty)

		return inst
	end
	if inst.components.trader ~= nil then
		inst.components.trader.dehy_onaccept = inst.components.trader.onaccept
		inst:DoTaskInTime(0, function()	
			inst.components.trader.onaccept = OnGivenItemWater
		end)
	end
end)
