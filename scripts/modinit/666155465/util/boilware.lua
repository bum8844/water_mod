local function round2(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

local function GetShowItemInfo(inst)
	local b = inst.components.brewing
	local d = inst.components.distiller
	local wl = inst.components.waterlevel
	local sm = inst.components.saltmaker

	local wstxt, smtxt, txt = "", "", ""
	local product = STRINGS.SHOWME.BOILWARE.PRODUCT
	local time = STRINGS.SHOWME.BOILWARE.TIME
	local amount = STRINGS.SHOWME.BOILWARE.AMOUNT
	local salt = STRINGS.SHOWME.BOILWARE.SALT

	if b and b.product and b.IsCooking and b:IsCooking() then

		local tm=round2(b.targettime-GetTime(),0)
		if tm<0 then 
			tm=0 
		end

		product = string.format(product,b.product)
		time = string.format(time,tm)

		txt = product..time
	end

	if sm then
		smtxt = string.format(salt,sm.pickablevalue)
	end

	if wl and wl:GetWater() > 0 then
		if b and (b.product or b.usedistill) then
		else
			amount = string.format(amount,wl.currentwater,wl.maxwater,wl.watertype)
			txt = amount..wstxt
			if d and d.isBoiling and d:isBoiling() then

				local tm=round2(d.boiling_timer-GetTime(),0)
				if tm<0 then 
					tm=0 
				end

				time = string.format(time,tm)

				txt = txt..time
			end
			if sm then
				txt = txt..smtxt
			end
		end
	elseif sm then
		txt = smtxt
	end

	return txt
end

local function fn(inst)
	inst.GetShowItemInfo = GetShowItemInfo
end

return { fn = fn }