require "prefabutil"--Не махин, а машин machine

local assets =
{
    Asset("ANIM", "anim/mahine.zip"),
	Asset("IMAGE", "images/inventoryimages/water_mahine.tex"),
	Asset("ATLAS", "images/inventoryimages/water_mahine.xml")
}

local prefabs =
{
    "collapse_small",
    "nightmarefuel",
}

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("bucket") then
	    if inst.waterlevel>=1 then
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
end

local function water_mahinedestroyed(inst, worker)
    inst.components.lootdropper:DropLoot()
	
    local x, y, z = inst.Transform:GetWorldPosition()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(x, y, z)
    fx:SetMaterial("stone")
    inst:Remove()
end

local function onextinguish(inst)
    if inst.components.fueled ~= nil then
        inst.components.fueled:InitializeFuelLevel(0)
    end
end


local function water_mahinebuilt(inst)
    inst.AnimState:PlayAnimation("open")
    inst.AnimState:PushAnimation("open", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
end

local function AddWater(inst)
	if not inst.components.fueled:IsEmpty() then
	inst:RemoveEventCallback("animover", AddWater)

	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	
	inst.components.fueled:StartConsuming()
	inst.AnimState:PlayAnimation("work", true)
	end
	if inst.waterlevel<5 then
	    inst.waterlevel=inst.waterlevel+0.5
	end
end

local function fuelupdatefn(inst, dt)
	if inst.components.fueled then
		inst.components.fueled.rate = 1
	end
	
	if inst.components.fueled:IsEmpty() then
	inst.AnimState:PlayAnimation("open", true)
	end
	
	local fueled = inst.components.fueled
    fueled.rate = TheWorld.state.israining and 1 + TUNING.FIREPIT_RAIN_RATE * TheWorld.state.precipitationrate or 1
				
end

local function ontakefuelfn(inst)
	inst.AnimState:PlayAnimation("open")
	inst.AnimState:PushAnimation("work", true)
	
	inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
	inst.components.fueled:StartConsuming()
end

local function fueltaskfn(inst)
	if not inst.components.fueled:IsEmpty() then
	inst.AnimState:PlayAnimation("open")
	inst.AnimState:PushAnimation("work", true)
	
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst.components.fueled:StopConsuming()
	inst:ListenForEvent("animover", AddWater)
	end
end

local function OnFuelEmpty(inst)
	inst.AnimState:PlayAnimation("open", true)
end

local function getstatus(inst)
	local fuelstatusid = inst.components.fueled:GetCurrentSection()
	if fuelstatusid == 0 then
		return "Empty"
	elseif fuelstatusid <= 4 then
		local t = {"Low","Medium","Many","Full"}
		return t[fuelstatusid]
	end

	
end

local function checkstatusdon(inst)
	--inst.components.talker:Say("Fuel - "..getstatus(inst))
	if inst.components.talker and inst.components.fueled then
	inst.components.talker:Say("Energy - "..(inst.components.fueled:GetPercent()*100).."%. Water Level "..inst.waterlevel.."/5 .")
	
	local fuelstatusid = inst.components.fueled:GetCurrentSection()
	if fuelstatusid == 0 then
	inst.components.talker.colour = Vector3(.9, .4, .4, 1)
	end
	
	if fuelstatusid == 1 then
	inst.components.talker.colour = Vector3(.2, .2, .2, 1)
	end
	
	if fuelstatusid == 2 then
	inst.components.talker.colour = Vector3(.4, .4, .4, 1)
	end
	
	if fuelstatusid == 3 then
	inst.components.talker.colour = Vector3(.5, .4, .4, 1)
	end
	
	if fuelstatusid == 4 then
	inst.components.talker.colour = Vector3(.3, .4, .2, 1)
	end
	
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

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	inst.waterlevel = 0

    MakeObstaclePhysics(inst, .3)

    --inst.MiniMapEntity:SetIcon("water_mahine.png")
    --inst.MiniMapEntity:SetPriority(1)

	inst.AnimState:SetBank("mahine")
	inst.AnimState:SetBuild("mahine")
	inst.AnimState:PlayAnimation("open", true)

    inst:AddTag("radiationmachine")
    inst:AddTag("structure")
    inst:AddTag("wildfireprotected")

    inst.entity:SetPristine()
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 24
	inst.components.talker.font = TALKINGFONT
	inst.components.talker.offset = Vector3(0,-340,0)
	

    if not TheWorld.ismastersim then
        return inst
    end
	inst:DoPeriodicTask(1, checkstatusdon)
    -------------------------
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(8)
    inst.components.workable:SetOnFinishCallback(water_mahinedestroyed)
    -------------------------
	inst:AddComponent("fueled")
	inst.components.fueled.maxfuel = 100
	inst.components.fueled.accepting = true
	inst.components.fueled:SetSections(4)
	inst.components.fueled.ontakefuelfn = ontakefuelfn
	inst.components.fueled:SetUpdateFn(fuelupdatefn)
	inst.components.fueled:SetDepletedFn(OnFuelEmpty)
	inst.components.fueled:SetSectionCallback(
		function(section)
			if section == 0 then
				inst.AnimState:PlayAnimation("open", true)
				if inst.fueltask ~= nil then
				inst.fueltask:Cancel()
				inst.fueltask = nil
				end
			else
				if inst.fueltask == nil then
				inst.AnimState:PlayAnimation("work", true)
				inst.fueltask = inst:DoPeriodicTask(25, fueltaskfn)
				end
			end
			
		end
	)
    inst.components.fueled:InitializeFuelLevel(0)
	inst.components.fueled:StartConsuming()
    -----------------------------
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.getstatus = getstatus
	
	inst:ListenForEvent("onbuilt", water_mahinebuilt)
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst
end

return Prefab( "common/water_mahine", fn, assets, prefabs),
	MakePlacer( "common/water_mahine_placer", "mahine", "mahine", "open" )