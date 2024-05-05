require 'soil/startersoil'
require 'plants/baseplant'

basepot = {}
basepot.__index = basepot

basepot.x = nil -- int, pot's drawing cord
basepot.y = nil -- int, pot's drawing cord
basepot.pos = nil -- int, pot's position on the row of pots fighting
basepot.currentHealth = nil -- int, pot's current health
basepot.baseHealth = nil -- int, pot's max hp
basepot.type = nil -- string, pot's type
basepot.plants = {} -- table, plants currently in the pot
basepot.maxPlants = nil -- int, max plants that can go in plants
basepot.currentPlants = 0
basepot.soil = startersoil.new() -- string, type of soil, will have the default value of soil
basepot.sprite = nil -- image, the pot's sprite

local POT_Y = 810 -- all pots of the same type will be rendered at the same y, but currently only one type of pot so simply naming it pot_y for now

local PLAYER_POS_1_X = 32
local PLAYER_POS_2_X = 276
local PLAYER_POS_3_X = 520

local ENEMY_POS_1_X = 1180
local ENEMY_POS_2_X = 1424
local ENEMY_POS_3_X = 1668

function basepot.new(pos) end
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
  love.graphics.draw(self.sprite, self.x, POT_Y)
  for k, v in pairs(self.plants) do
    v:render()
  end
  love.graphics.print(tostring(self.currentHealth), self.x, POT_Y + 20)
end

function basepot.assignX(instance, pos)
  instance.x =  (pos == 1 and PLAYER_POS_1_X) or (pos == 2 and PLAYER_POS_2_X) or (pos == 3 and PLAYER_POS_3_X) or (pos == 4 and ENEMY_POS_1_X) or (pos == 5 and ENEMY_POS_2_X) or (pos == 6 and ENEMY_POS_3_X)
end