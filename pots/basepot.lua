require 'plants/baseplant'
require 'globals'


basepot = {}
basepot.__index = basepot

basepot.x = nil -- int, pot's drawing cord
basepot.pos = nil -- int, pot's position on the row of pots fighting
basepot.currentHealth = nil -- int, pot's current health
basepot.baseHealth = nil -- int, pot's max hp
basepot.type = nil -- string, pot's type
--basepot.plants = -- a single table that is a plant
basepot.maxPlants = nil -- int, max plants that can go in plants
basepot.currentPlants = 0
--basepot.gadgets, a single gadget attached tot his pot
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
  instance.gadget = nil
  instance.currentHealth = baseHealth
  instance.type = potType
  instance.sprite = sprite or "why am i nil"
  instance.maxPlants = maxPlants
  instance.plant = nil
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
function basepot:fightStart() end
function basepot:effect() end
function basepot:addPlant(plant)
  self.plant = plant
end

function basepot:switchPlant(plant)
  self.plant = plant
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
    self.plant:update(dt)
  end
  
  if gSTATE_MACHINE.stateName == 'shop' then
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
        self.plant.x = self.x
        self.plant.y = DEFAULT_PLANT_Y
        if self.gadget then
          self.gadget:assignPos(self)
        end
      else 
        self.x = love.mouse.getX() - self.xDiff
        self.y = love.mouse.getY() - self.yDiff
        self.plant.x = self.x
        self.plant.y = self.y - DEFAULT_PLANT_Y
        if self.gadget then
          self.gadget:assignPos(self)
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
  self.plant:render()
  if self.gadget then
    self.gadget:render()
  end
  love.graphics.print(tostring(self.currentHealth), self.x, self.y)
  love.graphics.print(tostring(self.alive), self.x, self.y - 15)
end
function basepot:reset()
  self.currentHealth = self.baseHealth
  self.alive = true
end
function basepot.assignX(instance, pos)
  instance.x = (pos == 1 and PLAYER_POS_1_X) or (pos == 2 and PLAYER_POS_2_X) or (pos == 3 and PLAYER_POS_3_X) or (pos == 4 and ENEMY_POS_1_X) or (pos == 5 and ENEMY_POS_2_X) or (pos == 6 and ENEMY_POS_3_X) or 720
end
function basepot:changeTarget(pot) 
  self.plant:changeTarget(pot)
end

function basepot:out() 
  return "I am " .. tostring(self.pos)
end