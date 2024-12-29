local NEED_TAGS = {"pipe"}
local range = 2.5

local function HiddenPipes(inst)
	local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, range, NEED_TAGS)
    for i, v in ipairs(ents) do
        v:Hide()
    end
end

local function OnWaterInit(inst)
	inst.watertask = nil

	local test
	
	if inst:HasTag("sprinkler_water") then
    	HiddenPipes(inst)
    end

	if inst.components.watersource then
		test = inst.components.watersource.available
	end

	if inst.nitreformation_ents ~= nil then
		test = false
	end

	inst.components.water.available = test
    inst.watertask = inst:DoTaskInTime(0,OnWaterInit)
end

--Make a pond the source of a Sprinkler
for _, v in pairs(TUNING.TYPES_DIRTY) do
	AddPrefabPostInit(v, function(inst)
		inst:AddTag("sprinkler_water")

	    if not GLOBAL.TheWorld.ismastersim then
	        return inst
	    end

		inst:AddComponent("water")
		inst.components.water:SetWaterType(WATERTYPE.DIRTY)

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
		inst.components.water:SetWaterType(WATERTYPE.CLEAN)

		inst.watertask = inst:DoTaskInTime(0,OnWaterInit)
	end)
end

for _, v in pairs(TUNING.TYPES_SALTY) do
	AddPrefabPostInit(v, function(inst)
	    if not GLOBAL.TheWorld.ismastersim then
	        return inst
	    end
		
		inst:AddComponent("water")
		inst.components.water:SetWaterType(WATERTYPE.SALTY)

		inst.watertask = inst:DoTaskInTime(0,OnWaterInit)
	end)
end

for _, v in pairs(TUNING.TYPES_MINERAL) do
	AddPrefabPostInit(v, function(inst)
	    if not GLOBAL.TheWorld.ismastersim then
	        return inst
	    end
		
		inst:AddComponent("water")
		inst.components.water:SetWaterType(WATERTYPE.MINERAL)

		inst.watertask = inst:DoTaskInTime(0,OnWaterInit)
	end)
end