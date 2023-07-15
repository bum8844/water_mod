local function RetractPipes(target)
    local numPipes = #target.pipes
    if numPipes > 0 then
        local lastPipe = target.pipes[numPipes]
        lastPipe.sg:GoToState("retract", numPipes)
    end
end

local function Spawnhole(target)
    local hole = GLOBAL.SpawnPrefab("hole")
    hole.Transform:SetPosition(target.Transform:GetWorldPosition())
end

local function destroystructure(staff, target)
	if target.onhole then
		Spawnhole(target)
	elseif target.pipes and target.pipes[1] ~= nil then
		RetractPipes(target)
	elseif target.water_finiteuses then
		if target.AnimState:IsCurrentAnimation("watering") or target.AnimState:IsCurrentAnimation("hit_watering") or target.AnimState:IsCurrentAnimation("idle_watering") then
			local water_finiteuses = target.components.pickable.numtoharvest or 0
			while water_finiteuses > 0 do
	        	if water_finiteuses > 0 then
	            	target.components.lootdropper:SpawnLootPrefab("water_clean")
	        	end
	        	water_finiteuses = water_finiteuses - 1
	    	end
			if target.bucket_finiteuses > 0 then
				local x, y, z = target.Transform:GetWorldPosition()
		   		local refund = nil

				refund = GLOBAL.SpawnPrefab("bucket_empty")
				refund.components.finiteuses:SetUses(target.bucket_finiteuses)

				GLOBAL.LaunchAt(refund,target,target,-1.8,0.5,nil,65)
			end
		end
		Spawnhole(target)
	end
	staff.components.spellcaster.spell_old(staff, target)
end

local GREENHAUNT_CANT_TAGS = { "INLIMBO" }
local function onhauntgreen_water(inst)
    if math.random() <= TUNING.HAUNT_CHANCE_RARE then
        local target = GLOBAL.FindEntity(inst, 20, HasRecipe, nil, GREENHAUNT_CANT_TAGS)
        if target ~= nil then
            destroystructure(inst, target)
            GLOBAL.SpawnPrefab("collapse_small").Transform:SetPosition(target.Transform:GetWorldPosition())
            inst.components.hauntable.hauntvalue = TUNING.HAUNT_LARGE
            return true
        end
    end
    return false
end

local function holepatch(inst)
	if inst.components.spellcaster ~= nil then
		if inst.components.spellcaster.spell ~= nil and inst.components.spellcaster.spell_old == nil then
			inst.components.spellcaster.spell_old = inst.components.spellcaster.spell
			inst:DoTaskInTime(0, function()
				inst.components.spellcaster:SetSpellFn(destroystructure)
			end)
		end
	end

	GLOBAL.MakeHauntableLaunch(inst)
	GLOBAL.AddHauntableCustomReaction(inst, onhauntgreen_water, true, false, true)
end

AddPrefabPostInit("greenstaff",holepatch)