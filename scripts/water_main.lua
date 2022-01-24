local SpanwPrefab = _G.SpawnPrefab

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

TUNING.CLEANSOURCE =
{
	"oasislake",
	"hotspring"
}

local function CleanWater(inst)
	inst:AddTag("cleanwater")
end

for _, v in pairs(TUNING.CLEANSOURCE) do
	AddPrefabPostInit(v, function(inst) inst:AddTag("cleanwater") end)
end

local container = _G.require "containers"
local cookpot = containers.params.cookpot

containers.params.kettle = cookpot
containers.params.portablekettle = cookpot

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
