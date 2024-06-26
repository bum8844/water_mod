require "class"
require "util"

Translator = Class(function(self)
	self.languages = {}
	self.defaultlang = nil

	self.use_longest_locs = false
end)
