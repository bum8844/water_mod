local assets=
{
    Asset("ANIM", "anim/waterbarrle.zip"),-- В папке anim должен быть архив с чем то, с чем - узнаю потом
    Asset("ATLAS", "images/inventoryimages/waterbarrle.xml"),--Тупо картинки
    Asset("IMAGE", "images/inventoryimages/waterbarrle.tex"),--Это уже было 
}

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("bucketfull") then
        if inst.waterlevel<5 then
		    return true
	    else
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

local function fn()--Да здравствуют функции, о которых я ничего не знаю!
    local inst = CreateEntity()
    inst.entity:AddTransform()-- Это наверное тэги, или свойства, или что нибудь в этом роде
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()-- вот до сюда
	
	inst.waterlevel = 0

    MakeInventoryPhysics(inst)
	
	
	inst:AddTag("trader")
	
	inst:AddTag("bundle")
	

    inst.AnimState:SetBank("waterbarrle")
    inst.AnimState:SetBuild("waterbarrle")
    inst.AnimState:PlayAnimation("idle")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	
    inst:AddComponent("bundlemaker")
    inst.components.bundlemaker:SetBundlingPrefabs(containerprefab, name)
    inst.components.bundlemaker:SetOnStartBundlingFn(OnStartBundling)
	
    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_empety")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_empety.xml"

    MakeHauntableLaunchAndSmash(inst)
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst-- Возращаем inst, и заканчиваем нашу функцию
end

return Prefab( "thermos", fn, assets, prefabs),