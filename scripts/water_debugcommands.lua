require("consolecommands")

local function ListingOrConsolePlayer(input)
    if type(input) == "string" or type(input) == "number" then
        return UserToPlayer(input)
    end
    return input or ConsoleCommandPlayer()
end

function c_supergodmode(player)
    if TheWorld ~= nil and not TheWorld.ismastersim then
        c_remote("c_supergodmode()")
        return
    end

    player = ListingOrConsolePlayer(player)
    if player ~= nil then
        SuUsed("c_supergodmode", true)
        if player:HasTag("playerghost") then
            player:PushEvent("respawnfromghost")
            print("Reviving "..player.name.." from ghost.")
            return
        elseif player.components.health ~= nil then
            local godmode = player.components.health.invincible
            player.components.health:SetInvincible(not godmode)
            c_sethealth(1)
            c_setsanity(1)
            c_sethunger(1)
            c_setthirst(1)
            c_settemperature(25)
            c_setmoisture(0)
            print("God mode: "..tostring(not godmode))
        end
    end
end

function c_setthirst(n)
    local player = ConsoleCommandPlayer()
    if player ~= nil and player.components.thirst ~= nil and not player:HasTag("playerghost") then
        SuUsed("c_setthirst", true)
        player.components.thirst:SetPercent(math.min(n, 1))
    end
end