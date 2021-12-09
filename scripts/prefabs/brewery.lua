require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/brewery.zip"),
	Asset("ANIM", "anim/brewery_meter_dirty.zip"),
	Asset("ANIM", "anim/brewery_meter_water.zip"),
    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
}

local prefabs =
{
	"collapse_small",
}

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    --if not inst:HasTag("burnt") and inst.components.stewer.product ~= nil and inst.components.stewer:IsDone() then
        --inst.components.stewer:Harvest()
    --end
    --if inst.components.container ~= nil then
        --inst.components.container:DropEverything()
    --end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("hit")
		inst.AnimState:PushAnimation("idle")
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle")
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
        --inst.Light:Enable(false)
    end
end

local function onloadpostpass(inst, newents, data)
    if data and data.additems and inst.components.container then
        for i, itemname in ipairs(data.additems)do
            local ent = SpawnPrefab(itemname)
            inst.components.container:GiveItem( ent )
        end
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
	minimap:SetIcon("brewery.tex")
	
    MakeObstaclePhysics(inst, .4)
	
    inst.AnimState:SetBuild("brewery")
    inst.AnimState:SetBank("brewery")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","brewery_meter_dirty", "0")
    
	inst:AddTag("structure")
	inst:AddTag("brewery")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
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

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass
	
    return inst
end

return Prefab("brewery", fn, assets),
MakePlacer("brewery_placer", "brewery", "brewery", "idle")