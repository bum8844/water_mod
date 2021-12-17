local assets = {
	Asset("ANIM", "anim/well.zip"),
}

local prefabs = {
	"hole",
}

local function OnSpawnIn(inst)
	inst:Show()
    inst.AnimState:PlayAnimation("place", false)
    inst.AnimState:PushAnimation("idle")
end

local function OnConstructed(inst, doer)
    local concluded = true
    for i, v in ipairs(CONSTRUCTION_PLANS[inst.prefab] or {}) do
        if inst.components.constructionsite:GetMaterialCount(v.type) < v.amount then
            concluded = false
            break
        end
    end

    if concluded then
        local new_well = ReplacePrefab(inst, "well")
		new_well.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/place")
		new_well.AnimState:PlayAnimation("place")
		new_well.AnimState:PushAnimation("idle_empty")
    end
end

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
	
	MakeObstaclePhysics(inst, .5)
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("constructionsite")
    inst.components.constructionsite:SetConstructionPrefab("construction_container")
    inst.components.constructionsite:SetOnConstructedFn(OnConstructed)
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetOnWorkCallback(nil)
    inst.components.workable:SetWorkLeft(3)
	
	inst:DoTaskInTime(0, OnSpawnIn)

	return inst
end

local function onhammered(inst)
	if inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") then
		inst.components.lootdropper:SpawnLootPrefab("bucket_full")
	end
	inst.components.lootdropper:SpawnLootPrefab("boards")
	inst.components.lootdropper:SpawnLootPrefab("boards")
	inst.components.lootdropper:SpawnLootPrefab("cutstone")
	inst.components.lootdropper:SpawnLootPrefab("cutstone")
	inst.components.lootdropper:SpawnLootPrefab("cutstone")
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("hole").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst)
	if not inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") then
		inst.AnimState:PlayAnimation("hit_empty")
		inst.AnimState:PushAnimation("idle_empty")
	end
end

local function OnRefuseItem(inst, giver, item)
	if inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") or inst.AnimState:IsCurrentAnimation("shack_watering") then
		giver.components.talker:Say("I'm getting water right now.")
	else
		giver.components.talker:Say("Can't get water with this.")
	end
end

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("bucket") then 
		return true
    end
end

local function launchitem(item, angle)
    local speed = math.random() * 4 + 2
    angle = (angle + math.random() * 60 - 30) * DEGREES
    item.Physics:SetVel(speed * math.cos(angle), math.random() * 2 + 8, speed * math.sin(angle))
end

local function givewater(inst, item, giver)
	--giver.components.inventory:GiveItem(SpawnPrefab("bucket_full"))
	inst.AnimState:PlayAnimation("shack_watering")
	local x, y, z = inst.Transform:GetWorldPosition()
	
    y = 2

    local angle
    if giver ~= nil and giver:IsValid() then
        angle = 180 - giver:GetAngleToPoint(x, 0, z)
    else
        local down = TheCamera:GetDownVec()
        angle = math.atan2(down.z, down.x) / DEGREES
        giver = nil
    end
	
	local bucket = SpawnPrefab("bucket_full")
	bucket.Transform:SetPosition(x, y, z)
	launchitem(bucket, angle)
		
	inst.AnimState:PushAnimation("idle_empty")
	giver.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
end

local function upwater(inst, item, giver)
		inst.AnimState:PushAnimation("idle_watering")
		inst:DoTaskInTime(1.1,givewater, item, giver)
end

local function getwater(inst, item, giver)
		inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/ocean_hit")
		inst:DoTaskInTime(1.1,upwater, item, giver)
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == ("bucket") then
		if not inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") or inst.AnimState:IsCurrentAnimation("shack_watering") then
			inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/tether_land")
			inst.AnimState:PlayAnimation("watering")
			inst:DoTaskInTime(1.1,getwater, item, giver)
		else
			giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
			OnRefuseItem(inst, giver, item)
		end
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
	
	MakeObstaclePhysics(inst, .5)
	
    inst.AnimState:SetBank("well")
    inst.AnimState:SetBuild("well")
    inst.AnimState:PlayAnimation("idle_empty")
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	return inst
end

return Prefab("hole",hole,assets),
Prefab("well",well,assets,prefabs)
