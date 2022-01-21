local assets =
{
	Asset("ANIM", "anim/kettle_drink.zip"),
	Asset("IMAGE", "images/tea_inventoryitem.tex"),
	Asset("ATLAS", "images/tea_inventoryitem.xml"),
}

local prefabs =
{
	"preparedrink",
}

-- 컴포넌트를 바닐라의 것으로 교체하면서, 기존에 component에서 자체적으로 처리하던 태그 부분을 overrideonfillfn으로 가져왔습니다.
local function OnFill(inst, from_object)
	local filleditem, watertype = nil, nil
	if from_object ~= nil then
		if from_object.components.waterlevel ~= nil then
			watertype = from_object.components.waterlevel.watertype
		elseif from_object.components.water ~= nil then
			watertype = from_objcet.components.water.watertype
		end
		filleditem = SpawnPrefab("bucket_"..string.lower(watertype))
	else
		filleditem = SpawnPrefab("bucket_salty")
	end

	inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	
	if filleditem == nil then
		return false
	end

	if from_object.components.waterlevel ~= nil then
		from_object.components.waterlevel:DoDelta(2)
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


local function FillByRain(inst)
	local filleditem
    inst.rainfilling = 0
	inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	if inst.components.stackable.stacksize > 1 then
	    filleditem = SpawnPrefab("cup_water")
		filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst.components.stackable:Get():Remove()
	else
	    filleditem = SpawnPrefab("cup_water")
		filleditem.Transform:SetPosition(inst.Transform:GetWorldPosition())
		inst:Remove()
	end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("kettle_drink")
    inst.AnimState:SetBank("kettle_drink")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:OverrideSymbol("swap","kettle_drink","cup_empty")

    inst.entity:SetPristine()
	
	inst:AddTag("fil_cup")
	inst:AddTag("emptiy")

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.rainfilling = 0
	inst:DoPeriodicTask(1, function()
	    local owner = inst.components.inventoryitem.owner
		if TheWorld.state.israining and owner == nil then
		    inst.rainfilling = inst.rainfilling + 1
		end
		if inst.rainfilling >= 45 then
		    FillByRain(inst)
		end
	end)
	
    inst:AddComponent("fillable")
	inst.components.fillable.overrideonfillfn = OnFill
	inst.components.fillable.showoceanaction = true
	inst.components.fillable.acceptsoceanwater = true
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALL*2)
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")

    inst:AddComponent("inventoryitem")
    inst.replica.inventoryitem:SetImage("cup")
	inst.components.inventoryitem.atlasname= "images/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "cup_empty"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("cup", fn, assets)