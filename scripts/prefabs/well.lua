local assets =
{
	Asset("ANIM", "anim/well.zip"),
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
    inst:AddTag("constructionsite")
    inst:AddTag("birdblocker")
	
	MakeObstaclePhysics(inst, .6)
	
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

local function onhammered(inst)
	if inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("hit_watering") or inst.AnimState:IsCurrentAnimation("idle_watering") then
		local water_finiteuses = inst.components.pickable.numtoharvest
		while water_finiteuses > 0 do
        	if water_finiteuses > 0 then
            	inst.components.lootdropper:SpawnLootPrefab("water_clean")
        	end
        	water_finiteuses = water_finiteuses - 1
    	end
		if inst.bucket_finiteuses > 0 then
			local x, y, z = inst.Transform:GetWorldPosition()
	   		local refund = nil

			refund = SpawnPrefab("bucket_empty")
			refund.components.finiteuses:SetUses(inst.bucket_finiteuses)

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
	if inst.components.pickable.caninteractwith then
		giver.components.talker:Say(GetActionFailString(giver, "GIVE", "WELL_NOTEMPTY"))
	elseif inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") or inst.AnimState:IsCurrentAnimation("shack_watering") then
		giver.components.talker:Say(GetActionFailString(giver, "GIVE", "WELL_BUSY"))
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

local function SetPickable(inst, pickable, num)
    inst.components.pickable.canbepicked = pickable
    inst.components.pickable.caninteractwith = pickable
    inst.components.pickable.numtoharvest = num
end

local function givewater(inst, picker)
	local x, y, z = picker.Transform:GetWorldPosition()
    local refund = nil

	inst:AddTag("ready")
	inst.AnimState:PlayAnimation("shack_watering")
	inst.AnimState:PushAnimation("idle_empty")
	picker.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")

	if inst.bucket_finiteuses > 0 then
		refund = SpawnPrefab("bucket_empty")
		refund.components.finiteuses:SetUses(inst.bucket_finiteuses)

    	if picker ~= nil and picker.components.inventory ~= nil then
        	picker.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
    	else
        	refund.Transform:SetPosition(x,y,z)
    	end
	end
	SetPickable(inst, false, 0)
end

local function WellAct(inst, finiteuses)
	inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/tether_land")
	inst.AnimState:PlayAnimation("watering")
	inst:DoTaskInTime(1.1,function(inst)
		inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/ocean_hit")
		inst:DoTaskInTime(1.1,function(inst)
			inst.AnimState:PushAnimation("idle_watering")
			SetPickable(inst, true, finiteuses)
		end)
	end)
end

local function OnGetItemFromPlayer(inst, giver, item)
	inst:RemoveTag("ready")
	local water_finiteuses = item.components.finiteuses:GetUses()
	if water_finiteuses > TUNING.BUCKET_LEVEL_PER_USE then
		water_finiteuses = TUNING.BUCKET_LEVEL_PER_USE
	end
	inst.water_finiteuses = water_finiteuses
	item.components.finiteuses:Use(water_finiteuses)
	inst.bucket_finiteuses = item.components.finiteuses:GetUses()
	WellAct(inst, inst.water_finiteuses)
end

local function updatewellstate(inst, data)
    local num = data.numtoharvest or 0
	if num > 0 then
		inst.AnimState:PlayAnimation("idle_watering")
		SetPickable(inst, true, num)
	else
		inst.AnimState:PlayAnimation("idle_empty")
		SetPickable(inst, false, num)
	end
end

local function onsave(inst, data)
	data.bucket_finiteuses = inst.bucket_finiteuses
	if inst.water_finiteuses > 0 then
		data.water_finiteuses = inst.water_finiteuses
	end
    if inst.components.pickable.numtoharvest > 0 then
        data.numtoharvest = inst.components.pickable.numtoharvest
    end
end

local function onload(inst, data)
	if data ~= nil then
		inst.bucket_finiteuses = data.bucket_finiteuses
		if data.numtoharvest ~= nil then
			updatewellstate(inst, data)
		elseif data.bucket_finiteuses ~= nil and data.bucket_finiteuses > 0 then
			WellAct(inst, data.water_finiteuses)
		end
	else
		updatewellstate(inst, data)
	end
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
    inst:AddTag("ready")
	
	MakeObstaclePhysics(inst, .5)

	inst.entity:SetPristine()
	inst.bucket_finiteuses = 0
	inst.water_finiteuses = 0
	
    inst.AnimState:SetBank("well")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle_empty")
	
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
    inst.components.pickable.product = "water_clean"
    inst.components.pickable.numtoharvest = 0
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst.OnSave = onsave
    inst.OnLoad = onload
	
	return inst
end

return Prefab("hole", hole, assets),
	Prefab("well", well, assets, prefabs)
