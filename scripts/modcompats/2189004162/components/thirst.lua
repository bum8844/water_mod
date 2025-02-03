local function Descriptors()
	Insight.descriptors.thirst = {
		Describe = function(self, context)

			local function Describe(self, context)

				local world_type = Insight.env.GetWorldType()

				local function GetData(self)
					return {
						hunger = tonumber(Insight.env.Round(self.current, 0)),
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
					thirst_str = string.format(rawtext, Insight.env.Round(self.current, 0), self.max)

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
							
							local burn_per_second = Insight.env.Round(burn_rate * -self.thirstrate * (self.period or 1), 2) -- self.period missing in DST
							burn_str = string.format(rawtext_burn, burn_per_second * TUNING.TOTAL_DAY_TIME, burn_per_second)
						else
							burn_str = STRINGS.INSIGHT.THIRST.REWTEXT_PAUSED
						end
					end
				end

				description = Insight.env.CombineLines(thirst_str, burn_str)

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

