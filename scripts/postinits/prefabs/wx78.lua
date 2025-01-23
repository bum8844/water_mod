local CHARGEREGEN_TIMERNAME = "chargeregenupdate"
local MOISTURETRACK_TIMERNAME = "moisturetrackingupdate"
local HUNGERDRAIN_TIMERNAME = "hungerdraintick"
local HEATSTEAM_TIMERNAME = "heatsteam_tick"

local function OnAdjustCharge(inst,data)
	local rad = TUNING.WX78_OVERCHARGE_LIGHT_RED
	local runspeed_bonus = TUNING.WX78_OVERCHARGE_RUNSPEED_BONUS

	local timer = data.timer

    if timer < 60 then
        rad = math.max(.1, rad * (timer / 60))
        runspeed_bonus = ((timer / 60)*runspeed_bonus)
    end

    print("timer : ",timer)
    print("rad : ",rad)
    print("runspeed_bonus : ",runspeed_bonus)

	inst.Light:SetRadius(rad)
	inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED*(1+runspeed_bonus)
end

local function OnStartCharge(inst,data)
    inst:AddTag("overcharge")
    inst:PushEvent("ms_overcharge")

    inst.SoundEmitter:KillSound("overcharge_sound")
    inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/charged", "overcharge_sound")
    inst.components.bloomer:PushBloom("overcharge", "shaders/anim.ksh", 50)

    inst.Light:Enable(true)

    inst.components.temperature.mintemp = 10

    inst.components.wx78_overcharged:DoAdjust()
	OnAdjustCharge(inst,data)
end

local function OnStopCharge(inst)
    inst.SoundEmitter:KillSound("overcharge_sound")
    inst:RemoveTag("overcharge")
    inst.Light:Enable(false)
    inst.components.locomotor.runspeed = TUNING.WILSON_RUN_SPEED
    inst.components.bloomer:PopBloom("overcharge")
    inst.components.temperature.mintemp = -20
    inst.components.talker:Say(GetString(inst, "ANNOUNCE_DISCHARGE"))
end

local function stop_moisturetracking(inst)
    inst.components.timer:StopTimer(MOISTURETRACK_TIMERNAME)

    inst._moisture_steps = 0
end

local function OnDeath(inst)
	inst.components.wx78_overcharged:StopOverCharge()
    inst.components.upgrademoduleowner:PopAllModules()
    inst.components.upgrademoduleowner:SetChargeLevel(0)

    stop_moisturetracking(inst)
    inst.components.timer:StopTimer(HUNGERDRAIN_TIMERNAME)
    inst.components.timer:StopTimer(CHARGEREGEN_TIMERNAME)

    if inst._gears_eaten > 0 then
        local dropgears = math.random(math.floor(inst._gears_eaten / 3), math.ceil(inst._gears_eaten / 2))
        local x, y, z = inst.Transform:GetWorldPosition()
        for i = 1, dropgears do
            local gear = SpawnPrefab("gears")
            if gear ~= nil then
                if gear.Physics ~= nil then
                    local speed = 2 + math.random()
                    local angle = math.random() * TWOPI
                    gear.Physics:Teleport(x, y + 1, z)
                    gear.Physics:SetVel(speed * math.cos(angle), speed * 3, speed * math.sin(angle))
                else
                    gear.Transform:SetPosition(x, y, z)
                end

                if gear.components.propagator ~= nil then
                    gear.components.propagator:Delay(5)
                end
            end
        end

        inst._gears_eaten = 0
    end
end

local function OnEat(inst, food)
	if food ~= nil and food.components.edible ~= nil then
		if food.components.edible.foodtype == FOODTYPE.ACID_BATTERY then
			inst.components.talker:Say(GetString(inst, "ANNOUNCE_CHARGE"))
			inst.SoundEmitter:PlaySound("dontstarve/characters/wx78/levelup")
			inst:DoTaskInTime(.5,function()
				inst.components.wx78_overcharged:StartOverCharge()
			end)
		end
	end
	inst.components.eater._oneatfn(inst, food)
end

AddPrefabPostInit("wx78",function(inst)
	inst:AddComponent("bloomer")

	inst:AddComponent("wx78_overcharged")

	if inst.components.eater ~= nil then
		inst.components.eater:SetCanDrinkAcid()
		inst.components.eater:SetCanEatAcidBattery()
		inst.components.eater._oneatfn = inst.components.eater.oneatfn
		inst.components.eater:SetOnEatFn(OnEat)
	end

    inst:ListenForEvent("death", OnDeath)
    inst:ListenForEvent("ms_playerreroll", OnDeath)
    inst:ListenForEvent("startovercharge", OnStartCharge)
    inst:ListenForEvent("adjustovercharge", OnAdjustCharge)
    inst:ListenForEvent("stopovercharge", OnStopCharge)
end)