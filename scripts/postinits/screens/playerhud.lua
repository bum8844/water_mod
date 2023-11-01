local BoilbookPopupScreen 	= require "screens/boilbookpopupscreen"

AddClassPostConstruct("screens/playerhud", function(self)
	function self:OpenBoilbookScreen()
	    self:CloseBoilbookScreen()
	    self.boilbookscreen = BoilbookPopupScreen(self.owner)
	    self:OpenScreenUnderPause(self.boilbookscreen)
	    return true
	end

	function self:CloseBoilbookScreen()
	    if self.boilbookscreen ~= nil then
	        if self.boilbookscreen.inst:IsValid() then
	            TheFrontEnd:PopScreen(self.boilbookscreen)
			end
	        self.boilbookscreen = nil
	    end
	end
end)
