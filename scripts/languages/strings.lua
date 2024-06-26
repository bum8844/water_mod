local modlist = require("utils/water_modlist").active_mod_compatibility
--the translation function is in progress
STRINGS.NAMES.FRUITFLYFRUIT_DEAD = STRINGS.NAMES.FRUITFLYFRUIT
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
	--ua = "ua",--Ukranian
}

local stringfiles =
{
	"common",
	"insight",
	"showme",
}

local locale = GetModConfigData("locale") or locales[LOC.GetLocaleCode()] or "en"

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

function LoadStringsV1(loc)
	if locales[loc] == nil then return end
	--[[modrequire("languages/strings/"..locale.."/common"))
	if modlist.it and GetModConfigData("useinsight") then
		modrequire("languages/strings/"..locale.."/insight")
	elseif modlist.sm and GetModConfigData("useshowme") then
		modrequire("languages/strings/"..locale.."/showme")
	end]]

	for _, file in pairs(stringfiles) do
		modrequire("languages/strings/"..loc.."/"..file)
	end

	for _, character in pairs(vanilla_characters) do
		MergeTable(STRINGS.CHARACTERS[string.upper(character)], require("languages/strings/"..loc.."/speech_"..character))
	end
end

function LoadStringsV2()
	for _, file in pairs(stringfiles) do
		MergeTable(str_tbl, require("languages/strings/"..file))
	end

	local character = nil
	for _, name in pairs(vanilla_characters) do
		character = string.upper(name)
		MergeTable(str_tbl["CHARCTERS"][character], require("languages/strings/speech_"..character))
	end
end

LoadStringsV1(locale)
--LoadStringsV2()
---------------------------------------------------------------------------------
-- PO/T Generation
---------------------------------------------------------------------------------

local STRING_RESERVED_LEAD_BYTES =
{
    238,
    239,
}

local STRINGS_LOOKUP = {}

--This function only works correctly when both tables have the same key structure.
local function LookupIdValue(lkp_var, path)
	local evalstr = "return "..lkp_var.."."..path
	local result, val = pcall(function() return loadstring(evalstr)() end)
	if result and type(val) == "string" then return val else return nil end
end

--returns a table of flattened keys
--ex: { K1 = {a1 = "foo", a2 = "bar"}} -> {K1.a1, K1.a2}
local function GetIndexTable()
	local idxtbl = {}
	for _, file in pairs(stringfiles) do
		GetKeyTable(require("languages/strings/"..file), nil, idxtbl)
	end

	for _, name in pairs(vanilla_characters) do
		GetKeyTable(require("languages/strings/speech_"..name), "CHARACTERS."..string.upper(name), idxtbl)
	end
	--[[print("GetIndexTable():")
	for k, v in pairs(idxtbl) do
		print(k.." : "..v)
	end]]
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
	--[[print("str_tbl:")
	for k, v in pairs(str_tbl) do
		print(k.." : "..v)
	end]]
	return str_tbl
end

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

local output_strings = nil
local function PrintStringTable( base, tbl, file )
	if file then
		output_strings = {}
	end

	for k,v in pairs(tbl) do
		local path = base.."."..k
		if type(v) == "table" then
			PrintStringTable(path, v)
		else
			local str = string.gsub(v, "\n", "\\n")
			str = string.gsub(str, "\r", "\\r")
			str = string.gsub(str, "\"", "\\\"")
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
	for k,v in pairs(tbl_dta) do
		local idstr = lkp_tbl[k]
		if idstr then
			idstr = string.gsub(idstr, "\n", "\\n")
			idstr = string.gsub(idstr, "\r", "\\r")
			idstr = string.gsub(idstr, "\"", "\\\"")
		else
			idstr = ""
		end

		local str = v
		str = string.gsub(str, "\n", "\\n")
		str = string.gsub(str, "\r", "\\r")
		str = string.gsub(str, "\"", "\\\"")

		if idstr ~= "" then
			file:write("#. "..k)
			file:write("\n")
			file:write("msgctxt \""..k.."\"")
			file:write("\n")
			file:write("msgid \""..idstr.."\"")
			file:write("\n")
			file:write("msgstr \""..str.."\"")
			file:write("\n\n")
		end
	end
end

function DSD_CreateStringsPOT(filename, root, baselang)
	local change_lang = locale ~= baselang
	if change_lang then LoadStringsV1(baselang) end

	local tbl_idx = GetIndexTable()
	local tbl_dta = ExtractTableByIndex("STRINGS", tbl_idx)
	baselang = baselang or "en"
	filename = filename or "scripts\\languages\\strings.pot"
	root = root or "STRINGS"

	local file, errormsg = io.open(MODROOT..filename, "w")
	if not file then print("DSD FAILED TO GENERATE .POT:\n"..tostring(errormsg)) return end

	--write header
	file:write('# Please Notice: If strings_'..baselang..'.pot is not updated, you can update it by using DSD_Generate'..string.upper(baselang)..'POT() in the in-game console')
	file:write('msgid ""\n')
	file:write('msgstr ""\n')
	file:write('"Application: Don\'t Starve\\n"\n')
	file:write('"POT Version: 2.0\\n"\n\n')

	PrintStringTable( root, tbl_dta, file )

	file:close()

	if change_lang then LoadStringsV1(locale) end
	output_strings = nil
end

DSD_GenerateENPOT = function()
	DSD_CreateStringsPOT("scripts\\languages\\strings_en.pot", "STRINGS", "en")
end
GLOBAL.DSD_GenerateENPOT = DSD_GenerateENPOT

DSD_GenerateKOPOT = function()
	DSD_CreateStringsPOT("scripts\\languages\\strings_kr.pot", "STRINGS", "ko")
end
GLOBAL.DSD_GenerateKOPOT = DSD_GenerateKOPOT

--This function was used for initial .po generation only
DSD_GeneratePOfromLua = function(lang)
	if locales[lang] == nil then return end

	local baselang = ((lang=="en" or lang=="ko") and "ko") or "en"
	local tbl_idx = GetIndexTable()

	LoadStringsV1(baselang)	--Load the base language, extract strings and store
	STRINGS_LOOKUP = ExtractTableByIndex("STRINGS", tbl_idx)
	LoadStringsV1(lang) 	--Reload the selected language and extract the same strings
	local tbl_dta = ExtractTableByIndex("STRINGS", tbl_idx)

	local file, errormsg = io.open(MODROOT.."scripts\\languages\\DSD_"..lang..".po", "w")
	if not file then print("DSD FAILED TO GENERATE .POT:\n"..tostring(errormsg)) return end

	--write header
	file:write('# Please Notice: If strings_'..baselang..'.pot is not updated, you can update it by using DSD_Generate'..string.upper(baselang)..'POT() in the in-game console')
	file:write('msgid ""\n')
	file:write('msgstr ""\n')
	file:write('"Language: '.. lang .. '\n"\n')
	file:write('"Content-Type: text/plain; charset=utf-8\n"\n')
	file:write('"Content-Transfer-Encoding: 8bit\n"\n')
	file:write('"Application: Don\'t Starve\\n"\n')
	file:write('"POT Version: 2.0\\n"\n\n')

	PrintTranslatedStringTable( root, tbl_dta, "STRINGS_LOOKUP", file )

	file:close()

	LoadStringsV1(locale)
	output_strings = nil
end
GLOBAL.DSD_GeneratePOfromLua = DSD_GeneratePOfromLua
