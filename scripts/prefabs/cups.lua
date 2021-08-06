local assets =
{
	Asset("ANIM", "anim/cups.zip"),
	Asset("ANIM", "anim/swap_cup.zip" ),
	Asset("ANIM", "anim/fili_thirst_bage.zip" ),
	Asset("IMAGE", "images/inventoryimages/cup_water.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_water.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_empety.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_empety.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_coffe.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_coffe.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_beer.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_beer.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_monster.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_monster.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_red.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_red.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_monster.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_monster.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_tee.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_tee.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_strang.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_strang.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_carrot.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_carrot.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_cactus.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_cactus.xml"),
	Asset("IMAGE", "images/inventoryimages/cup_berry.tex"),
	Asset("ATLAS", "images/inventoryimages/cup_berry.xml"),
	Asset("IMAGE", "images/inventoryimages/soda1.tex"),
	Asset("ATLAS", "images/inventoryimages/soda1.xml"),
	Asset("IMAGE", "images/inventoryimages/soda2.tex"),
	Asset("ATLAS", "images/inventoryimages/soda2.xml"),
	Asset("IMAGE", "images/inventoryimages/soda3.tex"),
	Asset("ATLAS", "images/inventoryimages/soda3.xml"),
	Asset("IMAGE", "images/inventoryimages/soda4.tex"),
	Asset("ATLAS", "images/inventoryimages/soda4.xml"),
	
	Asset("SOUNDPACKAGE", "sound/fil_drink.fev"),	
    Asset("SOUND", "sound/fil_drink.fsb"),
}

local function OnFill(inst, from_object)
	local filleditem
	if from_object ~= nil then
		if from_object:HasTag("cleanwater") then
			filleditem = SpawnPrefab("cup_water")
		else
			filleditem = SpawnPrefab("cup_dirty")
		end
	else
		filleditem = SpawnPrefab("cup_dirty")
	end
	
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	
	if filleditem == nil then
		return false
	end

	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    if owner ~= nil then
        local container = owner.components.inventory or owner.components.container
        local item = container:RemoveItem(inst, false) or inst
        item:Remove()
        container:GiveItem(filleditem, nil, owner:GetPosition())
    else
        source.Transform:SetPosition(inst.Transform:GetWorldPosition())
        local item =
            inst.components.stackable ~= nil and
            inst.components.stackable:IsStack() and
            inst.components.stackable:Get() or
            inst
        item:Remove()
    end
	
	return true
end

local function OnSeason(inst, season)
    if inst ~= nil then
	    inst.season = season
	end
end

local function cup_water()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	
	inst:AddTag("fili_drink")

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("water")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 2
    inst.cup_hun = 3
    inst.cup_san = 0
	inst.thirst = TUNING.DRINKCUP_WATER
	inst.cold_bonus = 10
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_water")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_water.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_tea()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("green")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 7
    inst.cup_hun = 5
    inst.cup_san = 20
	inst.thirst = TUNING.DRINKCUP_TEA
	inst.cold_bonus = 10
	inst.warm_bonus = 15 
	 
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_tee")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_tee.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_strang()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("coffe")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = -2
    inst.cup_hun = -3
    inst.cup_san = -5
	inst.thirst = TUNING.DRINKCUP_WATER-5
	inst.need_talk = TUNING.POHMEL
	inst.spacial_bonus = "strang"
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_strang")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_strang.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_red()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("red")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 15
    inst.cup_hun = 10
    inst.cup_san = 35
	inst.thirst = TUNING.DRINKCUP_DRAGON
	inst.spacial_bonus = "red"
	inst.cold_bonus = 15
	inst.warm_bonus = 15
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)	
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_red")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_red.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_hibiscus()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("red")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 15
    inst.cup_hun = 10
    inst.cup_san = 22
	inst.thirst = TUNING.DRINKCUP_HIBISCUS
	inst.cold_bonus = 17
	inst.warm_bonus = 10
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_red")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_red.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_spider()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("coffe")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 0
    inst.cup_hun = 15
    inst.cup_san = -5
	inst.thirst = 40
	inst.cold_bonus = 20
	inst.spacial_bonus = "spider"
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")
	
	inst:AddComponent("selfstacker")

    inst.replica.inventoryitem:SetImage("cup_monster")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_monster.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_monster()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("coffe")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
	inst.thirst = TUNING.DRINKCUP_MONSTER
	inst.spacial_bonus = "monster"
	inst.cold_bonus = 5
	inst.warm_bonus = 5

	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")
	
	inst:AddComponent("selfstacker")

    inst.replica.inventoryitem:SetImage("cup_monster")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_monster.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_coffe()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("coffe")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 5
    inst.cup_hun = 5
    inst.cup_san = 19
	inst.thirst = TUNING.DRINKCUP_COFFE
	inst.spacial_bonus = "bustup"
	inst.cold_bonus = 10
	inst.warm_bonus = 25
	inst.need_talk = TUNING.STAR_BAKS
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_coffe")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_coffe.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_garbage()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("beer")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_beer")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_beer.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_beer()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("beer")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = -10
    inst.cup_hun = 10
    inst.cup_san = 55
	inst.thirst = TUNING.DRINKCUP_BEER
	inst.spacial_bonus = "alcahol"
	inst.cold_bonus = 20
	inst.warm_bonus = 23

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_beer")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_beer.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end
-- 벌꿀술
local function cup_mead()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("beer")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = -10
    inst.cup_hun = 10
    inst.cup_san = 55
	inst.thirst = TUNING.DRINKCUP_BEER
	inst.spacial_bonus = "alcahol"
	inst.cold_bonus = 20
	inst.warm_bonus = 23

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_beer")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_beer.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end
-- 와인
local function cup_wine()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("beer")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = -10
    inst.cup_hun = 10
    inst.cup_san = 55
	inst.thirst = TUNING.DRINKCUP_BEER
	inst.spacial_bonus = "alcahol"
	inst.cold_bonus = 20
	inst.warm_bonus = 23

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_berry")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_berry.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_abi()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("red")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
	inst.spacial_bonus = "ghost"
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_red")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_red.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_berry()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("berry")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 5
    inst.cup_hun = 18
    inst.cup_san = 15
	inst.thirst = TUNING.DRINK_BERRY
	inst.cold_bonus = 10
	inst.warm_bonus = 15

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_berry")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_berry.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_carrot()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("carrot")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 4
    inst.cup_hun = 23
    inst.cup_san = 7
	inst.thirst = TUNING.DRINK_CARROT
	inst.cold_bonus = 10
	inst.warm_bonus = 5

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_carrot")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_carrot.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_cactus()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("cactus")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 10
    inst.cup_hun = 10
    inst.cup_san = 40
	inst.thirst = TUNING.DRINK_CACTUS
	inst.cold_bonus = 17
	inst.warm_bonus = 7

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_cactus")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_cactus.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_honey()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("beer")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 12
    inst.cup_hun = 15
    inst.cup_san = 25
	inst.thirst = TUNING.DRINK_HONEY
	inst.cold_bonus = 7
	inst.warm_bonus = 23

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_beer")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_beer.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup_banana()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("carrot")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 7
    inst.cup_hun = 18
    inst.cup_san = 27
	inst.thirst = TUNING.DRINK_BANANA
	inst.cold_bonus = 24
	inst.warm_bonus = 0

    inst:AddTag("show_spoilage")
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_carrot")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_carrot.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function SetName(inst)
	if inst:HasTag("FilledByDirty") then
	    inst.components.named:SetName(STRINGS.CUP_WATERDIRTY)
	elseif inst:HasTag("FilledByOasis") then
	    inst.components.named:SetName(STRINGS.CUP_WATERRAW)
	else
	    inst.components.named:SetName(STRINGS.CUP_WATERDIRTY)
	end
end

local function OnSave(inst, data)
    if data ~= nil then
        if inst:HasTag("FilledByRain") then
	        data.watertag = "FilledByRain"
	    elseif inst:HasTag("FilledByDirty") then
	        data.watertag = "FilledByDirty"
	    elseif inst:HasTag("FilledByOasis") then
	        data.watertag = "FilledByOasis"
	    end
	end
end

local function OnLoad(inst, data)
    if data ~= nil and data.watertag then
	    inst:AddTag(data.watertag)
	end
end

local function cup_dirty()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	
	inst:AddTag("fili_drink")

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("water")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("named")
	
	inst:AddComponent("fili_cupdrink")
    inst.cup_hp = 0
    inst.cup_hun = 0
    inst.cup_san = -10
	inst.thirst = TUNING.DRINKCUP_WATER
	inst.cold_bonus = 5
	inst.need_talk = "Agh.. it was not clear water."
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	inst:DoPeriodicTask(0, SetName)
	
    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_water")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_water.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function cup()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

	inst:AddComponent("tradable")

    inst:AddTag("show_spoilage")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("cup_empety")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/cup_empety.xml"
	
	inst:AddComponent("fillable")
	inst.components.fillable.overrideonfillfn = OnFill
	inst.components.fillable.showoceanaction = true
	inst.components.fillable.acceptsoceanwater = true

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function soda1()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	
	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("soda1")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("soda1")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/soda1.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function soda2()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	
	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("soda2")
	
    inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("soda2")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/soda2.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function soda3()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	
	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("soda3")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("soda3")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/soda3.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function soda4()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	
	

    inst.AnimState:SetBuild("cups")
    inst.AnimState:SetBank("cups")
    inst.AnimState:PlayAnimation("soda4")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
	
	inst:WatchWorldState("season", OnSeason)
	OnSeason(inst, TheWorld.state.season)
	
    inst:AddTag("show_spoilage")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("soda4")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/soda4.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("cup", cup, assets),
Prefab("cup_abi", cup_abi, assets),
Prefab("cup_beer", cup_beer, assets),
Prefab("cup_wine", cup_wine, assets),
Prefab("cup_mead", cup_mead, assets),
Prefab("cup_coffe", cup_coffe, assets),
Prefab("cup_monster", cup_monster, assets),
Prefab("cup_spider", cup_spider, assets),
Prefab("cup_red", cup_red, assets),
Prefab("cup_strang", cup_strang, assets),
Prefab("cup_tee", cup_tea, assets),
Prefab("cup_water", cup_water, assets),
Prefab("cup_garbage", cup_garbage, assets),
Prefab("cup_hibiscus", cup_hibiscus, assets),
Prefab("cup_berry", cup_berry, assets),
Prefab("cup_carrot", cup_carrot, assets),
Prefab("cup_cactus", cup_cactus, assets),
Prefab("cup_honey", cup_honey, assets),
Prefab("cup_banana", cup_honey, assets),
Prefab("cup_dirty", cup_dirty, assets),
Prefab("soda1", soda1, assets),
Prefab("soda2", soda2, assets),
Prefab("soda3", soda3, assets),
Prefab("soda4", soda4, assets)