local function Descriptors()
	Insight.descriptors.distiller = {
		Describe = function(self, context)

			local Color = require("helpers/color")

			local description, boiling_time_string
			local boiling_time_string = self:GetTimeToBoil()

 			local is_authentic = self.GetTimeToBoil == require("components/distiller").GetTimeToBoil

			if not (is_authentic) then
				return
			end

			boiling_time_string = math.ceil(boiling_time_string)

			if boiling_time_string == 0 then
				return
			end

			local watertype = self.inst.components.waterlevel.watertype
			
			local water_type_string = watertype == WATERTYPE.SALTY and STRINGS.INSIGHT.STATE.DESALINATION or 
			(watertype == WATERTYPE.CLEAN_ICE or watertype == WATERTYPE.DIRTY_ICE) and STRINGS.INSIGHT.STATE.MELT or
			STRINGS.INSIGHT.STATE.PURIFY

<<<<<<< HEAD:scripts/modcompats/2189004162/components/distiller.lua
			local rawtext = STRINGS.INSIGHT.DISITLLER.RAWTEXT
=======
			local rawtext = STRINGS.INSIGHT.DISTILLER.RAWTEXT
>>>>>>> Beta_1.2.8:scripts/modinit/2189004162/components/distiller.lua
			boiling_time_string = string.format(rawtext,water_type_string,boiling_time_string)

			description = Insight.env.CombineLines(boiling_time_string)

			return {
				priority = 2,
				description = description
			}
		end
	}
end

return { Descriptors = Descriptors }