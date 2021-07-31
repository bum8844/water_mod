local assets =
{
	Asset("ANIM", "anim/buckets.zip"),
	Asset("IMAGE", "images/inventoryimages/bucketfull.tex"),
	Asset("ATLAS", "images/inventoryimages/bucketfull.xml"),
	Asset("IMAGE", "images/inventoryimages/bucketdirt.tex"),
	Asset("ATLAS", "images/inventoryimages/bucketdirt.xml"),
	Asset("IMAGE", "images/inventoryimages/bucketrain.tex"),
	Asset("ATLAS", "images/inventoryimages/bucketrain.xml"),
}

local prefabs =
{

}

local function check(inst)
    local owner = inst.components.inventoryitem.owner
    if owner and owner:HasTag("fridge") and inst.components.temperature.current<=0 then
	    if owner.components.container then
			local bucketice = SpawnPrefab("bucketice")
			bucketice.save_owner = owner
		    inst:Remove()
		    bucketice.save_owner.components.container:GiveItem(SpawnPrefab("bucketice"))
        end		   
	end
end

local function SetName(inst)
    if inst:HasTag("FilledByRain") then
	    inst.components.named:SetName(STRINGS.BUCKETRAIN)
		inst.AnimState:PlayAnimation("rain")
		inst.components.inventoryitem:ChangeImageName("bucketrain")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/bucketrain.xml"
	elseif inst:HasTag("FilledByDirty") then
	    inst.components.named:SetName(STRINGS.BUCKETDIRTY)
		inst.AnimState:PlayAnimation("dirty")
		inst.components.inventoryitem:ChangeImageName("bucketdirt")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/bucketdirt.xml"
	elseif inst:HasTag("FilledByOasis") then
	    inst.components.named:SetName(STRINGS.BUCKETOASIS)
		inst.AnimState:PlayAnimation("full")
		inst.components.inventoryitem:ChangeImageName("bucketfull")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/bucketfull.xml"
	else
	    inst.components.named:SetName(STRINGS.NAMES.BUCKETFULL)
		inst.AnimState:PlayAnimation("full")
		inst.components.inventoryitem:ChangeImageName("bucketfull")
        inst.components.inventoryitem.atlasname = "images/inventoryimages/bucketfull.xml"
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


local function commonfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	

    inst.AnimState:SetBuild("buckets")
    inst.AnimState:SetBank("buckets")
    inst.AnimState:PlayAnimation("full")
	
	inst:AddTag("fili_drink")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddTag("show_spoilage")
	
	inst:AddTag("icebox_valid")
	
	inst:AddTag("bucket")
	
	inst:AddTag("frozen")
	
	inst:AddComponent("tradable")
	inst:AddComponent("temperature")
	
	inst:AddComponent("fili_cupdrink")
--	inst.cup_hp = 0
	inst.cup_hun = 0
--	inst.cup_san = 10
	inst.thirst = TUNING.DRINKCUP_WATER
	inst.cold_bonus = 5
--	inst.need_talk = "Agh.. it was raw water."
	inst.cup_backitem = "bucket"
	
	inst.components.temperature.current = 30
	
--	inst:DoPeriodicTask(1, check)
--	inst:DoPeriodicTask(0, SetName)
	
    inst:AddComponent("inventoryitem")

	inst.replica.inventoryitem:SetImage("bucketfull")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bucketfull.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function bucketdirt()
	local inst = commonfn()
	
	inst.AnimState:PlayAnimation("dirty")
	inst.components.inventoryitem:ChangeImageName("bucketdirt")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/bucketdirt.xml"
	
	inst.cup_hp = -5
	inst.cup_san = -10
	inst.need_talk = "I might get ill, but I have no choice."
	return inst
end
	
local function bucketfull()
	local inst = commonfn()
	
	inst.AnimState:PlayAnimation("full")
	inst.components.inventoryitem:ChangeImageName("bucketfull")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bucketfull.xml"
	
	inst.cup_hp = 0
	inst.cup_san = -10
	inst.need_talk = "Agh... it was raw water."
	return inst
end

local function bucketsalt()
	local inst = commonfn("salt")
end

return Prefab("bucketdirt", bucketdirt, assets),
	Prefab("bucketfull", bucketfull, assets)