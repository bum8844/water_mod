local bucketstates =
{
	{ name = "full", health = 0, sanity = -10, hunger = 0, thirst = 15 },
	{ name = "dirty", health = -1, sanity = -10, hunger = 0, thirst = 15 },
	{ name = "salt", health = -3, sanity = -10, hunger = 0, thirst = -15 },
}

local prefabs =
{
	"bucket_ice",
}

local function oneaten(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local refund = SpawnPrefab("bucket")
	if eater ~= nil and eater.components.inventory ~= nil then
		eater.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
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
	
    local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		inst.entity:AddNetwork()

		MakeInventoryPhysics(inst)

		inst.AnimState:SetBuild("buckets")
		inst.AnimState:SetBank("buckets")
		inst.AnimState:PlayAnimation(name)

		inst:AddTag("drink")
		
		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end

		inst:AddComponent("inspectable")

		inst:AddTag("show_spoilage")
		
		if name ~= "salt" then
			if name == "dirty" then
				inst:AddTag("dirty")
			else
				inst:AddTag("clean")
			end
			inst:AddTag("icebox_valid")
		else
			inst:AddTag("salt")
		end

		inst:AddTag("bucket")
		inst:AddTag("watercan")

		inst:AddComponent("tradable")
		inst:AddComponent("temperature")
		
		--[[inst:AddComponent("drinkvalue")
		if inst:HasTag("dirty") then
			inst.components.drinkvalue:SetWaterType(WATERTYPE.DIRTY)
		elseif inst:HasTag("salt") then
			inst.components.drinkvalue:SetWaterType(WATERTYPE.SALT)
		elseif inst:HasTag("clean") then
			inst.components.drinkvalue:SetWaterType(WATERTYPE.CLEAN)
		end
		inst.components.drinkvalue:SetDrinkValue(TUNING.BUCKET_MAX_LEVEL)]]

		inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "bucket_"..name
		
		inst:AddComponent("water")
		inst.components.water.watervalue = 20
		inst.components.water.watertype = WATERTYPE.CLEAN
		inst.components.water:SetOnTakenFn(onuse)

		inst:AddComponent("watersource")
		inst.components.watersource.onusefn = onuse
		inst.components.watersource.override_fill_uses = 20

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
	
	return Prefab("bucket_"..data.name, fn, assets)
end

local buckets = {}

for k, v in pairs(bucketstates) do
	table.insert(buckets, MakeBucket(v))
end

return unpack(buckets)