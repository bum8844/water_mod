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


local function OnWaterInit(inst)
	inst.watertask = nil
    inst:WatchWorldState("snowlevel", OnSnowLevel)
    OnSnowLevel(inst, GLOBAL.TheWorld.state.snowlevel)
    HiddenPipes(inst)
end

local function TestWater(inst)
	inst.watertask = nil
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

		inst.watertask = inst:DoTaskInTime(0,OnWaterInit)
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

		inst.watertask = inst:DoTaskInTime(0,OnWaterInit)
	end)
end

for _, v in pairs(TUNING.TYPES_SALTY) do
	AddPrefabPostInit(v, function(inst)
	    if not GLOBAL.TheWorld.ismastersim then
	        return inst
	    end
		
		inst:AddComponent("water")
		inst.components.water.watertype = WATERTYPE.SALTY

		inst.watertask = inst:DoTaskInTime(0,TestWater)
	end)
end