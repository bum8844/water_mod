-- bum: Bucket-O-Poop now returns an Empty Bucket when depleted(uncompatible with those mods that makes everything stackable)
AddPrefabPostInit("fertilizer", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	inst:DoTaskInTime(0, function()	
        inst.components.finiteuses:SetOnFinished(function(inst) RefundItem(inst, "bucket") end)
	end)
end)

local function MakeBottle(inst)

	inst.entity:AddSoundEmitter()
	
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

			filleditem = SpawnPrefab("bottle_"..string.lower(watertype == "CLEAN" and "water" or watertype))

			if from_object.components.waterlevel ~= nil then
				local dodelta = from_object.components.waterlevel.currentwater < TUNING.BOTTLE_MAX_LEVEL and from_object.components.waterlevel.currentwater or TUNING.BOTTLE_MAX_LEVEL
				from_object.components.waterlevel:DoDelta(-dodelta)
				filleditem.components.finiteuses:SetUses(dodelta)
			end
			if from_object.components.finiteuses ~= nil then
				local uses = from_object.components.finiteuses:GetUses()

				if uses > TUNING.BOTTLE_MAX_LEVEL then
					uses = uses - TUNING.BOTTLE_MAX_LEVEL
					filleditem.components.finiteuses:SetUses(TUNING.BOTTLE_MAX_LEVEL)
				else
					filleditem.components.finiteuses:SetUses(uses)
					uses = 0
				end

				local refund = nil
				if uses > 0 then
					refund = SpawnPrefab(from_object.prefab)
					refund.components.finiteuses:SetUses(uses)
				else
					refund = SpawnPrefab("bucket")
				end

				filleditem.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")

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
			filleditem = SpawnPrefab("bottle_salt")
		end

		if from_object ~= nil then
			from_object.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
		else
			filleditem.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
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
	inst:AddTag("fil_bottle")
	inst:AddTag("emptiy")
	
	inst:AddComponent("tradable")

	inst:AddComponent("fillable")
	inst.components.fillable.overrideonfillfn = OnFill
	inst.components.fillable.showoceanaction = true
	inst.components.fillable.acceptsoceanwater = true
end

AddPrefabPostInit("messagebottleempty", MakeBottle)

local function OnGivenItemWater(inst, giver, item, ...)
	if item.prefab == "bucket_ice" then
		inst:PushEvent("onacceptfighttribute", { tributer = giver, trigger = "freeze" })
	elseif inst.components.trader.onaccept_old ~= nil then
		return inst.components.trader.onaccept_old(inst, giver, item, ...)
	end
end

AddPrefabPostInit("antlion", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		inst:ListenForEvent("isfightingdirty", OnIsFightingDirty)

		return inst
	end
	if inst.components.trader ~= nil then
		if inst.components.trader.onaccept ~= nil and inst.components.trader.onaccept_old == nil then
			inst.components.trader.onaccept_old = inst.components.trader.onaccept
		end
		inst:DoTaskInTime(0, function()	
			inst.components.trader.onaccept = OnGivenItemWater
		end)
	end
end)

for _, v in pairs(TUNING.CLEANSOURCE) do
	AddPrefabPostInit(v, function(inst) inst:AddTag("cleanwater") end)
end

-- bum: This makes tea leaves dryable.
-- AFS: dryer:StartDrying calls dryable.components.perishable:GetPercent(), so we need to add such hack to
-- make the objects without dryable on the rack (tea leaves, in this case).
AddComponentPostInit("dryer", function(self)
	local _StartDrying = self.StartDrying
	
	function self:StartDrying(dryable, ...)
		if dryable.components.dryable ~= nil and dryable.components.perishable == nil then
			dryable:AddComponent("perishable")
		end
		
		return _StartDrying(self, dryable, ...)
	end
end)

AddComponentPostInit("stewer",function(self)
	local _Harvest = self.Harvest

	function self:Harvest(harvester, ...)
		local result = _Harvest(self, harvester, ...)
		self.inst:PushEvent("harvestsalt", {inst = self.inst})
		
		return result
	end
end)

AddComponentPostInit("compostingbin",function(self)
	local _AddCompostable = self.AddCompostable

	function self:AddCompostable(item, ...)

		if item:HasTag("clean") or item:HasTag("salty") or item:HasTag("dirty") or item:HasTag("bucket") then
			return false
		end
		
		local refund = nil
		if item.components.stackable ~= nil then
			if item:HasTag("preparedrink_cup") then
				refund = SpawnPrefab("cup")
			end
		elseif item:HasTag("preparedrink_bottle") then
			refund = SpawnPrefab("messagebottleempty")
		end
		if refund ~= nil then
			local owner = item.components.inventoryitem ~= nil and item.components.inventoryitem:GetGrandOwner() or nil
			if owner ~= nil then
				local container = owner.components.inventory or owner.components.container
				container:GiveItem(refund, nil, owner:GetPosition())
			else
				source.Transform:SetPosition(item.Transform:GetWorldPosition())
			end
		end

		local result = _AddCompostable(self, item, ...)
		return result
	end
end)


-- bum: when you eat foods, you can restore thirst.
AddComponentPostInit("eater", function(self)
	self.thirstabsorption = 1
	local _Eat = self.Eat
	local _PrefersToEat = self.PrefersToEat

	function self:SetThristAbsorption(thirst)
		self.thirstabsorption = thirst
	end

	function self:Eat(food, feeder, ...)
		if _PrefersToEat(self, food, ...) then
			local stack_mult = self.eatwholestack and food.components.stackable ~= nil and food.components.stackable:StackSize() or 1
			local base_mult = self.inst.components.foodmemory ~= nil and self.inst.components.foodmemory:GetFoodMultiplier(food.prefab) or 1
			local thirst_delta = 0

			if self.inst.components.thirst ~= nil then
				thirst_delta = food.components.edible:GetThirst(self.inst) * base_mult * self.thirstabsorption
			end

			if thirst_delta ~= 0 then
				self.inst.components.thirst:DoDelta(thirst_delta * stack_mult)
			end
			_Eat(self, food, feeder, ...)
			return true
		end
	end

	function self:PrefersToEat(food, ...)
		if food:HasTag("alcohol") and self.inst:HasTag("childplayer") then
			return false
		end
		return _PrefersToEat(self, food, ...)
	end
end)

AddComponentPostInit("edible", function(self)
    self.isdrink = false
    --self.waterpersip = 10
    --self.thirstvalue = 0
    --AFS: If thirstvalue is not assigned, it will be automatically calculated.

    function self:GetThirstFromHungerValue()
    	local mult = self.inst:HasTag("preparedfood") and 0.5 or 1
        return RoundBiasedUp(self.hungervalue * 2 ^ (math.abs(self.hungervalue / 300) - 1), 4) * mult
    end

    function self:GetThirst(eater)
        local thirst = self.thirstvalue or self:GetThirstFromHungerValue()
        local multiplier = 1
        local ignore_spoilage = not self.degrades_with_spoilage or thirst < 0 or (eater ~= nil and eater.components.eater ~= nil and eater.components.eater.ignoresspoilage)

        if not ignore_spoilage and self.inst.components.perishable ~= nil then
            if self.inst.components.perishable:IsStale() then
                multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.stale_thirst or self.stale_thirst
            elseif self.inst.components.perishable:IsSpoiled() then
                multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.spoiled_thirst or self.spoiled_thirst
            end
        end

        if eater ~= nil and eater.components.foodaffinity ~= nil then
            local affinity_bonus = eater.components.foodaffinity:GetAffinity(self.inst)
            if affinity_bonus ~= nil then
                multiplier = multiplier * affinity_bonus
            end
        end

        return multiplier * thirst
    end
end)

-- 바닐라 코드쪽에서 일부 서순이 틀려서 패치했습니다 -_-
local function fixfuelsmall(inst)
	inst:RemoveComponent("tradable")
	inst:RemoveComponent("fuel")

	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL
	inst:AddComponent("tradable")
end

local function fixfueltiny(inst)
	inst:RemoveComponent("tradable")
	inst:RemoveComponent("fuel")

	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.TINY_FUEL
	inst:AddComponent("tradable")
end

function fixfuelyotb(inst) 
	inst:RemoveComponent("tradable")
	inst:RemoveComponent("fuel")

	inst:AddComponent("fuel")
	inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.YOTB_BEEFALO_DOLL
end

for _, v in pairs(TUNING.FIXFUELSMALL) do
	AddPrefabPostInit(v, fixfuelsmall)
end

for _, v in pairs(TUNING.FIXFUELTINY) do
	AddPrefabPostInit(v, fixfueltiny)
end

for _, v in pairs(TUNING.FIXYOTB) do
	AddPrefabPostInit(v, fixfuelyotb)
end

--regrowth code
AddComponentPostInit("regrowthmanager", function(self)
	self:SetRegrowthForType("tea_tree", TUNING.EVERGREEN_REGROWTH.DESOLATION_RESPAWN_TIME, "tea_tree", function()
		return TUNING.TEA_TREE_REGROWTH_TIME_MULT
	end)
	self:SetRegrowthForType("caffeinberry", TUNING.EVERGREEN_REGROWTH.DESOLATION_RESPAWN_TIME, "caffeinberry", function()
		return TUNING.CAFFEINBERRY_REGROWTH_TIME_MULT
	end)
end)

-- bum: Child Safety: the "child" survivors can't drink alcohols.
if GetModConfigData("child_safety") ~= 1 then
	for _, v in pairs(TUNING.CHILDS) do
		AddPrefabPostInit(v, function(inst) inst:AddTag("childplayer") end)
	end
end

AddComponentPostInit("wisecracker",function(self, inst)
	inst:ListenForEvent("sleep_end", function(inst, data)
		inst.components.talker:Say(_G.GetString(inst, "ANNOUNCE_SLEEP_END"))
	end)
end)

-- Applying Absorption of Wortox
AddPrefabPostInit("wortox",function(inst)
	if inst.components.eater ~= nil then
		inst.components.eater:SetThristAbsorption(.5)
	end
end)
-- (WIP) Upgrade a Firepit with a Campfire Kettle!
local function ItemTradeTest(inst, item)
	if item == nil then
		return false
	elseif not item:HasTag("campkettle") then
		return false, "NOTCAMPKETTLE"
	end
	return true
end

local function OnSetKettle(inst, giver, item)
	local kettle
	kettle = item:HasTag("campkettle") and SpawnPrefab("campkettle") or SpawnPrefab(item.prefab)
	inst.components.trader:Disable()
	inst._kettleinst = item:HasTag("campkettle") and kettle or item
	if inst._kettleinst == item then
		inst._remove = kettle
	end
	inst:AddChild(kettle)
	if inst.components.burnable then
		inst.components.burnable:OverrideBurnFXBuild("quagmire_pot_fire")
	end
	if not inst._setkettle then
		inst._setkettle = true
	end
	item:Remove()
end

local function OnSave(inst, data)
	if inst._setkettle then
		data.kettle = inst._kettleinst:GetSaveRecord()
		data.setkettle = inst._setkettle
	else
		data.kettle = nil
		data.setkettle = false
	end
end

local function OnLoad(inst, data)
	if data.kettle ~= nil then
		local kettle = GLOBAL.SpawnSaveRecord(data.kettle)
		if kettle ~= nil then
			inst._setkettle = data.setkettle
			OnSetKettle(inst, nil, kettle)
		end
	end
end

local function ChangeToItem(inst)
    local item = SpawnPrefab("campkettle_item")
    local type = inst._kettleinst._type
    inst._kettleinst = nil
    inst._setkettle = false
    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
    item.AnimState:PlayAnimation("collapse_"..type)
    item.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
end

local function DoDismantle(inst)
	if inst._kettleinst then
		local remove = SpawnPrefab(inst._kettleinst.prefab)
		if inst._remove then
			inst._remove:Hide()
		else
			inst._kettleinst:Hide()
		end
	    ChangeToItem(inst)
	    inst:RemoveChild(remove)
	end
end

AddPrefabPostInit("campfire",function(inst)

	inst:AddTag("trader")

	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end

	inst._kettleinst = nil
	inst._setkettle = false
	inst._remove = nil

	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ItemTradeTest)
	inst.components.trader.onaccept = OnSetKettle

	inst.OnLoad = OnLoad
	inst.OnSave = OnSave

	inst:ListenForEvent("onbuilt", onbuilt)
	inst:ListenForEvent("onextinguish", DoDismantle)

end)

AddPrefabPostInit("firepit",function(inst)

	inst:AddTag("trader")

	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("trader")
	inst.components.trader:SetAcceptTest(ItemTradeTest)
	inst.components.trader.onaccept = OnSetKettle

	inst.OnLoad = OnLoad
	inst.OnSave = OnSave
end)

local cooking = require("cooking")

local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        local product = inst.components.stewer.product
        local recipe = cooking.GetRecipe(inst.prefab, product)
        local chktag = SpawnPrefab(inst.components.stewer.product)
        if recipe ~= nil then
            product = recipe.basename or product
            if recipe.spice ~= nil then
                inst.AnimState:OverrideSymbol("swap_plate", "plate_food", "plate")
                inst.AnimState:OverrideSymbol("swap_garnish", "water_spice", "spice_caffeinpepper")
            else
                inst.AnimState:ClearOverrideSymbol("swap_plate")
                inst.AnimState:ClearOverrideSymbol("swap_garnish")
            end
        else
            inst.AnimState:ClearOverrideSymbol("swap_plate")
            inst.AnimState:ClearOverrideSymbol("swap_garnish")
        end
        if chktag:HasTag("watermod") then
            inst.AnimState:OverrideSymbol("swap_cooked", product, product)
        else
            local symbol_override_build = (recipe ~= nil and recipe.overridebuild) or "cook_pot_food"
            inst.AnimState:OverrideSymbol("swap_cooked", symbol_override_build, product)
        end
        chktag:Remove()
    end
end

local function checkitem(inst)
	return inst.components.stewer.ingredient_prefabs[2] == "spice_caffeinpepper" and true or false
end

local function checkname(inst)
	return string.find(inst.components.stewer.product,"_spice_caffeinpepper") ~= nil and true or false
end

local function continuedonefn(inst)
	local result = checkname(inst)
    if not inst:HasTag("burnt") then
		if result then
	        inst.AnimState:PlayAnimation("idle_full")
	        ShowProduct(inst)
		elseif inst.components.stewer.ondonecooking_old ~= nil then
			return inst.components.stewer.oncontinuedone_old(inst)
		end
	end
end

local function ondonecookingfn(inst)
	local test = checkitem(inst)
    if not inst:HasTag("burnt") then
		if test then
	        inst.AnimState:PlayAnimation("cooking_pst")
	        inst.AnimState:PushAnimation("idle_full", false)
	        ShowProduct(inst)
	        inst.SoundEmitter:KillSound("snd")
	        inst.SoundEmitter:PlaySound("dontstarve/common/together/portable/spicer/cooking_pst")
		elseif inst.components.stewer.ondonecooking_old ~= nil then
			return inst.components.stewer.ondonecooking_old(inst)
		end
	end
end

AddPrefabPostInit("portablespicer", function(inst)

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	if inst.components.stewer ~= nil then
		inst.components.stewer.oncontinuedone_old = inst.components.stewer.oncontinuedone
		inst.components.stewer.ondonecooking_old = inst.components.stewer.ondonecooking
	end
	inst.components.stewer.oncontinuedone = continuedonefn
	inst.components.stewer.ondonecooking = ondonecookingfn
end)