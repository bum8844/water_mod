local modlist = require("utils/water_modlist").active_mod_compatibility
--the translation function is in progress
STRINGS.NAMES.FRUITFLYFRUIT_DEAD = STRINGS.NAMES.FRUITFLYFRUIT
LOC = require("languages/loc")

local locales =
{
	en = "en",
	ko = "ko",  --default langugage
	vi = "vi",
	es = "es",
	--zh = "zh",
	--zht = "zh",
	--zhr = "zh",
	--ru = "ru",
	--ua = "ua",  --Ukranian
}

local stringfiles =
{
	"common",
	"insight",
	"showme",
}

local lang = GetModConfigData("locale") or LOC.GetLocaleCode() or "en"
local locale =  locales[lang]

local vanilla_characters =
{
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

local function MergeTable(tbl1, tbl2, no_overwrite)
    if not tbl1 then
        tbl1 = {}
    end

    for k, v in pairs(tbl2) do
        if type(v) == "table" then
            tbl1[k] = type(tbl1[k])=="table" and tbl1[k] or {}
            MergeTable(tbl1[k], v)
        elseif not no_overwrite or tbl1[k] == nil then
            tbl1[k] = v
        end
    end
    return tbl1
end

local function GetKeyTable(tbl, base, keytbl)
    if not keytbl then
        keytbl = {}
    end
    
    for k, v in pairs(tbl) do
    	local path = (base==nil and k) or base.."."..k
        if type(v) == "table" then
            GetKeyTable(v, path, keytbl)
        else
            table.insert(keytbl, path)
        end
    end
    return keytbl
end

local function LoadStringsV1(loc)
	if locales[loc] == nil then
		print('DSD Failed to load language file')
		return
	end

	for _, file in pairs(stringfiles) do
		modrequire("languages/strings/"..loc.."/"..file)
	end

	for _, character in pairs(vanilla_characters) do
		MergeTable(STRINGS.CHARACTERS[string.upper(character)], require("languages/strings/"..loc.."/speech_"..character))
	end
end

local function LoadStringsV2(str_tbl)
	for _, file in pairs(stringfiles) do
		MergeTable(str_tbl, require("languages/strings/"..file))
	end

	if type(str_tbl["CHARACTERS"]) ~= "table" then
		str_tbl["CHARACTERS"] = {}
	end
	for _, name in pairs(vanilla_characters) do
		local character = string.upper(name)
		if type(str_tbl["CHARACTERS"][character]) ~= "table" then
			str_tbl["CHARACTERS"][character] = {}
		end
		MergeTable(str_tbl["CHARACTERS"][character], require("languages/strings/speech_"..character))
	end
end

--LoadStringsV1(locale)
LoadStringsV2(STRINGS)

--------------------------------------------------------------------------------------------------------------------
require "translator"
local LanguageTranslator = GLOBAL.LanguageTranslator

function UnloadPOCache(lang)
	LanguageTranslator.languages[lang.."_temp"] = nil
end

function DSD_LoadPOFile(lang) --lang==nil -> Load the current language file
	local _defaultlang = LanguageTranslator.defaultlang
	local loc = lang or locale

	LanguageTranslator:LoadPOFile(MODROOT.."scripts/languages/DSD_"..loc..".po", loc.."_temp") --loc_temp라는 언어명으로 번역된 문자열 테이블이 저장됨
	if lang == nil then
		if LanguageTranslator.languages[loc] == nil then
			LanguageTranslator.languages[loc] = {}
		end
		MergeTable(LanguageTranslator.languages[loc], LanguageTranslator.languages[loc.."_temp"], true)
		UnloadPOCache(loc)
	end
	LanguageTranslator.defaultlang = _defaultlang

	return LanguageTranslator.languages[loc.."_temp"]
end

function TranslateString()
	local _defaultlang = LanguageTranslator.defaultlang
	LanguageTranslator.defaultlang = locale
	GLOBAL.TranslateStringTable(STRINGS)
	LanguageTranslator.defaultlang = _defaultlang
end

--This part should only run once at the startup
if locale ~= "ko" then
	DSD_LoadPOFile()
	TranslateString()
end
---------------------------------------------------------------------------------
-- PO/T Generation
---------------------------------------------------------------------------------

local STRING_RESERVED_LEAD_BYTES =
{
    238,
    239,
}

local STRINGS_LOOKUP = nil

local function IsValidString( str )
    if 0 < string.len(str) then
        local lead_byte = string.byte( str, 1, 1)
        for i, reserved_bytes in pairs(STRING_RESERVED_LEAD_BYTES) do
            if lead_byte == reserved_bytes then
                return false
            end
        end
    end
    return true
end

local function ConvertEscapeCharactersToString(str)
	local newstr = string.gsub(str, "\n", "\\n")
	newstr = string.gsub(newstr, "\r", "\\r")
	newstr = string.gsub(newstr, "\"", "\\\"")

	return newstr
end

local function ConvertEscapeCharactersToRaw(str)
	local newstr = string.gsub(str, "\\n", "\n")
	newstr = string.gsub(newstr, "\\r", "\r")
	newstr = string.gsub(newstr, "\\\"", "\"")

	return newstr
end

local output_strings = nil
local function PrintStringTable( base, tbl, file )
	if file then
		output_strings = {}
	end

	for k,v in pairs(tbl) do
		local path = (base ~= nil and base.."."..k) or k
		if type(v) == "table" then
			PrintStringTable(path, v)
		else
			local str = ConvertEscapeCharactersToString(v)
			if IsValidString( str ) then
				local to_add = {}
				to_add.path = path
				to_add.str = str
				table.insert( output_strings, to_add )
			elseif string.len(v) > 4 then --4 is arbitrary, high enough to just ignore the controller "strings" but low enough to catch valid strings that were dropped due to umlauts and such
				print("### Possible valid string dropped from .pot generation?", path, v)
			end

		end
	end

	if file then
		table.sort(output_strings, function(a,b) return a.path < b.path end )
		for _,v in pairs(output_strings) do
			file:write("#. "..v.path)
			file:write("\n")
			file:write("msgctxt \""..v.path.."\"")
			file:write("\n")
			file:write("msgid \""..v.str.."\"")
			file:write("\n")
			file:write("msgstr \"\"")
			file:write("\n\n")
		end
	end
end

--both tbl_dta and lkp_tbl must be a flattened string table
local function PrintTranslatedStringTable( base, tbl_dta, lkp_tbl, file )
	if file then
		output_strings = {}
	end

	for k,v in pairs(tbl_dta) do
		local idstr = lkp_tbl[k]
		if idstr then
			idstr = ConvertEscapeCharactersToString(idstr)
		else
			idstr = ""
		end
		local str = ConvertEscapeCharactersToString(v)

		if idstr and idstr ~= "" then
			table.insert(output_strings, {path=base.."."..k, idstr=idstr, str=str})
		end
	end
	table.sort(output_strings, function(a,b) return a.path < b.path end )

	if file then
		for _, v in pairs(output_strings) do
			file:write("#. "..v.path)
			file:write("\n")
			file:write("msgctxt \""..v.path.."\"")
			file:write("\n")
			file:write("msgid \""..v.idstr.."\"")
			file:write("\n")
			file:write("msgstr \""..v.str.."\"")
			file:write("\n\n")
		end
	end
end

function DSD_CreateStringsPOT(filename, root, str_tbl, baselang)
	baselang = baselang or "en"
	filename = filename or "scripts\\languages\\strings.pot"
	--root = root or "STRINGS"

	local file, errormsg = io.open(MODROOT..filename, "w")
	if not file then print("DSD FAILED TO GENERATE .POT:\n"..tostring(errormsg)) return end

	--write header
	file:write('# Please Notice: If strings_'..baselang..'.pot is not updated, you can update it by using DSD_Generate'..string.upper(baselang)..'POT() in the in-game console\n')
	file:write('msgid ""\n')
	file:write('msgstr ""\n')
	file:write('"DSD Version: '..modinfo.version..'"\n')
	file:write('"Application: Don\'t Starve"\n')
	file:write('"POT Version: 2.0"\n\n')

	PrintStringTable( root, str_tbl, file )

	file:close()


	output_strings = nil
end

DSD_GenerateENPOT = function()
	local str_tbl = DSD_LoadPOFile("en")
	DSD_CreateStringsPOT("scripts\\languages\\strings_en.pot", nil, str_tbl, "en")
	UnloadPOCache("en")
end

DSD_GenerateKOPOT = function()
	STRINGS_LOOKUP = {}
	LoadStringsV2(STRINGS_LOOKUP)
	DSD_CreateStringsPOT("scripts\\languages\\strings_ko.pot", "STRINGS", STRINGS_LOOKUP, "ko")
	STRINGS_LOOKUP = nil
end

--------------------------------------------------------------------------------------------

--assume both the table share the same structure
local function LookupIdValue(lkp_var, path)
	local evalstr = "return "..lkp_var.."["..path.."]"
	local result, val = pcall(function() return loadstring(evalstr)() end)
	if result and type(val) == "string" then return val else return nil end
end

--returns a table of flattened keys
--ex: { K1 = {a1 = "foo", a2 = "bar"}} -> {K1.a1, K1.a2}
local function GetIndexTable()
	local idxtbl = {}
	for _, file in pairs(stringfiles) do
		GetKeyTable(require("languages/strings/"..file), "STRINGS", idxtbl)
	end

	for _, name in pairs(vanilla_characters) do
		GetKeyTable(require("languages/strings/speech_"..name), "STRINGS.CHARACTERS."..string.upper(name), idxtbl)
	end
	return idxtbl
end

--'indexttable' must be a table of flattened keys
--returns a table of flattened keys - strings table
local function ExtractTableByIndex(lkp_var, indextable)
	local str_tbl = {}
	for _, v in pairs(indextable) do
		local str = LookupIdValue(lkp_var, v)
		if str then
			str_tbl[v] = str
		end
	end
	return str_tbl
end

--This function was used for initial .po generation only
DSD_GeneratePOfromLua = function(lang)
	if locales[lang] == nil then return end

	local baselang = ((lang=="en" or lang=="ko") and "ko") or "en"
	local tbl_idx = GetIndexTable()

	LoadStringsV1(baselang)	--Load the base language, extract strings and store
	STRINGS_LOOKUP = ExtractTableByIndex("STRINGS", tbl_idx)
	LoadStringsV1(lang) 	--Reload the selected language and extract strings with the same key
	local tbl_dta = ExtractTableByIndex("STRINGS", tbl_idx)

	local file, errormsg = io.open(MODROOT.."scripts\\languages\\DSD_"..lang..".po", "w")
	if not file then print("DSD FAILED TO GENERATE .POT:\n"..tostring(errormsg)) return end

	--write header
	file:write('# Please Notice: If strings_'..baselang..'.pot is not updated, you can update it by using DSD_Generate'..string.upper(baselang)..'POT() in the in-game console\n')
	file:write('msgid ""\n')
	file:write('msgstr ""\n')
	file:write('"Language: '.. lang .. '"\n')
	file:write('"Content-Type: text/plain; charset=utf-8"\n')
	file:write('"Content-Transfer-Encoding: 8bit"\n')
	file:write('"DSD Version: '..modinfo.version..'"')
	file:write('"Application: Don\'t Starve"\n')
	file:write('"POT Version: 2.0"\n\n')

	PrintTranslatedStringTable( "STRINGS", tbl_dta, STRINGS_LOOKUP, file )

	file:close()

	LoadStringsV1(locale)
	output_strings = nil
	STRINGS_LOOKUP = nil
end

---------------------------------------------------------------------------------------
GLOBAL.DSD_GenerateENPOT = DSD_GenerateENPOT
GLOBAL.DSD_GenerateKOPOT = DSD_GenerateKOPOT
GLOBAL.DSD_GeneratePOfromLua = DSD_GeneratePOfromLua
