require("savefileupgrades")

local SaveFileupgrades = require("savefileupgrades")

local nextupdate = #SaveFileupgrades.upgrades + 1

SaveFileupgrades.upgrades[nextupdate] = {
	version = SaveFileupgrades.VERSION,
	fn = function(savedata)
		print("해당코드가 작동했습니다.")
		FlagForRetrofitting_Forest(savedata, "retrofit_tree_tree")
		FlagForRetrofitting_Forest(savedata, "retrofit_caffeinberry_bush")
	end,
}