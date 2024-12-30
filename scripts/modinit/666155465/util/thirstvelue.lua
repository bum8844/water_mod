local SERVER_SIDE = TheNet:GetIsServer()
local CLIENT_SIDE =  TheNet:GetIsClient() or (SERVER_SIDE and not TheNet:IsDedicated())
local food_estimation = tonumber(GetModConfigData("food_estimation",true)) or -1
if food_estimation == -1 then
    food_estimation = tonumber(GetModConfigData("food_estimation","Show Me (Origin)")) or 0
end

local LOCALS = {
    " / Sanidade:", --br
    " / 精神:", --chs
    " / 理智:", --cht
    " / Cordura:", --es
    " / 정신력:", --kr
    " / Poczytalność:", --pl
    " / Рассудок:", --ru
}

--_G.pendingThirstValueCallback = nil

local function round2(num, idp)
    return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

local function GetThirstString(item,player)
    local thirstvalue = ""
    if item.components.edible and player.components.eater then
        local edible = item.components.edible
        local eater = player.components.eater
        if eater:CanEat(item) then
            local should_Estimate_Stale = player and player.should_Estimate_Stale
            if not should_Estimate_Stale then
                should_Estimate_Stale = food_estimation ~= 0
            end

            if should_Estimate_Stale and edible.GetThirst then
                thirstvalue = round2(edible:GetThirst(player),1)
            else
                thirstvalue = edible.thirstvalue or edible:GetThirstFromHungerValue()
                thirstvalue = round2(thirstvalue,1)
            end

            local base_mult = player.components.foodmemory ~= nil and player.components.foodmemory:GetFoodMultiplier(item) or 1
            local tt_mult = (eater.thirstabsorption or 1) * base_mult

            thirstvalue = thirstvalue * tt_mult
            if thirstvalue > 0 then
                thirstvalue = "+"..tostring(thirstvalue)
            end
        end
    end
    return thirstvalue
end

AddModRPCHandler("ShowMeSHint_Water", "Water_Hint", function(player, guid, item)
    if player.player_classified == nil then
        print("ERROR: player_classified not found!")
        return
    end
    if item ~= nil and item.components ~= nil then
        local s = GetThirstString(item,player)
        if s ~= "" then
            player.player_classified.net_showme_hint2_water:set(guid..";"..s)
        end
    end
end)

local function player_classifiedfn(inst)
    inst.showme_hint2_water = ""
    inst.net_showme_hint2_water = net_string(inst.GUID, "showme_hint_water_bua.", "showme_hint_water_dirty2")
    if CLIENT_SIDE then
        inst:ListenForEvent("showme_hint_water_dirty2",function(inst)
            inst.showme_hint2_water = inst.net_showme_hint2_water:value()
        end)
    end
end

--[[AddModRPCHandler("ShowMeSHint_Water", "RequestThirstValue", function(player, prefab, x, y, z)
    local entities = TheSim:FindEntities(x, y, z, .001)
    for k, entity in pairs(entities) do
        if entity.prefab == prefab then
            local thirstvalue = false
            local can_eat = false
			if player.components then
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
end)]]


local function hovererfn(self)

    local function GetThirst(inst)
        local c = _G.ThePlayer and _G.ThePlayer.player_classified
        if c == nil then
            return ""
        end
        local i = string.find(c.showme_hint2_water,';',1,true)
        if i == nil then
            return ""
        end
        local guid = _G.tonumber(c.showme_hint2_water:sub(1,i-1))
        if guid ~= inst.GUID then
            return ""
        end
        return c.showme_hint2_water:sub(i+1)
    end

    --[[local function RequestThirstValue(entity, callback)
        if not TheWorld.ismastersim and entity then
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
    end]]

    local old_SetString = self.text.SetString

    require("constants")
    local Text = require "widgets/text"
    local Widget = require "widgets/widget"

    self.text.SetString = function(text,str)
        old_SetString(text,str)

        local save_target
        local last_check_time = 0 

        local target = _G.TheInput:GetHUDEntityUnderMouse()
        if target ~= nil then
            target = target.widget ~= nil and target.widget.parent ~= nil and target.widget.parent.item
        else
            target = _G.TheInput:GetWorldEntityUnderMouse()
        end

        if target ~= nil then
            local waterstr = GetThirst(target)
            if waterstr ~= "" then
                local txt = STRINGS.SHOWME.THIRSTVALUE.THIRST
                waterstr = string.format(txt,tostring(waterstr))
                local newstr = text:GetString()
                local pattern = " / Sanity:" --en
             
                for k, v in pairs(LOCALS) do
                    if string.find(newstr,v) then
                        pattern = v    
                    end
                end

                str = string.gsub(newstr,pattern," / "..waterstr..pattern)
                text.string = str
                text.inst.TextWidget:SetString(str or "")
            end

            --[[if target ~= nil then
                RequestThirstValue(target, function(thirstvalue)
                    local txt = STRINGS.SHOWME.THIRSTVELUE.THIRST
                    if thirstvalue then
                        self.old_waterstr = self.waterstr
                        self.waterstr = thirstvalue < 0 and string.format(txt,tostring(round2(thirstvalue,1))) or string.format(txt,"+"..tostring(round2(thirstvalue,1))) 
                    else
                        self.waterstr = nil
                    end
                end)
            end



            if not self.waterstr then
                return old_SetString(text,str)
            end]]
            if target ~= save_target or last_check_time + 1 < GetTime() then
                save_target = target
                last_check_time = GetTime()
                SendModRPCToServer(MOD_RPC.ShowMeSHint_Water.Water_Hint, save_target.GUID, save_target)
            end
        end
    end

    --self.watertxt = self:AddChild(Text(_G.UIFONT, 30))
    --self.watertxt:SetPosition(0,-20,0)

    --[[function self:SetText()
        local old_SetString
        local text = self.text:GetString()
        local pattern = ""
        if text == nil then
            return nil
        elseif string.find(text," / 정신력:") then
            pattern = " / 정신력:"
        elseif string.find(text," / 정신력:") then
            pattern = " / Sanity:"
        else
            pattern = nil
        end

        if not pattern then
            return false
        end

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
                    self.waterstr = thirstvalue < 0 and string.format(txt,tostring(round2(thirstvalue,1))) or string.format(txt,"+"..tostring(round2(thirstvalue,1))) 
                end
            end)
        end        

        if not self.waterstr then
            return nil
        end

        text = string.gsub(text,pattern," / "..self.waterstr..pattern)
        return text
    end]]

    --[[self.updater_old = self.OnUpdate
    function self:OnUpdate()
        local strFrames = 0
        self:updater_old()

        if self.waterstr then
            local lmb = self.owner.components.playercontroller:GetLeftMouseAction()
            self.text:Hide()
            if lmb ~= nil and self.owner:IsActionsVisible() then
                if self.old_waterstr ~= self.waterstr then
                    local strFrames = 0
                    self.old_waterstr = self.waterstr
                else
                    strFrames = strFrames - 1
                    if strFrames <= 0 then
                        self.text:Show()
                    end
                end
            end
        end
    end]]
end

return { hovererfn = hovererfn, player_classifiedfn = player_classifiedfn }