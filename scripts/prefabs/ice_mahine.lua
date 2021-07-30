require "prefabutil"--Не махин, а машин machine

local assets =
{
    Asset("ANIM", "anim/mahine.zip"),
	Asset("IMAGE", "images/inventoryimages/ice_mahine.tex"),
	Asset("ATLAS", "images/inventoryimages/ice_mahine.xml")
}

local prefabs =
{
    "collapse_small",
    "nightmarefuel",
}

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("bucket") then
	    if inst.waterlevel>0 then
		    return true
	    else
		    return false
	    end
    end
	if item.prefab == ("ice") or item.prefab == ("bucketice") or item.prefab == ("icehat") then
	    if inst.icelevel<3 then
		    return true
	    else
		    return false
	    end
    end
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == ("bucket") then
	   inst.waterlevel=inst.waterlevel-1
	   giver.components.inventory:GiveItem(SpawnPrefab("bucketfull"))
	end
	if item.prefab == ("ice") then
	   inst.icelevel=inst.icelevel+1
	end
	if item.prefab == ("bucketice") or item.prefab == ("icehat") then
	   inst.icelevel=inst.icelevel+3
	end
end

local function water_mahinedestroyed(inst, worker)
    inst.components.lootdropper:DropLoot()
	
    local x, y, z = inst.Transform:GetWorldPosition()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(x, y, z)
    fx:SetMaterial("stone")
    inst:Remove()
end


local function water_mahinebuilt(inst)
    inst.AnimState:PlayAnimation("Fizer_0")
    inst.AnimState:PushAnimation("Fizer_0", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
end

local function AddWater(inst)
    if inst.icelevel == 3 and inst.working == true then
	    inst.icelevel = 0
	    inst.working = false
	    SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	    inst.AnimState:PlayAnimation("Fizer_0", true)
	    if inst.waterlevel<3 then
	       inst.waterlevel=inst.waterlevel+1
	    end
	end
end

local function checkstatusdon(inst)
	if inst.components.talker then
	    inst.components.talker:Say("Ice - "..inst.icelevel.."/3 Water Level "..inst.waterlevel.."/3 .")
    end
end

local function IceChecker(inst)
    if inst.icelevel == 0 and inst.working ~= true then
	    inst.AnimState:PlayAnimation("Fizer_0", true)
	end
	if inst.icelevel == 1 and inst.working ~= true then
	    inst.AnimState:PlayAnimation("Fizer_1", true)
	end
	if inst.icelevel == 2 and inst.working ~= true then
	    inst.AnimState:PlayAnimation("Fizer_2", true)
	end
	if inst.icelevel == 3 and inst.working ~= true then
	    inst.AnimState:PlayAnimation("Fizer_work", true)
	    inst.working = true
	end
end

local function OnSave(inst, data)
    data.waterlevel = inst.waterlevel
	data.icelevel = inst.icelevel
end

local function OnLoad(inst, data)
    if data ~= nil and data.waterlevel ~= nil then
        inst.waterlevel = data.waterlevel
    end
    if data ~= nil and data.icelevel ~= nil then
        inst.icelevel = data.icelevel
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	inst.waterlevel = 0
	inst.icelevel = 0
	inst.working = false

    MakeObstaclePhysics(inst, .3)

    --inst.MiniMapEntity:SetIcon("water_mahine.png")
    --inst.MiniMapEntity:SetPriority(1)

	inst.AnimState:SetBank("mahine")
	inst.AnimState:SetBuild("mahine")
	inst.AnimState:PlayAnimation("Fizer_0", true)

    inst:AddTag("radiationmachine")
    inst:AddTag("structure")
    inst:AddTag("wildfireprotected")

    inst.entity:SetPristine()
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 24
	inst.components.talker.font = TALKINGFONT
	inst.components.talker.offset = Vector3(0,-340,0)
	inst.components.talker.colour = Vector3(130/255, 80/255, 160/255, 1)
	

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:DoPeriodicTask(1, checkstatusdon)
	inst:DoPeriodicTask(0, IceChecker)
	
	inst:AddComponent("inspectable")
	
    -------------------------
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(8)
    inst.components.workable:SetOnFinishCallback(water_mahinedestroyed)
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.deleteitemonaccept = false
	inst.components.trader.acceptnontradable = true
	
	inst:ListenForEvent("onbuilt", water_mahinebuilt)
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad
	
	inst:DoPeriodicTask(35, AddWater)

    return inst
end

return Prefab( "common/ice_mahine", fn, assets, prefabs),
	MakePlacer( "common/ice_mahine_placer", "mahine", "mahine", "Fizer_0" )