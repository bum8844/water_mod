local assets=
{
    Asset("ANIM", "anim/waterbarrle.zip"),-- В папке anim должен быть архив с чем то, с чем - узнаю потом
    Asset("ATLAS", "images/inventoryimages/waterbarrle.xml"),--Тупо картинки
    Asset("IMAGE", "images/inventoryimages/waterbarrle.tex"),--Это уже было 
}

--------------------------------

----------------------------------

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

local function onhit(inst, worker)
--print(test)
end

local function checkstatusdon(inst)
if inst.components.talker then
	inst.components.talker:Say("   Water Level "..inst.waterlevel.."/5.")
end
end

local function ShouldAcceptItem(inst, item, giver)
    --local thirst_support = GetModConfigData("thirst_support")
	if item.prefab == ("bucketfull") then
	   if not item:HasTag("FilledByRain") and not item:HasTag("FilledByDirty") then
            if inst.waterlevel<5 then
		        return true
	        else
		        return false
			end
		else
	        giver.components.talker:Say("I can`t put dirty water to barrle.")
	        return false
	    end
	end
	if item.prefab == ("bucket") then
	    if inst.waterlevel>0 then
		    return true
	    else
		    return false
	    end
    end
	if (item:HasTag("des_bucket") or item:HasTag("bottle")) then
	    if item.components.cwater.current >= 50 and item.components.cwater:GetRealSaltPercent() < 0.25 and item.components.cwater:GetRealBadPercent() < 0.25 then
             if inst.waterlevel<5 then
			     item.components.cwater:DoDelta(-50)
                 inst.waterlevel=inst.waterlevel+1
			 end
		elseif item.components.cwater.current < 50 and item.components.cwater:GetRealSaltPercent() < 0.25 and item.components.cwater:GetRealBadPercent() < 0.25 then
		     if inst.waterlevel > 0 then
                 item.components.cwater:DoDelta(50)
                 inst.waterlevel=inst.waterlevel-1
			 end
		elseif item.components.cwater:GetRealSaltPercent() > 0.25 then
		    giver.components.talker:Say("I can`t, water salt!")
		elseif item.components.cwater:GetRealBadPercent() > 0.25 then
		    giver.components.talker:Say("Water is too stale.")
		end
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == ("bucketfull") then
	   inst.waterlevel=inst.waterlevel+1
	   giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
	end
	if item.prefab == ("bucket") then
	   inst.waterlevel=inst.waterlevel-1
	   giver.components.inventory:GiveItem(SpawnPrefab("bucketfull")) 
	end
end

local function OnSave(inst, data)
    data.waterlevel = inst.waterlevel
end

local function OnLoad(inst, data)
    if data ~= nil and data.waterlevel ~= nil then
        inst.waterlevel = data.waterlevel
    end
end

local function checkburt(inst)
    if inst:HasTag("burnt") then
        inst:Remove()
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("water_onbuild")
    inst.AnimState:PushAnimation("idle", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/rain_meter_craft")
end

local function fn()--Да здравствуют функции, о которых я ничего не знаю!
    local inst = CreateEntity()
    inst.entity:AddTransform()-- Это наверное тэги, или свойства, или что нибудь в этом роде
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()-- вот до сюда
	
	inst.waterlevel = 0
	
	inst.MiniMapEntity:SetIcon("barrle.tex")

    MakeObstaclePhysics(inst, 0.66)

    inst:AddTag("structure")
	
	
	inst:AddTag("trader")
	

    inst.AnimState:SetBank("waterbarrle")
    inst.AnimState:SetBuild("waterbarrle")
    inst.AnimState:PlayAnimation("idle")
	inst.Transform:SetScale(0.68,0.68,0.68)
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 24
	inst.components.talker.font = TALKINGFONT
	inst.components.talker.offset = Vector3(0,-390,0)
	inst.components.talker.colour = Vector3(130/255, 80/255, 160/255, 1)

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:DoPeriodicTask(1, checkstatusdon)
	inst:DoPeriodicTask(1, checkburt)

    inst:AddComponent("inspectable")
	inst:ListenForEvent("onbuilt", onbuilt)
    inst:AddComponent("workable")
	inst:AddComponent("lootdropper")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	inst.components.trader.acceptnontradable = true
	
    MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst-- Возращаем inst, и заканчиваем нашу функцию
end

return Prefab( "common/waterbarrle", fn, assets, prefabs),
        MakePlacer( "common/waterbarrle_placer", "waterbarrle", "waterbarrle", "idle" ) -- заканчиваем файл, возращением нашего префаба с использованием пред функции
