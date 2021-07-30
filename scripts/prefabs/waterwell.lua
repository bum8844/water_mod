require "prefabutil"
require "recipe"
require "modutil"

local assets=
{
    Asset("ANIM", "anim/waterwell.zip"),
    Asset("ATLAS", "images/inventoryimages/waterwell.xml"),
    Asset("IMAGE", "images/inventoryimages/waterwell.tex"),
	Asset("ATLAS", "images/watertab.xml"),
    Asset("IMAGE", "images/watertab.tex"),
}

local function onhammered(inst, worker)
	if inst.components.container ~= nil then
		inst.components.container:DropEverything()
	end
	local fx = SpawnPrefab("collapse_big")
	SpawnPrefab("boards").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("boards").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("cutstone").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("cutstone").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("hole2").Transform:SetPosition(inst.Transform:GetWorldPosition())
	fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	fx:SetMaterial("wood")
	inst:Remove()
end

local function onhit(inst, worker)
end

local function turnon(inst)
    if not inst.AnimState:IsCurrentAnimation("onwinter") then --А этим мы проверяем какая анимация играеться. Если зимняя, то не принимаем ничегошеньки.
	    inst.AnimState:PlayAnimation("water")
	    inst.AnimState:PushAnimation("idle_full", true)
    end
end

local function turnoff(inst)
    if not inst.AnimState:IsCurrentAnimation("onwinter") then
	    inst.AnimState:PlayAnimation("reset_to_idle")
	    inst.AnimState:PushAnimation("idle_empty", true)
    end
end

local function ShouldAcceptItem(inst, item, giver)
	if item.prefab == ("bucket") and inst.AnimState:IsCurrentAnimation("idle_full") then 
		return true
	else
		return false
    end
end

local function OnGetItemFromPlayer(inst, giver, item)
	if item.prefab == ("bucket") then
		giver.components.inventory:GiveItem(SpawnPrefab("bucketfull"))
		giver.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
		inst.components.machine:TurnOff() --этим мы возврощаем наш колодец в исходное положение.
	end
end

local function OnSnowLevel(inst, snowlevel)
    if snowlevel > .02 then
        if not inst.frozen then
            inst.frozen = true
            inst.SoundEmitter:PlaySound("dontstarve/winter/pondfreeze")
            inst.AnimState:PlayAnimation("onwinter", false)
        end
    elseif inst.frozen then
        inst.frozen = false
		inst.AnimState:PlayAnimation("idle_empty", true)
    elseif inst.frozen == nil then
        inst.frozen = false
		inst.AnimState:PlayAnimation("idle_empty", true)
    end
end


local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()
	
	inst.MiniMapEntity:SetIcon("waterwell.tex")

    MakeObstaclePhysics(inst, 1)

    inst:AddTag("structure")
	

    inst.AnimState:SetBank("waterwell")
    inst.AnimState:SetBuild("waterwell")
    inst.AnimState:PlayAnimation("idle_empty", true) --
	inst.Transform:SetScale(1.25, 1.25, 1.25)

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ShouldAcceptItem)
	inst.components.trader.onaccept = OnGetItemFromPlayer
	--А это очень хитрожопая реализация идеи
	inst:AddComponent("machine")
    inst.components.machine.turnonfn = turnon
    inst.components.machine.turnofffn = turnoff
    inst.components.machine.cooldowntime = TUNING.WELL_COOLDOWN --Задержка между использованиями в секундах
	
    inst:AddComponent("inspectable")
    inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:WatchWorldState("snowlevel", OnSnowLevel)
	OnSnowLevel(inst, TheWorld.state.snowlevel)

    return inst
end

return Prefab( "common/waterwell", fn, assets, prefabs)