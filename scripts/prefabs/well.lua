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
	
	MakeObstaclePhysics(inst, .7)
	
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


local function updatewellstate(inst)
    local num = inst.components.pickable.numtoharvest
	if num == 1 then
		inst.AnimState:PlayAnimation("idle_watering")
	else
		inst.AnimState:PlayAnimation("idle_empty")
	end
end

local function onhammered(inst)
	if inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") then
		inst.components.lootdropper:SpawnLootPrefab("bucket_clean")
	end
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
--say수정해야함
local function OnRefuseItem(inst, giver, item)
	if inst.components.pickable.caninteractwith then
		giver.components.talker:Say("I need to take out the bucket first.")
	elseif inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") or inst.AnimState:IsCurrentAnimation("shack_watering") then
		giver.components.talker:Say("I'm getting water right now.")
	else
		giver.components.talker:Say("Can't get water with this.")
	end
end

local function ShouldAcceptItem(inst, item, giver)
	if item:HasTag("bucket_empty") then 
		return true
    end
end

local function SetPickable(inst, pickable, num)
    inst.components.pickable.canbepicked = pickable
    inst.components.pickable.caninteractwith = pickable
    inst.components.pickable.numtoharvest = num
end

local function givewater(inst, picker)
	inst.AnimState:PlayAnimation("shack_watering")
	inst.AnimState:PushAnimation("idle_empty")
	picker.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	inst.components.pickable.numtoharvest = inst.components.pickable.numtoharvest - 1
	SetPickable(inst, false, inst.components.pickable.numtoharvest)
end

local function upwater(inst, item, giver)
	inst.AnimState:PushAnimation("idle_watering")
	inst.components.pickable.numtoharvest = inst.components.pickable.numtoharvest + 1
	SetPickable(inst, true, inst.components.pickable.numtoharvest)
end

local function getwater(inst, item, giver)
		inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/ocean_hit")
		inst:DoTaskInTime(1.1,upwater, item, giver)
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item:HasTag("fil_bucket") then
		if not inst.AnimState:IsCurrentAnimation("watering") or inst.AnimState:IsCurrentAnimation("idle_watering") or inst.AnimState:IsCurrentAnimation("shack_watering") then
			if not inst.components.pickable.caninteractwith then
				inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/tether_land")
				inst.AnimState:PlayAnimation("watering")
				inst:DoTaskInTime(1.1,getwater, item, giver)
			else
				giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
				OnRefuseItem(inst, giver, item)
			end
		else
			giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
			OnRefuseItem(inst, giver, item)
		end
	end
end

local function onsave(inst, data)
    if inst.components.pickable.numtoharvest > 0 then
        -- This isn't saved on the pickable component
        data.numtoharvest = inst.components.pickable.numtoharvest
    end
end

local function onload(inst, data)
	if data ~= nil then
		if data.numtoharvest ~= nil and data.numtoharvest > 0 then
			inst.components.pickable.numtoharvest = data.numtoharvest
			updatewellstate(inst)
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
	inst.IsGetWater = false
	
    inst:AddComponent("pickable")
    inst.components.pickable.caninteractwith = false
    inst.components.pickable.onpickedfn = givewater
    inst.components.pickable.product = "bucket_full"
    inst.components.pickable.numtoharvest = 0
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst.OnSave = onsave
    inst.OnLoad = onload
	
	return inst
end

return Prefab("hole",hole,assets),
Prefab("well",well,assets,prefabs)
