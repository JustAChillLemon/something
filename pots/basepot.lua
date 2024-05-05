require 'soil/startersoil'

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
basepot.soil = startersoil.new() -- string, type of soil, will have the default value of soil
basepot.sprite = nil -- image, the pot's sprite

local POT_Y = 810 -- all pots of the same type will be rendered at the same y, but currently only one type of pot so simply naming it pot_y for now

local PLAYER_POS_1_X = 32
local PLAYER_POS_2_X = 276
local PLAYER_POS_3_X = 520

local ENEMY_POS_1_X = 1180
local ENEMY_POS_2_X = 1424
local ENEMY_POS_3_X = 1668

function basepot.new() end
function basepot:addPlant(plant)
  if #plant + 1 > maxPlants then
    return "error"
  end
  table.insert(basepot.plants, plant)
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
  love.graphics.print(tostring(self.x), self.x, POT_Y + 20)
end