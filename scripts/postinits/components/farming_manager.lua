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
		local _overlaygrid = GetUpValue(self.AddSoilMoistureAtPoint, "_overlaygrid")
		local _moisturegrid = GetUpValue(self.AddSoilMoistureAtPoint, "_moisturegrid")
		local _x,_y = GLOBAL.TheWorld.Map:GetTileCoordsAtPoint(x,y,z)
		local index = _overlaygrid:GetIndex(_x,_y)
		return _moisturegrid:GetDataAtIndex(index)
	end
end)