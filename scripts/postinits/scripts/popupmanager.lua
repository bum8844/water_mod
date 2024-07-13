AddPopup("BOILBOOK_BASIC")
AddPopup("BOILBOOK_ADVANCED")


GLOBAL.POPUPS.BOILBOOK_BASIC.fn = function(inst, show)
    if inst.HUD then
        if not show then
            inst.HUD:CloseBoilbookBasicScreen()
        elseif not inst.HUD:OpenBoilbookBasicScreen() then
            GLOBAL.POPUPS.BOILBOOK_BASIC:Close(inst)
        end
    end
end

GLOBAL.POPUPS.BOILBOOK_ADVANCED.fn = function(inst, show)
    if inst.HUD then
        if not show then
            inst.HUD:CloseBoilbookAdvancedScreen()
        elseif not inst.HUD:OpenBoilbookAdvancedScreen() then
            GLOBAL.POPUPS.BOILBOOK_ADVANCED:Close(inst)
        end
    end
end