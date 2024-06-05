local function round2(num, idp)
	return _G.tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

_G.pendingThirstValueCallback = nil
local function RequestThirstValue(entity, callback)
    if not _G.TheWorld.ismastersim and entity then
        if entity.Transform then
            local x, y, z = entity.Transform:GetWorldPosition()
            if x ~= nil and y ~= nil and z ~= nil then 
                SendModRPCToServer(GetModRPC("ShowMeSHint_Water", "RequestThirstValue"), entity.prefab, x, y, z)
                if callback then
                    _G.pendingThirstValueCallback = callback
                end
            end
        end
    end
end

AddModRPCHandler("ShowMeSHint_Water", "RequestThirstValue", function(player, prefab, x, y, z)
    local entities = TheSim:FindEntities(x, y, z, .001)
    for k, entity in pairs(entities) do
        if entity.prefab == prefab then
            local thirstvalue = false
            local can_eat = false
			if player.components and not player:HasTag("playerghost") then
                if player.components.eater then
				    can_eat = player.components.eater:CanEat(entity)
                end
                if player.components.wereness and player.components.wereness.current > 0 then
                    can_eat = false
                end
			end
            if can_eat and entity.components and entity.components.edible then
                thirstvalue = entity.components.edible.thirstvalue or entity.components.edible:GetThirstFromHungerValue()
            end
            SendModRPCToClient(GetClientModRPC("ShowMeSHint_Water", "ReceiveThirstValue"), player.userid, thirstvalue)
            return
        end
    end
end)

AddClientModRPCHandler("ShowMeSHint_Water", "ReceiveThirstValue", function(thirstvalue)
    if _G.pendingThirstValueCallback then
        _G.pendingThirstValueCallback(thirstvalue)
        _G.pendingThirstValueCallback = nil
    end
end)


local function fn(self)
    require("constants")
    local Text = require "widgets/text"
    local Widget = require "widgets/widget"

    self.watertxt = self:AddChild(Text(_G.UIFONT, 30))
    self.watertxt:SetPosition(0,-20,0)

    self.updater_old = self.OnUpdate
    function self:OnUpdate()
        local activeItem = _G.ThePlayer.replica.inventory:GetActiveItem()
        local target = _G.TheInput:GetHUDEntityUnderMouse()
        if not activeItem then
            if target ~= nil then
                target = target.widget ~= nil and target.widget.parent ~= nil and target.widget.parent.item
            else
                target = _G.TheInput:GetWorldEntityUnderMouse()
            end
        end

        if target ~= nil then
            RequestThirstValue(target, function(thirstvalue)
            	local txt = STRINGS.SHOWME.THIRSTVELUE.THIRST
                if thirstvalue then
                    self.waterstr = thirstvalue < 0 and string.format(txt,tostring(round2(thirstvalue,1)))  or string.format(txt,"+"..tostring(round2(thirstvalue,1))) 
                    self.watertxt:SetString(self.waterstr)
                    self.watertxt:Show()         
                else
                    self.watertxt:Hide()
                end
            end)
        else
        	self.watertxt:Hide()
        end
        self:updater_old()    
    end
end

return { fn = fn }