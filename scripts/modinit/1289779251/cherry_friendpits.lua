local function OnRemove(inst)
	if inst._firecamp ~= nil and inst._firecamp:IsValid() then
		inst._firecamp._friendpit = nil
		inst._firecamp.components.fueled.accepting = true
		inst._firecamp.components.upgradeable.numupgrades = 0
		inst._firecamp.components.upgradeable.upgradetype = UPGRADETYPES.CAMPFIRE
	end
end


AddPrefabPostInit("cherryupgrade_friendpit_item", function(inst)
	if inst.components.upgrader then
		inst.components.upgrader.upgradetype = UPGRADETYPES.CAMPFIRE
	end
end)

AddPrefabPostInit("cherryupgrade_friendpit", function(inst)
	inst._OnRemove = inst.OnRemove
	inst:ListenForEvent("onremove", OnRemove)
end)