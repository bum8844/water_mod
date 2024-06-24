local function round2(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

local function GetFiniteuses(inst)
	local value = inst.components.finiteuses:GetUses() + 1
	local peruse = TUNING.BUCKET_LEVEL_PER_USE
	value = value > peruse and peruse or value

	return value
end

local function GetShowItemInfo(inst)
	local sp = inst.components.steampressure
	local ws = inst.components.wateringstructure
	local wt = inst.components.wateringtool

	local txt = ""
	local steam = STRINGS.SHOWME.WATERCOLLATOR.STEAM
	local waitrain = STRINGS.SHOWME.WATERCOLLATOR.WAITRAIN
	local amount = STRINGS.SHOWME.WATERCOLLATOR.AMOUNT

	if sp then
		local curpressure = sp.curpressure
		local maxpressure = sp.maxpressure

		local percent = math.min(maxpressure, curpressure) / maxpressure

		txt = string.format(steam,round2(percent*100,0).."%")

		return txt
	end

	if ws and ws.wateringtool then
		txt = string.format(amount,ws.wateramount)
		return txt
	end

	if wt and wt.cancollectrainwater then
		if not wt.wateringtooltask and not wt.watertype then
			txt = waitrain
		elseif wt.watertype then
			txt = string.format(amount,GetFiniteuses(inst))
		end
		return txt
	end
end

local function fn(inst)
	inst.GetShowItemInfo = GetShowItemInfo
end

return { fn = fn }