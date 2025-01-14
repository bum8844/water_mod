local assets = {

}

local prefabs = {
    "warkawater_item",
}

local function fn()
    -- body
end

local function fn_item()
end

return Prefab("warkawater",fn,assets,prefabs),
Prefab("warkawater_item",fn,assets),
MakePlacer("warkawater_item_placer","warkawater","warkawater","idle")
