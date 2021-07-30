-- Функции для модуля жажды
local function OnEatWithThirst(food,inst) -- Хук етера для востановки жажды от некоторых продуктов
	if inst.fili_thirst == nil then
		return
	end
	
	local short = food.components.edible
	
	if inst:HasTag("player") then
		if food.prefab == "icecream" or food.prefab == "berryshake" then
			inst.fili_thirst = inst.fili_thirst + 100
		elseif food.prefab == "ice" then
			inst.fili_thirst = inst.fili_thirst + 20
		elseif food.prefab == "lightbulb" or food.prefab == "berries_juicy" then
			inst.fili_thirst = inst.fili_thirst + 15
		elseif short.foodtype == "VEGGIE" then
			inst.fili_thirst = inst.fili_thirst + short.healthvalue*0.7+short.hungervalue*0.38
		elseif short.foodtype == "MEAT" and food.components.dryable then
			inst.fili_thirst = inst.fili_thirst + short.healthvalue*0.7+short.hungervalue*0.4
		end
	end
end

local function OnEatHook(self)
    local OldOnEat = self.OnEaten
  
    self.OnEaten = function(self, eater)
	    OnEatWithThirst(self.inst,eater)
	    OldOnEat(self, eater)
    end
end

AddComponentPostInit("edible", OnEatHook)

local thirst_after_repawn = 75 -- Кол-во жажды которое дадут после смерти игрока.
local thirstmax = GetModConfigData("aw_thirst_max")
local thirst_speed = GetModConfigData("aw_thirst_speed")

local function OnPlayerDead(inst) -- Игрок умер задём жажду на опредёлное цисло.
    inst.fili_thirst = thirst_after_repawn
end

local function OnSaveThirst(inst, data) -- Сохраняем кол-во жажды.
    if data then
        if inst.fili_thirst then
	       data.fili_thirst = inst.fili_thirst
	    end
	    if inst.Old_Save ~= nil then
	        return inst.Old_Save(inst, data)
	    end
	end
end

local function OnLoadThirst(inst, data) -- Если данные о жажде есть загружаемся.
    if data then
        if data.fili_thirst then
	       inst.fili_thirst = data.fili_thirst
	    end
	    if inst.Old_Load ~= nil then
	        return inst.Old_Load(inst, data)
	    end
	end
end

local function Thirsty(inst) -- Тртатим жажду если не мертвы.
    if not inst:HasTag("playerghost") then
	    inst.fili_thirst = inst.fili_thirst-1
    end	
end

local function ThirstyDamage(inst) -- Тратим жизни если жажды нет и не мертвы.
    if not inst:HasTag("playerghost") and inst.fili_thirst == 0 then
        inst.components.health:DoDelta(-1)
    end
end

local function LerpState(inst) -- Lerp для стабилизации в рамках разумого.
    if inst.fili_thirst > thirstmax then
	    inst.fili_thirst = thirstmax
	end
	if inst.fili_thirst < 0 then
	    inst.fili_thirst = 0
	end
end

local function ThirstySleep(inst)
    if inst.sg:HasStateTag("bedroll") or inst.sg:HasStateTag("tent") then
	    Thirsty(inst)
	end
end

local function AddFiliThirst(inst) -- Функции жажды.
    if GLOBAL.TheWorld.ismastersim then
	    inst.fili_thirst = thirstmax
		inst.fili_thirst_instanse = true
	    inst.Old_Save = inst.OnSave
	    inst.Old_Load = inst.OnLoad
        inst.OnSave = OnSaveThirst
        inst.OnLoad = OnLoadThirst
		inst:ListenForEvent("death", OnPlayerDead) -- Прослушка смерти игрока.
		inst:DoPeriodicTask(0, LerpState) -- Постаяная стабилизация.
		inst:DoPeriodicTask(thirst_speed, Thirsty) -- Переодичность затраты жажды.
	    inst:DoPeriodicTask(1.9, ThirstyDamage) -- Переодичность нанесения урона.
		inst:DoPeriodicTask(1.4, ThirstySleep) -- Потеря жажды при сне
	end
end

AddPlayerPostInit(AddFiliThirst) -- Добавление модуля жажды.


-- ВИДЖЕТЫ И РАБОТА С НЕТВАРАМИ --

local thirstb = GLOBAL.require "widgets/fili_thirst_badge"

local UIAnim = GLOBAL.require "widgets/uianim"
local Text = GLOBAL.require "widgets/text"
local easing = GLOBAL.require "easing"
local Widget = GLOBAL.require "widgets/widget"
local Image = GLOBAL.require "widgets/image"

local function onstatusdisplaysconstruct(self)
    if language_cfg == 1 then
        modimport("scripts/rus_strings.lua")
    end
    if language_cfg == 3 then
        modimport("scripts/strings_chi.lua")
    end
    if language_cfg == 0 and (GLOBAL.KnownModIndex:IsModEnabled("workshop-367546858") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-367546858")) then
        modimport("scripts/strings_chi.lua")
    end
    if language_cfg == 0 and (GLOBAL.KnownModIndex:IsModEnabled("workshop-354836336") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-354836336")) 
    or (GLOBAL.KnownModIndex:IsModEnabled("workshop-1240565842") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1240565842")) then
        modimport("scripts/rus_strings.lua")
    end
	
	self.fili_hud_thirst = self:AddChild(thirstb(self,self.owner))
	if GLOBAL.ThePlayer.prefab ~= "woodie" then
        if GLOBAL.KnownModIndex:IsModEnabled("workshop-376333686") then
		    self.fili_hud_thirst:SetPosition(-62, -52)
        else
		    self.fili_hud_thirst:SetPosition(-80, -40, 0)
		end
	end
	
	if GLOBAL.ThePlayer.prefab == "woodie" then
        if GLOBAL.KnownModIndex:IsModEnabled("workshop-376333686") then
			self.fili_hud_thirst:SetPosition(-124, 35, 0)
        else
		    self.fili_hud_thirst:SetPosition(-120, 20, 0)
		end
	end
	
	self.owner.UpdateThirstBadge = function()
	    local percent_thirst = self.owner.aw_thirst_bage_percent:value()
		self.fili_hud_thirst:SetPercent(percent_thirst,thirstmax)
	end
end

AddClassPostConstruct("widgets/statusdisplays", onstatusdisplaysconstruct)

local function Syn(inst)
	local thirst = inst.fili_thirst
	inst.aw_thirst_bage_percent:set(math.floor(thirst))
end

local function aw_thirst_bagedirty(inst)
    if GLOBAL.ThePlayer then
	    GLOBAL.ThePlayer.UpdateThirstBadge()
	end
end

local function customhppostinit(inst)
	inst.aw_thirst_bage_percent = GLOBAL.net_shortint(inst.GUID, "aw_thirst_bage.percent", "aw_thirst_bagedirty")
	if GLOBAL.TheWorld.ismastersim then
	    inst:DoPeriodicTask(0.5, function()
            Syn(inst)
	    end)	
	end
    if not GLOBAL.TheNet:IsDedicated() then
		inst:ListenForEvent("aw_thirst_bagedirty", aw_thirst_bagedirty)
    end
end

AddPlayerPostInit(customhppostinit)
