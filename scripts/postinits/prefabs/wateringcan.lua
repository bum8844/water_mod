local function OnFill_Waterlevel(inst, from_object ,...)
    local water = from_object.components.water and from_object.components.water:GetWatertype() or nil
    local waterlevel = from_object.components.waterlevel

    if water ~= nil and water == WATERTYPE.SALTY then
        return false
    end

    local maxfin = inst.components.finiteuses.total
    local using = inst.components.finiteuses:GetUses()

    local totalmax = maxfin/TUNING.WATERINGCAN_PER_WATER
    local totalusing = math.floor(using/TUNING.WATERINGCAN_PER_WATER)

    local result = totalmax-totalusing
    if waterlevel ~= nil then
        local waterlevel_water = from_object.components.waterlevel:GetWater()
    	if result > 0 then
    		inst.components.finiteuses:SetUses(math.min(maxfin,using+(waterlevel_water*TUNING.WATERINGCAN_PER_WATER)))
            if water ~= nil then
                from_object.components.water:Taken(inst, result)
            end
    		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
    		return true
    	else
    		return false
    	end
    elseif from_object:HasTag("farm_water") then
        local stacksize = from_object.components.stackable:StackSize()
        if using ~= maxfin then
            result = math.min(stacksize,result)
            inst.components.finiteuses:SetUses(math.min(maxfin,using+(result*TUNING.WATERINGCAN_PER_WATER)))
            if from_object.components.stackable:IsStack() then
                from_object.components.stackable:Get(result):Remove()
            else
                from_object:Remove()
            end
            inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
            return true
        else
            return false
        end
    elseif from_object.components.steampressure then
        if using < maxfin then
            inst.components.finiteuses:SetUses(maxfin)
            from_object.components.steampressure:LostPressure()
            inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
            return true
        else
            return false
        end
    else
    	return inst.components.fillable._overrideonfillfn(inst, from_object ,...)
    end
end

AddPrefabPostInit("wateringcan",function(inst)
	    if not GLOBAL.TheWorld.ismastersim then
            return inst
        end

        if inst.components.fillable.overrideonfillfn ~= nil and inst.components.fillable._overrideonfillfn == nil then
        	inst.components.fillable._overrideonfillfn = inst.components.fillable.overrideonfillfn
        	inst:DoTaskInTime(0,function()
        		inst.components.fillable.overrideonfillfn = OnFill_Waterlevel
        	end)
        end
    end)

AddPrefabPostInit("premiumwateringcan",function(inst)
	    if not GLOBAL.TheWorld.ismastersim then
            return inst
        end

        if inst.components.fillable.overrideonfillfn ~= nil and inst.components.fillable._overrideonfillfn == nil then
        	inst.components.fillable._overrideonfillfn = inst.components.fillable.overrideonfillfn
        	inst:DoTaskInTime(0,function()
        		inst.components.fillable.overrideonfillfn = OnFill_Waterlevel
        	end)
        end
    end)