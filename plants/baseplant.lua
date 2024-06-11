require 'globals'

baseplant = {}
baseplant.__index = baseplant

baseplant.attack = nil -- int, plant's dmg to pots
baseplant.sprite = nil -- image, plant's sprite
baseplant.x = nil -- int, plant's drawing cord
baseplant.y = 395 * gY_DIALATION -- int, plant's drawing cord, always the same
baseplant.type = nil -- string, plant's type
baseplant.ally = nil -- boolean, on your side or not, used for rendering
baseplant.timer = 0 -- long, timer until plant can attack again

local PLANT_WIDTH = 220 * gX_DIALATION
DEFAULT_PLANT_Y = 395 * gY_DIALATION
local ANIMATION_CD = 0.5

function baseplant.new(x, ally, attack, cd, sprite, plantType, height) 
  local instance = setmetatable({}, baseplant)
  instance.x = x
  instance.ally = ally
  instance.BASE_ATTACK = attack
  instance.attack = attack
  instance.BASE_CD = cd
  instance.cd = cd
  instance.sprite = sprite
  instance.type = plantType
  instance.height = height
  instance.attackMult = 1
  instance.animationTimer = 0
  instance.moving = 0
  instance.up = 1 == math.random(1,0)
  return instance
end
function baseplant:fightStart()
  self.attackMult = 1
  self.attack = self.BASE_ATTACK
  self.cd = self.BASE_CD
end
function baseplant:effects() end
function baseplant:attackPot() 
  self.target:attacked(self.attack * self.attackMult)
end
function baseplant:animate(dt)
  self.animationTimer = self.animationTimer + dt
  if self.animationTimer >= ANIMATION_CD then
    self.animationTimer = self.animationTimer % ANIMATION_CD
    if self.up then
      self.moving = math.random(-15, -30)
      self.up = false
    else
      self.moving = math.random(30, 15)
      self.up = true
    end
  end

  self.y = self.y + (self.moving * dt * 4)
  
  if self.y < (DEFAULT_PLANT_Y - (100 * gY_DIALATION)) then
    self.up = false
  elseif self.y > (DEFAULT_PLANT_Y + (100 * gY_DIALATION)) then
    self.up = true
  end
end
function baseplant:update(dt) 
  if gSTATE_MACHINE.stateName == 'fight' then
    self.timer = self.timer + dt
    self:animate(dt)
    
    if self.timer >= self.cd then
      self.timer = self.timer % self.cd 
      self:attackPot()
    end
  end
end
function baseplant:reset()
  self.y = DEFAULT_PLANT_Y
  self.cd = self.BASE_CD
  self.attack = self.BASE_ATTACK
end
function baseplant:render() 
  love.graphics.draw(self.sprite, self.ally and self.x + PLANT_WIDTH or self.x,
    self.y, 0, (self.ally and -1 or 1) * gX_DIALATION, 1 * gY_DIALATION)
  
  love.graphics.setColor(1,0,0)
  love.graphics.setFont(INFO_FONT)
  love.graphics.print(self.attack * self.attackMult, self.x + 180, POT_Y - 60)
  love.graphics.setColor(0,0,1)
  love.graphics.print(self.cd, self.x + 180, POT_Y - 30)

  love.graphics.setFont(DEFAULT_FONT)
  love.graphics.setColor(1,1,1)
end
function baseplant:changeTarget(pot)
  self.target = pot
end
function baseplant:buff(attack, cd)
  self.attack = self.attack + attack
  self.cd = self.BASE_CD - cd
end