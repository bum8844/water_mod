local assets =
{
	Asset("ANIM", "anim/well.zip"),
	Asset("ANIM", "anim/well_buckets_swap.zip")
}

local prefabs =
{
	"hole",
}

local function OnSpawnIn(inst)
	inst:Show()
    inst.AnimState:PlayAnimation("place", false)
    inst.AnimState:PushAnimation("idle")
end

local function FailUpgrade(inst, performer, prefabs)
	local refund = SpawnPrefab(prefabs)
    if performer ~= nil and performer.components.inventory ~= nil then
		performer.components.inventory:GiveItem(refund, nil)
	else
    	refund.Transform:SetPosition(inst.Transform:GetWorldPosition())
	end
	inst.components.upgradeable.upgradetype = UPGRADETYPES.HOLE
	inst.components.upgradeable.numupgrades = 0
	performer.components.talker:Say(GetActionFailString(performer,"CONSTRUCT","NOTALLOWED"))
end


local function CreateWell(inst)
	local well = ReplacePrefab(inst, "well")
	well.Transform:SetPosition(inst.Transform:GetWorldPosition())
	well.AnimState:PlayAnimation("place")
	well.AnimState:PushAnimation("idle_empty")
	well.SoundEmitter:PlaySound("dontstarve/common/together/town_portal/craft")
	well:DoTaskInTime(.6, function()
		well.SoundEmitter:PlaySound("saltydog/common/saltbox/place")
	end)
end

local function CreateWellSprinkler(inst)
	local sprinkler = ReplacePrefab(inst, "well_sprinkler")
	sprinkler.Transform:SetPosition(inst.Transform:GetWorldPosition())
	sprinkler.AnimState:PlayAnimation("place_hole")
	sprinkler.AnimState:PushAnimation("idle_off")
	sprinkler.onhole = "hole"
	sprinkler.SoundEmitter:PlaySound("dontstarve/common/together/catapult/hit")
	sprinkler:DoTaskInTime(.6, function()
		sprinkler.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl2_place")
	end)
end

local function OnUpgrade(inst, performer, upgraded_from_item)
	local prefab = upgraded_from_item.prefab
	if prefab == "well_kit" then
		local hole = CreateWell(inst)
	elseif prefab == "well_sprinkler_kit" then
		local hole = CreateWellSprinkler(inst)
	else
		FailUpgrade(inst, performer, prefab)
	end
end

--[[local function OnConstructed(inst, doer)
    local concluded = true
    for i, v in ipairs(CONSTRUCTION_PLANS[inst.prefab] or {}) do
        if inst.components.constructionsite:GetMaterialCount(v.type) < v.amount then
            concluded = false
            break
        end
    end

    if concluded then

    end
end]]

local function dig_up(inst)
	local x, y, z = inst.Transform:GetWorldPosition()
	SpawnPrefab("collapse_small").Transform:SetPosition(x, y, z)
    inst:Remove()
end

local function hole()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("holes")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("antlion_sinkhole_blocker")
    inst:AddTag("birdblocker")
	
	MakeObstaclePhysics(inst, .6)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	
	--[[inst:AddComponent("constructionsite")
    inst.components.constructionsite:SetConstructionPrefab("construction_container")
    inst.components.constructionsite:SetOnConstructedFn(OnConstructed)]]

	inst:AddComponent("upgradeable")
	inst.components.upgradeable.upgradetype = UPGRADETYPES.HOLE
	inst.components.upgradeable.onupgradefn = OnUpgrade
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetOnWorkCallback(nil)
    inst.components.workable:SetWorkLeft(3)
	
	inst:DoTaskInTime(0, OnSpawnIn)

	return inst
end

local function SetTemperature(inst)
    local isfrozen = inst.components.wateringstructure:IsFrozen()

    local temp = isfrozen and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP
    local curtemp = inst.components.wateringstructure:GetWater() ~= WATERTYPE.EMPTY and temp or TheWorld.state.temperature

    inst.components.temperature.current = curtemp

    if isfrozen then
        inst.components.temperature.maxtemp = TUNING.WATER_INITTEMP
        inst.components.temperature.mintemp = TUNING.MIN_ENTITY_TEMP
    else
        inst.components.temperature.mintemp = TUNING.MAX_ENTITY_TEMP
        inst.components.temperature.mintemp = TUNING.WATER_FROZEN_INITTEMP
    end
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE
end

local function SetToFrozed(inst, data)
    if inst.components.wateringstructure:GetWater() ~= WATERTYPE.EMPTY then
        local cur_temp = inst.components.temperature:GetCurrent()
        local min_temp = inst.components.temperature.mintemp
        local max_temp = inst.components.temperature.maxtemp
        if inst.components.wateringstructure:IsFrozen() then
            if cur_temp >= max_temp then
                inst.components.wateringstructure:SetFrozed(false)
                print("녹음")
            end
        elseif cur_temp <= min_temp then
            inst.components.wateringstructure:SetFrozed(true)
            print("얼음")
        end
    end
end

local function onhammered(inst)
	local wateringtool = inst.components.wateringstructure:GetWateringTool()
	if wateringtool then
		local toolfiniteuses = inst.components.wateringstructure:GetToolFiniteuses()
		local wateramount = inst.components.wateringstructure:GetWaterAmount() or 0
		local root = inst.components.pickable.product

		while wateramount > 0 do
        	if wateramount > 0 then
            	inst.components.lootdropper:SpawnLootPrefab(root)
        	end
        	wateramount = wateramount - 1
    	end
		if toolfiniteuses > 0 then
			local x, y, z = inst.Transform:GetWorldPosition()
	   		local refund = nil

			refund = SpawnPrefab(wateringtool)
			refund.components.finiteuses:SetUses(toolfiniteuses)

			LaunchAt(refund,inst,inst,-1.8,0.5,nil,65)
		end
	end
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("hole").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst.components.lootdropper:DropLoot()
	inst:Remove()
end

local function onhit(inst)
	if not inst.AnimState:IsCurrentAnimation("watering") then
		if inst.AnimState:IsCurrentAnimation("idle_watering") then
			inst.AnimState:PlayAnimation("hit_watering")
			inst.AnimState:PushAnimation("idle_watering")
		else
			inst.AnimState:PlayAnimation("hit_empty")
			inst.AnimState:PushAnimation("idle_empty")
		end
	end
end

local function OnRefuseItem(inst, giver, item)
	if inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("hit_watering") or inst.AnimState:IsCurrentAnimation("shack_watering") then
		giver.components.talker:Say(GetActionFailString(giver, "GIVE", "WELL_BUSY"))
	elseif inst.wateringtool then
		giver.components.talker:Say(GetActionFailString(giver, "GIVE", "WELL_NOTEMPTY"))
	else
		giver.components.talker:Say(GetActionFailString(giver, "GIVE", "GENERIC"))
	end
end

local function ShouldAcceptItem(inst, item, giver)
	if item:HasTag("bucket_empty") and inst:HasTag("ready") then
		return true
	end
	return false
end

local function SetCanPickable(inst,wateringtool)
	local hastool = wateringtool and true or nil
	inst.components.pickable.caninteractwith = hastool and hastool or false
	inst.components.pickable.canbepicked = hastool
end

local function SetPickable(inst)
	local isice = inst.components.wateringstructure:IsFrozen() and "_ice" or ""
	local watertype = inst.components.wateringstructure:GetWater()
	local amount = inst.components.wateringstructure:GetWaterAmount()
	local wateringtool = inst.components.wateringstructure:GetWateringTool()

    inst.components.pickable.numtoharvest = amount > 0 and amount or 1
    inst.components.pickable.product = watertype ~= WATERTYPE.EMPTY and watertype..isice or nil

    SetCanPickable(inst,wateringtool)
end

local function givewater(inst, picker, loot)
	local x, y, z = picker.Transform:GetWorldPosition()
    local refund = nil
    local toolfin = inst.components.wateringstructure:GetToolFiniteuses()

	inst.AnimState:PlayAnimation("shack_watering")
	inst.AnimState:PushAnimation("idle_empty")
	picker.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")

	if toolfin > 0 then
		local item = inst.components.wateringstructure:GetWateringTool()
		refund = SpawnPrefab(item)
		refund.components.finiteuses:SetUses(toolfin)

    	if picker ~= nil and picker.components.inventory ~= nil then
        	picker.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
    	else
        	refund.Transform:SetPosition(x,y,z)
    	end
	end
	if loot then
		loot.components.inventoryitemmoisture:SetMoisture(0)
	end
	inst.components.wateringstructure:Initialize()
end

local function SetBucket(inst)
	local bucket = inst.components.wateringstructure:GetBucketAnim()
	local bucket_old = inst.components.wateringstructure.old_wellanim

	if bucket ~= "" then
	    inst.AnimState:OverrideSymbol("well_buckets_empty", "well_buckets_swap", "well_buckets_"..bucket.."_empty")
	    inst.AnimState:OverrideSymbol("well_buckets_full", "well_buckets_swap", "well_buckets_"..bucket.."_clean")
	    inst.AnimState:OverrideSymbol("well_buckets_ice", "well_buckets_swap", "well_buckets_"..bucket.."_clean_ice")
	    inst.AnimState:OverrideSymbol("well_buckets_dirty", "well_buckets_swap", "well_buckets_"..bucket.."_dirty")
	    inst.AnimState:OverrideSymbol("well_buckets_ice_dirty", "well_buckets_swap", "well_buckets_"..bucket.."_dirty_ice")
	end
end

local function SetWellState(inst, reason)
	if reason then
		local sgaction = inst.components.wateringstructure:IsFrozen() and "turn_to_ice" or "turn_to_full"
		inst.sg:GoToState(sgaction)
		print(sgaction)
		print("물이 얼거나 녹음")
	else
		local watertype = inst.components.wateringstructure:GetWater()
		local isfrozen = inst.components.wateringstructure:IsFrozen() and "_ice" or ""
		local result = watertype ~= WATERTYPE.EMPTY and ( watertype == WATERTYPE.CLEAN and "_full" or "dirty") or "_empty"
		inst.sg:GoToState("watering_idle", isfrozen..result)
		print("물이 썩거나 마름")
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
	local toolfiniteuses = item.components.finiteuses:GetUses()
	inst.components.wateringstructure:RegistrationWateringTool(item, toolfiniteuses)
	SetBucket(inst)
   	inst.sg:GoToState("watering")
   	print("물을 깁니다")
end

local function SetAmount(inst)
	inst.components.wateringstructure:SetWaterAmount()
end

local function well()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("well.tex")

    inst:AddTag("well")
    inst:AddTag("structure")
    inst:AddTag("cleanwaterproduction")
    inst:AddTag("ready")
	
	MakeObstaclePhysics(inst, .5)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.AnimState:SetBank("well")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle_empty")

    inst:AddComponent("temperature")
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
	
	inst:AddComponent("inspectable")
	inst.IsGetWater = false

	inst:AddComponent("lootdropper")
	
    inst:AddComponent("pickable")
    inst.components.pickable.caninteractwith = false
    inst.components.pickable.onpickedfn = givewater
    inst.components.pickable.numtoharvest = 0

    inst:AddComponent("wateringstructure")
    inst.components.wateringstructure.setstatesfn = SetWellState
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:SetStateGraph("SGwell")

    inst:ListenForEvent("setwateringtool_temperature",SetTemperature)
    inst:ListenForEvent("setwateringtool_water",SetPickable)
    inst:ListenForEvent("temperaturedelta", SetToFrozed)
    inst:ListenForEvent("setwateramount",SetAmount)
    inst:ListenForEvent("setbucketanim",SetBucket)
	
	return inst
end

return Prefab("hole", hole, assets),
	Prefab("well", well, assets, prefabs)
