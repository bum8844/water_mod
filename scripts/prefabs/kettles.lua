require "prefabutil"

local boiling = require("cooking")

local assets=
{
    Asset("ANIM", "anim/kettle.zip"),-- В папке anim должен быть архив с чем то, с чем - узнаю потом --foxy Ты делаешь анимации в спрайтере, суёшь их в exported А потом прописываешь анимацию сюда, стоб игра её загружала. Exported можно удалить, он тебе не нуженю Только место занимает
	Asset("ANIM", "anim/kettle_port.zip"),
	Asset("ANIM", "anim/campkettle.zip"),
    Asset("IMAGE", "images/water_images.tex"),
    Asset("ATLAS", "images/water_images.xml"),
	Asset("IMAGE", "images/inventoryimages/kettle_port.tex"),
	Asset("ATLAS", "images/inventoryimages/kettle_port.xml"),
	Asset("IMAGE", "images/inventoryimages/campkettle.tex"),
	Asset("ATLAS", "images/inventoryimages/campkettle.xml"),
}

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_big")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        if inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("closet")
            inst.AnimState:PushAnimation("cooking", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        elseif inst.components.stewer:IsDone() then
            inst.AnimState:PlayAnimation("open")
            inst.AnimState:PushAnimation("open", false)
        else
            if inst.components.container ~= nil and inst.components.container:IsOpen() then
                inst.components.container:Close()
                --onclose will trigger sfx already
            else
                inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
            end
            inst.AnimState:PlayAnimation("open")
            inst.AnimState:PushAnimation("open", false)
        end
    end
end

local function startcookfn(inst)
    if not inst:HasTag("burnt") then
		if inst.components.inventoryitem then
			inst.components.inventoryitem.canbepickedup = false
		end
        inst.AnimState:PlayAnimation("cooking", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
        inst.Light:Enable(true)			
    end
end

local function donecookfn(inst)
    if not inst:HasTag("burnt") then
	    if inst.components.inventoryitem then
			inst.components.inventoryitem.canbepickedup = true
		end
        inst.AnimState:PlayAnimation("cooking")
        inst.AnimState:PushAnimation(inst.kettledrinkanim,true)
        ShowProduct(inst)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish")
        inst.Light:Enable(false)
		if inst.components.container ~= nil and then-- 가지고 있는 아이템 확인해주는 코드 넣어주세요( == cup_water)
			inst.components.container.canbeopened = true
		end
    end
end

local function onopen(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_pre_loop")
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_open")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot", "snd")
    end
end

local function onclose(inst)
    if not inst:HasTag("burnt") then
        if not inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("idle_empty")
            inst.SoundEmitter:KillSound("snd")
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    end
end

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("ice") then
	    if inst.kettledrink == nil then
		    if inst.kettlecook ~= true then
		        return true
	        else
		        return false
	        end
	    end
	end
	if item.prefab == ("cup") then
	    if inst.kettledrink ~= nil then
		    if inst.kettlecook ~= true then
		        return true
	        else
		        return false
	        end
	    end
	end
	if item.prefab == ("cup_dirty") then
	    if inst.kettledrink == nil then
		    if inst.kettlecook ~= true then
		        return true
	        else
		        return false
	        end
	    end
	end
	if item.prefab == ("cup_water") then
	    if inst.kettledrink == nil then
		    if inst.kettlecook ~= true then
		        return true
	        else
		        return false
	        end
	    end
	end
		if item.prefab == ("bucket") then
	    if inst.kettledrink == "cup_water" then
		    if inst.kettlecook ~= true then
		        return true
	        else
		        return false
	        end
	    end
	end
end

--local function cook_done(inst)

	--inst.Light:Enable(false)
    --if inst.kettledrinkanim ~= "water" then
	--    inst.kettlewater = false
	--end
	--if inst.kettledrinkanim == "water" then
	    --inst.kettlewater = true
	--end
    --inst.kettlecook = false -- Чайник теперь не готовит
	--inst.AnimState:PlayAnimation(inst.kettledrinkanim,true) -- Задаём анимацию для чайника которую мы указали
	--inst.SoundEmitter:KillSound("snd") -- Убиваем звук готовки
	--inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish") -- Играем звук конца готовки
--end

--local function cook(inst)
    --if inst.components.inventoryitem then
	    --inst.components.inventoryitem.canbepickedup = false
	--end
	--inst.Light:Enable(true)
    --inst.kettlecook = true -- Чайник теперь в режиме готовки
	--inst:DoTaskInTime(inst.kettlecooktime, cook_done) -- Вызываем функцию конца готовки через время которое мы указали
    --inst.AnimState:PlayAnimation("cooking", true) -- Играем анимацию готовки
	--inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd") -- Играем звук готовки
--end

-- inst.kettlewater = true/fasle есть ли в чайнике вода для заварок
-- inst.kettlecook = true/false Если чайник сейчас готовит напиток
local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == ("bucketfull") then
	   if inst.kettlewater ~= true and inst.kettlecook ~= true then
			inst.kettlecooktime = TUNING.KETTLE_WATER
	        giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
	        inst.kettledrinkanim = "water"
			inst.kettledrink = "cup_water"
			cook(inst)
		end
	end
	if item.prefab == ("bucketdirt") then
		if inst.kettlewater ~= true and inst.kettlecook ~= true then
			inst.kettlecooktime = TUNING.KETTLE_WATER + 20
			giver.components.inventory:GiveItem(SpawnPrefab("bucket"))
			inst.kettledrinkanim = "water"
			inst.kettledrink = "cup_water"
			cook(inst)
		end
	end
	if item.prefab == ("cup_dirty") then
		if inst.kettlewater ~= true and inst.kettlecook ~= true then
			inst.kettlecooktime = TUNING.KETTLE_WATER + 20
			giver.components.inventory:GiveItem(SpawnPrefab("cup"))
			inst.kettledrinkanim = "water"
			inst.kettledrink = "cup_water"
			cook(inst)
		end
	end
	if item.prefab == ("cup_water") then
		if inst.kettlewater ~= true and inst.kettlecook ~= true then
			inst.kettlecooktime = TUNING.KETTLE_WATER
			giver.components.inventory:GiveItem(SpawnPrefab("cup"))
			inst.kettledrinkanim = "water"
			inst.kettledrink = "cup_water"
			cook(inst)
		end
	end
	if item.prefab == ("ice") then
		if inst.kettlewater ~= true and inst.kettlecook ~= true then
			inst.kettlecooktime = TUNING.KETTLE_WATER + 20
			inst.kettledrinkanim = "water"
			inst.kettledrink = "cup_water"
			cook(inst)
		end
	end
	if item.prefab == ("cup") then
	   if inst.kettlecook ~= true and inst.kettledrink ~= nil then
		    giver.components.inventory:GiveItem(SpawnPrefab(inst.kettledrink))
		    inst.AnimState:PlayAnimation("closet",true)
			inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
		    inst.kettledrink = nil
		    inst.kettledrinkanim = "closet"
			inst.savebrew = nil
		    inst.kettlewater = false
			if inst.components.container ~= nil then
				inst.components.container.canbeopened = false
			end
		end
	end
	if item.prefab == ("bucket") then
		if inst.kettlecook ~= true and inst.kettledrink == "cup_water" then
	        giver.components.inventory:GiveItem(SpawnPrefab("bucketfull"))
		    inst.AnimState:PlayAnimation("closet",true)
			inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
		    inst.kettledrink = nil
		    inst.kettledrinkanim = "closet"
			inst.savebrew = nil
		    inst.kettlewater = false
			if inst.components.container ~= nil then
				inst.components.container.canbeopened = false
			end
		end
	end
end

local function OnSave(inst, data)
    --Сохраняем все парамтеры чайника.
    data.kettlewater = inst.kettlewater
	data.kettlecooktime = inst.kettlecooktime
	data.kettledrink = inst.kettledrink
	data.kettledrinkanim = inst.kettledrinkanim
	data.kettlecook = inst.kettlecook
end

local function OnLoad(inst, data)
if data ~= nil then -- Подолнительная проверка даты, она нужна ибо иногда крашит
    if data.kettlewater ~= nil then -- Если не nil значит сохранение не пустое и скорее всго true. Загрузаемся
        inst.kettlewater = data.kettlewater
    end
    if data.kettlewater == nil then -- Если nil значит скорее всего это новый чайник стави что воды нет
        inst.kettlewater = false
    end
    if data.kettlecook ~= nil then -- Если не nil значит сохранение не пустое и скорее всго true. Загрузаемся
        inst.kettlecook = data.kettlecook
    end
    if data.kettlecook == nil then -- Если nil значит скорее всего это новый чайник стави что он не готовит щас.
        inst.kettlecook = false
    end
    if data.kettledrinkanim ~= nil then  -- Если не nil значит там напиток. Загрузаемся
        inst.kettledrinkanim = data.kettledrinkanim
    end
    inst.kettlecooktime = data.kettlecooktime -- Это в любом случаии загружаем даже если nil. Ибо nil это когда чайник пуст
    inst.kettledrink = data.kettledrink -- Это в любом случаии загружаем даже если nil. Ибо nil это когда чайник пуст
    if inst.kettlecook == true then -- Если мы загрузились и чайник готовит то мы вызываем готовку.
        cook(inst)
    end
    if inst.kettlecook ~= true and data.kettledrinkanim ~= nil then -- Есои мы загрузились и чайник не готовит скорее всего там уже есть напито ставит его анимацию
        inst.AnimState:PlayAnimation(inst.kettledrinkanim,true) -- Но только если есть наиток
    end
end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("onbuild")
    inst.AnimState:PushAnimation("closet", true)
    inst.SoundEmitter:PlaySound("dontstarve/common/craftable/cook_pot")
end

local function kettle()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddLight()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	inst.MiniMapEntity:SetIcon("kettle.tex")

    MakeObstaclePhysics(inst, 0.5)
	
    inst.Light:Enable(false)
    inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(235/255,62/255,12/255)

    inst:AddTag("structure")
	
	inst:AddTag("trader")

    inst.AnimState:SetBank("kettle")
    inst.AnimState:SetBuild("kettle")
    inst.AnimState:PlayAnimation("closet",true)

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("container")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
    inst.components.container.skipclosesnd = true
    inst.components.container.skipopensnd = true
	inst.components.container.canbeopened = false

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
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

	
    return inst-- Возращаем inst, и заканчиваем нашу функцию
end

local function SetOnPickupFn(inst)
    inst.Light:Enable(false)
end

local function SetOnDropFn(inst)
	inst.Light:Enable(false)
end


local function kettle_port()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddLight()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	MakeInventoryPhysics(inst)
	
	inst.MiniMapEntity:SetIcon("kettle.tex")

    --MakeObstaclePhysics(inst, 0.5)
	
    inst.Light:Enable(false)
    inst.Light:SetRadius(.6)
    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetColour(235/255,62/255,12/255)

    inst:AddTag("structure")
	
	inst:AddTag("trader")

    inst.AnimState:SetBank("kettle_port")
    inst.AnimState:SetBuild("kettle_port")
    inst.AnimState:PlayAnimation("closet",true)

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
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.acceptnontradable = true
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(SetOnDropFn)
	inst.components.inventoryitem:SetOnPickupFn(SetOnPickupFn)
	inst.components.inventoryitem.canbepickedup = true
	inst.components.inventoryitem.nobounce = true
	inst.replica.inventoryitem:SetImage("kettle_port")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kettle_port.xml"
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

	
    return inst-- Возращаем inst, и заканчиваем нашу функцию
end

local function onextinguish(inst)
    if inst.components.fueled ~= nil then
        inst.components.fueled:InitializeFuelLevel(0)
    end
end

local function ontakefuel(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
end

local function updatefuelrate(inst)
    inst.components.fueled.rate = TheWorld.state.israining and 1 + TUNING.CAMPFIRE_RAIN_RATE * TheWorld.state.precipitationrate or 1
end

local function onupdatefueled(inst)
    if inst.components.burnable ~= nil and inst.components.fueled ~= nil then
        updatefuelrate(inst)
        inst.components.burnable:SetFXLevel(inst.components.fueled:GetCurrentSection(), inst.components.fueled:GetSectionPercent())
    end
end

local PROPAGATE_RANGES = { 1, 2, 3, 4 }
local HEAT_OUTPUTS = { 2, 5, 5, 10 }
local function onfuelchange(newsection, oldsection, inst)
    if newsection <= 0 then
        inst.components.burnable:Extinguish()
        inst.AnimState:PlayAnimation("broken")
		inst.components.lootdropper:SpawnLootPrefab("charcoal")
		if inst.savebrew then
		    inst.components.lootdropper:SpawnLootPrefab(inst.savebrew)
		end
        RemovePhysicsColliders(inst)
        inst.components.fueled.accepting = false
        inst:RemoveComponent("workable")
		inst:RemoveComponent("cooker")
		inst:RemoveComponent("propagator")
		inst:RemoveTag("cooker")
        inst.persists = false
        inst:AddTag("NOCLICK")
        inst:DoTaskInTime(3, ErodeAway)
    else
        if not inst.components.burnable:IsBurning() then
            updatefuelrate(inst)
        end
        inst.components.burnable:SetFXLevel(newsection, inst.components.fueled:GetSectionPercent())
        inst.components.propagator.propagaterange = PROPAGATE_RANGES[newsection]
        inst.components.propagator.heatoutput = HEAT_OUTPUTS[newsection]
    end
end

local function campkettle()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddLight()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, 0.5)

    inst:AddTag("structure")
	
	inst:AddTag("trader")
	inst:AddTag("cooker")
	
    inst.AnimState:SetBank("campkettle")
    inst.AnimState:SetBuild("campkettle")
    inst.AnimState:PlayAnimation("closet",true)

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("workable")
	inst:AddComponent("lootdropper")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("propagator")
    inst:AddComponent("burnable")
    inst.components.burnable:AddBurnFX("campfirefire", Vector3())
	
    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.CAMPFIRE_FUEL_MAX
    inst.components.fueled.accepting = true
	inst.components.fueled:SetSections(4)
    inst.components.fueled:SetTakeFuelFn(ontakefuel)
    inst.components.fueled:SetUpdateFn(onupdatefueled)
    inst.components.fueled:SetSectionCallback(onfuelchange)
    inst.components.fueled:InitializeFuelLevel(TUNING.CAMPFIRE_FUEL_START)
	
	inst:AddComponent("cooker")
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	
	inst.components.burnable:Ignite()
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad
	
    return inst
end

return Prefab( "common/kettle", kettle, assets, prefabs),
       MakePlacer( "common/kettle_placer", "kettle", "kettle", "closet" ), -- заканчиваем файл, возращением нашего префаба с использованием пред функции
       Prefab( "common/kettle_port", kettle_port, assets, prefabs),
       MakePlacer( "common/kettle_port_placer", "kettle_port", "kettle_port", "closet" ),
       Prefab( "common/campkettle", campkettle, assets, prefabs),
       MakePlacer( "common/campkettle_placer", "campkettle", "campkettle", "closet" )