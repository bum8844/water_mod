require("savefileupgrades")

local SaveFileupgrades = require("savefileupgrades")

local nextupdate = #SaveFileupgrades.upgrades + 1

local function FlagForRetrofitting_Forest(savedata, flag_name)
    if savedata ~= nil and savedata.map ~= nil and savedata.map.prefab == "forest" then
        if savedata.map.persistdata == nil then
            savedata.map.persistdata = {}
        end

        if savedata.map.persistdata.retrofitforestmap_anr == nil then
            savedata.map.persistdata.retrofitforestmap_anr = {}
        end
        savedata.map.persistdata.retrofitforestmap_anr[flag_name] = true
    end

end

local function FlagForRetrofitting_Cave(savedata, flag_name)
    if savedata ~= nil and savedata.map ~= nil and savedata.map.prefab == "cave" then
        if savedata.map.persistdata == nil then
            savedata.map.persistdata = {}
        end

        if savedata.map.persistdata.retrofitcavemap_anr == nil then
            savedata.map.persistdata.retrofitcavemap_anr = {}
        end
        savedata.map.persistdata.retrofitcavemap_anr[flag_name] = true
    end

end

SaveFileupgrades.upgrades[nextupdate] = {
	version = SaveFileupgrades.VERSION + 0.000002217,
	fn = function(savedata)
	    FlagForRetrofitting_Forest(savedata, "retrofit_tea_tree")
	    FlagForRetrofitting_Forest(savedata, "retrofit_caffeinberry_bush")
	    FlagForRetrofitting_Cave(savedata, "retrofit_ruincacao_tree")
		SaveFileupgrades.upgrades[nextupdate-1].fn(savedata)
	end
}