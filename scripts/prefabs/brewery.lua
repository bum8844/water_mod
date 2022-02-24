require "prefabutil"

local prepareagedrink = require("prepareagedrink")

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
    --[[if not inst:HasTag("burnt") and inst.components.stewer.product ~= nil and inst.components.stewer:IsDone() then
        --inst.components.stewer:Harvest()
    --end]]
	if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        if inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("hit_cooking")
            inst.AnimState:PushAnimation("cooking_loop", true)
            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
        elseif inst.components.stewer:IsDone() then
            inst.AnimState:PlayAnimation("hit_full")
            inst.AnimState:PushAnimation("idle_full", false)
        else
            if inst.components.container ~= nil and inst.components.container:IsOpen() then
                inst.components.container:Close()
                --onclose will trigger sfx already
            else
                inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
            end
            inst.AnimState:PlayAnimation("hit_empty")
            inst.AnimState:PushAnimation("idle_empty", false)
        end
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle_empty", false)
end

local function startcookfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.watersource.available = false
        inst.components.waterlevel.accepting = false
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
    end
end

local function SetProductSymbol(inst, product, overridebuild)
    local build = overridebuild or "kettle_drink"
    local overridesymbol = product
    inst.AnimState:OverrideSymbol("swap_food", build, "cup_"..overridesymbol)
end

local function spoilfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.stewer.product = inst.components.stewer.spoiledproduct
        SetProductSymbol(inst, inst.components.stewer.product)
    end
end

local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        local product = inst.components.stewer.product
        SetProductSymbol(inst, product, IsModCookingProduct(inst.prefab, product) and prepareagedrink[product] == nil and product or nil)
    end
end

local function donecookfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.watersource.available = true
        inst.AnimState:PlayAnimation("cooking_pst")
        inst.AnimState:PushAnimation("idle_full", false)
        ShowProduct(inst)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish")
    end
end

local function continuedonefn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("idle_full")
        ShowProduct(inst)
    end
end

local function continuecookfn(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("cooking_loop", true)
        inst.SoundEmitter:KillSound("snd")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
    end
end

local function harvestfn(inst)
    if not inst:HasTag("burnt") then
        inst.components.waterlevel:DoDelta(-TUNING.BREWERY_MAX_LEVEL)
        inst.components.waterlevel.accepting = true
        inst.components.stewer.product = nil
        inst.AnimState:PlayAnimation("idle_empty")
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    end
end


local function getstatus(inst)
    return (inst:HasTag("burnt") and "BURNT")
        or (inst.components.stewer:IsDone() and "DONE")
        or (not inst.components.stewer:IsCooking() and "EMPTY")
        or (inst.components.stewer:GetTimeToCook() > 15 and "FERMENTING_LONG")
        or "FERMENTING_SHORT"
end

local function onloadpostpass(inst, newents, data)
    if data and data.additems and inst.components.container then
        for i, itemname in ipairs(data.additems)do
            local ent = SpawnPrefab(itemname)
            inst.components.container:GiveItem( ent )
        end
    end
end

local function OnDepleted(inst)
    inst.components.watersource.available = false
    inst.components.propagator.acceptsheat = true
end

local function OnTakeWater(inst, watervalue)
    if watervalue >= 15 then
        inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    elseif watervalue >= 5 then
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
    else
        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    end
end

local function OnSectionChange(new, old, inst)
    if inst._waterlevel ~= new then
        inst._waterlevel = new
        inst.AnimState:OverrideSymbol("swap", "brewery_meter_water", tostring(new))
    end
end

local function Add_Componet(inst)
    inst.components.stewer.onstartcooking = startcookfn
    inst.components.stewer.oncontinuecooking = continuecookfn
    inst.components.stewer.oncontinuedone = continuedonefn
    inst.components.stewer.ondonecooking = donecookfn
    inst.components.stewer.onharvest = harvestfn
    --inst.components.stewer.onspoil = spoilfn
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
    if not inst:HasTag("stewer") then
        inst:AddComponent("stewer")
        Add_Componet(inst)
    end
    if not inst:HasTag("burnt") then
        if not inst.components.stewer:IsCooking() then
            inst.AnimState:PlayAnimation("idle_empty")
            inst.SoundEmitter:KillSound("snd")
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
    end
end

local function oncheckready_water(inst, from_object)
    if not inst:HasTag("stewer")then
        inst:AddComponent("stewer")
        Add_Componet(inst)
    end
    if inst.components.container ~= nil and inst.components.waterlevel ~= nil then
        if not inst.components.container:IsOpen() and inst.components.container:IsFull() and inst.components.waterlevel.currentwater ~= 0 then
            inst:AddTag("readytocook")
        elseif inst.components.container:IsOpen() and (inst.components.waterlevel.currentwater < 0 or inst.components.waterlevel.currentwater == 0) then
            inst:RemoveTag("stewer")
            inst:RemoveComponent("stewer")
        else
            inst:RemoveTag("readytocook")
        end
    end
end

local function oncheckready(inst)
    if not inst:HasTag("stewer")then
        inst:AddComponent("stewer")
        Add_Componet(inst)
    end
    if inst.components.container ~= nil and
        inst.components.waterlevel ~= nil and
        not inst.components.container:IsOpen() and
        inst.components.container:IsFull() and
        inst.components.waterlevel.currentwater ~= 0 then
        inst:AddTag("readytocook")
    end
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil then
        if data.burnt then
        inst.components.burnable.onburnt(inst)
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
    inst.AnimState:PlayAnimation("idle_empty")
	inst.AnimState:OverrideSymbol("swap","brewery_meter_water", "0")
    
	inst:AddTag("structure")
	inst:AddTag("kettle")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst._waterlevel = 0

    inst:AddComponent("waterlevel")
    inst.components.waterlevel:SetDepletedFn(OnDepleted)
    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
    inst.components.waterlevel.maxwater = TUNING.BREWERY_MAX_LEVEL
    inst.components.waterlevel.accepting = true
    inst.components.waterlevel:SetSections(TUNING.BREWERY_MAX_LEVEL)
    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
    inst.components.waterlevel:InitializeWaterLevel(0)

    inst:AddComponent("watersource")
    inst.components.watersource.available = false

    inst:AddComponent("boil")

    inst:AddComponent("stewer")
	inst.components.stewer.onstartcooking = startcookfn
	inst.components.stewer.oncontinuecooking = continuecookfn
	inst.components.stewer.oncontinuedone = continuedonefn
	inst.components.stewer.ondonecooking = donecookfn
	inst.components.stewer.onharvest = harvestfn
	--inst.components.stewer.onspoil = spoilfn

	inst:AddComponent("container")
	inst.components.container:WidgetSetup("kettle")
	inst.components.container.onopenfn = onopen
	inst.components.container.onclosefn = onclose
	inst.components.container.skipclosesnd = true
	inst.components.container.skipopensnd = true
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("itemget", oncheckready_water)
    inst:ListenForEvent("onclose", oncheckready)
    inst:ListenForEvent("takewater", oncheckready)
	
	MakeHauntableWork(inst)
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass
	
    return inst
end

return Prefab("brewery", fn, assets),
MakePlacer("brewery_placer", "brewery", "brewery", "idle_empty")