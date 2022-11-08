-- bum: Bucket-O-Poop now returns an Empty Bucket when depleted(uncompatible with those mods that makes everything stackable)
AddPrefabPostInit("fertilizer", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	inst:DoTaskInTime(0, function()	
        inst.components.finiteuses:SetOnFinished(function(inst) RefundItem(inst, "bucket_empty") end)
	end)
end)
