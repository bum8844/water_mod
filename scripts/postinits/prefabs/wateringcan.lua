local function OnFill_Waterlevel(inst, from_object ,...)

    local maxfin = inst.components.finiteuses.total
    local using = inst.components.finiteuses:GetUses()
    local result = math.ceil((maxfin-using)/TUNING.BUCKET_LEVEL_PER_USE)
    if from_object.components.waterlevel ~= nil then
    	if result > 0 then
    		inst.components.finiteuses:SetUses(math.min(maxfin,using+(result*20)))
    		from_object.components.waterlevel:DoDelta(-result)
    		inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
            if from_object.components.waterlevel.ontakewaterfn ~= nil then
               from_object.components.waterlevel.ontakewaterfn(from_object)
            end
    		return true
    	else
    		return false
    	end
    elseif from_object:HasTag("farm_water") then
        if using ~= maxfin then
            local stacksize = from_object.components.stackable:StackSize()
            result = math.min(stacksize,math.ceil((maxfin-using)/TUNING.BUCKET_LEVEL_PER_USE))
            inst.components.finiteuses:SetUses(math.min(maxfin,using+(result*20)))
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