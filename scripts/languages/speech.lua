local modlist = require("utils/water_modlist").active_mod_compatibility
--the translation function is in progress
STRINGS.NAMES.FRUITFLYFRUIT_DEAD = STRINGS.NAMES.FRUITFLYFRUIT
STRINGS.UI.DRINK_TYPES = {}

LOC = require("languages/loc")

local locales =
{
	en = "en",
	ko = "ko",
	vi = "vi",
	es = "es",
	--zh = "zh",
	--zht = "zh",
	--zhr = "zh",
	--ru = "ru",
	--ua = "ua",--우크라니아
}

local locale = GetModConfigData("locale") or locales[LOC.GetLocaleCode()] or "en"
--[[if type(locale)~="table" then
	print(locale)
else
	for k, v in pairs(locale) do
		print(k, v)
	end
end]]

local vanilla_characters = {
	"generic",
	"walter",
	"wanda",
	"warly",
	"wathgrithr",
	"waxwell",
	"webber",
	"wendy",
	"wickerbottom",
	"willow",
	"winona",
	"wolfgang",
	"woodie",
	"wormwood",
	"wortox",
	"wurt",
	"wx78",
}

local function MergeTable(tbl1, tbl2)
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
	MergeTable(STRINGS.CHARACTERS[string.upper(character)], require("languages/strings/"..locale.."/speech_"..character))
end

modrequire("languages/strings/"..locale.."/common")
--modrequire("languages/strings/"..locale.."/insight")
modrequire("languages/strings/en/insight")

if modlist.it and GetModConfigData("useinsight") then
	modrequire("languages/strings/"..locale.."/insight")
elseif modlist.sm and GetModConfigData("useshowme") then
	modrequire("languages/strings/"..locale.."/showme")
end

--AFS: some translation functions taken from Island Adventures. WIP
--[[function DSD_GeneratePOT()
	--create the file
	local file, errormsg = io.open(IAENV.MODROOT  ..  "scripts/languages/strings.pot", "w")
	if not file then print("FAILED TO GENERATE .POT:\n" ..  tostring(errormsg)) return end

	--write header
	file:write('#. Note to translators: Update the POT file using IA_makePOT() in the in-game console if we forget to\n')
	file:write('msgid ""\n')
	file:write('msgstr ""\n')
	file:write('"Application: Don\'t Starve\\n"\n')
	file:write('"POT Version: 2.0\\n"\n\n')

	--gather all the strings
	local _strings = flattenStringsTable(import("common.lua"), "STRINGS.")
	for _,v in pairs(_speech) do
		flattenStringsTable(import(v .. ".lua"), "STRINGS.CHARACTERS." .. string.upper(v) .. ".", _strings)
	end
	for _,v in pairs(_newspeech) do
		flattenStringsTable(import(v .. ".lua"), "STRINGS.CHARACTERS." .. string.upper(v) .. ".", _strings)
	end

	--write all the strings
	for k, v in pairs(_strings) do
		file:write('#. ' .. k .. "\n")
		file:write('msgctxt "' .. k .. '"\n')
		file:write('msgid "' .. v .. '"\n')
		file:write('msgstr ""\n\n')
	end

	--done
	file:close()
end]]

