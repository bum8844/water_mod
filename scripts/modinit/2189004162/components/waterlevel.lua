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
<<<<<<< HEAD:scripts/modcompats/2189004162/components/waterlevel.lua
						STRINGS.INSIGHT.STATE.MINERAL
					) or STRINGS.INSIGHT.STATE.EMPTY

				local rawtext = STRINGS.INSIGHT.WATERLEVEL.RAWTEXT

				water_amont_string = string.format(rawtext,state,currentwater,maxwater)
=======
						watertype == WATERTYPE.UNCLEAN_MINERAL and STRINGS.INSIGHT.STATE.UNCLEAN_MINERAL or
						STRINGS.INSIGHT.STATE.MINERAL
					) or STRINGS.INSIGHT.STATE.EMPTY

				local color_code = watertype and (
						watertype == WATERTYPE.CLEAN and STRINGS.INSIGHT.COLOR_CODE.CLEAN or
						watertype == WATERTYPE.CLEAN_ICE and STRINGS.INSIGHT.COLOR_CODE.CLEAN_ICE or
						watertype == WATERTYPE.DIRTY and STRINGS.INSIGHT.COLOR_CODE.DIRTY or
						watertype == WATERTYPE.DIRTY_ICE and STRINGS.INSIGHT.COLOR_CODE.DIRTY_ICE or
						watertype == WATERTYPE.SALTY and STRINGS.INSIGHT.COLOR_CODE.SALTY or
						watertype == WATERTYPE.UNCLEAN_MINERAL and STRINGS.INSIGHT.COLOR_CODE.UNCLEAN_MINERAL or
						STRINGS.INSIGHT.COLOR_CODE.MINERAL
					) or STRINGS.INSIGHT.COLOR_CODE.EMPTY

				local rawtext = STRINGS.INSIGHT.WATERLEVEL.RAWTEXT

				water_amont_string = string.format(rawtext,state,color_code,currentwater,maxwater)
>>>>>>> Beta_1.2.8:scripts/modinit/2189004162/components/waterlevel.lua

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