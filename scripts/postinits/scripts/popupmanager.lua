AddPopup("BOILBOOK")

GLOBAL.POPUPS.BOILBOOK.fn = function(inst, show)
    if inst.HUD then
        if not show then
            inst.HUD:CloseBoilbookScreen()
        elseif not inst.HUD:OpenBoilbookScreen() then
            GLOBAL.POPUPS.BOILBOOK:Close(inst)
        end
    end
end