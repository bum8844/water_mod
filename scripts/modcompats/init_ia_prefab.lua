local loot = {
	"needlespear",
	"cactus_meat",
	"cactus_meat"
}

local loot_dry = {
	"needlespear",
	"cactus_meat",
	"cactus_meat",
	"cactus_flower"
}

local function dig_up(inst, chopper)

    local withered = inst.components.witherable ~= nil and inst.components.witherable:IsWithered()

    if not withered and not inst.AnimState:IsCurrentAnimation("idle_underground") then
    	if GLOBAL.TheWorld.state.issummer then
    		inst.components.lootdropper:SpawnLootPrefab("cactus_flower")
    	end
        inst.components.lootdropper:SpawnLootPrefab("cactus_meat")
        inst.components.lootdropper:SpawnLootPrefab("cactus_meat")
    end
    inst.components.workable._onfinish(inst, chopper)
end

local function onseasonchange_active(inst)
    if not inst.prevseason then
        inst.prevseason = TheWorld.state.season
        return
    end

    if TheWorld.state.isautumn and inst.prevseason == SEASONS.SUMMER then
        local dormant = SpawnPrefab("elephantcactus")
        if dormant then
            dormant.Physics:Teleport(inst.Transform:GetWorldPosition())
            inst:Remove()
            return
        end
    end

    inst.prevseason = TheWorld.state.season
end

AddPrefabPostInit("elephantcactus_active", function(inst)

	if GLOBAL.TheWorld.state.issummer then
		if inst.components.lootdropper then
			inst.components.lootdropper:SetLoot(loot_dry)
		end
	else
		if inst.components.lootdropper then
			inst.components.lootdropper:SetLoot(loot)
		end
	end

	inst:WatchWorldState("season",function(inst, season)
		onseasonchange_active(inst)
		if GLOBAL.TheWorld.state.issummer then
			if inst.components.lootdropper then
				inst.components.lootdropper:SetLoot(loot_dry)
			end
		else
			if inst.components.lootdropper then
				inst.components.lootdropper:SetLoot(loot)
			end
		end
	end)
end)

AddPrefabPostInit("elephantcactus", function(inst)
	if inst.components.workable then
		inst.components.workable._onfinish = inst.components.workable.onfinish
		inst.components.workable:SetOnFinishCallback(dig_up)
	end
end)