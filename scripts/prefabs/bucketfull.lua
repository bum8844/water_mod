local bucketstates =
{
	{ name = "clean", anim = "full", health = 0, sanity = -10, hunger = 0, thirst = 15 },
	{ name = "dirty", anim = "dirty", health = -1, sanity = -10, hunger = 0, thirst = 15 },
	{ name = "salty", anim = "salt", health = -3, sanity = -10, hunger = 0, thirst = -15 },
}

local prefabs =
{
	"bucket_ice",
}

local function oneaten(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local item = nil
	inst.components.finiteuses:Use(1)

	if eater ~= nil and eater.components.inventory ~= nil then
		eater.components.inventory:GiveItem(inst, nil, Vector3(x, y, z))
	else
		refund.Transform:SetPosition(x,y,z)
	end
end

local function onuse(inst)
	local refund = SpawnPrefab("bucket")
	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil

	if owner ~= nil then
		local container = owner.components.inventory or owner.components.container
		local item = container:RemoveItem(inst, false) or inst
		item:Remove()
		container:GiveItem(refund, nil, owner:GetPosition())
	else
		refund.Transform:SetPosition(inst.Transform:GetWorldPosition())
		local item =
			inst.components.stackable ~= nil and
			inst.components.stackable:IsStack() and
			inst.components.stackable:Get() or
			inst
		item:Remove()
	end
	
	return true
end


local function MakeBucket(data)
	local assets =
		{
			Asset("ANIM", "anim/buckets.zip"),
			Asset("IMAGE", "images/tea_inventoryitem.tex"),
			Asset("ATLAS", "images/tea_inventoryitem.xml"),
			Asset("ATLAS_BUILD", "images/tea_inventoryitem.xml", 256),
		}
	
	local name = data.name
	local anim = data.anim
	
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
		
		if name ~= "salt" then
			inst:AddTag("icebox_valid")
		end

		inst:AddTag("bucket")
		inst:AddTag("watercan")

		inst:AddComponent("tradable")
		inst:AddComponent("temperature")
		
		inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "bucket_"..anim
		
		inst:AddComponent("water")
		inst.components.water.watervalue = 20
		inst.components.water.watertype = WATERTYPE[string.upper(name)]
		inst.components.water:SetOnTakenFn(onuse)

		inst:AddComponent("watersource")
		inst.components.watersource.onusefn = onuse
		inst.components.watersource.override_fill_uses = 20

		inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(5)
		inst.components.finiteuses:SetOnFinished(onuse)

		inst:AddComponent("edible")
		inst.components.edible.thirst = data.thirst
		inst.components.edible.health = data.health
		inst.components.edible.sanity = data.sanity
		inst.components.edible.hunger = data.hunger
		inst.components.edible:SetOnEatenFn(oneaten)

		inst.components.temperature.current = 30

		--inst:DoPeriodicTask(1, check)
		--	inst:DoPeriodicTask(0, SetName)

		MakeHauntableLaunchAndSmash(inst)
		
		return inst
	end
	
	return Prefab("bucket_"..name, fn, assets)
end

local buckets = {}

for k, v in pairs(bucketstates) do
	table.insert(buckets, MakeBucket(v))
end

return unpack(buckets)