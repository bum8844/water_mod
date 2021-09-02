local bucketstates =
{
	{ name = "full", health = 0, sanity = -10, hunger = 0, thirst = 15 },
	{ name = "dirt", health = -1, sanity = -10, hunger = 0, thirst = 15 },
	{ name = "salt", health = -3, sanity = -10, hunger = 0, thirst = 15 },
}

local function returnbucket(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local refund = SpawnPrefab("bucket")
	if eater ~= nil and eater.components.inventory ~= nil then
		eater.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
	else
		refund.Transform:SetPosition(x,y,z)
	end
end

local function MakeBucket(data)
	local assets =
		{
			Asset("ANIM", "anim/buckets.zip"),
			Asset("IMAGE", "images/inventoryimages/buckets.tex"),
			 Asset("ATLAS", "images/inventoryimages/buckets.xml"),
		}
	
	local anim = (data.name == "dirt" and "dirty") or (data.name == "salt" and "rain") or data.name
	
    local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		inst.entity:AddNetwork()

		MakeInventoryPhysics(inst)

		
		inst.AnimState:SetBuild("buckets")
		inst.AnimState:SetBank("buckets")
		inst.AnimState:PlayAnimation(anim)
			

		inst:AddTag("drink")
		
		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end

		inst:AddComponent("inspectable")

		inst:AddTag("show_spoilage")

		inst:AddTag("icebox_valid")

		inst:AddTag("bucket")
		inst:AddTag("watercan")

		inst:AddTag("frozen")

		inst:AddComponent("tradable")
		inst:AddComponent("temperature")

		inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/buckets.xml"
		inst.components.inventoryitem.imagename = "buckets-"..data.name
		
		inst:AddComponent("edible")
		inst.components.edible.thirst = data.thirst
		inst.components.edible.health = data.health
		inst.components.edible.sanity = data.sanity 
		inst.components.edible.hunger = data.hunger
		inst.components.edible:SetOnEatenFn(returnbucket)

		inst.components.temperature.current = 30

		--inst:DoPeriodicTask(1, check)
		--	inst:DoPeriodicTask(0, SetName)

		MakeHauntableLaunchAndSmash(inst)
		
		return inst
	end
	
	return Prefab("bucket"..data.name, fn, assets)
end

local buckets = {}

for k, v in pairs(bucketstates) do
	table.insert(buckets, MakeBucket(v))
end

return unpack(buckets)