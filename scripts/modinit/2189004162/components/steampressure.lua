local function Descriptors()
	Insight.descriptors.steampressure = {
		Describe = function(self, context)
			local function GetSteampressure(self)

				local curpressure = self.curpressure
				local maxpressure = self.maxpressure
				local remaintime = maxpressure - curpressure

				local percent = math.min(maxpressure, curpressure) / maxpressure

				if not self.inst.components.machine:IsOn() then
					return {
						percent = percent,
						time = nil,
					}
				end

				local next_task_call = self:IsDepleted() and GetTaskRemaining(self.depletedtask) or GetTaskRemaining(self.pressuretask)

				if next_task_call == -1 then
					return {
						percent = percent,
						time = nil,
					}
				end

				local time_left = (self.delayed * 0.25) * 0.01
				local time = self:GetTime()

				if not self:IsDepleted() then
					time_left = math.ceil((remaintime+time)*time_left)
				else
					time_left = math.ceil(next_task_call)
				end

				return {
					percent = percent,
					time = time_left,
				}
			end
			
			local function Describe(self, context)
				local description, alt_description, time

				local data = GetSteampressure(self)

				local rawtext = STRINGS.INSIGHT.STEAMPRESSURE.RAWTEXT
				local rawtext_ext = STRINGS.INSIGHT.STEAMPRESSURE.RAWTEXT_EXT

				if data.time then
					time = context.time:SimpleProcess(data.time,"realtime_short")
					rawtext = STRINGS.INSIGHT.STEAMPRESSURE.RAWTEXT_TIME
					rawtext_ext = STRINGS.INSIGHT.STEAMPRESSURE.RAWTEXT_TIME_EXT
				end

				description = subfmt(rawtext,{percent = Insight.env.Round(data.percent * 100, 1), time = time })
				alt_description = subfmt(rawtext_ext,{percent = Insight.env.Round(data.percent * 100, 1), time = time, cur = self.curpressure, max = self.maxpressure})

				return {
					priority = 0,
					description = description,
					alt_description = alt_description,
				}
			end

			return Describe(self, context)
		end
	}
end

return { Descriptors = Descriptors }