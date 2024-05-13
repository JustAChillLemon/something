require 'globals'

button = {}
button.__index = button

local SPRITE = love.graphics.newImage("sprites/button.png")
local WIDTH = 330 * gX_DIALATION
local HEIGHT = 180 * gY_DIALATION

function button.new(x, y, behavior, name) 
  instance = setmetatable({}, button)
  instance.x = x - (WIDTH / 2)
  instance.y = y
  instance.cd = 0
  instance.color = 234
  instance.name = name
  if (name ~= nil) then
    local nameLen = love.graphics.getFont():getWidth(name)
    local nameHeight = love.graphics.getFont():getHeight(name)
    
    instance.textX = (instance.x + (WIDTH / 2)) - (nameLen / 2)
    instance.textY = (instance.y + (HEIGHT / 2)) - (nameHeight / 2)
  end
  instance.behavior = behavior
  instance.inZone = false
  return instance
end
--

function button:update(dt) 
  if self.cd <= 0 then
    self.color = 234
    
    if isClicked(self.x, self.y, WIDTH, HEIGHT, 1) then
      self.inZone = true
    end 
    
    if isReleased(self.x, self.y, WIDTH, HEIGHT, 1) then
      if self.inZone then
        print(self.inZone)
        self:click()
        self.cd = 2
        self.color = 100
      else 
        self.inZone = false
      end
    end
  else 
    self.cd = self.cd - 1 * dt
  end
end
--

function isReleased(x, y, w, h, key) 
  return isInClickZone(x, y, w, h) and love.mouse.released[key]
end
--
function isClicked(x, y, w, h, key)
  return isInClickZone(x, y, w, h) and love.mouse.clicked[key]
end
--
function isHeld(x, y, w, h, key)
  return isInClickZone(x, y, w, h) and love.mouse.isDown(key)
end

function isInClickZone(x, y, h, w)
  return (love.mouse.getX() > x and love.mouse.getX() < x + w) and (love.mouse.getY() > y and love.mouse.getY() < y + h)
end
--

function button:render()
  love.graphics.setColor(self.color/255, 32/255, 23/255, 1)
  love.graphics.rectangle('fill', self.x, self.y, WIDTH, HEIGHT)
  love.graphics.setColor(1, 1, 1, 1)
  if self.name ~= nil then
    love.graphics.print(self.name, self.textX, self.textY)
  end
  love.graphics.rectangle('line', self.x, self.y, WIDTH, HEIGHT)
end
--

function button:click()
  self.behavior()
end
