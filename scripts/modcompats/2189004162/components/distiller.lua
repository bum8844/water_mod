local Color = require("helpers/color")

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

local function Descriptors()
	Insight.descriptors.distiller = {
		Describe = function(self, context)
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

			local rawtext = STRINGS.INSIGHT.DISITLLER.RAWTEXT
			boiling_time_string = string.format(rawtext,water_type_string,boiling_time_string)

			description = CombineLines(boiling_time_string)

			return {
				priority = 2,
				description = description
			}
		end
	}
end

return { Descriptors = Descriptors }