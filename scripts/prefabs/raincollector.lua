local assets =
{
    Asset("ANIM", "anim/raincollector.zip"),
}

local function SetState(inst)

	HideAllBucket(inst)

    local isfrozen = inst.components.wateringtool:IsFrozen()
    local watertype = inst.components.wateringtool:GetWater()
    local wateranim = watertype ~= nil and 
    	( watertype == WATERTYPE.CLEAN and (
    		isfrozen and "mounted_buckets_ice" or "mounted_buckets_full"
    		) or isfrozen and "mounted_buckets_ice_dirty" or "mounted_buckets_dirty" 
    	) or "mounted_buckets_empty"

    local sound = watertype ~= nil and
    	(
    		watertype == WATERTYPE.CLEAN and "dontstarve/creatures/pengull/splash" or ""
    	) 
    	or "dontstarve/common/dust_blowaway"

    inst.AnimState:Show(wateranim)
    if sound ~= "" and not init then
        inst.SoundEmitter:PlaySound(sound)
    end
end

local function getstatus(inst)
    return inst.components.wateringtool:IsFull() and 
    (
        inst.components.wateringtool:IsFrozen() and
        ( 
            inst.components.wateringtool:IsDirty() and "DIRTY_ICE" or "FULL_ICE" 
        )
        or inst.components.wateringtool:IsDirty() and "DIRTY" or "FULL"
    )
    or "EMPTY"
end

local function SetBucket(inst)
	local bucket = inst._bucket

	if bucket ~= inst._bucket_old then
		if bucket ~= "" then
			bucket = bucket.."_"
		end
	    inst.AnimState:OverrideSymbol("mounted_buckets_empty", "buckets_swap", "buckets_"..bucket.."empty")
	    inst.AnimState:OverrideSymbol("mounted_buckets_full", "buckets_swap", "buckets_"..bucket.."clean")
	    inst.AnimState:OverrideSymbol("mounted_buckets_ice", "buckets_swap", "buckets_"..bucket.."clean_ice")
	    inst.AnimState:OverrideSymbol("mounted_buckets_dirty", "buckets_swap", "buckets_"..bucket.."dirty")
	    inst.AnimState:OverrideSymbol("mounted_buckets_ice_dirty", "buckets_swap", "buckets_"..bucket.."dirty_ice")
	end
end

local function OnSave(inst)
	data.bucket = inst._bucket
	data.bucket_old = inst._bucket_old
end

local function OnLoad(inst, data)
	if data and data.bucket then
		inst._bucket = inst.bucket
		inst._bucket_old = data.bucket_old or nil
		SetBucket(inst)
		SetState(inst)
	end
end

local function fn()

	local inst = CreateEntity()

	inst.entity:AddNetwork()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()

	inst.AnimState:SetBuild("raincollector")
    inst.AnimState:SetBank("raincollector")
    inst.AnimState:PlayAnimation("idle")

    HideAllBucket(inst)

    inst:AddComponent("wateringtool")
    inst.components.wateringtool.setstatesfn = SetState

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst._bucket = nil
    inst._bucket_old = nil

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad
end

local function ondeploy(inst, pt, deployer)
    local raincollector = SpawnPrefab("raincollector")
    if raincollector ~= nil then
        raincollector.Physics:SetCollides(false)
        raincollector.Physics:Teleport(pt.x, 0, pt.z)
        raincollector.Physics:SetCollides(true)
        raincollector.AnimState:PlayAnimation("place")
        raincollector.AnimState:PushAnimation("idle", false)
        raincollector.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/place")
        inst:Remove()
        PreventCharacterCollisionsWithPlacedObjects(raincollector)
    end
end

local function fn_item()
	local inst = CreateEntity()

	inst.entity:AddNetwork()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()

	inst.AnimState:SetBuild("raincollector")
    inst.AnimState:SetBank("raincollector")
    inst.AnimState:PlayAnimation("item")

    inst:AddTag("portableitem")

    MakeInventoryFloatable(inst, "med", 0.1, 0.8)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.replica.inventoryitem:SetImage("raincollector_item")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "raincollector_item"

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
end

return Prefab(),
	   MakePlacer(),
	   Prefab()