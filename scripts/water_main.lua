
-- 비료 다쓰면 양동이 돌려주는 코드(아이템 스택 모드랑 쓰면 아이템이 제대로 반환 안되요)
local function BackBucket(inst)
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
end

AddPrefabPostInit("fertilizer", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	inst:DoTaskInTime(0, function()	
        inst.components.finiteuses:SetOnFinished(BackBucket)
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

AddPrefabPostInit("messagebottleempty",MakeBottle)

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

--[[for k, v in pairs(TUNING.HYDRATIONTYPE) do
	for _, r in pairs(v) do
		AddPrefabPostInit(r, function(inst)
			if not _G.TheWorld.ismastersim then
				return
			end
			inst.components.edible.thirstvalue = TUNING["HYDRATION_"..k]
		end)
	end
end]]


-- bum: 이 코드가 말리기 위해 추가한 코드임
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


-- 목마름을 채우기 위해 추가한 코드 352부터 413까지
AddComponentPostInit("eater", function(self)
	self.thirstabsorption = 1
	local _SetAbsorptionModifiers = self.SetAbsorptionModifiers
	local _Eat = self.Eat
	local _PrefersToEat = self.PrefersToEat

	function self:SetAbsorptionModifiers(health, thirst, sanity, thirst, ...)
		local result = _SetAbsorptionModifiers(self, health, thirst, sanity, ...)
		if thirst ~= nil then
			self.thirstabsorption = thirst
		end
		return result
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
		    local result = _Eat(self, food, feeder, ...)
		    return result
		end
	end

	function self:PrefersToEat(food, ...)
		if food:HasTag("alcohol") and self.inst:HasTag("childplayer") then
			return false
		end
		local result = _PrefersToEat(self, food, ...)
		return result
	end
end)



AddComponentPostInit("edible", function(self)
	self.thirstvalue = 0

	function self:GetThirst(eater)
	    local multiplier = 1
	    local ignore_spoilage = not self.degrades_with_spoilage or self.thirstvalue < 0 or (eater ~= nil and eater.components.eater ~= nil and eater.components.eater.ignoresspoilage)

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

	    return multiplier * self.thirstvalue
	end
end)

--regrowth code
AddComponentPostInit("regrowthmanager", function(self)
	self:SetRegrowthForType("tea_tree", TUNING.EVERGREEN_REGROWTH.DESOLATION_RESPAWN_TIME, "tea_tree", function()
        return TUNING.TEA_TREE_REGROWTH_TIME_MULT
    end)
    self:SetRegrowthForType("caffeinberry", TUNING.EVERGREEN_REGROWTH.DESOLATION_RESPAWN_TIME, "caffeinberry", function()
        return TUNING.CAFFEINBERRY_REGROWTH_TIME_MULT
    end)
end)


-- 어린이 보호(알콜음료 먹는거 방지 코드)
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