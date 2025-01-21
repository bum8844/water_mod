local function Descriptors()
	Insight.descriptors.wateringstructure = {
		Describe = function(self, context)
			
			local function GetTimeTask(self)
				local next_task_call = GetTaskRemaining(self.watertask)

				if next_task_call == -1 then
					return nil 
				end

				return math.ceil(next_task_call)
			end

			local function Describe(self, context)

				local wateramount = self:GetWaterAmount()
				local bucket = self.wateringtool

				if wateramount <= 0 and not self.dried then
					return
				end

				if not bucket then
					return
				end

				local bucketanim = self.wellanim or ""
				local toolfiniteuses = self.toolfiniteuses
				local mult = TUNING[string.upper(bucketanim).."_BUCKET_MULT"] or 1
				local max_toolfiniteuses = TUNING.BUCKET_MAX_LEVEL * mult
				local percent = math.min(max_toolfiniteuses, toolfiniteuses) / max_toolfiniteuses
				local watertype = self.watertype
				local frozed = self.frozed
				local change_state = watertype and (
					(watertype == WATERTYPE.DIRTY and not frozed) and STRINGS.INSIGHT.STATE.DRY or
					STRINGS.INSIGHT.STATE.SOPIL
					) or ""

				local state = watertype and (
					(watertype == WATERTYPE.CLEAN and (frozed and STRINGS.INSIGHT.STATE.CLEAN_ICE or STRINGS.INSIGHT.STATE.CLEAN)) or
					(watertype == WATERTYPE.DIRTY and (frozed and STRINGS.INSIGHT.STATE.DIRTY_ICE or STRINGS.INSIGHT.STATE.DIRTY)) or
					watertype == WATERTYPE.SALTY and STRINGS.INSIGHT.STATE.SALTY or STRINGS.INSIGHT.STATE.MINERAL
				) or STRINGS.INSIGHT.STATE.EMPTY

				local timedata = GetTimeTask(self)

				bucketanim = bucketanim ~= "" and string.upper(tostring(bucket)) or "BUCKET_EMPTY"
				bucket = STRINGS.INSIGHT.STATE[bucketanim]

				local description, alt_description

				local rawtext = STRINGS.INSIGHT.WATERINGSTRUCTURE.RAWTEXT
				local rawtext_ext = STRINGS.INSIGHT.WATERINGSTRUCTURE.RAWTEXT_EXT

				if timedata then
					timedata = context.time:SimpleProcess(timedata)
					rawtext = STRINGS.INSIGHT.WATERINGSTRUCTURE.RAWTEXT_TIME
					rawtext_ext = STRINGS.INSIGHT.WATERINGSTRUCTURE.RAWTEXT_TIME_EXT

					description = subfmt(rawtext,{bucket=bucket,state=state,n_state=change_state,time=timedata})
					alt_description = subfmt(rawtext_ext,{bucket=bucket,percent=Insight.env.Round(percent * 100, 1).."%",cur=toolfiniteuses,max=max_toolfiniteuses,state=state,amount=wateramount,n_state=change_state,time=timedata})
				else
					description = subfmt(rawtext,{bucket=bucket,state=state})
					alt_description = subfmt(rawtext_ext,{bucket=bucket,percent=Insight.env.Round(percent * 100, 1).."%",cur=toolfiniteuses,max=max_toolfiniteuses,state=state,amount=wateramount})
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