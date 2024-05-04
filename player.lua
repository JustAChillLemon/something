player = {}
player.__index = player
player.speed = 40


function player.new()
  instance = setmetatable({}, player)
  instance.x = 0
  instance.y = 0
  return instance
end

function player:update(dt) 
  if love.keyboard.wasKeyPressed('d') then
    self.x = self.x + self.speed * dt
  end
  if love.keyboard.wasKeyPressed('a') then
    self.x = self.x - self.speed * dt
  end
  if love.keyboard.wasKeyPressed('w') then
    self.y = self.y - self.speed * dt
  end
  if love.keyboard.wasKeyPressed('s') then 
    self.y = self.y + self.speed * dt
  end
end

function player:render()
  love.graphics.rectangle('fill', self.x, self.y, 10, 10)
end