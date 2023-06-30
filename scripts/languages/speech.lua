local vanilla_characters = {
	"generic",
	--[["walter",
	"wanda",
	"warly",
	"wathgrithr",
	"waxwell",
	"webber",
	"wendy",
	"wickerbottom",
	"willow",
	"wolfgang",
	"woodie",
	"wormwood",
	"wortox",
	"wurt",
	"wx78",]]
}

local function MergeTable( tbl1 , tbl2 )
	local base = tbl1
	for k, v in pairs(tbl2) do
		if type(v) == "table" then
			base[k] = type(base[k])=="table" and base[k] or {}
			MergeTable(base[k], v)
		else
			base[k] = v
		end
	end
end

for _, character in pairs(vanilla_characters) do
	MergeTable(STRINGS.CHARACTERS[string.upper(character)], require("languages/strings/speech_"..character))
end
