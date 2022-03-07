local bucketstates =
{
	{ name = "clean", anim = "full", health = 0, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_TINY },
	{ name = "dirty", anim = "dirty", health = -TUNING.HEALING_TINY, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_TINY },
	{ name = "salty", anim = "salt", health = -TUNING.HEALING_SMALL, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_SALT },
}

local prefabs =
{
	"bucket_ice",
}

local function oneaten(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local uses = inst.components.finiteuses:GetUses()
	uses = uses - 2

	local item = nil
	if uses > 0 then
		item = SpawnPrefab(inst.prefab)
		item.components.finiteuses:SetUses(uses)
	else
		item = SpawnPrefab("bucket")
	end

	inst:Remove()

	if eater ~= nil and eater.components.inventory ~= nil and eater:HasTag("player") then
		eater.components.inventory:GiveItem(item)
	else
		item.Transform:SetPosition(x,y,z)
	end

	if eater:HasTag("player") then
		local old_moisture = eater.components.moisture.moisture
		eater.components.moisture.moisture = old_moisture + TUNING.BUcKET_DRINK_WAT
	end

end

local function onuse(inst)
	
	if inst:HasTag("wateringcan") then
		local refund = nil
		local uses = inst.components.finiteuses:GetUses()
		local watervalue = TUNING.CUP_MAX_LEVEL*2
		uses = uses - watervalue
		if uses > 0 then
			refund = SpawnPrefab(inst.prefab)
			refund.components.finiteuses:SetUses(uses)
		else
			refund = SpawnPrefab("bucket")
		end
		
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
	end
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
		
		inst:AddTag("bucket")
		inst:AddTag("watercan")

		inst:AddComponent("tradable")
		inst:AddComponent("temperature")
		
		inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "bucket_"..anim
		
		inst:AddComponent("water")
		inst.components.water.watervalue = TUNING.BUCKET_MAX_LEVEL
		inst.components.water.watertype = WATERTYPE[string.upper(name)]

		if name ~= "salty" then
			inst:AddTag("icebox_valid")

			inst:AddComponent("watersource")
			inst.components.watersource.onusefn = onuse
		end

		--finiteuses for managing how many times bucket can be drank.
		inst:AddComponent("finiteuses")
		inst.components.finiteuses:SetMaxUses(TUNING.BUCKET_MAX_LEVEL)
		inst.components.finiteuses:SetUses(TUNING.BUCKET_MAX_LEVEL)

		inst:AddComponent("edible")
		inst.components.edible.thirstvalue = data.thirst
		inst.components.edible.healthvalue = data.health
		inst.components.edible.sanityvalue = data.sanity
		inst.components.edible.hungervalue = data.hunger
		inst.components.edible:SetOnEatenFn(oneaten)

		inst.components.temperature.current = 30

		--inst:DoPeriodicTask(1, check)
		--inst:DoPeriodicTask(0, SetName)

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