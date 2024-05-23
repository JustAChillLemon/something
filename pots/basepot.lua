require 'soil/startersoil'
require 'plants/baseplant'
require 'globals'


basepot = {}
basepot.__index = basepot

basepot.x = nil -- int, pot's drawing cord
basepot.pos = nil -- int, pot's position on the row of pots fighting
basepot.currentHealth = nil -- int, pot's current health
basepot.baseHealth = nil -- int, pot's max hp
basepot.type = nil -- string, pot's type
--basepot.plants = {} -- table, plants currently in the pot
basepot.maxPlants = nil -- int, max plants that can go in plants
basepot.currentPlants = 0
--basepot.soil = startersoil.new() -- string, type of soil, will have the default value of soil
basepot.sprite = nil -- image, the pot's sprite
basepot.alive = true

local POT_WIDTH = gX_DIALATION * 220
local POT_HEIGHT = gY_DIALATION * 250
local POT_GAP = gX_DIALATION * 24

local PLAYER_POS_1_X = 32 * gX_DIALATION
local PLAYER_POS_2_X = (PLAYER_POS_1_X + POT_WIDTH + POT_GAP)
local PLAYER_POS_3_X = (PLAYER_POS_2_X + POT_WIDTH + POT_GAP) 

local ENEMY_POS_1_X = (love.graphics.getWidth() - POT_WIDTH - (32 * gX_DIALATION))
local ENEMY_POS_2_X = ENEMY_POS_1_X - POT_GAP - POT_WIDTH
local ENEMY_POS_3_X = ENEMY_POS_2_X - POT_GAP - POT_WIDTH

local POT_Y = (810 * gY_DIALATION) -- all pots of the same type will be rendered at the same y, but currently only one type of pot so simply naming it pot_y for now

function basepot.new(instance, pos, baseHealth, potType, sprite, maxPlants)
  instance.pos = pos
  basepot.assignX(instance, pos)
  instance.baseHealth = baseHealth
  instance.soil = startersoil.new()
  instance.currentHealth = baseHealth
  instance.type = potType
  if not sprite then
    print("KILL ME!")
  end
  instance.sprite = sprite or "why am i nil"
  instance.maxPlants = maxPlants
  instance.plants = {}
  instance.alive = true
  instance.y = POT_Y
  instance.heldDown = false
  instance.xDiff = 0
  instance.yDiff = 0
  instance.width = POT_WIDTH
  instance.height = POT_HEIGHT
  instance.highlight = false
  return instance
end

function basepot:addPlant(plant)
  table.insert(self.plants, plant)
end

function basepot:changeSoil(soil) 
  self.soil = soil
end

function basepot:attacked(amount)
  self.currentHealth = self.currentHealth - amount
  if self.currentHealth <= 0 then
    self.alive = false
  end
end

function basepot:update(dt) 
  if gSTATE_MACHINE.stateName == 'fight' then
    for key, plant in pairs(self.plants) do
      plant:update(dt)
    end
  end
  
  if gSTATE_MACHINE.stateName == 'shop' then
    print(self.type)
    print(self.x)
    print(self.y)
    print(POT_WIDTH)
    print(POT_HEIGHT)
    print(self.sprite)
    if isClicked(self.x, self.y, POT_WIDTH, POT_HEIGHT, 1)then
      self.heldDown = true
      self.xDiff = love.mouse.getX() - self.x
      self.yDiff = love.mouse.getY() - self.y
    end
      
    if self.heldDown then
      if not love.mouse.isDown(1) then
        self.heldDown = false
        self.y = POT_Y
        basepot.assignX(self, self.pos)
        for key, plant in pairs(self.plants) do
          plant.x = self.x
          plant.y = DEFAULT_PLANT_Y
        end
      else 
        self.x = love.mouse.getX() - self.xDiff
        self.y = love.mouse.getY() - self.yDiff
        for key, plant in pairs(self.plants) do
          plant.x = self.x
          plant.y = self.y - DEFAULT_PLANT_Y
        end
      end
    end
  end
end
function basepot:render()
  if self.highlight then
    love.graphics.setColor(66/255, 247/255, 72/255)
  end
  love.graphics.draw(self.sprite, self.x, self.y, 0, gX_DIALATION, gY_DIALATION)
  love.graphics.rectangle('line', self.x, self.y, POT_WIDTH, POT_HEIGHT)
  love.graphics.setColor(1,1,1)
  for k, v in pairs(self.plants) do
    v:render()
  end
  love.graphics.print(tostring(self.currentHealth), self.x, self.y)
end
function basepot:reset()
  self.currentHealth = self.baseHealth
end
function basepot.assignX(instance, pos)
  instance.x = (pos == 1 and PLAYER_POS_1_X) or (pos == 2 and PLAYER_POS_2_X) or (pos == 3 and PLAYER_POS_3_X) or (pos == 4 and ENEMY_POS_1_X) or (pos == 5 and ENEMY_POS_2_X) or (pos == 6 and ENEMY_POS_3_X) or 720
end
function basepot:changeTarget(pot) 
  for key, plant in pairs(self.plants) do
    plant:changeTarget(pot)
  end
end

function basepot:out() 
  return "I am " .. tostring(self.pos)
end