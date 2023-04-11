local NEED_TAGS = {"pipe"}
local range = 2.5

local function Hiddenpipes(inst)
	local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, range, NEED_TAGS)
    for i, v in ipairs(ents) do
        v:Hide()
    end
end

local function OnSnowLevel(inst, snowlevel)
    if snowlevel > .02 then
		inst.components.water.available = false
    else
        inst.components.water.available = true
    end
end

local function WeatherCheck(inst)
    inst:WatchWorldState("snowlevel", OnSnowLevel)
    OnSnowLevel(inst, GLOBAL.TheWorld.state.snowlevel)
end

AddPrefabPostInit("pond", function(inst)

	inst:AddTag("sprinkler_water")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("water")
	inst.components.water.watertype = WATERTYPE.DIRTY

	inst:DoPeriodicTask(0.1,Hiddenpipes)

	inst:DoPeriodicTask(1,WeatherCheck)
end)

AddPrefabPostInit("pond_mos", function(inst)

	inst:AddTag("sprinkler_water")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("water")
	inst.components.water.watertype = WATERTYPE.DIRTY

	inst:DoPeriodicTask(0.1,Hiddenpipes)

	inst:DoPeriodicTask(1,WeatherCheck)
end)

AddPrefabPostInit("pond_cave", function(inst)

	inst:AddTag("sprinkler_water")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("water")
	inst.components.water.watertype = WATERTYPE.DIRTY

	inst:DoPeriodicTask(0.1,Hiddenpipes)

	--inst:DoPeriodicTask(1,WeatherCheck)
end)
