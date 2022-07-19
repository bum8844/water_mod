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
		if not from_object:HasTag("cleanwater") then
			if from_object.components.waterlevel ~= nil then
				watertype = from_object.components.waterlevel.watertype
			elseif from_object.components.water ~= nil then
				watertype = from_object.components.water.watertype
			else
				watertype = "DIRTY"
			end
		else
			watertype = "CLEAN"
		end
		if from_object.components.stewer ~= nil and from_object.components.stewer.product ~= nil and from_object.components.stewer.product ~= "saltrock" then
			watertype = from_object.components.stewer.product
		end

		filleditem = SpawnPrefab("cup_"..string.lower(watertype))

		if from_object.components.waterlevel ~= nil then
			from_object.components.waterlevel:DoDelta(-TUNING.CUP_MAX_LEVEL)
		end
		if from_object.components.finiteuses ~= nil then
			local uses = from_object.components.finiteuses:GetUses()
			uses = uses - TUNING.CUP_MAX_LEVEL

			local refund = nil
			if uses > 0 then
				refund = SpawnPrefab(from_object.prefab)
				refund.components.finiteuses:SetUses(uses)
			else
				refund = SpawnPrefab("bucket")
			end

			if from_object ~= nil then
				from_object.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
			else
				inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
			end

			local owner = from_object.components.inventoryitem ~= nil and from_object.components.inventoryitem:GetGrandOwner() or nil
			if owner ~= nil then
				local container = owner.components.inventory or owner.components.container
				local item = container:RemoveItem(from_object, false) or from_object
				item:Remove()
				container:GiveItem(refund, nil, owner:GetPosition())
			else
				refund.Transform:SetPosition(from_object.Transform:GetWorldPosition())
				local item =
					from_object.components.stackable ~= nil and
					from_object.components.stackable:IsStack() and
					from_object.components.stackable:Get() or
					from_object
				item:Remove()
			end
		end
		if from_object.components.stewer ~= nil then
			if from_object.components.waterlevel.currentwater == 0 then
				from_object.components.stewer.product = nil
				from_object.components.stewer:Harvest()
			end
		end
	else
		filleditem = SpawnPrefab("cup_salt")
	end

	if from_object ~= nil then
		from_object.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	else
		filleditem.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	end
	
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
    inst:PushEvent("givewater",{inst = inst, from_object = from_object})
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