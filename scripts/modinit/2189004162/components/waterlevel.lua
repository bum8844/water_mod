local function Descriptors()
	Insight.descriptors.waterlevel = {
		Describe = function(self, context)
			if self.inst:HasTag("onlyoneget") then return end
			local function Describe(self, context)

				local brewing = self.inst.components.brewing

				if brewing and ( brewing.product or brewing.usedistill ) then
					return
				end

				local description, water_amont_string

				local maxwater = self.maxwater
				local currentwater = self.currentwater
				local watertype = currentwater > 0 and self.watertype or nil

				local state = watertype and (
						watertype == WATERTYPE.CLEAN and STRINGS.INSIGHT.STATE.CLEAN or
						watertype == WATERTYPE.CLEAN_ICE and STRINGS.INSIGHT.STATE.CLEAN_ICE or
						watertype == WATERTYPE.DIRTY and STRINGS.INSIGHT.STATE.DIRTY or
						watertype == WATERTYPE.DIRTY_ICE and STRINGS.INSIGHT.STATE.DIRTY_ICE or
						watertype == WATERTYPE.SALTY and STRINGS.INSIGHT.STATE.SALTY or
						STRINGS.INSIGHT.STATE.MINERAL
					) or STRINGS.INSIGHT.STATE.EMPTY

				local rawtext = STRINGS.INSIGHT.WATERLEVEL.RAWTEXT

				water_amont_string = string.format(rawtext,state,currentwater,maxwater)

				description = water_amont_string

				return {
					priority = 3,
					description = description
				}
			end

			return Describe(self, context)
		end
	}
end

return { Descriptors = Descriptors }