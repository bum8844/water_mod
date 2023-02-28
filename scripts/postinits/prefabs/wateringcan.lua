
local function OnFill_Waterlevel(inst, from_object ,...)
    if from_object ~= nil and from_object.components.waterlevel ~= nil then
    	local maxfin = inst.components.finiteuses.total
    	local using = inst.components.finiteuses:GetUses()
    	using = math.ceil((maxfin-using)/TUNING.BUCKET_LEVEL_PER_USE)
    	if using > 0 then
    		inst.components.finiteuses:SetPercent(1)
    		from_object.components.waterlevel:DoDelta(-using)
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