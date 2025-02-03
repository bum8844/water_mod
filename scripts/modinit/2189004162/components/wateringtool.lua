local function Descriptors()
	Insight.descriptors.wateringtool = {
		Describe = function(self, context)

			local function GetTimeTask(self)
				local next_task_call = GetTaskRemaining(self.wateringtooltask)

				if next_task_call == -1 then
					return nil 
				end

				return math.ceil(next_task_call)
			end

			local function GetFiniteuses(self)
				local value = self.inst.components.finiteuses:GetUses() + 1
				local peruse = TUNING.BUCKET_LEVEL_PER_USE
    			value = value > peruse and peruse or value

    			return value
			end

			local function GetWaterState(self, watertype)
				local frozed = self.frozed
<<<<<<< HEAD:scripts/modcompats/2189004162/components/wateringtool.lua
=======
				local drying = self.drying

        		local raining = TheWorld.state.israining
        		local acidraining = TheWorld.state.isacidraining

				local gain_thing

				gain_thing = self.iscollectacid and STRINGS.INSIGHT.STATE.ACID or STRINGS.INSIGHT.STATE.CLEAN
				
				if drying then
					if raining then
						gain_thing = STRINGS.INSIGHT.STATE.ACID
					elseif acidraining then
						gain_thing = STRINGS.INSIGHT.STATE.CLEAN
					end
				end

>>>>>>> Beta_1.2.8:scripts/modinit/2189004162/components/wateringtool.lua
				local change_state = watertype and (
					(watertype == WATERTYPE.DIRTY and not frozed) and STRINGS.INSIGHT.STATE.DRY or
					STRINGS.INSIGHT.STATE.SOPIL
					) or ""

<<<<<<< HEAD:scripts/modcompats/2189004162/components/wateringtool.lua
				local gain_loss = TheWorld.state.israining and STRINGS.INSIGHT.STATE.GAIN or STRINGS.INSIGHT.STATE.DRY
=======
				local gain_loss = drying and STRINGS.INSIGHT.STATE.DRY or STRINGS.INSIGHT.STATE.GAIN
>>>>>>> Beta_1.2.8:scripts/modinit/2189004162/components/wateringtool.lua

				local state = watertype and (
					(watertype == WATERTYPE.CLEAN and (frozed and STRINGS.INSIGHT.STATE.CLEAN_ICE or STRINGS.INSIGHT.STATE.CLEAN)) or
					(watertype == WATERTYPE.DIRTY and (frozed and STRINGS.INSIGHT.STATE.DIRTY_ICE or STRINGS.INSIGHT.STATE.DIRTY)) or
<<<<<<< HEAD:scripts/modcompats/2189004162/components/wateringtool.lua
					watertype == WATERTYPE.SALTY and STRINGS.INSIGHT.STATE.SALTY or STRINGS.INSIGHT.STATE.MINERAL
				) or STRINGS.INSIGHT.STATE.EMPTY

				return {
=======
					watertype == WATERTYPE.SALTY and STRINGS.INSIGHT.STATE.SALTY or 
					watertype == WATERTYPE.MINERAL and STRINGS.INSIGHT.STATE.MINERAL or STRINGS.INSIGHT.STATE.ACID
				) or STRINGS.INSIGHT.STATE.EMPTY

				return {
					gain_thing = gain_thing,
>>>>>>> Beta_1.2.8:scripts/modinit/2189004162/components/wateringtool.lua
					change_state = change_state,
					gain_loss = gain_loss,
					state = state,
				}
			end

			local function Describe(self, context)

				local timedata = GetTimeTask(self)
				local watertype = self.watertype

				if not watertype and not timedata then
					return
				end

				local description, alt_description

				local rawtext, rawtext_ext = STRINGS.INSIGHT.WATERINGTOOL.RAWTEXT_GAIN_LOSS, STRINGS.INSIGHT.WATERINGTOOL.RAWTEXT_GAIN_LOSS

				local finiteusesdata = GetFiniteuses(self)
				local statedata = GetWaterState(self, watertype)

				if statedata.state ~= STRINGS.INSIGHT.STATE.EMPTY then
					if timedata then
						rawtext = STRINGS.INSIGHT.WATERINGTOOL.RAWTEXT_TIME
						rawtext_ext = STRINGS.INSIGHT.WATERINGTOOL.RAWTEXT_TIME_EXT

						timedata = context.time:SimpleProcess(timedata)

						rawtext = string.format(rawtext,statedata.state,statedata.change_state,timedata)
						rawtext_ext = string.format(rawtext_ext,statedata.state,finiteusesdata,statedata.change_state,timedata)
					else
						rawtext = STRINGS.INSIGHT.WATERINGTOOL.RAWTEXT
						rawtext_ext = STRINGS.INSIGHT.WATERINGTOOL.RAWTEXT_EXT

						rawtext = string.format(rawtext,statedata.state)
						rawtext_ext = string.format(rawtext_ext,statedata.state,finiteusesdata)
					end
				else
					timedata = context.time:SimpleProcess(timedata)
					
<<<<<<< HEAD:scripts/modcompats/2189004162/components/wateringtool.lua
					rawtext = string.format(rawtext,statedata.gain_loss,timedata)
					rawtext_ext = string.format(rawtext_ext,statedata.gain_loss,timedata)
=======
					rawtext = string.format(rawtext,statedata.gain_thing,statedata.gain_loss,timedata)
					rawtext_ext = string.format(rawtext_ext,statedata.gain_thing,statedata.gain_loss,timedata)
>>>>>>> Beta_1.2.8:scripts/modinit/2189004162/components/wateringtool.lua
				end

				description = rawtext
				alt_description = rawtext_ext

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