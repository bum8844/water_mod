local assets =
{
    Asset("ANIM", "anim/mr_beefalo.zip"),
}

local prefabs =
{
    "goldnugget",
}

local greet_phrases =
{
    "Hello!",
    "Nice day for qusts!",
    "Nice day ye?",
    "Tree Guardian! Joke.",
    "You look the charly?"
}

local goodbye_phrases =
{
    "I wait you in its place!",
    "Okey i am just wait you late!.",
    "See late.",
    "Don`t starve pal!"
}

local qust_give =
{
    "soda1",
    "soda2",
    "soda3",
    "soda4",
    "bun",
    "bread"
}

local find_item =
{
    "fish",
    "redgem",
    "green_cap",
    "beewax"
}

local function OnSave(inst, data)
    data.quest_complite = inst.quest_complite
	inst.findmyiem = find_item[math.random(#find_item)]
end

local function OnLoad(inst, data)
    if data ~= nil and data.quest_complite ~= nil then
        inst.quest_complite = data.quest_complite
    end
end

local function OnActivate(inst, doer)
   if not inst.activatedonce and inst.findmyiem == "" then
       inst.activatedonce = false
       inst.AnimState:PlayAnimation("dial_loop",false)
       inst.AnimState:PushAnimation("idle",true)
	   inst.components.talker:Say("Sorry i am don`t have qusts! You complite "..inst.quest_complite.." Qusts!")
	   inst.components.activatable.inactive = true
   end
   if not inst.activatedonce and inst.findmyiem ~= "" then
       inst.activatedonce = false
	   inst.AnimState:PlayAnimation("dial_loop",false)
       inst.AnimState:PushAnimation("idle",true)
	   inst.components.talker:Say("You can help me? Find me "..STRINGS.NAMES[inst.findmyiem].."!")
	   inst.components.activatable.inactive = true
    end
end

--STRINGS.NAMES.findmyiem

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == (inst.findmyiem) then
		return true
	else
		return false
	end
end

local function OnGetItemFromPlayer(inst, giver, item)
    inst.qust_give = qust_give[math.random(#qust_give)]
	inst.quest_complite=inst.quest_complite+1
	inst.components.talker:Say("Nice! In to day its all! You complite "..inst.quest_complite.." Qusts!")
	inst.AnimState:PlayAnimation("snap")
    inst.AnimState:PushAnimation("idle", true)
	giver.components.inventory:GiveItem(SpawnPrefab(inst.qust_give))
	inst.findmyiem = ""
end

local function OnIsNight(inst, isnight)
    if isnight then
        inst.components.trader:Disable()
        inst.AnimState:PlayAnimation("disappear")
    else
        inst.components.trader:Enable()
        inst.AnimState:PlayAnimation("disappear")
        inst.AnimState:PushAnimation("idle", true)
    end
end

local function goodbyeplayer(inst)
    if inst.components.talker then
        inst.AnimState:PlayAnimation("dial_loop",false)
        inst.AnimState:PushAnimation("idle",true)
        
        inst.components.talker:Say(goodbye_phrases[math.random(#goodbye_phrases)])
    end
end

local function greetplayer(inst, player)
    if inst.components.talker then
        inst.AnimState:PlayAnimation("dial_loop",false)
        inst.AnimState:PushAnimation("idle",true)
        inst.components.talker:Say(greet_phrases[math.random(#greet_phrases)])
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	inst.quest_complite = 0
	inst.findmyiem = find_item[math.random(#find_item)]

    MakeObstaclePhysics(inst, 2, .5)

    inst.MiniMapEntity:SetIcon("pigking.png")
    inst.MiniMapEntity:SetPriority(1)

    inst.DynamicShadow:SetSize(10, 5)

    inst:AddTag("king")
    inst.AnimState:SetBank("mr_beefalo")
    inst.AnimState:SetBuild("mr_beefalo")
    inst.AnimState:PlayAnimation("idle", true)

    inst:AddTag("trader")

    inst.entity:SetPristine()
	
	inst:AddComponent("talker")
    inst.components.talker.fontsize = 32
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(130/255, 80/255, 160/255, 1)
    inst.components.talker.offset = Vector3(0,-1000,0)

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.deleteitemonaccept = false
	inst.components.trader.acceptnontradable = true
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(4, 5)
    inst.components.playerprox:SetOnPlayerNear(greetplayer)
    inst.components.playerprox:SetOnPlayerFar(goodbyeplayer)
	
	inst:AddComponent("activatable")    
    inst.components.activatable.OnActivate = OnActivate
    inst.components.activatable.inactive = true
    inst.components.activatable.quickaction = true
	
	inst:AddComponent("lootdropper")
	
	inst:ListenForEvent("activateresurrection", inst.Remove)

    inst:WatchWorldState("isnight", OnIsNight)
    OnIsNight(inst, TheWorld.state.isnight)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    inst.components.hauntable:SetOnHauntFn(function(inst, haunter)
        if inst.components.trader and inst.components.trader.enabled then
            OnRefuseItem(inst)
            return true
        end
        return false
    end)
	
	inst.OnSave = OnSave
	inst.OnLoad = OnLoad

    return inst
end

return Prefab("mr_beefalo", fn, assets, prefabs)
