local bucketstates =
{
	{ name = "clean", anim = "full", health = TUNING.HEALING_TINY, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_TINY },
	{ name = "dirty", anim = "dirty", health = -TUNING.HEALING_TINY, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_TINY },
	{ name = "salty", anim = "salt", health = -TUNING.HEALING_SMALL, sanity = -TUNING.SANITY_SMALL, hunger = 0, thirst = TUNING.HYDRATION_SALT },
}

local prefabs =
{
	"bucket_ice",
}

local function oneaten(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	inst.components.finiteuses:Use(2)
	local uses = inst.components.finiteuses:GetUses()

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
		eater.components.moisture.moisture = old_moisture + TUNING.BUCKET_DRINK_WET
	end

end

local function onuse(inst)
	
	if inst:HasTag("wateringcan") then
		local refund = nil
		local uses = inst.components.finiteuses:Use(5)

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

local function Changeitem(inst)
	if inst.components.temperature.current <= 0 then
		local refund = SpawnPrefab("bucket_ice")
		inst.AnimState:PlayAnimation("turn_to_ice")
		inst.AnimState:PushAnimation("ice")
		inst:DoTaskInTime(2,function(inst)
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
		end)
	end
end

local function OnTake(inst, taker)
    if inst.components.water.watervalue >= 15 then
    	taker.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
    elseif inst.components.water.watervalue >= 5 then
    	taker.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	else
    	taker.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
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

	local function DisplayNameFn(inst)
		return subfmt( STRINGS.NAMES["BUCKET_FULL"],{drink=STRINGS.NAMES[string.upper(name)]})
	end
	
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

		inst:AddTag("pre-preparedfood")
		inst:AddTag("drink")

		inst.displaynamefn = DisplayNameFn

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
		inst.replica.inventoryitem:SetImage("bucket_"..name)
		inst.components.inventoryitem.atlasname = "images/tea_inventoryitem.xml"
		inst.components.inventoryitem.imagename = "bucket_"..anim
		
		inst:AddComponent("water")
		inst.components.water:SetWaterType(WATERTYPE[string.upper(name)])
		inst.components.water:SetOnTakenFn(OnTake)

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

		if name == "clean" then
			inst:AddComponent("temperature")
		    inst.components.temperature.mintemp = TUNING.BUCKET_FULL_MINETEMP
		    inst.components.temperature.maxtemp = TUNING.BUCKET_FULL_MAXTEMP
		    inst.components.temperature.current = TUNING.WATER_STARTING_TEMP
			inst:DoPeriodicTask(1, Changeitem)
		end

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