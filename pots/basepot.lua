require 'soil/startersoil'
require 'plants/baseplant'
require 'globals'


basepot = {}
basepot.__index = basepot

basepot.x = nil -- int, pot's drawing cord
basepot.y = nil -- int, pot's drawing cord
basepot.pos = nil -- int, pot's position on the row of pots fighting
basepot.currentHealth = nil -- int, pot's current health
basepot.baseHealth = nil -- int, pot's max hp
basepot.type = nil -- string, pot's type
--basepot.plants = {} -- table, plants currently in the pot
basepot.maxPlants = nil -- int, max plants that can go in plants
basepot.currentPlants = 0
basepot.soil = startersoil.new() -- string, type of soil, will have the default value of soil
basepot.sprite = nil -- image, the pot's sprite


print(love.window.getMode())

local POT_WIDTH = gX_DIALATION * 220
local POT_GAP = gX_DIALATION * 24

local PLAYER_POS_1_X = 32 * gX_DIALATION
local PLAYER_POS_2_X = (PLAYER_POS_1_X + POT_WIDTH + POT_GAP)
local PLAYER_POS_3_X = (PLAYER_POS_2_X + POT_WIDTH + POT_GAP) 

local ENEMY_POS_1_X = (1180/1920) * love.graphics.getWidth()
local ENEMY_POS_2_X = (1424/1920) * love.graphics.getWidth()
local ENEMY_POS_3_X = (1668/1920) * love.graphics.getWidth()

local POT_Y = (810 * gY_DIALATION) -- all pots of the same type will be rendered at the same y, but currently only one type of pot so simply naming it pot_y for now

function basepot.new(instance, pos, baseHealth, potType, sprite, maxPlants)
  instance.pos = pos
  basepot.assignX(instance, pos)
  instance.baseHealth = baseHealth
  instance.currentHealth = baseHealth
  instance.type = potType
  instance.sprite = sprite
  instance.maxPlants = maxPlants
  instance.plants = {}
  return instance
end

function basepot:addPlant(plant)
  if self.currentPlants + 1 > self.maxPlants then
    return "error"
  end
  table.insert(self.plants, plant)
  self.currentPlants = self.currentPlants + 1
end

function basepot:changeSoil(soil) 
  self.soil = soil
end

function basepot:attacked(amount)
  self.currentHealth = self.currentHealth - amount
end

function basepot:update(dt) end
function basepot:render()
  love.graphics.draw(self.sprite, self.x, POT_Y, 0, gX_DIALATION, gY_DIALATION)
  for k, v in pairs(self.plants) do
    v:render()
  end
  love.graphics.print(tostring(self.currentHealth), self.x, POT_Y + 20)
end

function basepot.assignX(instance, pos)
  instance.x =  (pos == 1 and PLAYER_POS_1_X) or (pos == 2 and PLAYER_POS_2_X) or (pos == 3 and PLAYER_POS_3_X) or (pos == 4 and ENEMY_POS_1_X) or (pos == 5 and ENEMY_POS_2_X) or (pos == 6 and ENEMY_POS_3_X)
end