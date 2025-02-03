local BoilbookBasicPopupScreen = require "screens/boilbookbasicpopupscreen"
local BoilbookAdvancedPopupScreen = require "screens/boilbookadvancedpopupscreen"

AddClassPostConstruct("screens/playerhud", function(self)
	function self:OpenBoilbookBasicScreen()
	    self:CloseBoilbookBasicScreen()
	    self.boilbookscreen = BoilbookBasicPopupScreen(self.owner)
	    self:OpenScreenUnderPause(self.boilbookscreen)
	    return true
	end

	function self:CloseBoilbookBasicScreen()
	    if self.boilbookscreen ~= nil then
	        if self.boilbookscreen.inst:IsValid() then
	            TheFrontEnd:PopScreen(self.boilbookscreen)
			end
	        self.boilbookscreen = nil
	    end
	end

	function self:OpenBoilbookAdvancedScreen()
	    self:CloseBoilbookAdvancedScreen()
	    self.boilbookscreen = BoilbookAdvancedPopupScreen(self.owner)
	    self:OpenScreenUnderPause(self.boilbookscreen)
	    return true
	end

	function self:CloseBoilbookAdvancedScreen()
	    if self.boilbookscreen ~= nil then
	        if self.boilbookscreen.inst:IsValid() then
	            TheFrontEnd:PopScreen(self.boilbookscreen)
			end
	        self.boilbookscreen = nil
	    end
	end
end)
