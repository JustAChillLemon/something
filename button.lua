require 'globals'
require 'functions'

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
end
--

function button:render()
  love.graphics.setColor(self.color/255, 32/255, 23/255, 1)
  love.graphics.rectangle('fill', self.x, self.y, WIDTH, HEIGHT)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setColor(2/255, 36/255, 75/255)
    love.graphics.setColor(1, 1, 1, 1)

  if self.name ~= nil then
    love.graphics.print(self.name, self.textX, self.textY)
  end
end
--

function button:click()
  self.behavior()
end
