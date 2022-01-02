require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/barrel.zip"),
	Asset("ANIM", "anim/barrel_meter_water.zip"),
}

local prefabs =
{
	"collapse_small",
}

--[[local function ShouldAcceptItem(inst, item, giver)
	if item:HasTag("clean") or item:HasTag("fil_bucket") or item:HasTag("fil_bottle") or item:HasTag("fil_cup") then
		return true
	end
end

local function OnRefuseItem(inst, giver, item)
	if item:HasTag("dirty") then
		giver.components.talker:Say("I can't put it in because the water is dirty.")
	elseif item:HasTag("salt") then
		giver.components.talker:Say("I can't put it in because the water is salty.")
	elseif inst._barrel_waterlevel == 0 then
		giver.components.talker:Say("It's empty.")
	else
		giver.components.talker:Say("Can't get water with this.")
	end
end

local function OnBackEmptyitem(inst, giver, item)
	if item:HasTag("fil_bucket") then
		giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
	elseif item:HasTag("fil_cup") then
		giver.components.inventory:GiveItem(SpawnPrefab("cup"))
	else
		giver.components.inventory:GiveItem(SpawnPrefab("messagebottleempty"))
	end
	if inst._barrel_waterlevel == 0 then
		giver.components.talker:Say("It's empty.")
	else
		giver.components.talker:Say("It's too little to get it!")
	end
end

local function OnBackFullitem(inst, giver, item)
	if item:HasTag("bucket") then
		giver.components.inventory:GiveItem(SpawnPrefab("bucket_full"))
	elseif item:HasTag("preparedrink_cup") then
		giver.components.inventory:GiveItem(SpawnPrefab("cup_water"))
	else
		giver.components.inventory:GiveItem(SpawnPrefab("bottle_water"))
	end
	giver.components.talker:Say("There's too much water...")
end

local function OnGetItemFromPlayer(inst, giver, item)
	local sum = inst._barrel_waterlevel
	if sum >= 10 and item:HasTag("fil_bucket") then
		inst._barrel_waterlevel = sum - 10
		giver.components.inventory:GiveItem(SpawnPrefab("bucket_full"))
	elseif sum >= 5 and item:HasTag("fil_bottle") then
		inst._barrel_waterlevel = sum - 5
		giver.components.inventory:GiveItem(SpawnPrefab("bottle_water"))
	elseif sum >= 1 and item:HasTag("fil_cup") then
		inst._barrel_waterlevel = sum - 1
		giver.components.inventory:GiveItem(SpawnPrefab("cup_water"))
	elseif item:HasTag("bucket") then
		if sum + 10 > inst._barrel_waterlevel_max then
			OnBackFullitem(inst, giver, item)
		else
			inst._barrel_waterlevel = sum + 10
			giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
		end
	elseif item:HasTag("preparedrink_bottle") then
		if sum + 5 > inst._barrel_waterlevel_max then
			OnBackFullitem(inst, giver, item)
		else
			inst._barrel_waterlevel = sum + 5
			giver.components.inventory:GiveItem(SpawnPrefab("messagebottleempty"))
		end
	elseif item:HasTag("preparedrink_cup") then
		if sum + 1 > inst._barrel_waterlevel_max then
			OnBackFullitem(inst, giver, item)
		else
			inst._barrel_waterlevel = sum + 1
			giver.components.inventory:GiveItem(SpawnPrefab("cup"))
		end
		WaterLevelChange(inst, giver, item)
	else
		OnBackEmptyitem(inst, giver, item)
	end
end
]]--

local function WaterLevelChange(inst, giver, item)
	if item:HasTag("fil_bucket") or item:HasTag("bucket") then
		inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	elseif item:HasTag("fil_bottle") or item:HasTag("preparedrink_bottle") then
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	else
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	end
	local sum = inst._barrel_waterlevel
	inst.AnimState:OverrideSymbol("swap","barrel_meter_water", tostring(sum))
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
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function onloadpostpass(inst, newents, data)
	if data.waterlevel ~= 0 then
	local sum = data.waterlevel
	inst.AnimState:OverrideSymbol("swap","barrel_meter_water", tostring(sum))
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
	minimap:SetIcon("barrel.tex")
	
    MakeObstaclePhysics(inst, .1)
	
    inst.AnimState:SetBuild("barrel")
    inst.AnimState:SetBank("barrel")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","barrel_meter_water", "0")
	
	inst:AddTag("structure")
	inst:AddTag("barrel")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	--inst._barrel_waterlevel = 0
	--inst._barrel_waterlevel_max = 20
	
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
	
	inst:AddComponent("waterlevel")
	inst.components.waterlevel:SetLevel(0)
	inst.components.waterlevel:SetMaxLevel(20)
	inst.components.waterlevel:SetLevelCallback(WaterLevelChange)
	--[[inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.onrefuse = OnRefuseItem]]--

    inst.OnSave = onsave
    inst.OnLoad = onload
	inst.OnLoadPostPass = onloadpostpass
	
    return inst
end

return Prefab("barrel", fn, assets),
MakePlacer("barrel_placer", "barrel", "barrel", "idle")