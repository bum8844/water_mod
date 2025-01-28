local debug = GLOBAL.debug

local function GetUpValue(func, varname)
	local i = 1
	local n, v = debug.getupvalue(func, 1)
	while v ~= nil do
		--print("UPVAL GET", varname ,n, v)
		if n == varname then
			return v
		end
		i = i + 1
		n, v = debug.getupvalue(func, i)
	end
end

AddComponentPostInit("farming_manager", function(self)
	function self:GetTileMoisureAtPoint(x,y,z)
		local dehy_overlaygrid = GetUpValue(self.AddSoilMoistureAtPoint, "_overlaygrid")
		local dehy_moisturegrid = GetUpValue(self.AddSoilMoistureAtPoint, "_moisturegrid")
		local dehy_x,dehy_y = GLOBAL.TheWorld.Map:GetTileCoordsAtPoint(x,y,z)
		local index = _overlaygrid:GetIndex(dehy_x,dehy_y)
		return dehy_moisturegrid:GetDataAtIndex(index)
	end
end)