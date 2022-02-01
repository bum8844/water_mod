local SpanwPrefab = _G.SpawnPrefab
-- 비료 다쓰면 양동이 돌려주는 코드(아이템 스택 모드랑 쓰면 아이템이 제대로 반환 안되요)
local function BackBucket(inst)
    local owner = inst.components.inventoryitem.owner
	if owner and owner.components.inventory then
		owner.components.inventory:GiveItem(GLOBAL.SpawnPrefab("bucket"))
	end
    inst:Remove()
end

AddPrefabPostInit("fertilizer", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end
	inst:DoTaskInTime(0, function()	
        inst.components.finiteuses:SetOnFinished(BackBucket)
	end)
end)

local function bottleadd(inst)

	inst.entity:AddSoundEmitter()
	
	local function OnFill(inst, from_object)
		local filleditem
		if from_object ~= nil then
			if from_object:HasTag("cleanwater") then
				filleditem = GLOBAL.SpawnPrefab("bottle_water")
			else
				filleditem = GLOBAL.SpawnPrefab("bottle_dirty")
			end
		else
			filleditem = GLOBAL.SpawnPrefab("bottle_salt")
		end
		
		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
		
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

AddPrefabPostInit("messagebottleempty",bottleadd)

--오류 걸리는 부분
local function OnGivenItemWater(inst, giver, item)
    if item.prefab == "bucket_ice" then
        local trigger = "freeze" or nil
        if trigger ~= nil then
			inst:PushEvent("onacceptfighttribute", { tributer = giver, trigger = trigger })
			return
		end
	else
		--OnGivenItem(inst, giver, item)
	end
end

-- 얼음 양동이를 활용하여 개미사자랑 싸울 수 있도록 수정(이 부분에서 함수 저장시켜줘야 해요)
local function addtradalbe(inst)
    if not GLOBAL.TheWorld.ismastersim then
        inst:ListenForEvent("isfightingdirty", OnIsFightingDirty)

        return inst
    end
    if inst.components.trader.onaccept ~= nil then
    	if inst.components.trader.onaccept_old == nil then
    		inst.components.trader.onaccept_old = inst.components.trader.onaccept
    	end
    end
	inst:DoTaskInTime(0, function()	
    	inst.components.trader.onaccept = OnGivenItemWater
	end)
end

AddPrefabPostInit("antlion",addtradalbe)

local function CleanWater(inst)
	inst:AddTag("cleanwater")
end

for _, v in pairs(TUNING.CLEANSOURCE) do
	AddPrefabPostInit(v, function(inst) inst:AddTag("cleanwater") end)
end

-- bum: 이 코드가 말리기 위해 추가한 코드임
-- AFS: dryer:StartDrying calls dryable.components.perishable:GetPercent(), so we need to add such hack to
-- make tea leaves dryable on the rack.
AddComponentPostInit("dryer", function(self)
    local _StartDrying = self.StartDrying
    
    function self:StartDrying(dryable, ...)
        if dryable.components.dryable ~= nil and dryable.components.perishable == nil then
            dryable:AddComponent("perishable")
        end
        
        return _StartDrying(self, dryable, ...)
    end
end)

local containers = _G.require "containers"
local cookpot = containers.params.cookpot

containers.params.kettle = cookpot
containers.params.portablekettle = cookpot
containers.params.brewery = cookpot
