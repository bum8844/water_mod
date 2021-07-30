require "prefabutil"
require "recipe"
require "modutil"

local assets=
{
    Asset("ANIM", "anim/waterbarrle.zip"),
	Asset("ATLAS", "images/inventoryimages/beer_barrle.xml"),
}

local function SetMode(inst, mode)
    if mode == "container" then
	    inst.components.container.canbeopened = true
		inst.components.trader.enabled = false
	elseif mode == "trader" then
	    inst.components.container.canbeopened = false
		inst.components.trader.enabled = true
	end
end

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	if inst.components.container ~= nil then
		inst.components.container:DropEverything()
	end
	local fx = SpawnPrefab("collapse_big")
	fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	fx:SetMaterial("wood")
	inst:Remove()
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("beer_onbuild")
    inst.AnimState:PushAnimation("beer", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/winter_meter_craft")
	--inst.components.lootdropper:SpawnLootPrefab("barrelbook")
end

local function StartingCooking(inst, drink, time)
    inst.components.timer:StartTimer(drink, time*60)
	inst.active_timer = drink
	inst.components.container:Close()
	inst.components.container.slots = {}
	SetMode(inst, "trader")
end

local function OnTimerDone(inst, data)
    inst.active_timer = nil
    inst.drink_name = data.name
	inst.waterlevel = 0
    if data.name == "Beer" then
	    inst.drink_count = 4
	end
	SetMode(inst, "trader")
end

local function TalkStatus(inst)
if inst.components.talker then
    if inst.waterlevel<3 and inst.drink_count < 1 and inst.drink_name == nil then
	    inst.components.talker:Say("  Water "..inst.waterlevel.."/3 . Add water!")
	end
    if inst.components.timer and inst.components.timer:GetTimeLeft(inst.active_timer) then
	    inst.components.talker:Say("  Time: "..math.floor(inst.components.timer:GetTimeLeft(inst.active_timer)/60).." minutes left")
	end
	if inst.drink_count > 0 then
	    inst.components.talker:Say("  "..inst.drink_name.." "..inst.drink_count)
	end
end
end

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("bucketfull") then
        if inst.waterlevel<3 then
		    return true
	    else
		    return false
	    end
	end
	if item.prefab == ("cup") then
        if inst.drink_name and inst.drink_count > 0 then
		    return true
	    else
		    return false
	    end
	end
	if inst.waterlevel<3 and (item:HasTag("des_bucket") or item:HasTag("bottle")) then
	    if item.components.cwater.current >= 50 and item.components.cwater:GetRealSaltPercent() < 0.25 and item.components.cwater:GetRealBadPercent() < 0.25 then
             item.components.cwater:DoDelta(-50)
             inst.waterlevel=inst.waterlevel+1
		elseif item.components.cwater.current < 50 then
		    giver.components.talker:Say("I can`t, need more water!")
		elseif item.components.cwater:GetRealSaltPercent() > 0.25 then
		    giver.components.talker:Say("I can`t, water salt!")
		elseif item.components.cwater:GetRealBadPercent() > 0.25 then
		    giver.components.talker:Say("Water is too stale.")
		end
	end
	if item:HasTag("bottle") and inst.drink_name and inst.drink_count > 0 and inst.waterlevel == 3 then
		inst.drink_count = inst.drink_count-1
		item.components.cwater.special_drink = string.lower(inst.drink_name)
	    item.components.cwater.current = 50
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == ("bucketfull") then
	    inst.waterlevel=inst.waterlevel+1
	    giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
	end
	if item.prefab == ("cup") then
	    inst.drink_count = inst.drink_count-1
		giver.components.inventory:GiveItem(SpawnPrefab("cup_"..string.lower(inst.drink_name)))
		if inst.drink_count == 0 then
		    SetMode(inst, "container")
		end
	end
end

local function CheckRecipes(inst)
    if inst.components.container:Has("kyno_wheat", 6) then
		StartingCooking(inst, "Beer", 10)
	end
    if inst.components.container:HasWithTag("barrel_berries_group", 6) then
		StartingCooking(inst, "Wine", 10)
	end
end

local function OnLoadComplite(inst)
    if inst.active_timer then
	    SetMode(inst, "trader")
	else
	    SetMode(inst, "container")
	end
	if inst.waterlevel < 3 then
	    SetMode(inst, "trader")
	end
end

local function OnSave(inst, data)
    if data then
	    if inst.waterlevel then
		    data.waterlevel = inst.waterlevel
		end
		if inst.drink_name then
		    data.drink_name = inst.drink_name
		end
		if inst.drink_count then
		    data.drink_count = inst.drink_count
		end
		if inst.active_timer then
		    data.active_timer = inst.active_timer
		end
	end
end

local function OnLoad(inst, data)
    if data then
	    if data.waterlevel then
		    inst.waterlevel = data.waterlevel
		end
		if data.drink_name then
		    inst.drink_name = data.drink_name
		end
		if data.drink_count then
		    inst.drink_count = data.drink_count
		end
		if data.active_timer then
		    inst.active_timer = data.active_timer
		end
		OnLoadComplite(inst)
	end
end

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	inst.drink_name = nil
	inst.active_timer = nil
	inst.drink_count = 0
    inst.waterlevel = 0
    inst.wait = TUNING.BEER_WAIT

    MakeObstaclePhysics(inst, 0.66)

    inst:AddTag("structure")
	
	inst:AddTag("trader")
	inst:AddTag("beer_barrel_container")
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 24
	inst.components.talker.font = TALKINGFONT
	inst.components.talker.offset = Vector3(0,-390,0)
	inst.components.talker.colour = Vector3(130/255, 80/255, 160/255, 1)
	inst:DoPeriodicTask(1, TalkStatus)

    inst.AnimState:SetBank("waterbarrle")
    inst.AnimState:SetBuild("waterbarrle")
    inst.AnimState:PlayAnimation("beer")
	inst.Transform:SetScale(0.68,0.68,0.68)

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst:ListenForEvent("onbuilt", onbuilt)
    inst:AddComponent("workable")
	inst:AddComponent("lootdropper")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.acceptnontradable = true
	
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("beer_barrle")
	inst:AddComponent("timer")
	inst:ListenForEvent("timerdone", OnTimerDone)
	SetMode(inst, "trader")
	inst:DoPeriodicTask(0, CheckRecipes)
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst
end

return Prefab( "common/beer_barrle", fn, assets, prefabs),
        MakePlacer( "common/beer_barrle_placer", "waterbarrle", "waterbarrle", "beer" ) -- заканчиваем файл, возращением нашего префаба с использованием пред функции
