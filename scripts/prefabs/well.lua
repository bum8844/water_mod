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
    inst.AnimState:PlayAnimation("digging", false)
    inst.AnimState:PushAnimation("idle")
end

local function OnSpawnIn_Well(inst)
	local x, y, z = inst.Transform:GetWorldPosition()
	local lunacyarea = TheWorld.Map:FindVisualNodeAtPoint(x, y, z , "lunacyarea") ~= nil
	inst.components.wateringstructure.islunacy = lunacyarea
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

local function CreateWellWaterPump(inst, upgraded_from_item)
	local waterpump = ReplacePrefab(inst, "well_waterpump")
	if upgraded_from_item._steampressure then
		local steampressure = waterpump.components.steampressure
		steampressure.curpressure = upgraded_from_item._steampressure
		if upgraded_from_item._steampressure >= steampressure.maxpressure then
			steampressure.fullpressure = true
		end
	end
	waterpump.Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function CreateWellBuryingSite(inst)
	local buryingsite = ReplacePrefab(inst, "well_buryingsite")
	buryingsite.Transform:SetPosition(inst.Transform:GetWorldPosition())
	buryingsite.AnimState:PlayAnimation("set_site_0")
	buryingsite.AnimState:PushAnimation("idle_site_0",true)
	buryingsite.SoundEmitter:PlaySound("dontstarve/common/together/spawn_portal_celestial/reveal")
end

local function OnUpgrade(inst, performer, upgraded_from_item)
	local prefab = upgraded_from_item.prefab
	if prefab == "well_kit" then
		local hole = CreateWell(inst)
	elseif prefab == "well_sprinkler_kit" then
		local hole = CreateWellSprinkler(inst)
	elseif prefab == "well_waterpump_kit" then 
		local hole = CreateWellWaterPump(inst, upgraded_from_item)
	elseif prefab == "well_burying_kit" then 
		local hole = CreateWellBuryingSite(inst)
	elseif prefab =="well_winona_sprinkler_kit" then
		local hole = CreateWellWinonaSprinkler(inst)
	else
		FailUpgrade(inst, performer, prefab)
	end
end

local function hole()
    local inst = CreateEntity()

	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("holes.tex")

    inst.AnimState:SetBank("holes")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle")
    inst.scrapbook_anim = "idle"
	
	inst:AddTag("water_hole")
	inst:AddTag("antlion_sinkhole_blocker")
    inst:AddTag("NOBLOCK")
    inst:AddTag("birdblocker")
	
	MakeObstaclePhysics(inst, .15)

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
	
	inst:DoTaskInTime(0, OnSpawnIn)

	return inst
end

local function SetTemperature(inst)
    local isfrozen = inst.components.wateringstructure:IsFrozen()

    local temp = isfrozen and TUNING.WATER_FROZEN_INITTEMP or TUNING.WATER_INITTEMP
    local watertype = inst.components.wateringstructure:GetWater()
    local curtemp = (watertype ~= WATERTYPE.EMPTY or watertype ~= WATERTYPE.MINERAL) and temp or TheWorld.state.temperature

    inst.components.temperature.current = curtemp

    if isfrozen then
        inst.components.temperature.maxtemp = TUNING.WATER_FROZEN_INITTEMP
        inst.components.temperature.mintemp = TUNING.MIN_ENTITY_TEMP
    else
        inst.components.temperature.maxtemp = TUNING.WATER_MAXTEMP
        inst.components.temperature.mintemp = TUNING.WATER_MINTEMP
    end
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE
end

local function SetToFrozed(inst, data)
	if not inst.components.wateringstructure.checktemp then
		return
	end
	if inst.components.wateringstructure:GetWateringTool() then
		local watertype = inst.components.wateringstructure:GetWater()
		if watertype ~= WATERTYPE.EMPTY or watertype ~= WATERTYPE.MINERAL then
		    local cur_temp = inst.components.temperature:GetCurrent()
		    local min_temp = inst.components.temperature.mintemp
		    local max_temp = inst.components.temperature.maxtemp
		    if inst.components.wateringstructure:IsFrozen() then
		        if cur_temp >= max_temp then
		            inst.components.wateringstructure:SetFrozed(false)
		        end
		    elseif cur_temp <= min_temp then
		        inst.components.wateringstructure:SetFrozed(true)
		    end
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

local function SetWaterData(inst)
	local watertype = inst.components.wateringstructure:GetWater()
	local isfrozen = inst.components.wateringstructure:IsFrozen() and "_ice" or ""
	local result = watertype ~= WATERTYPE.EMPTY and ((watertype == WATERTYPE.CLEAN or watertype == WATERTYPE.MINERAL) and "_full" or "_dirty") or "_empty"
	local data = { setwatertype = isfrozen..result }
	return data
end

local function onhit(inst)
	if not inst.sg:HasStateTag("busy") then
		if inst.sg:HasStateTag("watering") then
			local data = SetWaterData(inst)
			inst.sg:GoToState("hit_watering", data)
		else
			inst.sg:GoToState("hit_empty")
		end
	end
end

local function OnRefuseItem(inst, giver, item)
	if inst.sg:HasStateTag("busy") then
		giver.components.talker:Say(GetActionFailString(giver, "GIVE", "WELL_BUSY"))
	elseif inst.sg:HasStateTag("watering")then
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
    inst.components.pickable.product = watertype ~= WATERTYPE.EMPTY and "water_"..watertype..isice or nil

    SetCanPickable(inst,wateringtool)
end

local function givewater(inst, picker, loot)
	local x, y, z = picker.Transform:GetWorldPosition()
    local refund = nil
    local toolfin = inst.components.wateringstructure:GetToolFiniteuses()
    local toolfin_old = inst.components.wateringstructure.toolfiniteuses_old

	if not loot then
		toolfin = toolfin_old
	end

	inst.sg:GoToState("shack_watering",loot)

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
	local bucket = inst.components.wateringstructure:GetBucketAnim() or ""
	local bucket_old = inst.components.wateringstructure.old_wellanim

	if bucket ~= bucket_old then
		if bucket ~= "" then
			bucket = bucket.."_"
		end
	    inst.AnimState:OverrideSymbol("well_buckets_empty", "well_buckets_swap", "well_buckets_"..bucket.."empty")
	    inst.AnimState:OverrideSymbol("well_buckets_full", "well_buckets_swap", "well_buckets_"..bucket.."clean")
	    inst.AnimState:OverrideSymbol("well_buckets_ice", "well_buckets_swap", "well_buckets_"..bucket.."clean_ice")
	    inst.AnimState:OverrideSymbol("well_buckets_dirty", "well_buckets_swap", "well_buckets_"..bucket.."dirty")
	    inst.AnimState:OverrideSymbol("well_buckets_ice_dirty", "well_buckets_swap", "well_buckets_"..bucket.."dirty_ice")
	end
end

local function SetWellState(inst, reason)
	if reason then
		local sgaction = inst.components.wateringstructure:IsFrozen() and "turn_to_ice" or "turn_to_full"
		inst.sg:GoToState(sgaction)
	else
		local data = SetWaterData(inst)
		inst.sg:GoToState("watering_idle", data)
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
	local toolfiniteuses = item.components.finiteuses:GetUses()
	inst.components.wateringstructure:RegistrationWateringTool(item, toolfiniteuses)
	SetBucket(inst)
   	inst.sg:GoToState("watering")
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
    inst:AddTag("hashole")
	
	MakeObstaclePhysics(inst, .5)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.AnimState:SetBank("well")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle_empty")
    inst.scrapbook_anim = "idle_empty"

    inst:AddComponent("temperature")
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
	
	inst:AddComponent("inspectable")

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

    inst:DoTaskInTime(0, OnSpawnIn_Well)
	
	return inst
end

local function CalculatedValue(inst)
	local a = 0
    local t = 0
    for i, v in ipairs(CONSTRUCTION_PLANS[inst.prefab] or {}) do
        a = a + inst.components.constructionsite:GetMaterialCount(v.type)
        t = t + v.amount
    end
    return a, t
end

local function DoBurying(inst)
	inst.SoundEmitter:PlaySound("dontstarve/creatures/together/antlion/sfx/ground_break")
	inst.AnimState:PushAnimation("burying")
	inst:ListenForEvent("animover",function (inst)
		local x, y, z = inst.Transform:GetWorldPosition()
		SpawnPrefab("small_puff").Transform:SetPosition(x, y, z)
	    inst:Remove()
	end)
end

local function OnConstructed(inst, doer)
    local amount, total = CalculatedValue(inst)
    local pct = math.min(1, amount / total)
    if inst.AnimState:IsCurrentAnimation("idle_site_0") and pct >= .5 and pct < 1 then
    	inst.components.constructionsite:Disable()
    	inst.AnimState:PlayAnimation("set_site_1")
    	inst.AnimState:PushAnimation("idle_site_1")
    	inst.SoundEmitter:PlaySound("dontstarve/common/fixed_stonefurniture")
    	inst:ListenForEvent("animover",function (inst)
    		inst.components.constructionsite:Enable()
    	end)
    elseif pct >= 1 then
    	inst.components.constructionsite:Disable()
    	if inst.AnimState:IsCurrentAnimation("idle_site_0") then
    		inst.AnimState:PlayAnimation("set_site_1")
    		inst.AnimState:PushAnimation("idle_site_1")
    		inst.SoundEmitter:PlaySound("dontstarve/common/fixed_stonefurniture")
			inst:DoTaskInTime(1.25,function(inst)
				DoBurying(inst)
			end)
    	else
    		DoBurying(inst)
    	end
    end
end

local function OnLoad(inst)
	local amount, total = CalculatedValue(inst)
	local pct = math.min(1, amount / total)
	if pct >= .5 then
    	inst.AnimState:PlayAnimation("idle_site_1")
	end
end

local function onhammered_site(inst)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("hole").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst.components.lootdropper:DropLoot()
	inst:Remove()
end

local function site()
    local inst = CreateEntity()

	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("buryingsite")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle_site_0")
	
	inst:AddTag("antlion_sinkhole_blocker")
    inst:AddTag("birdblocker")
    inst:AddTag("hashole")

    inst:SetPrefabNameOverride("hole")
	
	MakeObstaclePhysics(inst, .15)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("constructionsite")
    inst.components.constructionsite:SetConstructionPrefab("construction_container")
    inst.components.constructionsite:SetOnConstructedFn(OnConstructed)

    inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(1)
	inst.components.workable:SetOnFinishCallback(onhammered_site)

    inst.OnLoad = OnLoad
	
	return inst
end

return Prefab("hole", hole, assets),
	Prefab("well", well, assets, prefabs),
	Prefab("well_buryingsite", site, assets, prefabs)