local NEED_TAGS = {"pipe"}
local BLOCKERS_TAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "playerghost", "ghost", "flying", "structure" }
local range = 5
local WATER_RADIUS = 3.8

local function Hiddenpipes(inst)
	local pt = inst:GetPosition()
    local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, range, NEED_TAGS)
    for i, v in ipairs(ents) do
        v:Hide()
    end
end

local function HasPhysics(obj)
    return obj.Physics ~= nil
end

local function TryAvailable(inst, OnSandstormChanged)
    if GLOBAL.FindEntity(inst, WATER_RADIUS, HasPhysics, nil, BLOCKERS_TAGS) ~= nil then
        inst.availabletask = inst:DoTaskInTime(5, TryAvailable, OnSandstormChanged)
        return
    end

    inst.availabletask = nil
    inst.driedup_water = false

    inst.components.water.available = true
end

local function OnSandstormChanged(inst, active)
	if inst.availabletask then
		inst.availabletask:Cancel()
		inst.availabletask = nil
	end
    if active then
        if inst.driedup_water then
            TryAvailable(inst, OnSandstormChanged)
        end
    elseif not inst.driedup_water then
    	inst.driedup_water = true
        inst.components.water.available = false
    end
end

local function WeatherCheck(inst)
    inst:ListenForEvent("ms_stormchanged", function(src, data)
            if data.stormtype == GLOBAL.STORM_TYPES.SANDSTORM then
                OnSandstormChanged(inst, data.setting)
            end
        end, GLOBAL.TheWorld)
    OnSandstormChanged(inst, GLOBAL.TheWorld.components.sandstorms ~= nil and GLOBAL.TheWorld.components.sandstorms:IsSandstormActive())
end

local function SetOasislake(inst)

	inst:AddTag("sprinkler_water")
	inst:AddTag("oasis_lake")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("water")
	inst.components.water.watertype = WATERTYPE.CLEAN

	inst:DoPeriodicTask(1,WeatherCheck)

	inst:DoPeriodicTask(0,Hiddenpipes)
end

AddPrefabPostInit("oasislake",SetOasislake)
