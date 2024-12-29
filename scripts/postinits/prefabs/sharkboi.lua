

local function AcceptTest(inst, item)
	if item.prefab == "wine_cellar_part" then
		return true
	else
		return inst.components.trader._test(inst, item)
	end
end

local function OnGivenItem(inst, giver, item)
	if item.prefab == "wine_cellar_part" then
		item:Remove()
	else
		return inst.components.trader._onaccept(inst, giver, item)
	end
end

local function GiveBlueprint(inst, target)
	if target and not target:IsValid() then
		target = nil
	end
	LaunchAt(SpawnPrefab("wine_cellar_blueprint"), inst, target, 1, 2, 1)
	inst.SoundEmitter:PlaySound("dontstarve/common/dropGeneric")
end

local function checktrader(inst)
	
	if inst._checktrader then
		inst._checktrader:Cancel()
		inst._checktrader = nil
	end

	if inst.components.trader and inst.components.trader.test then
		inst.components.trader._test = inst.components.trader.test
		inst.components.trader._onaccept = inst.components.trader.onaccept
		inst.components.trader:SetAcceptTest(AcceptTest)
		inst.components.trader.onaccept = OnGivenItem
	else
		inst._checktrader = inst:DoTaskInTime(1,checktrader)
	end
end

AddPrefabPostInit("sharkboi",function(inst)
	checktrader(inst)
	inst.GiveBlueprint = GiveBlueprint
end)