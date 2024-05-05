baseplant = {}
baseplant.__index = baseplant

baseplant.attack = nil -- int, plant's dmg to pots
baseplant.sprite = nil -- image, plant's sprite
baseplant.x = nil -- int, plant's drawing cord
baseplant.y = 395 -- int, plant's drawing cord, always the same
baseplant.type = nil -- string, plant's type
baseplant.ally = nil -- boolean, on your side or not used for rendering
baseplant.timer = 0 -- long, timer until plant can attack again
baseplant.cd = nil -- double, time between plant's attacks

function baseplant.new() end
function baseplant:effects() end
function baseplant:update(dt) end
function baseplant:render() 
  love.graphics.draw(self.sprite, self.ally and self.x + 220 or self.x, self.y, 0, self.ally and -1 or 1, 1)
end