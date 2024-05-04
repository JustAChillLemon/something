button = {}
button.__index = button

function button.new(x, y, width, height) 
  instance = setmetatable({}, button)
  instance.x = x
  instance.y = y
  instance.width = width
  instance.height = height
  instance.cd = 0
  instance.color = 234
  instance.word = 0
  return instance
end
--

function button:update(dt) 
  if self.cd <= 0 then
    self.color = 234
    if love.mouse.isDown(1) and self:inClickZone() then
      self:click()
      self.cd = 2
      self.color = 100
      self.word = 0
    end
  else 
    self.cd = self.cd - 1 * dt
    self.word = self.word + dt
  end
end
--

function button:inClickZone() 
  return love.mouse.getX() >= self.x and love.mouse.getX() <= self.x + self.width and
  love.mouse.getY() >= self.y and love.mouse.getY() <= self.y + self.height
end
--

function button:render()
  love.graphics.setColor(self.color/255, 32/255, 23/255, 1)
  love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
  love.graphics.print(tostring(self.word), 200, 200)
  love.graphics.setColor(1, 1, 1, 1)
end
--

function button:click()
  print("heyyyyyyy")
end
