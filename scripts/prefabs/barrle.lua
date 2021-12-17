require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/barrle.zip"),
	Asset("ANIM", "anim/barrle_meter_dirty.zip"),
	Asset("ANIM", "anim/barrle_meter_water.zip"),
}

local prefabs =
{
	"collapse_small",
}

local function ShouldAcceptItem(inst, item, giver)
	local i = item.prefab
	if i == ("bucket") or i == ("cup") or i == ("bucket_full") or i == ("cup_water") or i == ("messagebottleempty") or i == ("bottle_water") then
		return true
	end
end

local function OnRefuseItem(inst, giver, item)
	local i = item.prefab
	if i == ("bucket_dirty") or i == ("cup_dirty") then -- or i == (bottle_dirty) then
		giver.components.talker:Say("I can't put it in because the water is dirty.")
	elseif i == ("bucket_salt") or i == ("cup_salt") then -- or i == (bottle_salt) then
		giver.components.talker:Say("I can't put it in because the water is salty.")
	else
		giver.components.talker:Say("Can't get water with this.")
	end
end

local function OnBackEmptyitem(inst, giver, item)
	local i = item.prefab
	if i == ("bucket") then
		giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
	elseif i == ("cup") then
		giver.components.inventory:GiveItem(SpawnPrefab("cup"))
	elseif i == ("messagebottleempty") then
		giver.components.inventory:GiveItem(SpawnPrefab("messagebottleempty"))
	end
	if inst._barrle_waterlevel == 0 then
		giver.components.talker:Say("It's empty.")
	else
		giver.components.talker:Say("It's too little to get it!")
	end
end

local function OnBackFullitem(inst, giver, item)
	local i = item.prefab
	if i == ("bucket_full") then
		giver.components.inventory:GiveItem(SpawnPrefab("bucket_full"))
	elseif i == ("cup_water") then
		giver.components.inventory:GiveItem(SpawnPrefab("cup_water"))
	elseif i == ("bottle_water") then
		giver.components.inventory:GiveItem(SpawnPrefab("bottle_water"))
	end
	giver.components.talker:Say("There's too much water...")
end

local function OnGetItemFromPlayer(inst, giver, item)
	local sum = 0
	local i = item.prefab
	if inst._barrle_waterlevel >= 10 and i == ("bucket") then
		sum = inst._barrle_waterlevel - 10
		inst._barrle_waterlevel = sum
		giver.components.inventory:GiveItem(SpawnPrefab("bucket_full"))
		inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
		inst.AnimState:OverrideSymbol("swap","barrle_meter_water", tostring(sum))
	elseif inst._barrle_waterlevel >= 5 and i == ("messagebottleempty") then
		sum = inst._barrle_waterlevel - 5
		inst._barrle_waterlevel = sum
		giver.components.inventory:GiveItem(SpawnPrefab("bottle_water"))
		inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
		inst.AnimState:OverrideSymbol("swap","barrle_meter_water", tostring(sum))
	elseif inst._barrle_waterlevel >= 1 and i == ("cup") then
		sum = inst._barrle_waterlevel - 1
		inst._barrle_waterlevel = sum
		giver.components.inventory:GiveItem(SpawnPrefab("cup_water"))
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
		inst.AnimState:OverrideSymbol("swap","barrle_meter_water", tostring(sum))
	elseif i == ("bucket_full") then
		sum = inst._barrle_waterlevel + 10
		inst._barrle_waterlevel = sum
		if inst._barrle_waterlevel > inst._barrle_waterlevel_max then
			sum = inst._barrle_waterlevel - 10
			inst._barrle_waterlevel = sum
			OnBackFullitem(inst, giver, item)
		else
			giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
			inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
			inst.AnimState:OverrideSymbol("swap","barrle_meter_water", tostring(sum))
		end
	elseif item.prefab == ("bottle_water") then
		sum = inst._barrle_waterlevel + 5
		inst._barrle_waterlevel = sum
		if inst._barrle_waterlevel > inst._barrle_waterlevel_max then
			sum = inst._barrle_waterlevel - 5
			inst._barrle_waterlevel = sum
			OnBackFullitem(inst, giver, item)
		else
			giver.components.inventory:GiveItem(SpawnPrefab("messagebottleempty"))
			inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
			inst.AnimState:OverrideSymbol("swap","barrle_meter_water", tostring(sum))
		end
	elseif i == ("cup_water") then
		sum = inst._barrle_waterlevel + 1
		inst._barrle_waterlevel = sum
		if inst._barrle_waterlevel > inst._barrle_waterlevel_max then
			sum = inst._barrle_waterlevel - 1
			inst._barrle_waterlevel = sum
			OnBackFullitem(inst, giver, item)
		else
			giver.components.inventory:GiveItem(SpawnPrefab("cup"))
			inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
			inst.AnimState:OverrideSymbol("swap","barrle_meter_water", tostring(sum))
		end
	else
		OnBackEmptyitem(inst, giver, item)
	end
end

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("hit_idle")
		inst.AnimState:PushAnimation("idle")
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place",false)
	inst.SoundEmitter:PlaySound("dontstarve/common/rain_meter_craft")
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
	data._barrle_waterlevel = inst._barrle_waterlevel
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
	if data._barrle_waterlevel ~= 0 then
		inst._barrle_waterlevel = data._barrle_waterlevel
	end
end

local function onloadpostpass(inst, newents, data)
	if data._barrle_waterlevel ~= 0 then
	local sum = data._barrle_waterlevel
	inst.AnimState:OverrideSymbol("swap","barrle_meter_water", tostring(sum))
	end
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("barrle.tex")
	
    MakeObstaclePhysics(inst, .1)
	
    inst.AnimState:SetBuild("barrle")
    inst.AnimState:SetBank("barrle")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","barrle_meter_water", "0")
	
	inst:AddTag("structure")
	inst:AddTag("barrle")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst._barrle_waterlevel = 0
	inst._barrle_waterlevel_max = 20
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem

    inst.OnSave = onsave
    inst.OnLoad = onload
	inst.OnLoadPostPass = onloadpostpass
	
    return inst
end

return Prefab("barrle", fn, assets),
MakePlacer("barrle_placer", "barrle", "barrle", "idle")