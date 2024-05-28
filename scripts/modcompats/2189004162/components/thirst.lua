local function Round(num, decimals)
    decimals = math.pow(10, decimals or 0)
    num = num * decimals
    if num >= 0 then num = math.floor(num + 0.5) else num = math.ceil(num - 0.5) end
    return math.floor(num / decimals)
end


local function CombineLines(...)
	local lines, argnum = nil, select("#",...)

	for i = 1, argnum do
		local v = select(i, ...)
		
		if v ~= nil then
			lines = lines or {}
			lines[#lines+1] = tostring(v)
		end
	end

	return (lines and table.concat(lines, "\n")) or nil
end


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

local function Descriptors()
	Insight.descriptors.thirst = {
		Describe = function(self, context)

			local function Describe(self, context)

				local world_type = GetWorldType()

				local function GetData(self)
					return {
						hunger = tonumber(Round(self.current, 0)),
						max_hunger = self.max
					}
				end

				local function GetBurnRate(self)
					local burn_rate
					if world_type == -1 then
						burn_rate = self.burnratemodifiers:Get()
					elseif world_type == 0 or world_type == 1 then -- base game and rog
						burn_rate = self.burnrate
					else
						burn_rate = self:GetBurnRate()
					end

					return burn_rate
				end

				local function GetTimeToEmpty(self)
					local decay_per_moment = GetBurnRate(self) * self.thirstrate * (self.period or 1)

					return self.current / decay_per_moment
				end

				local inst = self.inst
				local verbosity = context.config["display_hunger"]
				local description = nil
				local rawtext, rawtext_burn = STRINGS.INSIGHT.THIRST.REWTEXT, STRINGS.INSIGHT.THIRST.REWTEXT_BURN
				local thirst_str, burn_str
				
				if verbosity > 0 then
					thirst_str = string.format(rawtext, Round(self.current, 0), self.max)

					local burn_rate = 1

					if self.burning == false then
						burn_rate = 0
					else
						burn_rate = GetBurnRate(self)

						if not burn_rate then
							error("you moused over a: " .. self.inst:GetDisplayName() .. ", please report this to penguin (PLEASE ATTACH MOD LOG!).")
						end
					end

					if verbosity == 2 then
						if burn_rate ~= 0 then
							-- period fixed 1
							-- self.burnrate*(-self.thirstrate*dt)
							
							local burn_per_second = Round(burn_rate * -self.thirstrate * (self.period or 1), 2) -- self.period missing in DST
							burn_str = string.format(rawtext_burn, burn_per_second * TUNING.TOTAL_DAY_TIME, burn_per_second)
						else
							burn_str = STRINGS.INSIGHT.THIRST.REWTEXT_PAUSED
						end
					end
				end

				description = CombineLines(thirst_str, burn_str)

				return {
					priority = 28.5,
					description = description,
					GetData = GetData,
				}
			end

			return Describe(self, context)
		end
	}
end

return { Descriptors = Descriptors }

