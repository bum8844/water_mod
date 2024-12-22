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
	if target:HasTag("hashole") then
		if target.components.wateringstructure then
			local wateringtool = target.components.wateringstructure:GetWateringTool()
			if wateringtool then
				local toolfiniteuses = target.components.wateringstructure:GetToolFiniteuses()
				local wateramount = target.components.wateringstructure:GetWaterAmount() or 0
				local root = target.components.pickable.product

				while wateramount > 0 do
		        	if wateramount > 0 then
		            	target.components.lootdropper:SpawnLootPrefab(root)
		        	end
		        	wateramount = wateramount - 1
		    	end
				if toolfiniteuses > 0 then
					local x, y, z = target.Transform:GetWorldPosition()
			   		local refund = nil

					refund = SpawnPrefab(wateringtool)
					refund.components.finiteuses:SetUses(toolfiniteuses)

					LaunchAt(refund,target,target,-1.8,0.5,nil,65)
				end
			end
		end
		Spawnhole(target)
	elseif target:HasTag("haspipe") then
		RetractPipes(target)
	end
	staff.components.spellcaster.spell_old(staff, target)
	if target.prefab == "wine_cellar" then
		local pt = target:GetPosition()
		local ents = TheSim:FindEntities(pt.x, pt.y, pt.z, 2, {"projectile"})
		local num = 0
		for k, v in pairs(ents) do
			if v.prefab == "gelblob_bottle" and not (num >= 4) then
	            if not (v.components.stackable.stacksize > 1) then
	            	num = num + 1
	                v.components.complexprojectile.onhitfn(v)
	            end
			end
		end
	end
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