local NEED_TAGS = {"pipe"}
local range = 2.5

local function HiddenPipes(inst)
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

local function TestWater(inst)
   	if inst:HasTag("watersource") and inst.components.watersource.available then
   		inst.components.watersource.available = false
   	end
   	if inst.nitreformation_ents ~= nil then
   		inst.components.water.available = false
   	else
   		inst.components.water.available = true
   	end
end

for _, v in pairs(TUNING.TYPES_DIRTY) do
	AddPrefabPostInit(v, function(inst)
		inst:AddTag("sprinkler_water")

	    if not GLOBAL.TheWorld.ismastersim then
	        return inst
	    end

		inst:AddComponent("water")
		inst.components.water.watertype = WATERTYPE.DIRTY

		inst:DoPeriodicTask(0.1,HiddenPipes)

		inst:DoPeriodicTask(1,WeatherCheck)
	end)
end

for _, v in pairs(TUNING.TYPES_CLEAN) do
	AddPrefabPostInit(v, function(inst)
		inst:AddTag("sprinkler_water")

	    if not GLOBAL.TheWorld.ismastersim then
	        return inst
	    end

		inst:AddComponent("water")
		inst.components.water.watertype = WATERTYPE.CLEAN

		inst:DoPeriodicTask(0.1,HiddenPipes)

		inst:DoPeriodicTask(1,WeatherCheck)
	end)
end

for _, v in pairs(TUNING.TYPES_SALTY) do
	AddPrefabPostInit(v, function(inst)
	    if not GLOBAL.TheWorld.ismastersim then
	        return inst
	    end
		
		inst:AddComponent("water")
		inst.components.water.watertype = WATERTYPE.SALTY

	    inst:DoPeriodicTask(0.1,TestWater)
	end)
end