require 'globals'

baseplant = {}
baseplant.__index = baseplant

baseplant.attack = nil -- int, plant's dmg to pots
baseplant.sprite = nil -- image, plant's sprite
baseplant.x = nil -- int, plant's drawing cord
baseplant.y = 395 * gY_DIALATION -- int, plant's drawing cord, always the same
baseplant.type = nil -- string, plant's type
baseplant.ally = nil -- boolean, on your side or not used for rendering
baseplant.timer = 0 -- long, timer until plant can attack again

local PLANT_WIDTH = 220 * gX_DIALATION
DEFAULT_PLANT_Y = 395 * gY_DIALATION

function baseplant.new() end
function baseplant:effects() end
function baseplant:attackPot() 
  self.target:attacked(self.attack)
end
function baseplant:update(dt) 
  if gSTATE_MACHINE.stateName == 'fight' then
    self.timer = self.timer + dt
    
    if self.timer >= self.cd then
      self.timer = self.timer % self.cd 
      self:attackPot()
    end
  end
end
function baseplant:render() 
  love.graphics.draw(self.sprite, self.ally and self.x + PLANT_WIDTH or self.x,
    self.y, 0, (self.ally and -1 or 1) * gX_DIALATION, 1 * gY_DIALATION)
end
function baseplant:changeTarget(pot)
  self.target = pot
end