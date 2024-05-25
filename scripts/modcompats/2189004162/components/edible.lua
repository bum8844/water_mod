local function FormatDecimal(num, places)
	if not places then
		local x = string.match(num, "%.(.+)")
		places = x and #x or 1
	end
	
	return string.format("%+." .. places .. "f", num)
end

local function GetWorldType()
	if TheSim:GetGameID() == "DST" then
		return -1 -- Don't Starve Together
		-- ds DLC variables don't exist here by the way
	end

	if IsDLCEnabled(PORKLAND_DLC) then
		return 3 -- hamlet
	elseif IsDLCEnabled(CAPY_DLC) then
		return 2 -- shipwrecked
	elseif IsDLCEnabled(REIGN_OF_GIANTS) then
		return 1 -- reign of giants
	else
		return 0 -- base game of Don't Starve
	end
end

if type(Insight.descriptors.edible) == "table" and Insight.descriptors.edible.Describe then
	local oldDescribe = Insight.descriptors.edible.Describe
	Insight.descriptors.edible.Describe = function(self, context, ...)
		local packed = Insight.env.pack(oldDescribe(self, context, ...))

		local world_type = GetWorldType()

		if not context.player.components.eater then
			return
		end

		local rawtext, rawtext_ext = STRINGS.INSIGHT.EDIBLE.RAWTEXT.LONG, STRINGS.INSIGHT.EDIBLE.RAWTEXT.LONG

		local owner = context.player --GetPlayer()
		local foodmemory = owner.components.foodmemory
		local stats = context.stats

		local safe_food = true

		local function IsEdible(owner, inst)
			if not owner then
				return false
			end
			
			if owner.components.eater then
				-- base game does not have :IsValidFood()
				if owner.components.eater.IsValidFood and owner.components.eater:IsValidFood(inst) then
					if owner.components.eater:AbleToEat(inst) then
						return true
					end
				elseif owner.components.eater:CanEat(inst) then
					return true
				end
			end

			if owner.components.souleater and inst.components.soul then
				return true
			end

			return false
		end

		local function GetWaterStatsForEntity(self, eating_entity, feeder, account_eatable)
			feeder = feeder or eating_entity

			if account_eatable then
				if not IsEdible(eating_entity, self.inst) then
					return nil
				end
			end

			-- get hunger values
			local thirst = self:GetThirst(eating_entity) or 0 -- DST's food affinity is included in all 3
			local eater = eating_entity.components.eater

			-- food effects
			if eater and world_type ~= 0 then -- accounting for strong stomach in anywhere except base game since no one cares there
				local do_effects = eater:DoFoodEffects(self.inst)
				
				if thirst < 0 and do_effects == false then
					thirst = 0
				end
			end

			-- food multipliers
			local base_mult = eating_entity.components.foodmemory ~= nil and eating_entity.components.foodmemory:GetFoodMultiplier(self.inst.prefab) or 1 -- warly? added while was doing food stat modifiers
			if not stats or (type(stats) == 'table' and not stats.fixed) then
				-- uncompromising mode sets absorptions to 0 on first eat event and stores the original as a variable in the player.
				-- \init\init_food\init_foodregen.lua in local function oneat, August 17, 2021.
				-- Variable change necessary according to Atoba, Dec 16 2022
				-- Do I want to do something with custom logic for uncomp absorption??
				thirst = thirst * base_mult * eater.thirstabsorption --(uncompromising and eating_entity.modded_thirstabsorption or eater.thirstabsorption)
			end

			-- new very helpful function by klei
			if eater and eater.custom_stats_mod_water_fn then
				thirst = eater.custom_stats_mod_water_fn(eating_entity, thirst, self.inst, feeder)
			end

			return thirst
		end

		if context.config["display_food"] then

			local style = context.config["food_style"]

			if style == "short" then
				rawtext, rawtext_ext = STRINGS.INSIGHT.EDIBLE.RAWTEXT.SHORT, STRINGS.INSIGHT.EDIBLE.RAWTEXT.SHORT
			end

			local thirst
			if type(stats) == 'table' then
				thirst = stats.thirst
			else
				thirst = self:GetThirst()
			end

			if thirst then thirst = (thirst > 0 and "+" or "") .. thirst else safe_food = false thirst = "?" end
			rawtext_ext = string.format(rawtext_ext, thirst)

			if not safe_food then
				rawtext = rawtext_ext
			end
		end

		if safe_food and IsEdible(owner, self.inst) and context.config["display_food"] then
			local eater = owner.components.eater

			local thirst
			if type(stats) == 'table' then
				thirst = stats.thirst
			else
				thirst = GetWaterStatsForEntity(self, context.player, nil, false)
			end
			
			thirst = (thirst ~= 0 and FormatDecimal(thirst, thirst%1==0 and 0 or 1)) or thirst
			
			rawtext = string.format(rawtext, thirst)
		end
				
		for i,v in ipairs(packed) do
			if v and v.name == "edible" then
				if v.description then
					v.description = string.gsub(v.description,"</color> / <color=SANITY>","</color> / "..rawtext.." / <color=SANITY>")
				end
				if v.alt_description then
					v.alt_description = "Stuff: " .. string.gsub(v.alt_description,"</color> / <color=SANITY>","</color> / "..rawtext.." / <color=SANITY>")
				end
				break
			end
		end
		
		return Insight.env.vararg(packed)
	end
end