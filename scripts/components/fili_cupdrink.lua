local Fili_CupDrink = Class(function(self, inst)
    self.inst = inst
end)

local function GiveBonus(eater, cup)
	if cup.spacial_bonus and cup.spacial_bonus ~= "" then
	    if cup.spacial_bonus == "bustup" then
	        eater:AddTag("insomniac")
	        eater.components.locomotor.externalspeedmultiplier = TUNING.COFFEE_POWR
	        eater:DoTaskInTime(TUNING.COFFEE_TIME, 
			function()
	            eater.components.talker:Say("I am again slow.")
  	            eater.components.locomotor.externalspeedmultiplier = 1
	            if eater.prefab ~= "wickerbottom" then
	               eater:RemoveTag("insomniac")
                end			
			end)
		end
        if cup.spacial_bonus == "ghost" and eater:HasTag("player") then
		    TheNet:Announce(""..eater:GetDisplayName().." drank Ghosty Drink, and became a ghost for 40 seconds!")
	        eater.components.health:DoDelta(-10000)
			eater:DoTaskInTime(40, 
			function() 
	            TheNet:Announce(""..eater:GetDisplayName().."'s ghost effect ended. Respawning!")
	            eater:PushEvent("respawnfromghost")
			end)
		end
		if cup.spacial_bonus == "alcahol" then
	        eater:PushEvent("powerdown")
	        eater:AddTag("groggy")
	        eater.components.locomotor.externalspeedmultiplier = 0.8
	        eater:DoTaskInTime(240, 
			function()
                if eater:HasTag("groggy") then
	                eater.components.talker:Say(TUNING.BEER_OFFDRINK)
	                eater:RemoveTag("groggy")
  	                eater.components.locomotor.externalspeedmultiplier = 1
	                eater:PushEvent("powerup")
	            end
			end)
		end
		if cup.spacial_bonus == "monster" then
            if eater:HasTag("monster") and eater:HasTag("player") then
		       eater.components.health:DoDelta(37)
		       eater.components.sanity:DoDelta(25)
            end
	        if not eater:HasTag("monster") and eater:HasTag("player") then
		        eater.components.health:DoDelta(-10)
		        eater.components.sanity:DoDelta(-20)
		        eater.components.hunger:DoDelta(-10)
            end
		end
		if cup.spacial_bonus == "spider" and not eater:HasTag("monster") then
	        eater:AddTag("monster")
	        eater:DoTaskInTime(120, 
			function()
                eater:RemoveTag("monster")
	            eater.components.talker:Say("I feel like a human again!")
			end)
		end
		if cup.spacial_bonus == "red" then
			eater:PushEvent("yawn", { grogginess = 4, knockoutduration = TUNING.TEASLEEP_TIME + math.random() })
		end
		if cup.spacial_bonus == "strang" then
	        eater:RemoveTag("groggy")
	        eater.components.locomotor.externalspeedmultiplier = 1
		end
	end
end

function Fili_CupDrink:Drink(eater, cup)
    if cup.cup_hp and eater.components.health then
	    eater.components.health:DoDelta(cup.cup_hp)
	end
	if cup.cup_san and eater.components.sanity then
        eater.components.sanity:DoDelta(cup.cup_san)
	end
	if cup.cup_hun and eater.components.hunger then
        eater.components.hunger:DoDelta(cup.cup_hun)
	end
	if cup.thirst then
	    if eater.fili_thirst then
	        eater.fili_thirst = eater.fili_thirst+cup.thirst
		end
		if eater.components.thirst then
		    eater.components.thirst:DoDelta(cup.thirst) 
		end
	end
	if eater.components.inventory then
	    if cup.cup_backitem == nil then
	        eater.components.inventory:GiveItem(SpawnPrefab("cup"))
		else
		    eater.components.inventory:GiveItem(SpawnPrefab(cup.cup_backitem))
		end
	end
	if cup.need_talk and cup.need_talk ~= "" and eater.components.talker then
	    eater.components.talker:Say(cup.need_talk)
	end
	if cup.season and eater.components.temperature then
	    local temp = eater.components.temperature.current
		if cup.season == "summer" and cup.cold_bonus then
			eater.components.temperature:SetTemperatureInBelly(TUNING.COLD_FOOD_BONUS_TEMP, cup.cold_bonus)
		end
		if (cup.season == "winter" or cup.season == "spring") and cup.warm_bonus then
			eater.components.temperature:SetTemperatureInBelly(TUNING.HOT_FOOD_BONUS_TEMP, cup.warm_bonus)
		end
	end
	if eater:HasTag("player") then
	    GiveBonus(eater, cup)
	end
    if cup.components.stackable ~= nil then
        cup.components.stackable:Get():Remove()
    else
        cup:Remove()
    end
	return true
end

return Fili_CupDrink