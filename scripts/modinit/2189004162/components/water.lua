local function Descriptors()
	Insight.descriptors.water = {
		Describe = function(self, context)
			local function Describe(self, context)
				if not self.use_WaterManager then
					return
				end

				local description, alt_description
				local watermanager = self.left_to_dirty

				local watertype = string.upper(self.watertype)

				if watermanager > 0 then
					watertype = string.upper(self.set_watertype)
				end

				local rawtext = STRINGS.INSIGHT.WATER.RAWTEXT
				local rawtext_ext = STRINGS.INSIGHT.WATER.RAWTEXT_EXT

				description = string.format(rawtext,STRINGS.INSIGHT.STATE[watertype])
				alt_description = string.format(rawtext_ext,STRINGS.INSIGHT.STATE[watertype],watermanager)
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