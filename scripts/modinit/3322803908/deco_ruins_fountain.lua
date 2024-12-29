local function OnGetItemFromPlayer_Vortex(inst, giver, item)
	local spawn_point = inst:GetPosition() + Vector3(0, 4.5, 0)
	local x, y, z = spawn_point:Get()
	local angle = (math.random() * 360) * DEGREES

	if giver ~= nil and giver:IsValid() then
	    angle = 180 - giver:GetAngleToPoint(x, 0, z)
	end

	local speed = math.random() * 4 + 2

	if item.prefab == "messagebottleempty" then
	    inst.AnimState:PlayAnimation("vortex_splash")
	    inst.AnimState:PushAnimation("vortex_idle_full",true)
	    inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/endswell/splash")
	    inst:DoTaskInTime(1, function()
			local bottle = SpawnPrefab("gelblob_bottle")

	        inst.AnimState:PlayAnimation("vortex_splash")
	        inst.AnimState:PushAnimation("vortex_idle_full", true)
	        inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/endswell/splash")

			bottle.Transform:SetPosition(x, y, z)
			bottle.Physics:SetVel(speed * math.cos(angle), math.random() * 2 + 8, speed * math.sin(angle))
			item:Remove()
		end)
	else
		inst.components.trader._onaccept(inst, giver, item)
		inst:DoTaskInTime(1,function()
		    local ents = TheSim:FindEntities(x, y, z, 10, {"gem"})
		    local num = 0
		    local chance = math.random()
		    for k, v in pairs(ents) do
		        if v.prefab == "purplegem" and not (num >= 1) and chance >= 0.5 then
		        	if not (v.components.stackable.stacksize > 1) and not v.components.inventoryitem:IsHeld() then
		        		num = num + 1
			            local part = ReplacePrefab(v, "wine_cellar_part")
			            part.Transform:SetPosition(x, y, z)
			            part.Physics:SetVel(speed * math.cos(angle), math.random() * 2 + 8, speed * math.sin(angle))
		            end
		        end
		    end
		end)
	end
end

AddPrefabPostInit("deco_ruins_fountain",function(inst)
	inst:AddComponent("water")
	inst.components.water:SetWaterType(WATERTYPE.CLEAN)
	inst:AddComponent("watersource")
end)

AddPrefabPostInit("deco_ruins_endswell",function(inst)
	if inst.components.trader then
		inst.components.trader._onaccept = inst.components.trader.onaccept
		inst.components.trader.onaccept = OnGetItemFromPlayer_Vortex
	end
end)