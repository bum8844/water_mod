local function Round(num, decimals)
    decimals = math.pow(10, decimals or 0)
    num = num * decimals
    if num >= 0 then num = math.floor(num + 0.5) else num = math.ceil(num - 0.5) end
    return math.floor(num / decimals).."%"
end

local function Descriptors()
	Insight.descriptors.waterspoilage = {
		Describe = function(self, context)
			local function GetPerishData(self)
				local next_task_call = GetTaskRemaining(self.updatetask)

				if next_task_call == -1 then
					return
				end

				if not self.max_freshness and not self.freshness or not (self.freshness > 0) then
					return
				end

				local modifier = self:GetModifier()

				if modifier == 0 then
					return
				end

				local state = modifier >= 0 and STRINGS.INSIGHT.STATE.REFRESH or STRINGS.INSIGHT.STATE.SOPIL
				local time_to_perish = self.freshness / modifier
				local alt_time_to_perish = self.freshness / modifier

				local delta = self.updatetask.arg[2]
				local max_perish_time = self.max_freshness / math.abs(modifier)
				local percent

				if modifier > 0 then
					time_to_perish = max_perish_time - time_to_perish
					local old_vel = alt_time_to_perish
					alt_time_to_perish = max_perish_time - alt_time_to_perish
					time_to_perish = math.floor(time_to_perish / delta) * delta + next_task_call
					alt_time_to_perish = math.floor(alt_time_to_perish / delta) * delta + next_task_call
					percent = math.min(max_perish_time, old_vel) / max_perish_time
				elseif modifier < 0 then
					time_to_perish = math.floor(time_to_perish / delta) * delta + next_task_call
					alt_time_to_perish = math.floor(alt_time_to_perish / delta) * delta + next_task_call
					percent = math.min(max_perish_time, alt_time_to_perish) / max_perish_time
				end

				

				return {
					modifier = modifier,
					state = state,
					time_to_perish = time_to_perish,
					alt_time_to_perish = alt_time_to_perish,
					percent = percent
				}
			end

			local function Describe(self, context)
				local description, alt_description, spoilage_time, alt_spoilage_time

				if not context.config["display_perishable"] then
					return
				end

				local data = GetPerishData(self)
				local rawtext = STRINGS.INSIGHT.WATERSPOILAGE.RAWTEXT
				local rawtext_ext = STRINGS.INSIGHT.WATERSPOILAGE.RAWTEXT_EXT

				if data and data.modifier == 0 then
					return
				elseif data then
					local percent = Round(data.percent * 100, 1)..""
					percent = data.modifier >= 0 and "<color=#2F70C0>"..percent.."</color>" or "<color=#4E5347>"..percent.."</color>"
					spoilage_time = context.time:SimpleProcess(math.abs(data.time_to_perish))
					alt_spoilage_time = context.time:SimpleProcess(math.abs(data.alt_time_to_perish))
					description = subfmt(rawtext,{ state = data.state, time = spoilage_time})
					alt_description = subfmt(rawtext_ext,{ state = data.state, time = alt_spoilage_time, percent=percent})
				end

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