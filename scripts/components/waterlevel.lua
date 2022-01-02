
local WaterLevel = Class(function(self, inst)
    self.inst = inst
	self.maxlevel = 0
	self.currentlevel = 0
    self.currentlevelfn = nil
end,
nil,
{
})

function WaterLevel:SetLevelCallback(fn)
    self.currentlevelfn = fn
end

function WaterLevel:SetLevel(num)
	self.currentlevel = num
end

function WaterLevel:SetMaxLevel(num)
	self.maxlevel = num 
end

local function TakeWater(item, doer)
	local levelvalue = item.components.drinkvalue.levelvalue
	if self.currentlevel ~= self.maxlevel and self.currentlevel + levelvalue > self.maxlevel then
		self.currentlevel = self.currentlevel + levelvalue
		if item:HasTag("fil_bucket") then
		doer.components.inventory:GiveItem(SpawnPrefab("bucket"))
		elseif item:HasTag("fil_bottle") then
		doer.components.inventory:GiveItem(SpawnPrefab("messagebottleempty"))
		elseif item:HasTag("fil_cup") then
		doer.components.inventory:GiveItem(SpawnPrefab("cup"))
		end
		item:Remove()
	else
		doer.components.talker:Say("There's too much water...")
	end
end

local function GiveWater(item, doer)
	local levelvalue = item.components.drinkvalue.levelvalue
	if self.currentlevel <= 0 then
		doer.components.talker:Say("It's empty.")
	else
		if levelvalue <= self.currentlevel then
			self.currentlevel = self.currentlevel - levelvalue
			if item:HasTag("bucket") then
				doer.components.inventory:GiveItem(SpawnPrefab("bucket_full"))
			elseif item:HasTag("preparedrink_bottle") then
				doer.components.inventory:GiveItem(SpawnPrefab("bottle_water"))
			elseif item:HasTag("preparedrink_cup") then
				doer.components.inventory:GiveItem(SpawnPrefab("cup_water"))
			end
			item:Remove()
		else
			doer.components.talker:Say("It's too little to get it!")
		end
	end
end

--[[function
end]]--

local function SayWorld(item, doer)
	if item:HasTag("dirty") then
		doer.components.talker:Say("I can't put it in because the water is dirty.")
	elseif item:HasTag("salt") then
		doer.components.talker:Say("I can't put it in because the water is salty.")
	else
		doer.components.talker:Say("Can't get water with this.")
	end
end

function WaterLevel:CheckTag(item, doer)
	if self.inst:HasTag("barrle") then
		if item:HasTag("emptiy") then
			GiveWater(item, doer)
		elseif item:HasTag("water") then
			TakeWater(item, doer)
		end
	--[[elseif self.inst:HasTag("desalinator") then
		if item:HasTag("emptiy") then
			--GiveWater(item, doer)
		elseif item:HasTag("salt") then
			--TakeWater(item, doer)
		end
	elseif self.inst:HasTag("kettle") then
		if item:HasTag("emptiy") then
			--GiveWater(item, doer)
		elseif item:HasTag("water") then
			--TakeWater(item, doer)
		elseif item:HasTag("")
		end
	elseif self.inst:HasTag("campkettle")then]]--
	else
	SayWorld(item, doer)
	end
end

function WaterLevel:OnSave()
    if self.currentlevel ~= nil then
        return {waterlevel = self.currentlevel}
    end
end

function WaterLevel:OnLoad(data)
    if data.waterlevel then
        self.currentlevel = data.waterlevel
    end
end

return WaterLevel